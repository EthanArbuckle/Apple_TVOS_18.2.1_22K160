@interface CaptureMTLCommandBuffer
- (BOOL)commitAndWaitUntilSubmitted;
- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isCapturing;
- (BOOL)isCommited;
- (BOOL)isEnqueued;
- (BOOL)isProfilingEnabled;
- (BOOL)presentDrawableUsed;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainedReferences;
- (CaptureMTLCommandBuffer)initWithBaseObject:(id)a3 captureCommandQueue:(id)a4 funcRef:(GTTraceFuncRef)a5;
- (CaptureMTLCommandQueue)captureCommandQueue;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLBuffer)privateData;
- (MTLBuffer)privateLoggingBuffer;
- (MTLCommandBuffer)baseObject;
- (MTLCommandQueue)commandQueue;
- (MTLDeadlineProfile)deadlineProfile;
- (MTLDevice)device;
- (MTLLogContainer)logs;
- (MTLSharedEvent)accelerationStructureDescriptorProcessEvent;
- (NSDictionary)profilingResults;
- (NSError)error;
- (NSMutableDictionary)userDictionary;
- (NSMutableSet)retainedObjects;
- (NSString)description;
- (NSString)label;
- (double)GPUEndTime;
- (double)GPUStartTime;
- (double)kernelEndTime;
- (double)kernelStartTime;
- (id)accelerationStructureCommandEncoder;
- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3;
- (id)blitCommandEncoder;
- (id)blitCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoder;
- (id)computeCommandEncoderWithDescriptor:(id)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3;
- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4;
- (id)debugCommandEncoder;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourceStateCommandEncoder;
- (id)resourceStateCommandEncoderWithDescriptor:(id)a3;
- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5;
- (unint64_t)accelerationStructureCommandEncoderPreamble;
- (unint64_t)errorOptions;
- (unint64_t)getListIndex;
- (unint64_t)globalTraceObjectID;
- (unint64_t)privateDataOffset;
- (unint64_t)status;
- (unint64_t)streamReference;
- (void)_encodeDownloadPoint;
- (void)_preCommitWithIndex:(unint64_t)a3;
- (void)addCompletedHandler:(id)a3;
- (void)addPurgedHeap:(id)a3;
- (void)addPurgedResource:(id)a3;
- (void)addRequestsToDownloadQueue:(id)a3 withIndex:(unint64_t)a4;
- (void)addScheduledHandler:(id)a3;
- (void)commit;
- (void)commitAndHold;
- (void)commitWithDeadline:(unint64_t)a3;
- (void)configWithCommandBufferDescriptor:(id)a3;
- (void)dealloc;
- (void)debugBufferContentsWithLength:(unint64_t *)a3;
- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5;
- (void)encodeConditionalAbortEvent:(id)a3;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6;
- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7;
- (void)encodeDashboardTagForResourceGroup:(id)a3;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4;
- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5;
- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4;
- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4;
- (void)enqueue;
- (void)popDebugGroup;
- (void)presentDrawable:(id)a3;
- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4;
- (void)presentDrawable:(id)a3 atTime:(double)a4;
- (void)presentDrawable:(id)a3 options:(id)a4;
- (void)pushDebugGroup:(id)a3;
- (void)setIsCommited:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPrivateData:(id)a3;
- (void)setPrivateDataOffset:(unint64_t)a3;
- (void)setPrivateLoggingBuffer:(id)a3;
- (void)setProfilingEnabled:(BOOL)a3;
- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4;
- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4;
- (void)touch;
- (void)trackPresent:(id)a3;
- (void)unionRetainSet:(id)a3;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)waitUntilCompleted;
- (void)waitUntilScheduled;
@end

@implementation CaptureMTLCommandBuffer

- (MTLCommandBuffer)baseObject
{
  return self->_baseObject;
}

- (void)_encodeDownloadPoint
{
  v10 = objc_alloc_init(&OBJC_CLASS___GTDownloadPoint);
  uint64_t v3 = 2LL * (void)-[NSMutableArray count](self->_downloadPoints, "count");
  -[GTDownloadPoint setWaitValue:](v10, "setWaitValue:", v3 | 1);
  -[GTDownloadPoint setWaitEvent:](v10, "setWaitEvent:", self->_downloadEvent);
  -[GTDownloadPoint setDownloadValue:](v10, "setDownloadValue:", v3 + 2);
  -[GTDownloadPoint setDownloadEvent:](v10, "setDownloadEvent:", self->_downloadEvent);
  -[NSMutableArray addObject:](self->_downloadPoints, "addObject:", v10);
  id v4 = DEVICEOBJECT(self->_baseObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTDownloadPoint waitEvent](v10, "waitEvent"));
  objc_msgSend(v5, "encodeSignalEvent:value:", v6, -[GTDownloadPoint waitValue](v10, "waitValue"));

  char v7 = objc_opt_respondsToSelector(v5, "encodeWaitForEvent:value:timeout:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GTDownloadPoint downloadEvent](v10, "downloadEvent"));
  id v9 = -[GTDownloadPoint downloadValue](v10, "downloadValue");
  if ((v7 & 1) != 0) {
    [v5 encodeWaitForEvent:v8 value:v9 timeout:GT_ENV];
  }
  else {
    [v5 encodeWaitForEvent:v8 value:v9];
  }
}

- (CaptureMTLCommandBuffer)initWithBaseObject:(id)a3 captureCommandQueue:(id)a4 funcRef:(GTTraceFuncRef)a5
{
  unint64_t var1 = a5.var1;
  unint64_t var0 = a5.var0;
  id v10 = a3;
  id v11 = a4;
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandBuffer;
  v12 = -[CaptureMTLCommandBuffer init](&v61, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_captureCommandQueue, a4);
    objc_storeStrong((id *)&v13->_baseObject, a3);
    v14 = (GTTraceContext *)[v11 traceContext];
    v13->_traceContext = v14;
    id v15 = DEVICEOBJECT(v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v13->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v14, (unint64_t)v16, 0LL);

    traceStream = v13->_traceStream;
    if (traceStream) {
      unint64_t v18 = traceStream->var0;
    }
    else {
      unint64_t v18 = 0LL;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue([v11 device]);
    v20 = (uint64_t *)[v19 traceStream];
    if (v20) {
      uint64_t v21 = *v20;
    }
    else {
      uint64_t v21 = 0LL;
    }
    v22 = (uint64_t *)[v11 traceStream];
    if (v22) {
      uint64_t v23 = *v22;
    }
    else {
      uint64_t v23 = 0LL;
    }

    *(void *)&__int128 v51 = 0x400000008LL;
    *((void *)&v51 + 1) = v18;
    unint64_t v52 = var1;
    uint64_t v53 = 0LL;
    uint64_t v54 = 0LL;
    uint64_t v55 = v21;
    uint64_t v56 = 0LL;
    uint64_t v57 = v23;
    unint64_t v58 = var0;
    uint64_t v59 = 0LL;
    uint64_t v60 = 0LL;
    GTCaptureBoundaryTracker_handleTrigger(&v51);
    BOOL v24 = (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2;
    v13->_isCapturing = v24;
    if (v24)
    {
      uint64_t v25 = *(void *)_sharedCaptureManager;
      if (*(void *)_sharedCaptureManager)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v11 device]);
        v27 = (uint64_t *)[v26 traceStream];
        if (v27) {
          uint64_t v28 = *v27;
        }
        else {
          uint64_t v28 = 0LL;
        }
        v13->_isCapturing = v25 == v28;
      }

      else
      {
        v13->_isCapturing = 1;
      }

      v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      scheduledDispatchArray = v13->_scheduledDispatchArray;
      v13->_scheduledDispatchArray = v29;
    }

    pthread_mutex_init(&v13->_retainMutex, 0LL);
    if (([v10 retainedReferences] & 1) != 0 || v13->_isCapturing)
    {
      v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      retainedObjects = v13->_retainedObjects;
      v13->_retainedObjects = v31;

      if (v13->_isCapturing)
      {
        apr_pool_create_ex(&v13->_pool, 0LL, 0LL, 0LL);
        id v33 = DEVICEOBJECT(v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

        v35 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
        downloadPoints = v13->_downloadPoints;
        v13->_downloadPoints = v35;

        v37 = (void *)objc_claimAutoreleasedReturnValue([v34 device]);
        v38 = (MTLSharedEvent *)[v37 newSharedEvent];
        downloadEvent = v13->_downloadEvent;
        v13->_downloadEvent = v38;

        id v40 = DEVICEOBJECT(v13->_downloadEvent);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        id v42 = DEVICEOBJECT(v13->_baseObject);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v46 = _NSConcreteStackBlock;
        uint64_t v47 = 3221225472LL;
        v48 = __74__CaptureMTLCommandBuffer_initWithBaseObject_captureCommandQueue_funcRef___block_invoke;
        v49 = &unk_20E118;
        id v50 = v41;
        id v44 = v41;
        [v43 addCompletedHandler:&v46];

        -[CaptureMTLCommandBuffer _encodeDownloadPoint](v13, "_encodeDownloadPoint", v46, v47, v48, v49);
        id v10 = v34;
      }
    }

    v13->_presentDrawableUsed = 0;
  }

  return v13;
}

- (CaptureMTLCommandQueue)captureCommandQueue
{
  return self->_captureCommandQueue;
}

- (MTLSharedEvent)accelerationStructureDescriptorProcessEvent
{
  return self->_accelerationStructureDescriptorProcessEvent;
}

- (void)dealloc
{
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v3 = self->_downloadPoints;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v9 = [v8 downloadValue];
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadEvent]);
        [v10 setSignaledValue:v9];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v41,  v46,  16LL);
    }

    while (v5);
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  s();
  v12 = v11;
  uint64_t v13 = *v11;
  *id v11 = v14;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v15 = self->_completedDispatchArray;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v45,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v29 + 1) + 8LL * (void)j) + 16LL))();
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v29,  v45,  16LL);
    }

    while (v17);
  }

  void *v12 = v13;
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -16363;
  unsigned __int8 v21 = v39;
  if (v39 > 0x38uLL)
  {
    uint64_t v23 = *(void *)(v34 + 24);
    uint64_t v24 = v40++;
    v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x800000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    v22 = (char *)(v20 + v39);
    v39 += 8;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v22 = var0;
  void *v12 = v37;
  *((_BYTE *)v12 + 8) = v38;
  *(_BYTE *)(v35 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  pthread_mutex_destroy(&self->_retainMutex);
  pool = self->_pool;
  if (pool) {
    apr_pool_destroy(pool);
  }
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandBuffer;
  -[CaptureMTLCommandBuffer dealloc](&v28, "dealloc");
}

- (void)unionRetainSet:(id)a3
{
  if (self->_retainedObjects != a3)
  {
    p_retainMutex = &self->_retainMutex;
    id v5 = a3;
    pthread_mutex_lock(p_retainMutex);
    -[NSMutableSet unionSet:](self->_retainedObjects, "unionSet:", v5);

    pthread_mutex_unlock(p_retainMutex);
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

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v36);
  baseObject = self->_baseObject;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLCommandBufferSPI encodeWaitForEvent:value:](baseObject, "encodeWaitForEvent:value:", v9, a4);

  if (self->_isCapturing)
  {
    if ((qword_23A448 & 0x400) != 0) {
      -[CaptureMTLCommandBuffer _encodeDownloadPoint](self, "_encodeDownloadPoint");
    }
    v35[0] = 0LL;
    v35[1] = v35;
    v35[2] = 0x2020000000LL;
    v35[3] = v39;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandQueue device](self->_captureCommandQueue, "device"));
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___CaptureMTLSharedEvent, v11);
    if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
    {
      id v14 = v6;
      if (IsEventActuallyShared((uint64_t)[v14 traceStream]))
      {
        id v15 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v10 dispatchGroup]);
        dispatch_group_enter(v15);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 captureEventListener]);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke;
        v34[3] = &unk_20D7A8;
        uint64_t v18 = v34;
        v34[7] = v35;
        v34[4] = self;
        v34[5] = v14;
        v34[6] = v10;
        [v16 notifyListener:v17 atValue:a4 block:v34];
LABEL_13:
      }
    }

    else
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___CaptureMTLLateEvalEvent, v13);
      if ((objc_opt_isKindOfClass(v6, v19) & 1) == 0)
      {
LABEL_15:

        _Block_object_dispose(v35, 8);
        goto LABEL_16;
      }

      id v20 = v6;
      if (IsEventActuallyShared((uint64_t)[v20 traceStream]))
      {
        unsigned __int8 v21 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v10 dispatchGroup]);
        dispatch_group_enter(v21);

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v20 baseObject]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 captureEventListener]);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke_2;
        v33[3] = &unk_20D7D0;
        uint64_t v18 = v33;
        v33[7] = v35;
        v33[4] = self;
        v33[5] = v20;
        v33[6] = v10;
        [v16 notifyListener:v17 atValue:a4 block:v33];
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }

- (void)_preCommitWithIndex:(unint64_t)a3
{
  id v5 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v5) {
    unint64_t var0 = v5->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandQueue device](self->_captureCommandQueue, "device"));
  v8 = (uint64_t *)[v7 traceStream];
  if (v8) {
    uint64_t v9 = *v8;
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = -[CaptureMTLCommandQueue traceStream](self->_captureCommandQueue, "traceStream");
  if (v10) {
    unint64_t v11 = v10->var0;
  }
  else {
    unint64_t v11 = 0LL;
  }
  uint64_t v12 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0LL;
  }
  BOOL isCapturing = self->_isCapturing;

  *(void *)&__int128 size_ptr = 0x500000008LL;
  *((void *)&size_ptr + 1) = var0;
  unint64_t v80 = a3;
  uint64_t v81 = 0LL;
  uint64_t v82 = 0LL;
  uint64_t v83 = v9;
  unint64_t v84 = 0LL;
  unint64_t v85 = v11;
  unint64_t v86 = v13;
  BOOL v87 = isCapturing;
  memset(v88, 0, sizeof(v88));
  GTCaptureBoundaryTracker_handleTrigger(&size_ptr);
  if (self->_presentDrawableUsed)
  {
    id v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
    if (v15) {
      unint64_t v16 = v15->var0;
    }
    else {
      unint64_t v16 = 0LL;
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandQueue device](self->_captureCommandQueue, "device"));
    uint64_t v18 = (uint64_t *)[v17 traceStream];
    if (v18) {
      uint64_t v19 = *v18;
    }
    else {
      uint64_t v19 = 0LL;
    }
    unint64_t layerRef = self->_layerRef;
    unsigned __int8 v21 = -[CaptureMTLCommandQueue traceStream](self->_captureCommandQueue, "traceStream");
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0LL;
    }
    unsigned __int8 v23 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
    if (v23) {
      unint64_t v24 = v23->var0;
    }
    else {
      unint64_t v24 = 0LL;
    }
    BOOL v25 = self->_isCapturing;

    *(void *)&__int128 size_ptr = 0x300000003LL;
    *((void *)&size_ptr + 1) = v16;
    unint64_t v80 = a3;
    uint64_t v81 = 0LL;
    uint64_t v82 = 0LL;
    uint64_t v83 = v19;
    unint64_t v84 = layerRef;
    unint64_t v85 = v22;
    unint64_t v86 = v24;
    BOOL v87 = v25;
    memset(v88, 0, sizeof(v88));
    GTCaptureBoundaryTracker_handleTrigger(&size_ptr);
  }

  scheduledDispatchArray = self->_scheduledDispatchArray;
  if (scheduledDispatchArray)
  {
    v27 = scheduledDispatchArray;
    objc_super v28 = self->_scheduledDispatchArray;
    self->_scheduledDispatchArray = 0LL;

    traceContext = self->_traceContext;
    uint64_t v30 = self;
    BOOL v31 = self->_isCapturing;
    baseObject = v30->_baseObject;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke;
    v73[3] = &unk_20D7F8;
    v74 = v27;
    v75 = v30;
    unint64_t v76 = a3;
    v77 = traceContext;
    BOOL v78 = v31;
    id v33 = v30;
    uint64_t v34 = v27;
    -[MTLCommandBufferSPI addScheduledHandler:](baseObject, "addScheduledHandler:", v73);
  }

  if (self->_completedDispatchArray || self->_retainedObjects || self->_downloadPoints)
  {
    uint64_t v35 = self->_downloadPoints;
    uint64_t v36 = self->_completedDispatchArray;
    uint64_t v37 = self->_retainedObjects;
    completedDispatchArray = self->_completedDispatchArray;
    self->_completedDispatchArray = 0LL;

    retainedObjects = self->_retainedObjects;
    self->_retainedObjects = 0LL;

    char v40 = self;
    unsigned __int8 v41 = v40->_baseObject;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_2;
    v67[3] = &unk_20D820;
    v71 = v37;
    unint64_t v72 = a3;
    v68 = v35;
    v69 = v36;
    v70 = v40;
    unsigned __int8 v42 = v37;
    __int128 v43 = v40;
    __int128 v44 = v36;
    v45 = v35;
    -[MTLCommandBufferSPI addCompletedHandler:](v41, "addCompletedHandler:", v67);
  }

  if (self->_isCapturing && (*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandBuffer device](self, "device"));
    uint64_t v47 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([v46 dispatchGroup]);
    dispatch_group_enter(v47);

    GTMTLCaptureState_notifyCommandBufferCaptured(_sharedCaptureManager);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v46 baseObject]);
    id v49 = DEVICEOBJECT(v48);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    if ((objc_opt_respondsToSelector(v50, "indirectArgumentBufferDecodingData") & 1) != 0)
    {
      __int128 v51 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue([v50 indirectArgumentBufferDecodingData]);
      unint64_t v52 = v51;
      if (v51 != &_dispatch_data_empty && v51)
      {
        dispatch_data_t map = dispatch_data_create_map(v51, (const void **)&buffer_ptr, (size_t *)&size_ptr);
        uint64_t v54 = buffer_ptr;
        if (buffer_ptr)
        {
          unint64_t v55 = ((void)size_ptr << 32) | 0xFFLL;
          if (HIDWORD(v55))
          {
            size_t v56 = size_ptr;
            Bytes = GTTraceMemPool_allocateBytes((uint64_t)self->_traceStream->var3, a3, v55);
            memcpy(Bytes + 16, v54, v56);
          }
        }
      }
    }

    id v58 = DEVICEOBJECT(self->_baseObject);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    objc_super v61 = _NSConcreteStackBlock;
    uint64_t v62 = 3221225472LL;
    v63 = __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_3;
    v64 = &unk_20E118;
    id v60 = v46;
    id v65 = v60;
    [v59 addCompletedHandler:&v61];

    if ((qword_23A448 & 1) != 0 && self->_presentDrawableUsed) {
      -[CaptureMTLCommandBuffer _encodeDownloadPoint](self, "_encodeDownloadPoint", v61, v62, v63, v64);
    }
  }

  GTTelemetry_trackCommit(self);
  -[CaptureMTLCommandQueue commitCommandBuffer:withIndex:]( self->_captureCommandQueue,  "commitCommandBuffer:withIndex:",  self,  a3);
}

- (void)addRequestsToDownloadQueue:(id)a3 withIndex:(unint64_t)a4
{
  id v89 = a3;
  if (self->_isCapturing)
  {
    if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
    {
      apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL);
      id v6 = newpool;
      char v7 = GTTraceContext_copyStreamMap((uint64_t)self->_traceContext, newpool);
      v8 = apr_hash_make(v6);
      *((void *)v7 + 3) = 0LL;
      *((void *)v7 + 4) = 0LL;
      *((void *)v7 + 2) = v7;
      uint64_t v85 = (uint64_t)v7;
      *((_DWORD *)v7 + 10) = 0;
      uint64_t v9 = apr_hash_next((apr_hash_t *)((char *)v7 + 16));
      if (v9)
      {
        id v10 = v9;
        do
        {
          GTTraceMemPool_buildMemoryMap(*(void *)(*(void *)(*((void *)v10 + 1) + 32LL) + 24LL), v8);
          id v10 = apr_hash_next(v10);
        }

        while (v10);
      }

      v88 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandQueue device](self->_captureCommandQueue, "device"));
      uint64_t v86 = _sharedCaptureManager;
      unint64_t v11 = GTResourceTrackerMake(v85, (uint64_t)v8, v6);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_downloadPoints, "objectAtIndexedSubscript:", 0LL));
      traceuint64_t Stream = self->_traceStream;
      if (traceStream) {
        uint64_t var0 = traceStream->var0;
      }
      else {
        uint64_t var0 = 0LL;
      }
      unsigned __int8 v23 = traceStream->var4.var0;
      v96 = self;
      unint64_t v83 = a4;
      v91 = (void *)v12;
      unsigned int v24 = 0;
      if (v23)
      {
        while (1)
        {
          unsigned int v25 = atomic_load((unsigned int *)v23 + 1);
          uint64_t v26 = v24 + (v25 >> 6) - 1;
          unsigned __int8 v23 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v23 + 5);
          unsigned int v24 = v26;
          if (!v23)
          {
            unsigned int v24 = v26;
            goto LABEL_22;
          }
        }
      }

      uint64_t v26 = 0LL;
LABEL_22:
      int v90 = 0;
      v27 = 0LL;
      unint64_t v28 = v24 | (unint64_t)(v26 << 32);
      __int128 v29 = &unk_23A000;
      uint64_t v95 = (uint64_t)v8;
LABEL_23:
      uint64_t v30 = (char *)v23 + 64;
      while (1)
      {
        v92 = v27;
        if (!v23) {
          break;
        }
        int v31 = HIDWORD(v28) - v28;
        uint64_t v32 = v31;
        uint64_t v94 = (uint64_t)&v30[64 * (uint64_t)v31];
        uint64_t v33 = v29[137];
        if (*(_DWORD *)(v94 + 8) == -15991 && (v29[137] & 0x400LL) != 0)
        {
          uint64_t v35 = newpool;
          uint64_t v36 = ResourceTracker_harvestResources(v11, newpool);
          DownloadRequests = GTResourceHarvesterGetDownloadRequests( (pthread_mutex_t *)-[NSMutableArray harvester](v88, "harvester"),  var0,  (uint64_t)v36);
          uint64_t v38 = GTResourceDownloaderProcessRequest(v35, (uint64_t)DownloadRequests);
          GTMTLCaptureState_appendDownloadRequests(v86, v38);
          [v91 setDownloadQueue:v89];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray downloader](v88, "downloader"));
          char v40 = v38;
          v8 = (apr_hash_t *)v95;
          [v39 downloadRequest:v40 atPoint:v91];

          unsigned __int8 v41 = GTResourceTrackerMake(v85, v95, v35);
          uint64_t v42 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v96->_downloadPoints, "objectAtIndexedSubscript:", ++v90));

          unint64_t v11 = v41;
          uint64_t v33 = v29[137];
          v91 = (void *)v42;
        }

        if ((v33 & 1) != 0 && IsFuncEnumPresent(*(_DWORD *)(v94 + 8)))
        {
          unint64_t layerRef = v96->_layerRef;
          __int128 v43 = GTTraceFunc_argumentBytesWithMap((void *)v94, *((unsigned __int8 *)v23 + 64 * v32 + 77), (uint64_t)v8);
          uint64_t v44 = *(void *)(GTTraceContext_getStream((uint64_t)v96->_traceContext, *((void *)v43 + 1)) + 32);
          if (v44)
          {
            unsigned int v45 = 0;
            while (1)
            {
              unsigned int v46 = atomic_load((unsigned int *)(v44 + 4));
              uint64_t v47 = v45 + (v46 >> 6) - 1;
              uint64_t v44 = *(void *)(v44 + 40);
              unsigned int v45 = v47;
              if (!v44)
              {
                v48 = v11;
                unsigned int v45 = v47;
                goto LABEL_42;
              }
            }

            v48 = v11;
          }

          else
          {
            v48 = v11;
            unsigned int v45 = 0;
          }

          uint64_t v47 = 0LL;
LABEL_42:
          unint64_t v49 = v45 | (unint64_t)(v47 << 32);
LABEL_43:
          uint64_t v50 = v44 + 64;
          while (v44 && (*(_BYTE *)(v50 + ((uint64_t)(HIDWORD(v49) - (int)v49) << 6) + 15) & 8) != 0)
          {
            __int128 v51 = (uint64_t *)(v50 + ((uint64_t)(HIDWORD(v49) - (int)v49) << 6));
            if (*((_DWORD *)v51 + 2) == -7167)
            {
              unint64_t v52 = GTTraceFunc_argumentBytesWithMap(v51, *((unsigned __int8 *)v51 + 13), v95);
              uint64_t Stream = GTTraceContext_getStream((uint64_t)v96->_traceContext, *((void *)v52 + 1));
              if (Stream)
              {
                objc_super v61 = (uint64_t *)Stream;
                v93 = newpool;
                uint64_t v62 = apr_array_make(newpool, 1, 56);
                uint64_t v64 = *v61;
                uint64_t v63 = v61[1];
                uint64_t v65 = *(void *)v94;
                LODWORD(v61) = GetFuncEnumConstructorType(*((_DWORD *)v51 + 2));
                v66 = (char *)apr_array_push(v62);
                *(void *)v66 = v63;
                *((void *)v66 + 1) = v64;
                *((void *)v66 + 2) = v65;
                *((void *)v66 + 3) = v65;
                *((void *)v66 + 4) = v65;
                *((_DWORD *)v66 + 10) = (_DWORD)v61;
                *((_DWORD *)v66 + 11) = 0;
                v66[48] = 1;
                *(_DWORD *)(v66 + 49) = 0;
                *((_DWORD *)v66 + 13) = 0;
                v67 = GTResourceHarvesterGetDownloadRequests( (pthread_mutex_t *)-[NSMutableArray harvester](v88, "harvester"),  var0,  (uint64_t)v62);
                v68 = GTResourceDownloaderProcessRequest(v93, (uint64_t)v67);
                v27 = v68;
                if (v68->nelts >= 1)
                {
                  uint64_t v69 = 0LL;
                  uint64_t v70 = 0LL;
                  v8 = (apr_hash_t *)v95;
                  unint64_t v11 = v48;
                  uint64_t v30 = (char *)v23 + 64;
                  int v57 = HIDWORD(v28);
                  do
                  {
                    uint64_t v71 = *v51;
                    unint64_t v72 = &v68->elts[v69];
                    v72[47] |= 4u;
                    *((void *)v72 + 3) = layerRef;
                    *((void *)v72 + 4) = v71;
                    ++v70;
                    v69 += 88LL;
                  }

                  while (v70 < v68->nelts);
                  goto LABEL_53;
                }

                v8 = (apr_hash_t *)v95;
LABEL_51:
                unint64_t v11 = v48;
                goto LABEL_52;
              }
            }

            unsigned int v54 = atomic_load((unsigned int *)(v44 + 4));
            int v55 = v49 + (v54 >> 6);
            uint64_t v56 = (HIDWORD(v49) + 1);
            unint64_t v49 = (v56 << 32) | v49;
            if ((_DWORD)v56 == v55 - 1)
            {
              unint64_t v49 = (v56 << 32) | v56;
              uint64_t v44 = *(void *)(v44 + 40);
              goto LABEL_43;
            }
          }

          v8 = (apr_hash_t *)v95;
          v27 = v92;
          goto LABEL_51;
        }

        v27 = v92;
LABEL_52:
        uint64_t v30 = (char *)v23 + 64;
        int v57 = HIDWORD(v28);
LABEL_53:
        GTResourceTrackerProcessFunction(v11, v94);
        unsigned int v58 = atomic_load((unsigned int *)v23 + 1);
        int v59 = v28 + (v58 >> 6);
        uint64_t v60 = (v57 + 1);
        unint64_t v28 = (v60 << 32) | v28;
        __int128 v29 = (void *)&unk_23A000;
        if ((_DWORD)v60 == v59 - 1)
        {
          unint64_t v28 = (v60 << 32) | v60;
          unsigned __int8 v23 = (GTTraceStoreNode)^(GTTraceStoreNode)AiAi *)*((void *)v23 + 5);
          goto LABEL_23;
        }
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLCommandBuffer commandQueue](v96, "commandQueue"));
      id v74 = [v73 traceStream];
      v75 = newpool;
      ResourceTracker_processUsedResidencySets((uint64_t)v11, v83, (uint64_t)v74, newpool);

      unint64_t v76 = ResourceTracker_harvestResources(v11, v75);
      v77 = GTResourceHarvesterGetDownloadRequests( (pthread_mutex_t *)-[NSMutableArray harvester](v88, "harvester"),  var0,  (uint64_t)v76);
      BOOL v78 = GTResourceDownloaderProcessRequest(v75, (uint64_t)v77);
      GTMTLCaptureState_appendDownloadRequests(v86, v78);
      v79 = v91;
      [v91 setDownloadQueue:v89];
      unint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray downloader](v88, "downloader"));
      [v80 downloadRequest:v78 atPoint:v91];

      if ((v29[137] & 1) != 0 && v96->_presentDrawableUsed)
      {
        uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( v96->_downloadPoints,  "objectAtIndexedSubscript:",  v90 + 1));

        GTMTLCaptureState_appendDownloadRequests(v86, v92);
        [v81 setDownloadQueue:v89];
        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray downloader](v88, "downloader"));
        [v82 downloadRequest:v92 atPoint:v81];

        v79 = v81;
      }

      apr_pool_destroy(v75);

      downloadPoints = v88;
    }

    else
    {
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      id v14 = self->_downloadPoints;
      id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v97,  v102,  16LL);
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v98;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v98 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)i);
            id v20 = [v19 downloadValue];
            unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 downloadEvent]);
            [v21 setSignaledValue:v20];
          }

          id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v97,  v102,  16LL);
        }

        while (v16);
      }

      downloadPoints = self->_downloadPoints;
      self->_downloadPoints = 0LL;
    }
  }
}

- (BOOL)isEnqueued
{
  return -[MTLCommandBufferSPI status](self->_baseObject, "status") != 0LL;
}

- (void)enqueue
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16362;
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
  v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (void)commit
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16361;
  unsigned __int8 v4 = v17;
  if (v17 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v13[1] + 24LL);
    uint64_t v7 = v18++;
    id v5 = GTTraceMemPool_allocateBytes(v6, v15, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    id v5 = (char *)(v3 + v17);
    v17 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v5 = var0;
  uint64_t v10 = (void *)v14;
  *(_BYTE *)(v14 + 15) |= 8u;
  -[CaptureMTLCommandBuffer _preCommitWithIndex:](self, "_preCommitWithIndex:", *v10);
  -[MTLCommandBufferSPI commit](self->_baseObject, "commit");
  if ((qword_23A448 & 0x10000) != 0) {
    -[MTLCommandBufferSPI waitUntilCompleted](self->_baseObject, "waitUntilCompleted");
  }
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v16;
  *(_BYTE *)(v14 + 15) |= 8u;
}

- (void)commitAndHold
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16202;
  unsigned __int8 v4 = v17;
  if (v17 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v13[1] + 24LL);
    uint64_t v7 = v18++;
    id v5 = GTTraceMemPool_allocateBytes(v6, v15, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    id v5 = (char *)(v3 + v17);
    v17 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v5 = var0;
  uint64_t v10 = (void *)v14;
  *(_BYTE *)(v14 + 15) |= 8u;
  -[CaptureMTLCommandBuffer _preCommitWithIndex:](self, "_preCommitWithIndex:", *v10);
  -[MTLCommandBufferSPI commitAndHold](self->_baseObject, "commitAndHold");
  s();
  *(void *)uint64_t v11 = v12;
  *(_BYTE *)(v11 + 8) = v16;
  *(_BYTE *)(v14 + 15) |= 8u;
}

- (void)commitWithDeadline:(unint64_t)a3
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v15);
  uint64_t v5 = v16;
  *(_DWORD *)(v16 + 8) = -15318;
  unsigned __int8 v6 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v15[1] + 24LL);
    uint64_t v9 = v20++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v17, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  uint64_t v12 = (void *)v16;
  *(_BYTE *)(v16 + 15) |= 8u;
  -[CaptureMTLCommandBuffer _preCommitWithIndex:](self, "_preCommitWithIndex:", *v12);
  -[MTLCommandBufferSPI commitWithDeadline:](self->_baseObject, "commitWithDeadline:", a3);
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (BOOL)commitAndWaitUntilSubmitted
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v17);
  uint64_t v3 = v18;
  *(_DWORD *)(v18 + 8) = -15908;
  unsigned __int8 v4 = v21;
  if (v21 > 0x30uLL)
  {
    uint64_t v6 = *(void *)(v17[1] + 24LL);
    uint64_t v7 = v22++;
    uint64_t v5 = GTTraceMemPool_allocateBytes(v6, v19, v7 | 0x1000000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    uint64_t v5 = (char *)(v3 + v21);
    v21 += 16;
  }

  *(_BYTE *)(v3 + 13) = v4;
  uint64_t v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v5 = var0;
  *((void *)v5 + 1) = 1LL;
  uint64_t v10 = (void *)v18;
  *(_BYTE *)(v18 + 15) |= 8u;
  -[CaptureMTLCommandBuffer _preCommitWithIndex:](self, "_preCommitWithIndex:", *v10);
  unsigned int v11 = -[MTLCommandBufferSPI commitAndWaitUntilSubmitted]( self->_baseObject,  "commitAndWaitUntilSubmitted");
  uint64_t v12 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v12) {
    unint64_t v13 = v12->var0;
  }
  else {
    unint64_t v13 = 0LL;
  }
  *(void *)uint64_t v5 = v13;
  *((_DWORD *)v5 + 2) = v11;
  *((_DWORD *)v5 + 3) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v20;
  *(_BYTE *)(v18 + 15) |= 8u;
  return v11;
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    CommandQueueCaptureResidencySetSnapshots(self->_captureCommandQueue);
  }
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -15316;
  unsigned __int8 v6 = v23;
  if (v23 > 0x28uLL)
  {
    uint64_t v8 = *(void *)(v19[1] + 24LL);
    uint64_t v9 = v24++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v21, v9 | 0x1800000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v23);
    v23 += 24;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  *((void *)v7 + 2) = 1LL;
  uint64_t v12 = (void *)v20;
  *(_BYTE *)(v20 + 15) |= 8u;
  -[CaptureMTLCommandBuffer _preCommitWithIndex:](self, "_preCommitWithIndex:", *v12);
  unsigned int v13 = -[MTLCommandBufferSPI commitAndWaitUntilSubmittedWithDeadline:]( self->_baseObject,  "commitAndWaitUntilSubmittedWithDeadline:",  a3);
  uint64_t v14 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v14) {
    unint64_t v15 = v14->var0;
  }
  else {
    unint64_t v15 = 0LL;
  }
  *(void *)uint64_t v7 = v15;
  *((void *)v7 + 1) = a3;
  *((_DWORD *)v7 + 4) = v13;
  *((_DWORD *)v7 + 5) = 0;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
  return v13;
}

- (void)addScheduledHandler:(id)a3
{
  id v4 = a3;
  scheduledDispatchArray = self->_scheduledDispatchArray;
  if (!scheduledDispatchArray)
  {
    unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = self->_scheduledDispatchArray;
    self->_scheduledDispatchArray = v6;

    scheduledDispatchArray = self->_scheduledDispatchArray;
  }

  id v8 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](scheduledDispatchArray, "addObject:", v8);

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16360;
  unsigned __int8 v10 = v22;
  if (v22 > 0x30uLL)
  {
    uint64_t v12 = *(void *)(v18[1] + 24LL);
    uint64_t v13 = v23++;
    unsigned int v11 = GTTraceMemPool_allocateBytes(v12, v20, v13 | 0x1000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    unsigned int v11 = (char *)(v9 + v22);
    v22 += 16;
  }

  *(_BYTE *)(v9 + 13) = v10;
  uint64_t v14 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned int v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
}

- (void)trackPresent:(id)a3
{
  id v4 = a3;
  self->_unint64_t layerRef = 0LL;
  id v8 = v4;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CAMetalDrawable])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
    unsigned __int8 v6 = (unint64_t *)[v5 traceStream];
    if (v6) {
      unint64_t v7 = *v6;
    }
    else {
      unint64_t v7 = 0LL;
    }
    self->_unint64_t layerRef = v7;
    GTTelemetry_trackPresent(v8);
  }

  self->_presentDrawableUsed = 1;
}

- (void)presentDrawable:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[CaptureMTLCommandBuffer trackPresent:](self, "trackPresent:", v4);
  baseObject = self->_baseObject;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI presentDrawable:](baseObject, "presentDrawable:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16359;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    unsigned __int8 v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    unsigned __int8 v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)unsigned __int8 v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
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
  -[CaptureMTLCommandBuffer trackPresent:](self, "trackPresent:", v6);
  baseObject = self->_baseObject;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLCommandBufferSPI presentDrawable:atTime:](baseObject, "presentDrawable:atTime:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16358;
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
  unint64_t v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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
  *((double *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
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
  -[CaptureMTLCommandBuffer trackPresent:](self, "trackPresent:", v6);
  baseObject = self->_baseObject;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLCommandBufferSPI presentDrawable:afterMinimumDuration:]( baseObject,  "presentDrawable:afterMinimumDuration:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16133;
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
  unint64_t v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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
  *((double *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)addCompletedHandler:(id)a3
{
  id v4 = a3;
  completedDispatchArray = self->_completedDispatchArray;
  if (!completedDispatchArray)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unint64_t v7 = self->_completedDispatchArray;
    self->_completedDispatchArray = v6;

    completedDispatchArray = self->_completedDispatchArray;
  }

  id v8 = objc_retainBlock(v4);
  -[NSMutableArray addObject:](completedDispatchArray, "addObject:", v8);

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v18);
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16356;
  unsigned __int8 v10 = v22;
  if (v22 > 0x30uLL)
  {
    uint64_t v12 = *(void *)(v18[1] + 24LL);
    uint64_t v13 = v23++;
    unsigned __int8 v11 = GTTraceMemPool_allocateBytes(v12, v20, v13 | 0x1000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    unsigned __int8 v11 = (char *)(v9 + v22);
    v22 += 16;
  }

  *(_BYTE *)(v9 + 13) = v10;
  uint64_t v14 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v11 = var0;
  *((void *)v11 + 1) = v4;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
}

- (id)debugCommandEncoder
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI debugCommandEncoder](self->_baseObject, "debugCommandEncoder"));
  if (v3) {
    id v4 = -[CaptureMTLDebugCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLDebugCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v3,  self);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)waitUntilCompleted
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16355;
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
  id v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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
  -[MTLCommandBufferSPI waitUntilCompleted](self->_baseObject, "waitUntilCompleted");
}

- (unint64_t)accelerationStructureCommandEncoderPreamble
{
  if (!self->_accelerationStructureDescriptorProcessEvent)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI device](self->_baseObject, "device"));
    id v4 = DEVICEOBJECT(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    uint64_t v6 = (MTLSharedEvent *)[v5 newSharedEvent];
    accelerationStructureDescriptorProcessEvent = self->_accelerationStructureDescriptorProcessEvent;
    self->_accelerationStructureDescriptorProcessEvent = v6;

    self->_accelerationStructureDescriptorCopyEventValue = 0LL;
  }

  unint64_t result = self->_accelerationStructureDescriptorCopyEventValue;
  self->_accelerationStructureDescriptorCopyEventValue = result + 1;
  return result;
}

- (id)accelerationStructureCommandEncoder
{
  unint64_t v3 = -[CaptureMTLCommandBuffer accelerationStructureCommandEncoderPreamble]( self,  "accelerationStructureCommandEncoderPreamble");
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v6 = __ldaxr(p_var2);
  while (__stlxr(v6 + 1, p_var2));
  __int128 v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v6;
  s();
  id v8 = v7;
  uint64_t v9 = *v7;
  *uint64_t v7 = v10;
  uint64_t v33 = v9;
  char v34 = *((_BYTE *)v7 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI accelerationStructureCommandEncoder]( self->_baseObject,  "accelerationStructureCommandEncoder"));
  if (v11) {
    uint64_t v12 = -[CaptureMTLAccelerationStructureCommandEncoder initWithBaseObject:captureCommandBuffer:copyEventValue:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructureCommandEncoder),  "initWithBaseObject:captureCommandBuffer:copyEventValue:",  v11,  self,  v3);
  }
  else {
    uint64_t v12 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v29,  (uint64_t)-[CaptureMTLAccelerationStructureCommandEncoder traceStream](v12, "traceStream"));
  uint64_t v13 = v31;
  *(_DWORD *)(v31 + 8) = -15673;
  char v14 = v35;
  if (v35 > 0x30uLL)
  {
    uint64_t v16 = *(void *)(v30 + 24);
    uint64_t v17 = HIBYTE(v35);
    ++HIBYTE(v35);
    char v15 = GTTraceMemPool_allocateBytes(v16, v32, v17 | 0x1000000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    char v15 = (char *)(v13 + v35);
    LOBYTE(v35) = v35 + 16;
  }

  *(_BYTE *)(v13 + 13) = v14;
  uint64_t v18 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](v12, "traceStream");
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0LL;
  }
  *(void *)char v15 = var0;
  *((void *)v15 + 1) = v21;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v31 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v23 = v31;
  __int128 v24 = *(_OWORD *)(v31 + 16);
  __int128 v26 = *(_OWORD *)(v31 + 32);
  __int128 v25 = *(_OWORD *)(v31 + 48);
  _OWORD *v27 = *(_OWORD *)v31;
  v27[1] = v24;
  v27[2] = v26;
  v27[3] = v25;
  uint64_t *v8 = v33;
  *((_BYTE *)v8 + 8) = v34;
  *(_BYTE *)(v23 + 15) |= 8u;

  return v12;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[CaptureMTLCommandBuffer accelerationStructureCommandEncoderPreamble]( self,  "accelerationStructureCommandEncoderPreamble");
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v8 = __ldaxr(p_var2);
  while (__stlxr(v8 + 1, p_var2));
  __int16 v35 = traceContext;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  unint64_t v38 = v8;
  s();
  uint64_t v10 = v9;
  uint64_t v11 = *v9;
  *uint64_t v9 = v12;
  uint64_t v39 = v11;
  char v40 = *((_BYTE *)v9 + 8);
  __int16 v41 = 16400;
  int v42 = 0;
  char v43 = 0;
  baseObject = self->_baseObject;
  id v14 = unwrapMTLAccelerationStructurePassDescriptor_(v4, self->_retainedObjects);
  char v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI accelerationStructureCommandEncoderWithDescriptor:]( baseObject,  "accelerationStructureCommandEncoderWithDescriptor:",  v15));

  if (v16) {
    uint64_t v17 = -[CaptureMTLAccelerationStructureCommandEncoder initWithBaseObject:captureCommandBuffer:copyEventValue:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructureCommandEncoder),  "initWithBaseObject:captureCommandBuffer:copyEventValue:",  v16,  self,  v5);
  }
  else {
    uint64_t v17 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v35,  (uint64_t)-[CaptureMTLAccelerationStructureCommandEncoder traceStream](v17, "traceStream"));
  uint64_t v18 = v37;
  *(_DWORD *)(v37 + 8) = -15364;
  char v19 = v41;
  if (v41 > 0x28uLL)
  {
    uint64_t v21 = *(void *)(v36 + 24);
    uint64_t v22 = HIBYTE(v41);
    ++HIBYTE(v41);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v38, v22 | 0x1800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v41);
    LOBYTE(v41) = v41 + 24;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v25 = -[CaptureMTLAccelerationStructureCommandEncoder traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  char v27 = SaveMTLAccelerationStructurePassDescriptor((uint64_t)&v35, v4);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  v20[16] = v27;
  *(_DWORD *)(v20 + 17) = 0;
  *((_DWORD *)v20 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v37 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v29 = v37;
  __int128 v30 = *(_OWORD *)(v37 + 16);
  __int128 v32 = *(_OWORD *)(v37 + 32);
  __int128 v31 = *(_OWORD *)(v37 + 48);
  *uint64_t v33 = *(_OWORD *)v37;
  v33[1] = v30;
  v33[2] = v32;
  v33[3] = v31;
  uint64_t *v10 = v39;
  *((_BYTE *)v10 + 8) = v40;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v17;
}

- (void)useResidencySet:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CaptureMTLResidencySet, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    ResidencySetTakeSnapshotInternal(v4, 0);
  }
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI useResidencySet:](baseObject, "useResidencySet:", v9);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15254;
  unsigned __int8 v11 = v25;
  if (v25 > 0x30uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1000000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    uint64_t v12 = (char *)(v10 + v25);
    v25 += 16;
  }

  *(_BYTE *)(v10 + 13) = v11;
  char v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v17 = (uint64_t *)[v4 traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  *(void *)uint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    for (uint64_t i = 0LL; i != a4; ++i)
    {
      unint64_t v8 = a3[i];
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___CaptureMTLResidencySet, a2);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
        ResidencySetTakeSnapshotInternal((void *)a3[i], 0);
      }
    }

    RetainArray(self->_retainedObjects, (id *)a3, a4);
  }

  else
  {
  }

  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  unint64_t v12 = 8 * a4;
  __chkstk_darwin(v10, v13);
  if (a4)
  {
    uint64_t v14 = a3;
    char v15 = &v30[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v16 = a4;
    do
    {
      uint64_t v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  -[MTLCommandBufferSPI useResidencySets:count:]( baseObject,  "useResidencySets:count:",  &v30[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15253;
  unsigned __int8 v19 = v35;
  if (v35 > 0x28uLL)
  {
    uint64_t v21 = *(void *)(v31 + 24);
    uint64_t v22 = v36++;
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v33, v22 | 0x1800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v35);
    v35 += 24;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v23, v24);
  char v26 = StreamArray((uint64_t)v30, &v30[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = a4;
  v20[16] = v26;
  *(_DWORD *)(v20 + 17) = 0;
  *((_DWORD *)v20 + 5) = 0;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v34;
  *(_BYTE *)(v32 + 15) |= 8u;
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (void)touch
{
  traceuint64_t Stream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    p_unint64_t var1 = &traceStream[1].var1;
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
  traceuint64_t Stream = self->_traceStream;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLCommandBuffer;
  uint64_t v3 = -[CaptureMTLCommandBuffer description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLCommandBufferSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (double)GPUEndTime
{
  return result;
}

- (double)GPUStartTime
{
  return result;
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)self->_captureCommandQueue;
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)-[MTLCommandBufferSPI deadlineProfile](self->_baseObject, "deadlineProfile");
}

- (MTLDevice)device
{
  return -[CaptureMTLCommandQueue device](self->_captureCommandQueue, "device");
}

- (NSError)error
{
  return (NSError *)-[MTLCommandBufferSPI error](self->_baseObject, "error");
}

- (unint64_t)errorOptions
{
  return (unint64_t)-[MTLCommandBufferSPI errorOptions](self->_baseObject, "errorOptions");
}

- (unint64_t)globalTraceObjectID
{
  return (unint64_t)-[MTLCommandBufferSPI globalTraceObjectID](self->_baseObject, "globalTraceObjectID");
}

- (double)kernelEndTime
{
  return result;
}

- (double)kernelStartTime
{
  return result;
}

- (NSString)label
{
  return (NSString *)-[MTLCommandBufferSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLCommandBufferSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16365;
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
  uint64_t v10 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (unint64_t)getListIndex
{
  return (unint64_t)-[MTLCommandBufferSPI getListIndex](self->_baseObject, "getListIndex");
}

- (MTLLogContainer)logs
{
  return (MTLLogContainer *)-[MTLCommandBufferSPI logs](self->_baseObject, "logs");
}

- (MTLBuffer)privateData
{
  return (MTLBuffer *)-[MTLCommandBufferSPI privateData](self->_baseObject, "privateData");
}

- (void)setPrivateData:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_setPrivateData",  (uint64_t)"Command Buffer Private Data",  0LL,  0LL);
  -[MTLCommandBufferSPI setPrivateData:](self->_baseObject, "setPrivateData:", v4);
}

- (unint64_t)privateDataOffset
{
  return (unint64_t)-[MTLCommandBufferSPI privateDataOffset](self->_baseObject, "privateDataOffset");
}

- (void)setPrivateDataOffset:(unint64_t)a3
{
}

- (MTLBuffer)privateLoggingBuffer
{
  return (MTLBuffer *)-[MTLCommandBufferSPI privateLoggingBuffer](self->_baseObject, "privateLoggingBuffer");
}

- (void)setPrivateLoggingBuffer:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_setPrivateLoggingBuffer",  (uint64_t)"Command Buffer logging",  0LL,  0LL);
  -[MTLCommandBufferSPI setPrivateLoggingBuffer:](self->_baseObject, "setPrivateLoggingBuffer:", v4);
}

- (BOOL)isProfilingEnabled
{
  return -[MTLCommandBufferSPI isProfilingEnabled](self->_baseObject, "isProfilingEnabled");
}

- (void)setProfilingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLCommandBufferSPI setProfilingEnabled:](self->_baseObject, "setProfilingEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16364;
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
  uint64_t v10 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (NSDictionary)profilingResults
{
  return (NSDictionary *)-[MTLCommandBufferSPI profilingResults](self->_baseObject, "profilingResults");
}

- (BOOL)retainedReferences
{
  return -[MTLCommandBufferSPI retainedReferences](self->_baseObject, "retainedReferences");
}

- (unint64_t)status
{
  return (unint64_t)-[MTLCommandBufferSPI status](self->_baseObject, "status");
}

- (NSMutableDictionary)userDictionary
{
  return (NSMutableDictionary *)-[MTLCommandBufferSPI userDictionary](self->_baseObject, "userDictionary");
}

- (void)addPurgedHeap:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI addPurgedHeap:](baseObject, "addPurgedHeap:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15966;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)addPurgedResource:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI addPurgedResource:](baseObject, "addPurgedResource:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15967;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (id)blitCommandEncoder
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v5;
  s();
  int v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v32 = v8;
  char v33 = *((_BYTE *)v6 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI blitCommandEncoder](self->_baseObject, "blitCommandEncoder"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLBlitCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLBlitCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLBlitCommandEncoder traceStream](v11, "traceStream"));
  uint64_t v12 = v30;
  *(_DWORD *)(v30 + 8) = -16354;
  char v13 = v34;
  if (v34 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v29 + 24);
    uint64_t v16 = HIBYTE(v34);
    ++HIBYTE(v34);
    id v14 = GTTraceMemPool_allocateBytes(v15, v31, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v34);
    LOBYTE(v34) = v34 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = -[CaptureMTLBlitCommandEncoder traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v30 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v22 = v30;
  __int128 v23 = *(_OWORD *)(v30 + 16);
  __int128 v25 = *(_OWORD *)(v30 + 32);
  __int128 v24 = *(_OWORD *)(v30 + 48);
  _OWORD *v26 = *(_OWORD *)v30;
  v26[1] = v23;
  v26[2] = v25;
  v26[3] = v24;
  *int v7 = v32;
  *((_BYTE *)v7 + 8) = v33;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int16 v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLBlitPassDescriptor_(v4, self->_retainedObjects);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI blitCommandEncoderWithDescriptor:]( baseObject,  "blitCommandEncoderWithDescriptor:",  v14));

  if (v15) {
    uint64_t v16 = -[CaptureMTLBlitCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLBlitCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v15,  self);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLBlitCommandEncoder traceStream](v16, "traceStream"));
  uint64_t v17 = v36;
  *(_DWORD *)(v36 + 8) = -15587;
  char v18 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v35 + 24);
    uint64_t v21 = HIBYTE(v40);
    ++HIBYTE(v40);
    unsigned __int8 v19 = GTTraceMemPool_allocateBytes(v20, v37, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    unsigned __int8 v19 = (char *)(v17 + v40);
    LOBYTE(v40) = v40 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v24 = -[CaptureMTLBlitCommandEncoder traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLBlitPassDescriptor((uint64_t)&v34, v4);
  *(void *)unsigned __int8 v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v36 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v28 = v36;
  __int128 v29 = *(_OWORD *)(v36 + 16);
  __int128 v31 = *(_OWORD *)(v36 + 32);
  __int128 v30 = *(_OWORD *)(v36 + 48);
  *uint64_t v32 = *(_OWORD *)v36;
  v32[1] = v29;
  v32[2] = v31;
  v32[3] = v30;
  *uint64_t v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (id)computeCommandEncoder
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v5;
  s();
  unint64_t v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v32 = v8;
  char v33 = *((_BYTE *)v6 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI computeCommandEncoder](self->_baseObject, "computeCommandEncoder"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLComputeCommandEncoder traceStream](v11, "traceStream"));
  uint64_t v12 = v30;
  *(_DWORD *)(v30 + 8) = -16352;
  char v13 = v34;
  if (v34 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v29 + 24);
    uint64_t v16 = HIBYTE(v34);
    ++HIBYTE(v34);
    id v14 = GTTraceMemPool_allocateBytes(v15, v31, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v34);
    LOBYTE(v34) = v34 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = -[CaptureMTLComputeCommandEncoder traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v30 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v22 = v30;
  __int128 v23 = *(_OWORD *)(v30 + 16);
  __int128 v25 = *(_OWORD *)(v30 + 32);
  __int128 v24 = *(_OWORD *)(v30 + 48);
  _OWORD *v26 = *(_OWORD *)v30;
  v26[1] = v23;
  v26[2] = v25;
  v26[3] = v24;
  *unint64_t v7 = v32;
  *((_BYTE *)v7 + 8) = v33;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int16 v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLComputePassDescriptor_(v4, self->_retainedObjects);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI computeCommandEncoderWithDescriptor:]( baseObject,  "computeCommandEncoderWithDescriptor:",  v14));

  if (v15) {
    uint64_t v16 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v15,  self);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLComputeCommandEncoder traceStream](v16, "traceStream"));
  uint64_t v17 = v36;
  *(_DWORD *)(v36 + 8) = -15586;
  char v18 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v35 + 24);
    uint64_t v21 = HIBYTE(v40);
    ++HIBYTE(v40);
    unsigned __int8 v19 = GTTraceMemPool_allocateBytes(v20, v37, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    unsigned __int8 v19 = (char *)(v17 + v40);
    LOBYTE(v40) = v40 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v24 = -[CaptureMTLComputeCommandEncoder traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLComputePassDescriptor((uint64_t)&v34, v4);
  *(void *)unsigned __int8 v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v36 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v28 = v36;
  __int128 v29 = *(_OWORD *)(v36 + 16);
  __int128 v31 = *(_OWORD *)(v36 + 32);
  __int128 v30 = *(_OWORD *)(v36 + 48);
  *uint64_t v32 = *(_OWORD *)v36;
  v32[1] = v29;
  v32[2] = v31;
  v32[3] = v30;
  *uint64_t v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int128 v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v34 = v10;
  char v35 = *((_BYTE *)v8 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI computeCommandEncoderWithDispatchType:]( self->_baseObject,  "computeCommandEncoderWithDispatchType:",  a3));
  if (v12) {
    id v13 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLComputeCommandEncoder traceStream](v13, "traceStream"));
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16014;
  char v15 = v36;
  if (v36 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v31 + 24);
    uint64_t v18 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v33, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v36);
    LOBYTE(v36) = v36 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLComputeCommandEncoder traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v32 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v24 = v32;
  __int128 v25 = *(_OWORD *)(v32 + 16);
  __int128 v27 = *(_OWORD *)(v32 + 32);
  __int128 v26 = *(_OWORD *)(v32 + 48);
  *uint64_t v28 = *(_OWORD *)v32;
  v28[1] = v25;
  v28[2] = v27;
  v28[3] = v26;
  *uint64_t v9 = v34;
  *((_BYTE *)v9 + 8) = v35;
  *(_BYTE *)(v24 + 15) |= 8u;

  return v13;
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3 substreamCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v20);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI computeCommandEncoderWithDispatchType:substreamCount:]( self->_baseObject,  "computeCommandEncoderWithDispatchType:substreamCount:",  a3,  v4));
  uint64_t v8 = v21;
  *(_DWORD *)(v21 + 8) = -15712;
  unsigned __int8 v9 = v24;
  if (v24 > 0x20uLL)
  {
    uint64_t v11 = *(void *)(v20[1] + 24LL);
    uint64_t v12 = v25++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v22, v12 | 0x2000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v24);
    v24 += 32;
  }

  *(_BYTE *)(v8 + 13) = v9;
  id v13 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v15 = (uint64_t *)[v7 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  *((void *)v10 + 2) = a3;
  *((_DWORD *)v10 + 6) = v4;
  *((_DWORD *)v10 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
  return v7;
}

- (void)configWithCommandBufferDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_configWithCommandBufferDescriptor",  (uint64_t)"Shader logging",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v6 = unwrapMTLCommandBufferDescriptor(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[MTLCommandBufferSPI configWithCommandBufferDescriptor:](baseObject, "configWithCommandBufferDescriptor:", v7);
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  return -[MTLCommandBufferSPI debugBufferContentsWithLength:](self->_baseObject, "debugBufferContentsWithLength:", a3);
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  id v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  if (a4)
  {
    uint64_t v11 = a3;
    uint64_t v12 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLCommandBufferSPI dropResourceGroups:count:]( baseObject,  "dropResourceGroups:count:",  &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15897;
  unsigned __int8 v16 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v28 + 24);
    uint64_t v19 = v33++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x1800000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v20, v21);
  char v23 = StreamArray((uint64_t)v27, &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  id v6 = a4;
  RetainArray(self->_retainedObjects, (id *)a4, a5);
  baseObject = self->_baseObject;
  __chkstk_darwin(v10, v11);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v14 = (char *)&v18 - v13;
  if (a5)
  {
    uint64_t v15 = (uint64_t *)((char *)&v18 - v13);
    unint64_t v16 = a5;
    do
    {
      uint64_t v17 = (void *)*v6++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  -[MTLCommandBufferSPI encodeCacheHintFinalize:resourceGroups:count:]( baseObject,  "encodeCacheHintFinalize:resourceGroups:count:",  a3,  v14,  a5);
}

- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  id v6 = a4;
  RetainArray(self->_retainedObjects, (id *)a4, a5);
  baseObject = self->_baseObject;
  __chkstk_darwin(v10, v11);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v14 = (char *)&v18 - v13;
  if (a5)
  {
    uint64_t v15 = (uint64_t *)((char *)&v18 - v13);
    unint64_t v16 = a5;
    do
    {
      uint64_t v17 = (void *)*v6++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  -[MTLCommandBufferSPI encodeCacheHintTag:resourceGroups:count:]( baseObject,  "encodeCacheHintTag:resourceGroups:count:",  a3,  v14,  a5);
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_encodeConditionalAbortEvent",  (uint64_t)"Conditional abort",  0LL,  0LL);
  [v8 touch];
  id v4 = v8;
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
      id v4 = v8;
    }
  }

  baseObject = self->_baseObject;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI encodeConditionalAbortEvent:](baseObject, "encodeConditionalAbortEvent:", v7);
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
  baseObject = self->_baseObject;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLCommandBufferSPI encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:]( baseObject,  "encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15501;
  unsigned __int8 v15 = v29;
  if (v29 > 0x18uLL)
  {
    uint64_t v17 = *(void *)(v25[1] + 24LL);
    uint64_t v18 = v30++;
    unint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x2800000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    unint64_t v16 = (char *)(v14 + v29);
    v29 += 40;
  }

  *(_BYTE *)(v14 + 13) = v15;
  uint64_t v19 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = (uint64_t *)[v10 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  *(void *)unint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLCommandBufferSPI encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:]( baseObject,  "encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:",  v15,  a4,  a5,  a6,  a7);

  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15410;
  unsigned __int8 v17 = v33;
  if (v33 > 0x18uLL)
  {
    uint64_t v19 = *(void *)(v29[1] + 24LL);
    uint64_t v20 = v34++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2800000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    v33 += 40;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = (uint64_t *)[v12 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0LL;
  }
  char v25 = GTTraceEncoder_storeBytes((uint64_t)v29, (void *)a5, 8 * a7);
  char v26 = GTTraceEncoder_storeBytes((uint64_t)v29, (void *)a6, 8 * a7);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a7;
  v18[32] = v25;
  v18[33] = v26;
  *(_DWORD *)(v18 + 34) = 0;
  *((_WORD *)v18 + 19) = 0;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  id v4 = a3;
  [v4 touch];
  if (v4)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v4);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  baseObject = self->_baseObject;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLCommandBufferSPI encodeDashboardTagForResourceGroup:](baseObject, "encodeDashboardTagForResourceGroup:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -15500;
  unsigned __int8 v9 = v23;
  if (v23 > 0x30uLL)
  {
    uint64_t v11 = *(void *)(v19[1] + 24LL);
    uint64_t v12 = v24++;
    id v10 = GTTraceMemPool_allocateBytes(v11, v21, v12 | 0x1000000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    id v10 = (char *)(v8 + v23);
    v23 += 16;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unint64_t v13 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v15 = (uint64_t *)[v4 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
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
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLCommandBufferSPI encodeSignalEvent:value:](baseObject, "encodeSignalEvent:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15990;
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
  unsigned __int8 v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  id v12 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_encodeSignalEvent_value_agentMask",  (uint64_t)"Shared event agent mask",  0LL,  0LL);
  [v12 touch];
  uint64_t v8 = v12;
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
      uint64_t v8 = v12;
    }
  }

  baseObject = self->_baseObject;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLCommandBufferSPI encodeSignalEvent:value:agentMask:]( baseObject,  "encodeSignalEvent:value:agentMask:",  v11,  a4,  a5);
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
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
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLCommandBufferSPI encodeSignalEventScheduled:value:](baseObject, "encodeSignalEventScheduled:value:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15217;
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
  unsigned __int8 v15 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  unsigned __int8 v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLRenderPassDescriptor_(v4, self->_retainedObjects);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI parallelRenderCommandEncoderWithDescriptor:]( baseObject,  "parallelRenderCommandEncoderWithDescriptor:",  v14));

  if (v15) {
    uint64_t v16 = -[CaptureMTLParallelRenderCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLParallelRenderCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v15,  self);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v34,  (uint64_t)-[CaptureMTLParallelRenderCommandEncoder traceStream](v16, "traceStream"));
  uint64_t v17 = v36;
  *(_DWORD *)(v36 + 8) = -16351;
  char v18 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v35 + 24);
    uint64_t v21 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v37, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v40);
    LOBYTE(v40) = v40 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v24 = -[CaptureMTLParallelRenderCommandEncoder traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLRenderPassDescriptor((uint64_t)&v34, v4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v36 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v28 = v36;
  __int128 v29 = *(_OWORD *)(v36 + 16);
  __int128 v31 = *(_OWORD *)(v36 + 32);
  __int128 v30 = *(_OWORD *)(v36 + 48);
  *char v32 = *(_OWORD *)v36;
  v32[1] = v29;
  v32[2] = v31;
  v32[3] = v30;
  *unsigned __int8 v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16064;
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
  uint64_t v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (void)presentDrawable:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLCommandBuffer_presentDrawable_options",  (uint64_t)"Present SPI",  0LL,  0LL);
  [v11 touch];
  uint64_t v7 = v11;
  if (v11)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v11);
      uint64_t v7 = v11;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLCommandBufferSPI presentDrawable:options:](baseObject, "presentDrawable:options:", v10, v6);
}

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLCommandBufferSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16065;
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
  uint64_t v10 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLRenderPassDescriptor_(v4, self->_retainedObjects);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI renderCommandEncoderWithDescriptor:]( baseObject,  "renderCommandEncoderWithDescriptor:",  v14));

  if (v15) {
    size_t v16 = -[CaptureMTLRenderCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v15,  self);
  }
  else {
    size_t v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLRenderCommandEncoder traceStream](v16, "traceStream"));
  uint64_t v17 = v36;
  *(_DWORD *)(v36 + 8) = -16353;
  char v18 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v35 + 24);
    uint64_t v21 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v37, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v40);
    LOBYTE(v40) = v40 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  char v22 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v24 = -[CaptureMTLRenderCommandEncoder traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLRenderPassDescriptor((uint64_t)&v34, v4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v36 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v28 = v36;
  __int128 v29 = *(_OWORD *)(v36 + 16);
  __int128 v31 = *(_OWORD *)(v36 + 32);
  __int128 v30 = *(_OWORD *)(v36 + 48);
  *char v32 = *(_OWORD *)v36;
  v32[1] = v29;
  v32[2] = v31;
  v32[3] = v30;
  *uint64_t v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (id)resourceStateCommandEncoder
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v5;
  s();
  unint64_t v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v32 = v8;
  char v33 = *((_BYTE *)v6 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTLCommandBufferSPI resourceStateCommandEncoder](self->_baseObject, "resourceStateCommandEncoder"));
  if (v10) {
    uint64_t v11 = -[CaptureMTLResourceStateCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLResourceStateCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v10,  self);
  }
  else {
    uint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v28,  (uint64_t)-[CaptureMTLResourceStateCommandEncoder traceStream](v11, "traceStream"));
  uint64_t v12 = v30;
  *(_DWORD *)(v30 + 8) = -15870;
  char v13 = v34;
  if (v34 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v29 + 24);
    uint64_t v16 = HIBYTE(v34);
    ++HIBYTE(v34);
    id v14 = GTTraceMemPool_allocateBytes(v15, v31, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v34);
    LOBYTE(v34) = v34 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = -[CaptureMTLResourceStateCommandEncoder traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v30 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v22 = v30;
  __int128 v23 = *(_OWORD *)(v30 + 16);
  __int128 v25 = *(_OWORD *)(v30 + 32);
  __int128 v24 = *(_OWORD *)(v30 + 48);
  _OWORD *v26 = *(_OWORD *)v30;
  v26[1] = v23;
  v26[2] = v25;
  v26[3] = v24;
  *unint64_t v7 = v32;
  *((_BYTE *)v7 + 8) = v33;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v11;
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int16 v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  uint64_t *v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLResourceStatePassDescriptor_(v4, self->_retainedObjects);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI resourceStateCommandEncoderWithDescriptor:]( baseObject,  "resourceStateCommandEncoderWithDescriptor:",  v14));

  if (v15) {
    uint64_t v16 = -[CaptureMTLResourceStateCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLResourceStateCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v15,  self);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream( (uint64_t *)&v34,  (uint64_t)-[CaptureMTLResourceStateCommandEncoder traceStream](v16, "traceStream"));
  uint64_t v17 = v36;
  *(_DWORD *)(v36 + 8) = -15585;
  char v18 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v20 = *(void *)(v35 + 24);
    uint64_t v21 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v37, v21 | 0x1800000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v40);
    LOBYTE(v40) = v40 + 24;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v24 = -[CaptureMTLResourceStateCommandEncoder traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLResourceStatePassDescriptor((uint64_t)&v34, v4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v36 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v28 = v36;
  __int128 v29 = *(_OWORD *)(v36 + 16);
  __int128 v31 = *(_OWORD *)(v36 + 32);
  __int128 v30 = *(_OWORD *)(v36 + 48);
  *uint64_t v32 = *(_OWORD *)v36;
  v32[1] = v29;
  v32[2] = v31;
  v32[3] = v30;
  *uint64_t v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v16;
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  __int16 v40 = traceContext;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  unint64_t v43 = v11;
  s();
  id v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v44 = v14;
  char v45 = *((_BYTE *)v12 + 8);
  __int16 v46 = 16400;
  int v47 = 0;
  char v48 = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapMTLComputePassDescriptor_(v8, self->_retainedObjects);
  char v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:]( baseObject,  "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:",  v18,  a4,  a5));

  if (v19) {
    uint64_t v20 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v19,  self);
  }
  else {
    uint64_t v20 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v40, (uint64_t)-[CaptureMTLComputeCommandEncoder traceStream](v20, "traceStream"));
  uint64_t v21 = v42;
  *(_DWORD *)(v42 + 8) = -15584;
  char v22 = v46;
  char v39 = a4;
  if (v46 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v41 + 24);
    uint64_t v25 = HIBYTE(v46);
    ++HIBYTE(v46);
    __int128 v23 = GTTraceMemPool_allocateBytes(v24, v43, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    __int128 v23 = (char *)(v21 + v46);
    LOBYTE(v46) = v46 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  char v26 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLComputeCommandEncoder traceStream](v20, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  char v30 = SaveMTLComputePassDescriptor((uint64_t)&v40, v8);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)&v40, v39, a5);
  }
  else {
    char v31 = 0;
  }
  *(void *)__int128 v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = a5;
  v23[24] = v30;
  v23[25] = v31;
  *(_DWORD *)(v23 + 26) = 0;
  *((_WORD *)v23 + 15) = 0;
  traceuint64_t Stream = self->_traceStream;
  *(_BYTE *)(v42 + 15) |= 8u;
  PushFunc((uint64_t)traceStream);
  uint64_t v33 = v42;
  __int128 v34 = *(_OWORD *)(v42 + 16);
  __int128 v36 = *(_OWORD *)(v42 + 32);
  __int128 v35 = *(_OWORD *)(v42 + 48);
  _OWORD *v37 = *(_OWORD *)v42;
  v37[1] = v34;
  v37[2] = v36;
  v37[3] = v35;
  uint64_t *v13 = v44;
  *((_BYTE *)v13 + 8) = v45;
  *(_BYTE *)(v33 + 15) |= 8u;

  return v20;
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:]( self->_baseObject,  "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:",  a3,  a4,  a5));
  if (v6) {
    unint64_t v7 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v6,  self);
  }
  else {
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:]( self->_baseObject,  "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:",  a3,  a4));
  if (v5) {
    unsigned __int8 v6 = -[CaptureMTLComputeCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputeCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v5,  self);
  }
  else {
    unsigned __int8 v6 = 0LL;
  }

  return v6;
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  baseObject = self->_baseObject;
  id v9 = unwrapMTLRenderPassDescriptor_(a3, self->_retainedObjects);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTLCommandBufferSPI sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:]( baseObject,  "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:",  v10,  a4,  a5));

  if (v11) {
    uint64_t v12 = -[CaptureMTLRenderCommandEncoder initWithBaseObject:captureCommandBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderCommandEncoder),  "initWithBaseObject:captureCommandBuffer:",  v11,  self);
  }
  else {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  if (a4)
  {
    unint64_t v11 = a3;
    uint64_t v12 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v13 = a4;
    do
    {
      uint64_t v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLCommandBufferSPI setResourceGroups:count:]( baseObject,  "setResourceGroups:count:",  &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -15898;
  unsigned __int8 v16 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v28 + 24);
    uint64_t v19 = v33++;
    id v17 = GTTraceMemPool_allocateBytes(v18, v30, v19 | 0x1800000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    id v17 = (char *)(v15 + v32);
    v32 += 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v20, v21);
  char v23 = StreamArray((uint64_t)v27, &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)id v17 = var0;
  *((void *)v17 + 1) = a4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
}

- (void)waitUntilScheduled
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16357;
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
  id v8 = -[CaptureMTLCommandBuffer traceStream](self, "traceStream");
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

- (BOOL)presentDrawableUsed
{
  return self->_presentDrawableUsed;
}

- (void).cxx_destruct
{
}

void __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke(uint64_t a1)
{
  v2 = (unsigned int *)(boundaryTrackerInstance + 92);
  do
    unsigned int v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  s();
  unint64_t v5 = v4;
  uint64_t v6 = *v4;
  *unsigned __int8 v4 = v7;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v8 = *(id *)(a1 + 32);
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8LL * (void)v12) + 16LL))();
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }

    while (v10);
  }

  void *v5 = v6;
  uint64_t v13 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v13) {
    uint64_t v14 = *v13;
  }
  else {
    uint64_t v14 = 0LL;
  }
  unint64_t v15 = atomic_load((unint64_t *)(*(void *)(a1 + 56) + 72LL));
  unsigned __int8 v16 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v16) {
    uint64_t v17 = *v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  char v18 = *(_BYTE *)(a1 + 64);
  memset(v28, 0, sizeof(v28));
  *(void *)&__int128 v21 = 0x600000008LL;
  *((void *)&v21 + 1) = v14;
  unint64_t v22 = v15;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v25 = 0LL;
  uint64_t v26 = v17;
  char v27 = v18;
  uint64_t v29 = 0LL;
  GTCaptureBoundaryTracker_handleTrigger(&v21);
  uint64_t v19 = (unsigned int *)(boundaryTrackerInstance + 92);
  do
    unsigned int v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
}

id __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_2(id *a1)
{
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v8 = [v7 downloadValue];
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 downloadEvent]);
        [v9 setSignaledValue:v8];
      }

      id v4 = [v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v4);
  }

  id v10 = (unsigned int *)(boundaryTrackerInstance + 92);
  do
    unsigned int v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  void *v12 = v15;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v16 = a1[5];
  id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8LL * (void)j) + 16LL))(*(void *)(*((void *)&v24 + 1) + 8LL * (void)j));
      }

      id v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v18);
  }

  void *v13 = v14;
  __int128 v21 = (unsigned int *)(boundaryTrackerInstance + 92);
  do
    unsigned int v22 = __ldaxr(v21);
  while (__stlxr(v22 - 1, v21));
  return objc_msgSend(a1[7], "count", (void)v24);
}

void __47__CaptureMTLCommandBuffer__preCommitWithIndex___block_invoke_3(uint64_t a1)
{
  v1 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dispatchGroup]);
  dispatch_group_leave(v1);
}

void __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v6 = v5;
  uint64_t v7 = *v5;
  uint64_t *v5 = v8;
  *((_BYTE *)v5 + 8) |= 0x40u;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24LL);
  [*(id *)(a1 + 40) traceStream];
  GTTraceContext_pushEncoderWithStream(v9, (uint64_t)v18);
  uint64_t v10 = v19;
  *(_DWORD *)(v19 + 8) = -15975;
  unsigned __int8 v11 = v21;
  if (v21 > 0x30uLL)
  {
    uint64_t v13 = *(void *)(v18[1] + 24LL);
    uint64_t v14 = v22++;
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v20, v14 | 0x1000000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    uint64_t v12 = (char *)(v10 + v21);
    v21 += 16;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v12 = v16;
  *((void *)v12 + 1) = a3;
  void *v6 = v7;
  *(_BYTE *)(v19 + 15) |= 8u;
  id v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) dispatchGroup]);
  dispatch_group_leave(v17);
}

void __52__CaptureMTLCommandBuffer_encodeWaitForEvent_value___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v6 = v5;
  uint64_t v7 = *v5;
  uint64_t *v5 = v8;
  *((_BYTE *)v5 + 8) |= 0x40u;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24LL);
  [*(id *)(a1 + 40) traceStream];
  GTTraceContext_pushEncoderWithStream(v9, (uint64_t)v18);
  uint64_t v10 = v19;
  *(_DWORD *)(v19 + 8) = -15490;
  unsigned __int8 v11 = v21;
  if (v21 > 0x30uLL)
  {
    uint64_t v13 = *(void *)(v18[1] + 24LL);
    uint64_t v14 = v22++;
    uint64_t v12 = GTTraceMemPool_allocateBytes(v13, v20, v14 | 0x1000000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    uint64_t v12 = (char *)(v10 + v21);
    v21 += 16;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  *(void *)uint64_t v12 = v16;
  *((void *)v12 + 1) = a3;
  void *v6 = v7;
  *(_BYTE *)(v19 + 15) |= 8u;
  id v17 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) dispatchGroup]);
  dispatch_group_leave(v17);
}

id __74__CaptureMTLCommandBuffer_initWithBaseObject_captureCommandQueue_funcRef___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hash];
}

@end