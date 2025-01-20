@interface CaptureMTLComputeCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (BOOL)encodeEndIf;
- (BOOL)encodeEndWhile;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLComputeCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLComputeCommandEncoder)baseObject;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)newKernelDebugInfo;
- (id)originalObject;
- (unint64_t)dispatchType;
- (unint64_t)nextVirtualSubstream;
- (unint64_t)streamReference;
- (void)beginVirtualSubstream;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)enableNullBufferBinds:(BOOL)a3;
- (void)encodeStartDoWhile;
- (void)encodeStartElse;
- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6;
- (void)endEncoding;
- (void)endVirtualSubstream;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertCompressedTextureReinterpretationFlush;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setComputePipelineState:(id)a3;
- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setLabel:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setSubstream:(unsigned int)a3;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupDistributionMode:(int64_t)a3;
- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setThreadgroupPackingDisabled:(BOOL)a3;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)signalProgress:(unsigned int)a3;
- (void)touch;
- (void)updateFence:(id)a3;
- (void)useHeap:(id)a3;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)waitForFence:(id)a3;
- (void)waitForProgress:(unsigned int)a3;
- (void)waitForVirtualSubstream:(unint64_t)a3;
@end

@implementation CaptureMTLComputeCommandEncoder

- (CaptureMTLComputeCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CaptureMTLComputeCommandEncoder;
  v9 = -[CaptureMTLComputeCommandEncoder init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseObject, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 device]);
    captureDevice = v10->_captureDevice;
    v10->_captureDevice = (CaptureMTLDevice *)v11;

    v13 = (GTTraceContext *)[v8 traceContext];
    v10->_traceContext = v13;
    id v14 = DEVICEOBJECT(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openEncoderStream( (uint64_t)v13,  (unint64_t)v15,  *((void *)[v8 traceStream] + 3));

    objc_storeWeak((id *)&v10->_captureCommandBuffer, v8);
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v8 retainedObjects]);
    retainedObjects = v10->_retainedObjects;
    v10->_retainedObjects = (NSMutableSet *)v16;

    v18 = v10->_retainedObjects;
    id v19 = DEVICEOBJECT(v10->_baseObject);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableSet addObject:](v18, "addObject:", v20);

    apr_pool_create_ex(&v10->_pool, 0LL, 0LL, 0LL);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16338;
  unsigned __int8 v4 = v18;
  if (v18 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v14 + 24);
    uint64_t v7 = v19++;
    v5 = GTTraceMemPool_allocateBytes(v6, v16, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)(v3 + v18);
    v18 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  apr_pool_destroy(self->_pool);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLComputeCommandEncoder;
  -[CaptureMTLComputeCommandEncoder dealloc](&v12, "dealloc");
}

- (MTLComputeCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v7);
    }
  }

  [v8 touch];
  if (v8)
  {
    uint64_t v10 = self->_retainedObjects;
    if (v10) {
      -[NSMutableSet addObject:](v10, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v79);
  baseObject = self->_baseObject;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLComputeCommandEncoderSPI executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:]( baseObject,  "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:",  v12,  v13,  a5);

  uint64_t v14 = v81;
  *(_DWORD *)(v81 + 8) = -15963;
  unsigned __int8 v15 = v84;
  if (v84 > 0x10uLL)
  {
    uint64_t v17 = *(void *)(v80 + 24);
    uint64_t v18 = v85++;
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v82, v18 | 0x3000000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v84);
    v84 += 48;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  v21 = (uint64_t *)[v7 traceStream];
  if (v21) {
    uint64_t v22 = *v21;
  }
  else {
    uint64_t v22 = 0LL;
  }
  v23 = (uint64_t *)[v8 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v24;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = 0LL;
  *((void *)v16 + 5) = 0LL;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v83;
  *(_BYTE *)(v81 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v28 = [WeakRetained isCapturing];

  if (v28)
  {
    p_captureCommandBuffer = &self->_captureCommandBuffer;
    context = objc_autoreleasePoolPush();
    id v29 = v7;
    uint64_t v30 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v29 traceStream]);
    MTLIndirectCommandBufferDescriptorWithoutResourceIndex = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(MTLIndirectCommandBufferDescriptorWithoutResourceIndex);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v29, (uint64_t)self->_snapshotMap);
    v67 = v32;
    v68 = v29;
    if (FuncSnapshot)
    {
      v34 = (void *)FuncSnapshot;
      id v65 = 0LL;
      v66 = 0LL;
      v64 = *(char **)(FuncSnapshot + 8);
    }

    else
    {
      id v78 = 0LL;
      id v35 = CreateIndirectComputeCommandBufferSnapshot(self, v29, v32, &v78);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v35);
      id v65 = v78;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)v79, v30, (int)[v29 size]);
      pool = self->_pool;
      snapshotMap = self->_snapshotMap;
      id v39 = [v29 streamReference];
      v34 = apr_palloc(pool, 0x18uLL);
      void *v34 = v39;
      apr_hash_set(snapshotMap, v34, 8LL, v34);
      v64 = SnapshotMemory;
      v34[1] = SnapshotMemory;
      v34[2] = *(void *)v81;
    }

    RestoreComputeCommandEncoder(self);
    v40 = self;
    id v41 = v8;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLComputeCommandEncoder device](v40, "device"));
    id v43 = DEVICEOBJECT(v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 device]);
    id v46 = [v45 newBufferWithLength:8 options:0];
    id v47 = DEVICEOBJECT(v40);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    v63 = v46;
    [v48 setBuffer:v46 offset:0 atIndex:0];
    [v48 setBuffer:v44 offset:a5 atIndex:1];
    v49 = v42;
    v50 = (void *)objc_claimAutoreleasedReturnValue([v42 computePipelineCopyBuffer]);
    [v48 setComputePipelineState:v50];
    unsigned int v51 = [v45 supportsNonUniformThreadgroupSize];
    __int128 v87 = xmmword_1CA4C0;
    uint64_t v88 = 1LL;
    if (v51)
    {
      *(void *)v86 = [v50 threadExecutionWidth];
      *(int64x2_t *)&v86[8] = vdupq_n_s64(1uLL);
      [v48 dispatchThreads:&v87 threadsPerThreadgroup:v86];
    }

    else
    {
      *(int64x2_t *)v86 = vdupq_n_s64(1uLL);
      *(void *)&v86[16] = 1LL;
      [v48 dispatchThreadgroups:&v87 threadsPerThreadgroup:v86];
    }

    uint64_t v52 = *(void *)(v80 + 24);
    uint64_t v53 = v85++;
    Bytes = GTTraceMemPool_allocateBytes(v52, v82, v53 | 0x1000000100LL);
    v16[40] = v64[8];
    v16[41] = Bytes[8];
    *((void *)v16 + 4) = v34[2];
    id v55 = objc_loadWeakRetained((id *)p_captureCommandBuffer);
    id v56 = DEVICEOBJECT(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = __95__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke;
    v71[3] = &unk_20DC88;
    id v72 = v65;
    id v73 = v66;
    id v74 = v67;
    id v75 = v63;
    v76 = v64;
    v77 = Bytes;
    id v58 = v63;
    id v59 = v67;
    id v60 = v66;
    id v61 = v65;
    [v57 addCompletedHandler:v71];

    objc_autoreleasePoolPop(context);
  }
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  [v7 touch];
  if (v7)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v7);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v50);
  baseObject = self->_baseObject;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLComputeCommandEncoderSPI executeCommandsInBuffer:withRange:]( baseObject,  "executeCommandsInBuffer:withRange:",  v10,  location,  length);

  uint64_t v11 = v52;
  *(_DWORD *)(v52 + 8) = -15964;
  unsigned __int8 v12 = v55;
  if (v55 > 0x10uLL)
  {
    uint64_t v14 = *(void *)(v51 + 24);
    uint64_t v15 = v56++;
    v13 = GTTraceMemPool_allocateBytes(v14, v53, v15 | 0x3000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    v13 = (char *)(v11 + v55);
    v55 += 48;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  *(void *)v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = location;
  *((void *)v13 + 3) = length;
  *((void *)v13 + 4) = 0LL;
  *((void *)v13 + 5) = 0LL;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v54;
  *(_BYTE *)(v52 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v23 = [WeakRetained isCapturing];

  if (v23)
  {
    context = objc_autoreleasePoolPush();
    id v24 = v7;
    uint64_t v25 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v24 traceStream]);
    MTLIndirectCommandBufferDescriptorWithoutResourceIndex = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(MTLIndirectCommandBufferDescriptorWithoutResourceIndex);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v24, (uint64_t)self->_snapshotMap);
    if (FuncSnapshot)
    {
      id v29 = (void *)FuncSnapshot;
      v42 = 0LL;
      id v30 = 0LL;
      SnapshotMemory = *(char **)(FuncSnapshot + 8);
    }

    else
    {
      id v49 = 0LL;
      id v32 = CreateIndirectComputeCommandBufferSnapshot(self, v24, v27, &v49);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v32);
      id v30 = v49;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)v50, v25, (int)[v24 size]);
      pool = self->_pool;
      ht = self->_snapshotMap;
      id v34 = [v24 streamReference];
      id v29 = apr_palloc(pool, 0x18uLL);
      *id v29 = v34;
      apr_hash_set(ht, v29, 8LL, v29);
      v29[1] = SnapshotMemory;
      v29[2] = *(void *)v52;
    }

    RestoreComputeCommandEncoder(self);
    v13[40] = SnapshotMemory[8];
    *((void *)v13 + 4) = v29[2];
    id v35 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    id v36 = DEVICEOBJECT(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = __69__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_withRange___block_invoke;
    v44[3] = &unk_20DCB0;
    id v45 = v30;
    id v46 = v42;
    id v47 = v27;
    v48 = SnapshotMemory;
    id v38 = v27;
    id v39 = v42;
    id v40 = v30;
    [v37 addCompletedHandler:v44];

    objc_autoreleasePoolPop(context);
  }
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI enableNullBufferBinds:](self->_baseObject, "enableNullBufferBinds:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15732;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    id v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    id v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
    unsigned __int8 v9 = [v8 captureRaytracingEnabled];

    if ((v9 & 1) == 0)
    {
      GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_setAccelerationStructure_atBufferIndex",  (uint64_t)"Raytracing",  0LL,  0LL);
      baseObject = self->_baseObject;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
      -[MTLComputeCommandEncoderSPI setAccelerationStructure:atBufferIndex:]( baseObject,  "setAccelerationStructure:atBufferIndex:",  v21,  a4);

      goto LABEL_17;
    }

    [v7 touch];
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v7);
    }
  }

  else
  {
    [0 touch];
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v26);
  uint64_t v11 = self->_baseObject;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 baseObject]);
  -[MTLComputeCommandEncoderSPI setAccelerationStructure:atBufferIndex:]( v11,  "setAccelerationStructure:atBufferIndex:",  v12,  a4);

  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -15623;
  unsigned __int8 v14 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v16 = *(void *)(v26[1] + 24LL);
    uint64_t v17 = v31++;
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v28, v17 | 0x1800000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v30);
    v30 += 24;
  }

  *(_BYTE *)(v13 + 13) = v14;
  unsigned __int8 v18 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = (uint64_t *)[v7 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = v23;
  *((void *)v15 + 2) = a4;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v29;
  *(_BYTE *)(v27 + 15) |= 8u;
LABEL_17:
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLComputeCommandEncoder;
  uint64_t v3 = -[CaptureMTLComputeCommandEncoder description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLComputeCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLComputeCommandEncoderSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)dispatchType
{
  return (unint64_t)-[MTLComputeCommandEncoderSPI dispatchType](self->_baseObject, "dispatchType");
}

- (NSString)label
{
  return (NSString *)-[MTLComputeCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLComputeCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16339;
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
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)beginVirtualSubstream
{
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  -[MTLComputeCommandEncoderSPI dispatchThreadgroups:threadsPerThreadgroup:]( baseObject,  "dispatchThreadgroups:threadsPerThreadgroup:",  &v21,  &v20);
  uint64_t v8 = v24;
  *(_DWORD *)(v24 + 8) = -16327;
  unsigned __int8 v9 = v27;
  if (v27 > 8uLL)
  {
    uint64_t v11 = *(void *)(v23 + 24);
    uint64_t v12 = v28++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v25, v12 | 0x3800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v27);
    v27 += 56;
  }

  *(_BYTE *)(v8 + 13) = v9;
  id v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)uint64_t v10 = var0;
  __int128 v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v26);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  __int128 v24 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  -[MTLComputeCommandEncoderSPI dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:]( baseObject,  "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:",  v11,  a4,  &v24);

  uint64_t v12 = v28;
  *(_DWORD *)(v28 + 8) = -16220;
  unsigned __int8 v13 = v31;
  if (v31 > 0x10uLL)
  {
    uint64_t v15 = *(void *)(v27 + 24);
    uint64_t v16 = v32++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v29, v16 | 0x3000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v31);
    v31 += 48;
  }

  *(_BYTE *)(v12 + 13) = v13;
  __int128 v17 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  unint64_t v21 = a5->var2;
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *(_OWORD *)(v14 + 24) = *(_OWORD *)&a5->var0;
  *((void *)v14 + 5) = v21;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v21 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20 = *a4;
  -[MTLComputeCommandEncoderSPI dispatchThreads:threadsPerThreadgroup:]( baseObject,  "dispatchThreads:threadsPerThreadgroup:",  &v21,  &v20);
  uint64_t v8 = v24;
  *(_DWORD *)(v24 + 8) = -16078;
  unsigned __int8 v9 = v27;
  if (v27 > 8uLL)
  {
    uint64_t v11 = *(void *)(v23 + 24);
    uint64_t v12 = v28++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v25, v12 | 0x3800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v27);
    v27 += 56;
  }

  *(_BYTE *)(v8 + 13) = v9;
  unsigned __int8 v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v16 = a4->var2;
  *(void *)uint64_t v10 = var0;
  __int128 v17 = *(_OWORD *)&a4->var0;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v10 + 3) = var2;
  *((_OWORD *)v10 + 2) = v17;
  *((void *)v10 + 6) = v16;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI dispatchThreadsWithIndirectBuffer:indirectBufferOffset:]( baseObject,  "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16079;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v17 = (uint64_t *)[v6 traceStream];
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

- (BOOL)encodeEndDoWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_encodeEndDoWhile_offset_comparison_referenceValue",  (uint64_t)"Command buffer jump",  0LL,  0LL);
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  unsigned __int8 v14 = -[MTLComputeCommandEncoderSPI encodeEndDoWhile:offset:comparison:referenceValue:]( baseObject,  "encodeEndDoWhile:offset:comparison:referenceValue:",  v13,  a4,  a5,  v6);

  return v14;
}

- (BOOL)encodeEndIf
{
  return -[MTLComputeCommandEncoderSPI encodeEndIf](self->_baseObject, "encodeEndIf");
}

- (BOOL)encodeEndWhile
{
  return -[MTLComputeCommandEncoderSPI encodeEndWhile](self->_baseObject, "encodeEndWhile");
}

- (void)encodeStartDoWhile
{
}

- (void)encodeStartElse
{
}

- (void)encodeStartIf:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v14 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartIf_offset_comparison_referenceValue",  (uint64_t)"Command buffer jump",  0LL,  0LL);
  [v14 touch];
  id v10 = v14;
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
      id v10 = v14;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLComputeCommandEncoderSPI encodeStartIf:offset:comparison:referenceValue:]( baseObject,  "encodeStartIf:offset:comparison:referenceValue:",  v13,  a4,  a5,  v6);
}

- (void)encodeStartWhile:(id)a3 offset:(unint64_t)a4 comparison:(unint64_t)a5 referenceValue:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v14 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_encodeStartWhile_offset_comparison_referenceValue",  (uint64_t)"Command buffer jump",  0LL,  0LL);
  [v14 touch];
  id v10 = v14;
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
      id v10 = v14;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLComputeCommandEncoderSPI encodeStartWhile:offset:comparison:referenceValue:]( baseObject,  "encodeStartWhile:offset:comparison:referenceValue:",  v13,  a4,  a5,  v6);
}

- (void)endEncoding
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16325;
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
  uint64_t v8 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)endVirtualSubstream
{
}

- (void)insertCompressedTextureReinterpretationFlush
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15511;
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
  uint64_t v8 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)insertDebugSignpost:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLComputeCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16324;
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
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v9 = 8 * v4;
  __chkstk_darwin(v7, v10);
  if (v4)
  {
    uint64_t v11 = (void **)v5;
    id v12 = &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v13 = v4;
    do
    {
      id v14 = *v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLComputeCommandEncoderSPI memoryBarrierWithResources:count:]( baseObject,  "memoryBarrierWithResources:count:",  &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  v4);
  uint64_t v15 = v30;
  *(_DWORD *)(v30 + 8) = -16008;
  unsigned __int8 v16 = v33;
  if (v33 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v29 + 24);
    uint64_t v19 = v34++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v31, v19 | 0x1800000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v33);
    v33 += 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v20, v21);
  char v23 = StreamArray((uint64_t)v28, &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)v5, v4);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v4;
  v17[16] = v23;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v32;
  for (*(_BYTE *)(v30 + 15) |= 8u; v4; --v4)
  {
    id v26 = (id)*v5++;
    CaptureRemoveFuncSnapshot(v26, self->_snapshotMap);
  }

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16009;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
  CaptureClearFuncSnapshot((apr_hash_index_t *)a3, (uint64_t)self->_snapshotMap);
}

- (id)newKernelDebugInfo
{
  return -[MTLComputeCommandEncoderSPI newKernelDebugInfo](self->_baseObject, "newKernelDebugInfo");
}

- (unint64_t)nextVirtualSubstream
{
  return (unint64_t)-[MTLComputeCommandEncoderSPI nextVirtualSubstream]( self->_baseObject,  "nextVirtualSubstream");
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16322;
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
  uint64_t v8 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)pushDebugGroup:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLComputeCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16323;
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
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLComputeCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:]( baseObject,  "sampleCountersInBuffer:atSampleIndex:withBarrier:",  v11,  a4,  v5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15754;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((_DWORD *)v14 + 6) = v5;
  *((_DWORD *)v14 + 7) = 0;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v23);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLComputeCommandEncoderSPI setBuffer:offset:atIndex:](baseObject, "setBuffer:offset:atIndex:", v11, a4, a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16336;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    id v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    id v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)id v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
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
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLComputeCommandEncoderSPI setBuffer:offset:attributeStride:atIndex:]( baseObject,  "setBuffer:offset:attributeStride:atIndex:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15284;
  unsigned __int8 v15 = v29;
  if (v29 > 0x18uLL)
  {
    uint64_t v17 = *(void *)(v25[1] + 24LL);
    uint64_t v18 = v30++;
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x2800000000LL) + 16;
    unsigned __int8 v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v29);
    v29 += 40;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  *((void *)v16 + 3) = a5;
  *((void *)v16 + 4) = a6;
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16226;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    uint64_t v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15283;
  unsigned __int8 v10 = v22;
  if (v22 > 0x20uLL)
  {
    uint64_t v12 = *(void *)(v18[1] + 24LL);
    uint64_t v13 = v23++;
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, v20, v13 | 0x2000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    uint64_t v11 = (char *)(v9 + v22);
    v22 += 32;
  }

  *(_BYTE *)(v9 + 13) = v10;
  uint64_t v14 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a3;
  *((void *)v11 + 2) = a4;
  *((void *)v11 + 3) = a5;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v36 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  unsigned __int8 v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v37);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  if (length)
  {
    uint64_t v14 = a3;
    uint64_t v15 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    NSUInteger v16 = length;
    do
    {
      uint64_t v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  NSUInteger v18 = location;
  uint64_t v19 = a5;
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:attributeStrides:withRange:]( baseObject,  "setBuffers:offsets:attributeStrides:withRange:",  (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v36,  a5,  location,  length);
  uint64_t v20 = v39;
  *(_DWORD *)(v39 + 8) = -15282;
  unsigned __int8 v21 = v42;
  if (v42 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v38 + 24);
    uint64_t v24 = v43++;
    unsigned __int8 v22 = GTTraceMemPool_allocateBytes(v23, v40, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    unsigned __int8 v22 = (char *)(v20 + v42);
    v42 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v37, (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)), (id *)a3, length);
  uint64_t v29 = boundaryTrackerInstance;
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    char v30 = GTTraceEncoder_storeBlob((uint64_t)v37, v36, length);
    uint64_t v29 = boundaryTrackerInstance;
  }

  else
  {
    char v30 = 0;
  }

  if ((*(_DWORD *)(v29 + 20) & 0xFFFFFFFE) == 2) {
    char v31 = GTTraceEncoder_storeBlob((uint64_t)v37, v19, length);
  }
  else {
    char v31 = 0;
  }
  *(void *)unsigned __int8 v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v30;
  v22[26] = v31;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v41;
  *(_BYTE *)(v39 + 15) |= 8u;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  if (length)
  {
    uint64_t v13 = a3;
    uint64_t v14 = &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v15 = length;
    do
    {
      NSUInteger v16 = (void *)*v13++;
      *v14++ = objc_msgSend(v16, "baseObject", location);
      --v15;
    }

    while (v15);
  }

  NSUInteger v17 = location;
  -[MTLComputeCommandEncoderSPI setBuffers:offsets:withRange:]( baseObject,  "setBuffers:offsets:withRange:",  &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  location,  length,  location);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16335;
  unsigned __int8 v19 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v21 = *(void *)(v32 + 24);
    uint64_t v22 = v37++;
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v34, v22 | 0x2000000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v36);
    v36 += 32;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v23, v24);
  char v26 = StreamArray((uint64_t)v31, &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  char v27 = GTTraceEncoder_storeBytes((uint64_t)v31, (void *)a4, 8 * length);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v17;
  *((void *)v20 + 2) = length;
  v20[24] = v26;
  v20[25] = v27;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16227;
  unsigned __int8 v10 = v23;
  if (v23 > 0x20uLL)
  {
    uint64_t v12 = *(void *)(v19[1] + 24LL);
    uint64_t v13 = v24++;
    uint64_t v11 = GTTraceMemPool_allocateBytes(v12, v21, v13 | 0x2000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    uint64_t v11 = (char *)(v9 + v23);
    v23 += 32;
  }

  *(_BYTE *)(v9 + 13) = v10;
  uint64_t v14 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v16 = GTTraceEncoder_storeBlob((uint64_t)v19, a3, a4);
  }
  else {
    char v16 = 0;
  }
  *(void *)uint64_t v11 = var0;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  uint64_t v11 = v22;
  *(_DWORD *)(v22 + 8) = -15281;
  unsigned __int8 v12 = v25;
  if (v25 > 0x18uLL)
  {
    uint64_t v14 = *(void *)(v21[1] + 24LL);
    uint64_t v15 = v26++;
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v23, v15 | 0x2800000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v25);
    v25 += 40;
  }

  *(_BYTE *)(v11 + 13) = v12;
  char v16 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v18 = GTTraceEncoder_storeBlob((uint64_t)v21, a3, a4);
  }
  else {
    char v18 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a4;
  *((void *)v13 + 2) = a5;
  *((void *)v13 + 3) = a6;
  v13[32] = v18;
  *(_DWORD *)(v13 + 33) = 0;
  *((_DWORD *)v13 + 9) = 0;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setComputePipelineState:(id)a3
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLComputeCommandEncoderSPI setComputePipelineState:](baseObject, "setComputePipelineState:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16337;
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
  uint64_t v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unsigned __int8 v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)setImageblockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16149;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    unsigned __int8 v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    unsigned __int8 v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI setIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setIntersectionFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15583;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  unsigned __int8 v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLComputeCommandEncoderSPI setIntersectionFunctionTables:withBufferRange:]( baseObject,  "setIntersectionFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15582;
  unsigned __int8 v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v29 + 24);
    uint64_t v20 = v34++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    v33 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v21, v22);
  char v24 = StreamArray((uint64_t)v28, &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI setSamplerState:atIndex:](baseObject, "setSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16332;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v17 = (uint64_t *)[v6 traceStream];
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

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  -[MTLComputeCommandEncoderSPI setSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16330;
  unsigned __int8 v17 = v31;
  if (v31 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v27[1] + 24LL);
    uint64_t v20 = v32++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v31);
    v31 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = (uint64_t *)[v10 traceStream];
  if (v23) {
    uint64_t v24 = *v23;
  }
  else {
    uint64_t v24 = 0LL;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a6;
  *((float *)v18 + 6) = a4;
  *((float *)v18 + 7) = a5;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  char v35 = (float *)a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  id v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v36);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  if (length)
  {
    double v14 = a3;
    double v15 = (uint64_t *)((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    NSUInteger v16 = length;
    do
    {
      unsigned __int8 v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  NSUInteger v18 = location;
  uint64_t v19 = (float *)a5;
  -[MTLComputeCommandEncoderSPI setSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v35,  a5,  location,  length);
  uint64_t v20 = v38;
  *(_DWORD *)(v38 + 8) = -16329;
  unsigned __int8 v21 = v41;
  if (v41 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v37 + 24);
    uint64_t v24 = v42++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v39, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v41);
    v41 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v36, (uint64_t *)((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)), (id *)a3, length);
  char v29 = GTTraceEncoder_storeBytes((uint64_t)v36, v35, 4 * length);
  char v30 = GTTraceEncoder_storeBytes((uint64_t)v36, v19, 4 * length);
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v18;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  v22[26] = v30;
  *(_DWORD *)(v22 + 27) = 0;
  v22[31] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v40;
  *(_BYTE *)(v38 + 15) |= 8u;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  unsigned __int8 v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v14 = length;
    do
    {
      double v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLComputeCommandEncoderSPI setSamplerStates:withRange:]( baseObject,  "setSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16331;
  unsigned __int8 v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v29 + 24);
    uint64_t v20 = v34++;
    NSUInteger v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    NSUInteger v18 = (char *)(v16 + v33);
    v33 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v21, v22);
  char v24 = StreamArray((uint64_t)v28, &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)NSUInteger v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)setStageInRegion:(id *)a3
{
  baseObject = self->_baseObject;
  __int128 v6 = *(_OWORD *)&a3->var0.var2;
  v18[0] = *(_OWORD *)&a3->var0.var0;
  v18[1] = v6;
  void v18[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLComputeCommandEncoderSPI setStageInRegion:](baseObject, "setStageInRegion:", v18);
  uint64_t v7 = v21;
  *(_DWORD *)(v21 + 8) = -16100;
  unsigned __int8 v8 = v24;
  if (v24 > 8uLL)
  {
    uint64_t v10 = *(void *)(v20 + 24);
    uint64_t v11 = v25++;
    unsigned __int8 v9 = GTTraceMemPool_allocateBytes(v10, v22, v11 | 0x3800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    unsigned __int8 v9 = (char *)(v7 + v24);
    v24 += 56;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v9 = var0;
  __int128 v14 = *(_OWORD *)&a3->var0.var2;
  __int128 v15 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI setStageInRegionWithIndirectBuffer:indirectBufferOffset:]( baseObject,  "setStageInRegionWithIndirectBuffer:indirectBufferOffset:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16017;
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
  __int128 v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)setSubstream:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI setSubstream:](self->_baseObject, "setSubstream:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15711;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI setTexture:atIndex:](baseObject, "setTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16334;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLComputeCommandEncoderSPI setTextures:withRange:]( baseObject,  "setTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16333;
  unsigned __int8 v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v29 + 24);
    uint64_t v20 = v34++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    v33 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v21, v22);
  char v24 = StreamArray((uint64_t)v28, &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)setThreadgroupDistributionMode:(int64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15280;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setThreadgroupDistributionModeWithClusterGroupIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI setThreadgroupDistributionModeWithClusterGroupIndex:]( self->_baseObject,  "setThreadgroupDistributionModeWithClusterGroupIndex:",  v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15279;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16328;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    uint64_t v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI setThreadgroupPackingDisabled:](self->_baseObject, "setThreadgroupPackingDisabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15278;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI setVisibleFunctionTable:atBufferIndex:]( baseObject,  "setVisibleFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15581;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v17 = (uint64_t *)[v6 traceStream];
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

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  RetainArray(self->_retainedObjects, (id *)a3, a4.length);
  uint64_t v8 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v28);
  baseObject = self->_baseObject;
  uint64_t v10 = 8 * length;
  __chkstk_darwin(v8, v11);
  if (length)
  {
    uint64_t v12 = a3;
    uint64_t v13 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v14 = length;
    do
    {
      uint64_t v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLComputeCommandEncoderSPI setVisibleFunctionTables:withBufferRange:]( baseObject,  "setVisibleFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15580;
  unsigned __int8 v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v29 + 24);
    uint64_t v20 = v34++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    v33 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v21, v22);
  char v24 = StreamArray((uint64_t)v28, &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = location;
  *((void *)v18 + 2) = length;
  v18[24] = v24;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)signalProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI signalProgress:](self->_baseObject, "signalProgress:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15710;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)updateFence:(id)a3
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLComputeCommandEncoderSPI updateFence:](baseObject, "updateFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16130;
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
  uint64_t v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)useHeap:(id)a3
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLComputeCommandEncoderSPI useHeap:](baseObject, "useHeap:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16045;
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
  uint64_t v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
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
      NSUInteger v14 = (void *)*v11++;
      *v12++ = [v14 baseObject];
      --v13;
    }

    while (v13);
  }

  -[MTLComputeCommandEncoderSPI useHeaps:count:]( baseObject,  "useHeaps:count:",  &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -16044;
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
  uint64_t v20 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)useResidencySet:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_useResidencySet",  (uint64_t)"Deprecated Residency Set API",  0LL,  0LL);
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLComputeCommandEncoderSPI useResidencySet:](baseObject, "useResidencySet:", v7);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  baseObject = self->_baseObject;
  __chkstk_darwin(v8, v9);
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v12 = (char *)&v16 - v11;
  if (a4)
  {
    unint64_t v13 = (uint64_t *)((char *)&v16 - v11);
    unint64_t v14 = a4;
    do
    {
      uint64_t v15 = (void *)*a3++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLComputeCommandEncoderSPI useResidencySets:count:](baseObject, "useResidencySets:count:", v12, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
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
  -[MTLComputeCommandEncoderSPI useResource:usage:](baseObject, "useResource:usage:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16047;
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
  uint64_t v15 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLComputeCommandEncoder_useResourceGroup_usage",  (uint64_t)"Resource groups",  0LL,  0LL);
  [v10 touch];
  id v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
      id v6 = v10;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLComputeCommandEncoderSPI useResourceGroup:usage:](baseObject, "useResourceGroup:usage:", v9, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  if (a4)
  {
    uint64_t v13 = a3;
    uint64_t v14 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v15 = a4;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLComputeCommandEncoderSPI useResources:count:usage:]( baseObject,  "useResources:count:usage:",  &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  a5);
  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -16046;
  unsigned __int8 v18 = v34;
  if (v34 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v30 + 24);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2000000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v22, v23);
  char v25 = StreamArray((uint64_t)v29, &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = a4;
  *((void *)v19 + 2) = a5;
  v19[24] = v25;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)waitForFence:(id)a3
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
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLComputeCommandEncoderSPI waitForFence:](baseObject, "waitForFence:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16129;
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
  uint64_t v13 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
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
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)waitForProgress:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLComputeCommandEncoderSPI waitForProgress:](self->_baseObject, "waitForProgress:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15709;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    uint64_t v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    uint64_t v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLComputeCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)waitForVirtualSubstream:(unint64_t)a3
{
}

- (void).cxx_destruct
{
}

void __69__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_withRange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      unsigned __int8 v6 = (void *)(v5 + 16);
    }
    else {
      unsigned __int8 v6 = 0LL;
    }
    id v7 = v4;
    memcpy(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  }

float __95__CaptureMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      unsigned __int8 v6 = (void *)(v5 + 16);
    }
    else {
      unsigned __int8 v6 = 0LL;
    }
    id v7 = v4;
    memcpy(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  }

  uint64_t v8 = [*(id *)(a1 + 56) contents];
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    id v10 = (_OWORD *)(v9 + 16);
  }
  else {
    id v10 = 0LL;
  }
  *(void *)&__int128 v11 = *v8;
  *((void *)&v11 + 1) = HIDWORD(*v8);
  LODWORD(result) = *v8;
  _OWORD *v10 = v11;
  return result;
}

@end