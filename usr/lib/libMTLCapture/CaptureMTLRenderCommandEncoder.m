@interface CaptureMTLRenderCommandEncoder
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isMemorylessRender;
- (BOOL)respondsToSelector:(SEL)a3;
- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4;
- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureParallelRenderCommandEncoder:(id)a4;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)baseObject;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)originalObject;
- (unint64_t)streamReference;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (void)dealloc;
- (void)dispatchThreadsPerTile:(id *)a3;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4;
- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5;
- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9;
- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10;
- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7;
- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9;
- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6;
- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7;
- (void)endEncoding;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)insertDebugSignpost:(id)a3;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6;
- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5;
- (void)popDebugGroup;
- (void)pushDebugGroup:(id)a3;
- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5;
- (void)setAlphaTestReferenceValue:(float)a3;
- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7;
- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setCommandDataCorruptModeSPI:(unint64_t)a3;
- (void)setCullMode:(unint64_t)a3;
- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5;
- (void)setDepthCleared;
- (void)setDepthClipMode:(unint64_t)a3;
- (void)setDepthClipModeSPI:(unint64_t)a3;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setDepthStencilState:(id)a3;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setDepthStoreActionOptions:(unint64_t)a3;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6;
- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setFrontFacingWinding:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setLineWidth:(float)a3;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setPointSize:(float)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3;
- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4;
- (void)setProvokingVertexMode:(unint64_t)a3;
- (void)setRenderPipelineState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setStencilCleared;
- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4;
- (void)setStencilReferenceValue:(unsigned int)a3;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6;
- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7;
- (void)setStencilStoreAction:(unint64_t)a3;
- (void)setStencilStoreActionOptions:(unint64_t)a3;
- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5;
- (void)setTessellationFactorScale:(float)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setTransformFeedbackState:(unint64_t)a3;
- (void)setTriangleFillMode:(unint64_t)a3;
- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4;
- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7;
- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setViewport:(id *)a3;
- (void)setViewportTransformEnabled:(BOOL)a3;
- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4;
- (void)touch;
- (void)updateFence:(id)a3 afterStages:(unint64_t)a4;
- (void)useHeap:(id)a3;
- (void)useHeap:(id)a3 stages:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4;
- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4;
- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5;
- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6;
- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4;
@end

@implementation CaptureMTLRenderCommandEncoder

- (MTLRenderCommandEncoder)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureCommandBuffer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderCommandEncoder;
  v9 = -[CaptureMTLRenderCommandEncoder init](&v22, "init");
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

    apr_pool_create_ex(&v10->_pool, 0LL, 0LL, 0LL);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
    v18 = v10->_retainedObjects;
    id v19 = DEVICEOBJECT(v10->_baseObject);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableSet addObject:](v18, "addObject:", v20);
  }

  return v10;
}

- (CaptureMTLRenderCommandEncoder)initWithBaseObject:(id)a3 captureParallelRenderCommandEncoder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderCommandEncoder;
  v9 = -[CaptureMTLRenderCommandEncoder init](&v25, "init");
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
    v10->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v13, (unint64_t)v15, 0LL);

    apr_pool_create_ex(&v10->_pool, 0LL, 0LL, 0LL);
    v10->_snapshotMap = apr_hash_make(v10->_pool);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 commandBuffer]);
    objc_storeWeak((id *)&v10->_captureCommandBuffer, v16);

    id WeakRetained = objc_loadWeakRetained((id *)&v10->_captureCommandBuffer);
    v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained retainedObjects]);

    if (v18)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      retainedObjects = v10->_retainedObjects;
      v10->_retainedObjects = v19;

      v21 = v10->_retainedObjects;
      id v22 = DEVICEOBJECT(v10->_baseObject);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[NSMutableSet addObject:](v21, "addObject:", v23);
    }
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = v16;
  *(_DWORD *)(v16 + 8) = -16280;
  unsigned __int8 v4 = v19;
  if (v19 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v15 + 24);
    uint64_t v7 = v20++;
    v5 = GTTraceMemPool_allocateBytes(v6, v17, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    v5 = (char *)(v3 + v19);
    v19 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  [WeakRetained unionRetainSet:self->_retainedObjects];

  apr_pool_destroy(self->_pool);
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderCommandEncoder;
  -[CaptureMTLRenderCommandEncoder dealloc](&v13, "dealloc");
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
  -[MTLRenderCommandEncoderSPI executeCommandsInBuffer:withRange:]( baseObject,  "executeCommandsInBuffer:withRange:",  v10,  location,  length);

  uint64_t v11 = v52;
  *(_DWORD *)(v52 + 8) = -15962;
  unsigned __int8 v12 = v55;
  if (v55 > 0x10uLL)
  {
    uint64_t v14 = *(void *)(v51 + 24);
    uint64_t v15 = v56++;
    objc_super v13 = GTTraceMemPool_allocateBytes(v14, v53, v15 | 0x3000000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    objc_super v13 = (char *)(v11 + v55);
    v55 += 48;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v18 = (uint64_t *)[v7 traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  *(void *)objc_super v13 = var0;
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
      v29 = (void *)FuncSnapshot;
      v42 = 0LL;
      id v30 = 0LL;
      SnapshotMemory = *(char **)(FuncSnapshot + 8);
    }

    else
    {
      id v49 = 0LL;
      id v32 = CreateIndirectRenderCommandBufferSnapshot(self, v24, v27, &v49);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v32);
      id v30 = v49;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)v50, v25, (int)[v24 size]);
      pool = self->_pool;
      ht = self->_snapshotMap;
      id v34 = [v24 streamReference];
      v29 = apr_palloc(pool, 0x18uLL);
      void *v29 = v34;
      apr_hash_set(ht, v29, 8LL, v29);
      v29[1] = SnapshotMemory;
      v29[2] = *(void *)v52;
    }

    RestoreRenderCommandEncoder(self);
    v13[40] = SnapshotMemory[8];
    *((void *)v13 + 4) = v29[2];
    id v35 = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
    id v36 = DEVICEOBJECT(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = __68__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_withRange___block_invoke;
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

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 touch];
  if (v8)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v8);
    }
  }

  [v9 touch];
  if (v9)
  {
    uint64_t v11 = self->_retainedObjects;
    if (v11) {
      -[NSMutableSet addObject:](v11, "addObject:", v9);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v78);
  baseObject = self->_baseObject;
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  -[MTLRenderCommandEncoderSPI executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:]( baseObject,  "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:",  v13,  v14,  a5);

  uint64_t v15 = v80;
  *(_DWORD *)(v80 + 8) = -15961;
  unsigned __int8 v16 = v83;
  if (v83 > 0x10uLL)
  {
    uint64_t v18 = *(void *)(v79 + 24);
    uint64_t v19 = v84++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v81, v19 | 0x3000000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v83);
    v83 += 48;
  }

  *(_BYTE *)(v15 + 13) = v16;
  uint64_t v20 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v22 = (uint64_t *)[v8 traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  id v24 = (uint64_t *)[v9 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = a5;
  *((void *)v17 + 4) = 0LL;
  *((void *)v17 + 5) = 0LL;
  s();
  *(void *)uint64_t v26 = v27;
  *(_BYTE *)(v26 + 8) = v82;
  *(_BYTE *)(v80 + 15) |= 8u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureCommandBuffer);
  unsigned int v29 = [WeakRetained isCapturing];

  if (v29)
  {
    NSUInteger location = (id *)&self->_captureCommandBuffer;
    unint64_t v30 = a5;
    context = objc_autoreleasePoolPush();
    id v69 = v8;
    id v31 = v8;
    uint64_t v32 = MTLIndirectCommandBuffer_descriptor((uint64_t)[v31 traceStream]);
    MTLIndirectCommandBufferDescriptorWithoutResourceIndex = MakeMTLIndirectCommandBufferDescriptorWithoutResourceIndex(v32);
    id v34 = (void *)objc_claimAutoreleasedReturnValue(MTLIndirectCommandBufferDescriptorWithoutResourceIndex);
    uint64_t FuncSnapshot = CaptureFindFuncSnapshot(v31, (uint64_t)self->_snapshotMap);
    v64 = v31;
    v62 = v34;
    if (FuncSnapshot)
    {
      id v36 = (void *)FuncSnapshot;
      id v65 = 0LL;
      v66 = 0LL;
      v63 = *(char **)(FuncSnapshot + 8);
    }

    else
    {
      id v77 = 0LL;
      id v37 = CreateIndirectRenderCommandBufferSnapshot(self, v31, v34, &v77);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v37);
      id v65 = v77;
      SnapshotMemory = AllocateSnapshotMemory((uint64_t)v78, v32, (int)[v31 size]);
      pool = self->_pool;
      snapshotMap = self->_snapshotMap;
      id v41 = [v31 streamReference];
      id v36 = apr_palloc(pool, 0x18uLL);
      *id v36 = v41;
      apr_hash_set(snapshotMap, v36, 8LL, v36);
      v63 = SnapshotMemory;
      v36[1] = SnapshotMemory;
      v36[2] = *(void *)v80;
    }

    v42 = self;
    id v43 = v9;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLRenderCommandEncoder device](v42, "device"));
    id v45 = DEVICEOBJECT(v43);
    id v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

    id v47 = (void *)objc_claimAutoreleasedReturnValue([v46 device]);
    id v48 = [v47 newBufferWithLength:8 options:0];
    id v49 = DEVICEOBJECT(v42);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    [v50 setVertexBuffer:v48 offset:0 atIndex:0];
    [v50 setVertexBuffer:v46 offset:v30 atIndex:1];
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v44 renderPipelineCopyBuffer]);
    [v50 setRenderPipelineState:v51];

    [v50 drawPrimitives:0 vertexStart:0 vertexCount:8];
    uint64_t v52 = *(void *)(v79 + 24);
    uint64_t v53 = v84++;
    Bytes = GTTraceMemPool_allocateBytes(v52, v81, v53 | 0x1000000100LL);
    RestoreRenderCommandEncoder(v42);
    v17[40] = v63[8];
    v17[41] = Bytes[8];
    *((void *)v17 + 4) = v36[2];
    id v55 = objc_loadWeakRetained(location);
    id v56 = DEVICEOBJECT(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = __94__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke;
    v70[3] = &unk_20DC88;
    id v71 = v65;
    id v72 = v66;
    id v73 = v62;
    id v74 = v48;
    v75 = v63;
    v76 = Bytes;
    id v58 = v48;
    id v59 = v62;
    id v60 = v66;
    id v61 = v65;
    [v57 addCompletedHandler:v70];

    objc_autoreleasePoolPop(context);
    id v8 = v69;
  }
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  uint64_t v7 = v18;
  *(_DWORD *)(v18 + 8) = -15822;
  unsigned __int8 v8 = v21;
  if (v21 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v17[1] + 24LL);
    uint64_t v11 = v22++;
    id v9 = GTTraceMemPool_allocateBytes(v10, v19, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    id v9 = (char *)(v7 + v21);
    v21 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  unsigned __int8 v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (!v12)
  {
    unint64_t var0 = 0LL;
    if (a4) {
      goto LABEL_6;
    }
LABEL_8:
    char v14 = 0;
    goto LABEL_9;
  }

  unint64_t var0 = v12->var0;
  if (!a4) {
    goto LABEL_8;
  }
LABEL_6:
  char v14 = GTTraceEncoder_storeBlob((uint64_t)v17, a4, 8 * a3);
LABEL_9:
  *(void *)id v9 = var0;
  *((void *)v9 + 1) = a3;
  v9[16] = v14;
  *(_DWORD *)(v9 + 17) = 0;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v20;
  *(_BYTE *)(v18 + 15) |= 8u;
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if ((v8 & 1) != 0)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
      }
    }

    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
    baseObject = self->_baseObject;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setVertexAccelerationStructure:atBufferIndex:]( baseObject,  "setVertexAccelerationStructure:atBufferIndex:",  v11,  a4);

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15449;
    unsigned __int8 v13 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v17 = *(void *)(v25[1] + 24LL);
      uint64_t v18 = v30++;
      char v14 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
      unsigned __int8 v13 = v18;
    }

    else
    {
      char v14 = (char *)(v12 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v12 + 13) = v13;
    uint64_t v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    unsigned __int8 v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0LL;
    }
    *(void *)char v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(_BYTE *)(v23 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setVertexAccelerationStructure_atBufferIndex",  (uint64_t)"Raytracing",  0LL,  0LL);
    uint64_t v15 = self->_baseObject;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setVertexAccelerationStructure:atBufferIndex:]( v15,  "setVertexAccelerationStructure:atBufferIndex:",  v16,  a4);
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if ((v8 & 1) != 0)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
      }
    }

    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
    baseObject = self->_baseObject;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setFragmentAccelerationStructure:atBufferIndex:]( baseObject,  "setFragmentAccelerationStructure:atBufferIndex:",  v11,  a4);

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15459;
    unsigned __int8 v13 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v17 = *(void *)(v25[1] + 24LL);
      uint64_t v18 = v30++;
      char v14 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
      unsigned __int8 v13 = v18;
    }

    else
    {
      char v14 = (char *)(v12 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v12 + 13) = v13;
    uint64_t v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    unsigned __int8 v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0LL;
    }
    *(void *)char v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(_BYTE *)(v23 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setFragmentAccelerationStructure_atBufferIndex",  (uint64_t)"Raytracing",  0LL,  0LL);
    uint64_t v15 = self->_baseObject;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setFragmentAccelerationStructure:atBufferIndex:]( v15,  "setFragmentAccelerationStructure:atBufferIndex:",  v16,  a4);
  }
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 device]);
  unsigned __int8 v8 = [v7 captureRaytracingEnabled];

  if ((v8 & 1) != 0)
  {
    [v6 touch];
    if (v6)
    {
      retainedObjects = self->_retainedObjects;
      if (retainedObjects) {
        -[NSMutableSet addObject:](retainedObjects, "addObject:", v6);
      }
    }

    GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v25);
    baseObject = self->_baseObject;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setTileAccelerationStructure:atBufferIndex:]( baseObject,  "setTileAccelerationStructure:atBufferIndex:",  v11,  a4);

    uint64_t v12 = v26;
    *(_DWORD *)(v26 + 8) = -15454;
    unsigned __int8 v13 = v29;
    if (v29 > 0x28uLL)
    {
      uint64_t v17 = *(void *)(v25[1] + 24LL);
      uint64_t v18 = v30++;
      char v14 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
      unsigned __int8 v13 = v18;
    }

    else
    {
      char v14 = (char *)(v12 + v29);
      v29 += 24;
    }

    *(_BYTE *)(v12 + 13) = v13;
    uint64_t v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    unsigned __int8 v21 = (uint64_t *)[v6 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0LL;
    }
    *(void *)char v14 = var0;
    *((void *)v14 + 1) = v22;
    *((void *)v14 + 2) = a4;
    s();
    *(void *)uint64_t v23 = v24;
    *(_BYTE *)(v23 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setTileAccelerationStructure_atBufferIndex",  (uint64_t)"Raytracing",  0LL,  0LL);
    uint64_t v15 = self->_baseObject;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
    -[MTLRenderCommandEncoderSPI setTileAccelerationStructure:atBufferIndex:]( v15,  "setTileAccelerationStructure:atBufferIndex:",  v16,  a4);
  }
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLRenderCommandEncoder;
  uint64_t v3 = -[CaptureMTLRenderCommandEncoder description](&v8, "description");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderCommandEncoderSPI description](self->_baseObject, "description"));
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
  unsigned __int8 v5 = -[MTLRenderCommandEncoderSPI conformsToProtocol:](baseObject, "conformsToProtocol:", v4);

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

- (NSString)label
{
  return (NSString *)-[MTLRenderCommandEncoderSPI label](self->_baseObject, "label");
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v19);
  -[MTLRenderCommandEncoderSPI setLabel:](self->_baseObject, "setLabel:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16281;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (unint64_t)tileHeight
{
  return (unint64_t)-[MTLRenderCommandEncoderSPI tileHeight](self->_baseObject, "tileHeight");
}

- (unint64_t)tileWidth
{
  return (unint64_t)-[MTLRenderCommandEncoderSPI tileWidth](self->_baseObject, "tileWidth");
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16 = *a3;
  -[MTLRenderCommandEncoderSPI dispatchThreadsPerTile:](baseObject, "dispatchThreadsPerTile:", &v16);
  uint64_t v6 = v19;
  *(_DWORD *)(v19 + 8) = -16137;
  unsigned __int8 v7 = v22;
  if (v22 > 0x20uLL)
  {
    uint64_t v9 = *(void *)(v18 + 24);
    uint64_t v10 = v23++;
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, v20, v10 | 0x2000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    uint64_t v8 = (char *)(v6 + v22);
    v22 += 32;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  *(void *)uint64_t v8 = var0;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)&a3->var0;
  *((void *)v8 + 3) = var2;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v21;
  *(_BYTE *)(v19 + 15) |= 8u;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  baseObject = self->_baseObject;
  __int128 v8 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  __int128 v9 = *(_OWORD *)&a4->var0.var2;
  v22[0] = *(_OWORD *)&a4->var0.var0;
  v22[1] = v9;
  v22[2] = *(_OWORD *)&a4->var1.var1;
  __int128 v23 = v8;
  -[MTLRenderCommandEncoderSPI dispatchThreadsPerTile:inRegion:]( baseObject,  "dispatchThreadsPerTile:inRegion:",  &v23,  v22);
  uint64_t v10 = v27;
  *(_DWORD *)(v27 + 8) = -15486;
  uint64_t v11 = *(void *)(v26 + 24);
  uint64_t v12 = v30++;
  Bytes = GTTraceMemPool_allocateBytes(v11, v28, v12 | 0x5000000000LL);
  *(_BYTE *)(v10 + 13) = v12;
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v16 = a3->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v17 = *(_OWORD *)&a4->var0.var0;
  __int128 v18 = *(_OWORD *)&a4->var0.var2;
  __int128 v19 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = v16;
  *((_OWORD *)Bytes + 3) = v17;
  *((_OWORD *)Bytes + 4) = v18;
  *((_OWORD *)Bytes + 5) = v19;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v29;
  *(_BYTE *)(v27 + 15) |= 8u;
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  __int128 v10 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  __int128 v11 = *(_OWORD *)&a4->var0.var2;
  v24[0] = *(_OWORD *)&a4->var0.var0;
  v24[1] = v11;
  v24[2] = *(_OWORD *)&a4->var1.var1;
  __int128 v25 = v10;
  -[MTLRenderCommandEncoderSPI dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:]( baseObject,  "dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:",  &v25,  v24,  v5);
  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -15297;
  uint64_t v13 = *(void *)(v28 + 24);
  uint64_t v14 = v32++;
  Bytes = GTTraceMemPool_allocateBytes(v13, v30, v14 | 0x5800000000LL);
  *(_BYTE *)(v12 + 13) = v14;
  unint64_t v16 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v18 = a3->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v19 = *(_OWORD *)&a4->var0.var0;
  __int128 v20 = *(_OWORD *)&a4->var0.var2;
  __int128 v21 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = v18;
  *((_OWORD *)Bytes + 3) = v19;
  *((_OWORD *)Bytes + 4) = v20;
  *((_OWORD *)Bytes + 5) = v21;
  *((_DWORD *)Bytes + 24) = v5;
  *((_DWORD *)Bytes + 25) = 0;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v31;
  *(_BYTE *)(v29 + 15) |= 8u;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  [v13 touch];
  if (v13)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v13);
    }
  }

  [v14 touch];
  if (v14)
  {
    __int128 v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v14);
    }
  }

  [v15 touch];
  if (v15)
  {
    unint64_t v18 = self->_retainedObjects;
    if (v18) {
      -[NSMutableSet addObject:](v18, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v39);
  baseObject = self->_baseObject;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLRenderCommandEncoderSPI drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:]( baseObject,  "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:ind irectBuffer:indirectBufferOffset:",  a3,  v20,  a5,  v21,  a7,  v22,  a9);

  uint64_t v23 = (char *)v41;
  *(_DWORD *)(v41 + 8) = -16144;
  if (v44)
  {
    uint64_t v24 = *(void *)(v40 + 24);
    uint64_t v25 = v45++;
    uint64_t v26 = GTTraceMemPool_allocateBytes(v24, v42, v25 | 0x4000000000LL) + 16;
  }

  else
  {
    LOBYTE(v25) = 0;
    char v44 = 64;
    uint64_t v26 = v23;
  }

  v23[13] = v25;
  uint64_t v27 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v13 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  char v31 = (uint64_t *)[v14 traceStream];
  if (v31) {
    uint64_t v32 = *v31;
  }
  else {
    uint64_t v32 = 0LL;
  }
  v33 = (uint64_t *)[v15 traceStream];
  if (v33) {
    uint64_t v34 = *v33;
  }
  else {
    uint64_t v34 = 0LL;
  }
  *(void *)uint64_t v26 = var0;
  *((void *)v26 + 1) = a3;
  *((void *)v26 + 2) = v30;
  *((void *)v26 + 3) = a5;
  *((void *)v26 + 4) = v32;
  *((void *)v26 + 5) = a7;
  *((void *)v26 + 6) = v34;
  *((void *)v26 + 7) = a9;
  s();
  *(void *)uint64_t v35 = v36;
  *(_BYTE *)(v35 + 8) = v43;
  *(_BYTE *)(v41 + 15) |= 8u;
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  id v14 = a6;
  id v15 = a8;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  [v15 touch];
  if (v15)
  {
    __int128 v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v36);
  baseObject = self->_baseObject;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLRenderCommandEncoderSPI drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:]( baseObject,  "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPoin tIndexBufferOffset:instanceCount:baseInstance:",  a3,  a4,  a5,  v19,  a7,  v20,  a9,  a10,  a11);

  uint64_t v21 = v38;
  *(_DWORD *)(v38 + 8) = -16145;
  uint64_t v22 = *(void *)(v37 + 24);
  uint64_t v23 = v41++;
  Bytes = GTTraceMemPool_allocateBytes(v22, v39, v23 | 0x5000000000LL);
  *(_BYTE *)(v21 + 13) = v23;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v14 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v15 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v28;
  *((void *)Bytes + 7) = a7;
  *((void *)Bytes + 8) = v30;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  *((void *)Bytes + 11) = a11;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v40;
  *(_BYTE *)(v38 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  id v12 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLRenderCommandEncoderSPI drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:]( baseObject,  "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:",  a3,  a4,  a5,  v15,  a7);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16248;
  unsigned __int8 v17 = v31;
  if (v31 > 0x10uLL)
  {
    uint64_t v19 = *(void *)(v27[1] + 24LL);
    uint64_t v20 = v32++;
    unint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x3000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    unint64_t v18 = (char *)(v16 + v31);
    v31 += 48;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unint64_t v18 = var0;
  *((void *)v18 + 1) = a3;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = v24;
  *((void *)v18 + 5) = a7;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  id v14 = a6;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  -[MTLRenderCommandEncoderSPI drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:]( baseObject,  "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:",  a3,  a4,  a5,  v17,  a7,  a8);

  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -16249;
  unsigned __int8 v19 = v33;
  if (v33 > 8uLL)
  {
    uint64_t v21 = *(void *)(v29[1] + 24LL);
    uint64_t v22 = v34++;
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v31, v22 | 0x3800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v33);
    v33 += 56;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = a3;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = v26;
  *((void *)v20 + 5) = a7;
  *((void *)v20 + 6) = a8;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  id v16 = a6;
  [v16 touch];
  if (v16)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v16);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 baseObject]);
  unint64_t v20 = a7;
  unint64_t v21 = a7;
  unint64_t v22 = a8;
  -[MTLRenderCommandEncoderSPI drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:]( baseObject,  "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:",  a3,  a4,  a5,  v19,  v21,  a8,  a9,  a10);

  uint64_t v23 = v35;
  *(_DWORD *)(v35 + 8) = -16217;
  uint64_t v24 = *(void *)(v34 + 24);
  uint64_t v25 = v38++;
  Bytes = GTTraceMemPool_allocateBytes(v24, v36, v25 | 0x4800000000LL);
  *(_BYTE *)(v23 + 13) = v25;
  uint64_t v27 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v29 = (uint64_t *)[v16 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = a3;
  *((void *)Bytes + 4) = a4;
  *((void *)Bytes + 5) = a5;
  *((void *)Bytes + 6) = v30;
  *((void *)Bytes + 7) = v20;
  *((void *)Bytes + 8) = v22;
  *((void *)Bytes + 9) = a9;
  *((void *)Bytes + 10) = a10;
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  id v14 = a5;
  id v15 = a7;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  [v15 touch];
  if (v15)
  {
    unsigned __int8 v17 = self->_retainedObjects;
    if (v17) {
      -[NSMutableSet addObject:](v17, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v34);
  baseObject = self->_baseObject;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  -[MTLRenderCommandEncoderSPI drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:]( baseObject,  "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:",  a3,  a4,  v19,  a6,  v20,  a8);

  uint64_t v21 = v35;
  *(_DWORD *)(v35 + 8) = -16215;
  unsigned __int8 v22 = v38;
  if (v38 > 8uLL)
  {
    uint64_t v24 = *(void *)(v34[1] + 24LL);
    uint64_t v25 = v39++;
    uint64_t v23 = GTTraceMemPool_allocateBytes(v24, v36, v25 | 0x3800000000LL) + 16;
    unsigned __int8 v22 = v25;
  }

  else
  {
    uint64_t v23 = (char *)(v21 + v38);
    v38 += 56;
  }

  *(_BYTE *)(v21 + 13) = v22;
  uint64_t v26 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = (uint64_t *)[v14 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0LL;
  }
  uint64_t v30 = (uint64_t *)[v15 traceStream];
  if (v30) {
    uint64_t v31 = *v30;
  }
  else {
    uint64_t v31 = 0LL;
  }
  *(void *)uint64_t v23 = var0;
  *((void *)v23 + 1) = a3;
  *((void *)v23 + 2) = a4;
  *((void *)v23 + 3) = v29;
  *((void *)v23 + 4) = a6;
  *((void *)v23 + 5) = v31;
  *((void *)v23 + 6) = a8;
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  -[MTLRenderCommandEncoderSPI drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]( baseObject,  "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:",  &v25,  &v24,  &v23);
  uint64_t v10 = v28;
  *(_DWORD *)(v28 + 8) = -15416;
  uint64_t v11 = *(void *)(v27 + 24);
  uint64_t v12 = v31++;
  Bytes = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x5000000000LL);
  *(_BYTE *)(v10 + 13) = v12;
  id v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v19 = *(_OWORD *)&a4->var0;
  __int128 v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
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

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  __int128 v29 = *(_OWORD *)&a5->var0;
  unint64_t var2 = a5->var2;
  __int128 v27 = *(_OWORD *)&a6->var0;
  unint64_t v28 = a6->var2;
  -[MTLRenderCommandEncoderSPI drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]( baseObject,  "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:",  v13,  a4,  &v29,  &v27);

  uint64_t v14 = v33;
  *(_DWORD *)(v33 + 8) = -15415;
  uint64_t v15 = *(void *)(v32 + 24);
  uint64_t v16 = v36++;
  Bytes = GTTraceMemPool_allocateBytes(v15, v34, v16 | 0x4800000000LL);
  *(_BYTE *)(v14 + 13) = v16;
  unint64_t v18 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int128 v20 = (uint64_t *)[v10 traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  unint64_t v22 = a5->var2;
  unint64_t v23 = a6->var2;
  *((void *)Bytes + 2) = var0;
  *((void *)Bytes + 3) = v21;
  *((void *)Bytes + 4) = a4;
  __int128 v24 = *(_OWORD *)&a6->var0;
  *(_OWORD *)(Bytes + 40) = *(_OWORD *)&a5->var0;
  *((void *)Bytes + 7) = v22;
  *((_OWORD *)Bytes + 4) = v24;
  *((void *)Bytes + 10) = v23;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v23 = *a5;
  -[MTLRenderCommandEncoderSPI drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]( baseObject,  "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:",  &v25,  &v24,  &v23);
  uint64_t v10 = v28;
  *(_DWORD *)(v28 + 8) = -15414;
  uint64_t v11 = *(void *)(v27 + 24);
  uint64_t v12 = v31++;
  Bytes = GTTraceMemPool_allocateBytes(v11, v29, v12 | 0x5000000000LL);
  *(_BYTE *)(v10 + 13) = v12;
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = a3->var2;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a5->var2;
  *((void *)Bytes + 2) = var0;
  __int128 v19 = *(_OWORD *)&a4->var0;
  __int128 v20 = *(_OWORD *)&a5->var0;
  *(_OWORD *)(Bytes + 24) = *(_OWORD *)&a3->var0;
  *((void *)Bytes + 5) = var2;
  *((_OWORD *)Bytes + 3) = v19;
  *((void *)Bytes + 8) = v17;
  *(_OWORD *)(Bytes + 72) = v20;
  *((void *)Bytes + 11) = v18;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a6;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  [v13 touch];
  if (v13)
  {
    uint64_t v15 = self->_retainedObjects;
    if (v15) {
      -[NSMutableSet addObject:](v15, "addObject:", v13);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v32);
  baseObject = self->_baseObject;
  unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  -[MTLRenderCommandEncoderSPI drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:]( baseObject,  "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:",  a3,  v17,  a5,  v18,  a7);

  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -16146;
  unsigned __int8 v20 = v36;
  if (v36 > 0x10uLL)
  {
    uint64_t v22 = *(void *)(v32[1] + 24LL);
    uint64_t v23 = v37++;
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v34, v23 | 0x3000000000LL) + 16;
    unsigned __int8 v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    v36 += 48;
  }

  *(_BYTE *)(v19 + 13) = v20;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = (uint64_t *)[v12 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  uint64_t v28 = (uint64_t *)[v13 traceStream];
  if (v28) {
    uint64_t v29 = *v28;
  }
  else {
    uint64_t v29 = 0LL;
  }
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = a3;
  *((void *)v21 + 2) = v27;
  *((void *)v21 + 3) = a5;
  *((void *)v21 + 4) = v29;
  *((void *)v21 + 5) = a7;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  id v15 = a6;
  [v15 touch];
  if (v15)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v15);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v32);
  baseObject = self->_baseObject;
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 baseObject]);
  unint64_t v31 = a7;
  unint64_t v19 = a7;
  unint64_t v20 = a8;
  -[MTLRenderCommandEncoderSPI drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:]( baseObject,  "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:",  a3,  a4,  a5,  v18,  v19,  a8,  a9);

  uint64_t v21 = (char *)v34;
  *(_DWORD *)(v34 + 8) = -16147;
  if (v37)
  {
    uint64_t v22 = *(void *)(v33 + 24);
    uint64_t v23 = v38++;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = GTTraceMemPool_allocateBytes(v22, v35, v23 | 0x4000000000LL) + 16;
  }

  else
  {
    LOBYTE(v23) = 0;
    char v37 = 64;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = v21;
  }

  v21[13] = v23;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v15 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v24 = var0;
  *((void *)v24 + 1) = a3;
  *((void *)v24 + 2) = a4;
  *((void *)v24 + 3) = a5;
  *((void *)v24 + 4) = v28;
  *((void *)v24 + 5) = v31;
  *((void *)v24 + 6) = v20;
  *((void *)v24 + 7) = a9;
  s();
  *(void *)uint64_t v29 = v30;
  *(_BYTE *)(v29 + 8) = v36;
  *(_BYTE *)(v34 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v8 = a4;
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
  -[MTLRenderCommandEncoderSPI drawPrimitives:indirectBuffer:indirectBufferOffset:]( baseObject,  "drawPrimitives:indirectBuffer:indirectBufferOffset:",  a3,  v11,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16216;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  unint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = a3;
  *((void *)v14 + 2) = v20;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16250;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  uint64_t v11 = v21;
  *(_DWORD *)(v21 + 8) = -16251;
  unsigned __int8 v12 = v24;
  if (v24 > 0x18uLL)
  {
    uint64_t v14 = *(void *)(v20[1] + 24LL);
    uint64_t v15 = v25++;
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v22, v15 | 0x2800000000LL) + 16;
    unsigned __int8 v12 = v15;
  }

  else
  {
    uint64_t v13 = (char *)(v11 + v24);
    v24 += 40;
  }

  *(_BYTE *)(v11 + 13) = v12;
  uint64_t v16 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = a3;
  *((void *)v13 + 2) = a4;
  *((void *)v13 + 3) = a5;
  *((void *)v13 + 4) = a6;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  uint64_t v13 = v23;
  *(_DWORD *)(v23 + 8) = -16218;
  unsigned __int8 v14 = v26;
  if (v26 > 0x10uLL)
  {
    uint64_t v16 = *(void *)(v22[1] + 24LL);
    uint64_t v17 = v27++;
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v24, v17 | 0x3000000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v26);
    v26 += 48;
  }

  *(_BYTE *)(v13 + 13) = v14;
  uint64_t v18 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = a3;
  *((void *)v15 + 2) = a4;
  *((void *)v15 + 3) = a5;
  *((void *)v15 + 4) = a6;
  *((void *)v15 + 5) = a7;
  s();
  *(void *)uint64_t v20 = v21;
  *(_BYTE *)(v20 + 8) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
}

- (void)endEncoding
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16246;
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
  id v8 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  -[MTLRenderCommandEncoderSPI insertDebugSignpost:](self->_baseObject, "insertDebugSignpost:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16245;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (BOOL)isMemorylessRender
{
  return -[MTLRenderCommandEncoderSPI isMemorylessRender](self->_baseObject, "isMemorylessRender");
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  unint64_t v32 = a6;
  unint64_t v7 = a4;
  uint64_t v8 = a3;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * v7;
  __chkstk_darwin(v10, v13);
  if (v7)
  {
    id v14 = (void **)v8;
    id v15 = &v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v16 = v7;
    do
    {
      uint64_t v17 = *v14++;
      *v15++ = objc_msgSend(v17, "baseObject", v32);
      --v16;
    }

    while (v16);
  }

  unint64_t v18 = v32;
  -[MTLRenderCommandEncoderSPI memoryBarrierWithResources:count:afterStages:beforeStages:]( baseObject,  "memoryBarrierWithResources:count:afterStages:beforeStages:",  &v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  v7,  a5,  v32,  v32);
  uint64_t v19 = v35;
  *(_DWORD *)(v35 + 8) = -16003;
  unsigned __int8 v20 = v38;
  if (v38 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v34 + 24);
    uint64_t v23 = v39++;
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v36, v23 | 0x2800000000LL) + 16;
    unsigned __int8 v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v38);
    v38 += 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  unsigned __int8 v24 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v24, v25);
  char v27 = StreamArray((uint64_t)v33, &v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)v8, v7);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v7;
  *((void *)v21 + 2) = a5;
  *((void *)v21 + 3) = v18;
  v21[32] = v27;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
  if (v7)
  {
    BOOL v31 = a5 == 1 && v18 == 1;
    do
    {
      if (v31) {
        CaptureRemoveFuncSnapshot((void *)*v8, self->_snapshotMap);
      }
      ++v8;
      --v7;
    }

    while (v7);
  }

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16004;
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
  id v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  if (a4 == 1 && a5 == 1) {
    CaptureClearFuncSnapshot((apr_hash_index_t *)a3, (uint64_t)self->_snapshotMap);
  }
}

- (void)popDebugGroup
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16243;
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
  uint64_t v8 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  -[MTLRenderCommandEncoderSPI pushDebugGroup:](self->_baseObject, "pushDebugGroup:", v4);
  uint64_t v5 = v20;
  *(_DWORD *)(v20 + 8) = -16244;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  -[MTLRenderCommandEncoderSPI sampleCountersInBuffer:atSampleIndex:withBarrier:]( baseObject,  "sampleCountersInBuffer:atSampleIndex:withBarrier:",  v11,  a4,  v5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15750;
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
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setAlphaTestReferenceValue:(float)a3
{
  *(float *)&double v5 = a3;
  -[MTLRenderCommandEncoderSPI setAlphaTestReferenceValue:](self->_baseObject, "setAlphaTestReferenceValue:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15729;
  unsigned __int8 v7 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;
  -[MTLRenderCommandEncoderSPI setBlendColorRed:green:blue:alpha:]( self->_baseObject,  "setBlendColorRed:green:blue:alpha:",  v11,  v12,  v13,  v14);
  uint64_t v15 = v25;
  *(_DWORD *)(v25 + 8) = -16255;
  unsigned __int8 v16 = v28;
  if (v28 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v24[1] + 24LL);
    uint64_t v19 = v29++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v26, v19 | 0x1800000000LL) + 16;
    unsigned __int8 v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v28);
    v28 += 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  unsigned __int8 v20 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v17 = var0;
  *((float *)v17 + 2) = a3;
  *((float *)v17 + 3) = a4;
  *((float *)v17 + 4) = a5;
  *((float *)v17 + 5) = a6;
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
}

- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7
{
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
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

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLRenderCommandEncoderSPI setColorResolveTexture:slice:depthPlane:level:atIndex:]( baseObject,  "setColorResolveTexture:slice:depthPlane:level:atIndex:",  v15,  a4,  a5,  a6,  a7);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16156;
  unsigned __int8 v17 = v31;
  if (v31 > 0x10uLL)
  {
    uint64_t v19 = *(void *)(v27[1] + 24LL);
    uint64_t v20 = v32++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x3000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v31);
    v31 += 48;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((void *)v18 + 5) = a7;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  [v14 touch];
  if (v14)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v14);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 baseObject]);
  -[MTLRenderCommandEncoderSPI setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:]( baseObject,  "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:",  v17,  a4,  a5,  a6,  v9,  a8);

  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -15728;
  unsigned __int8 v19 = v33;
  if (v33 > 8uLL)
  {
    uint64_t v21 = *(void *)(v29[1] + 24LL);
    uint64_t v22 = v34++;
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v31, v22 | 0x3800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v33);
    v33 += 56;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = (uint64_t *)[v14 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0LL;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = a6;
  *((void *)v20 + 5) = a8;
  *((_DWORD *)v20 + 12) = v9;
  *((_DWORD *)v20 + 13) = 0;
  s();
  *(void *)uint64_t v27 = v28;
  *(_BYTE *)(v27 + 8) = v32;
  *(_BYTE *)(v30 + 15) |= 8u;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16159;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    BOOL v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    BOOL v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  id v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16022;
  unsigned __int8 v8 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    BOOL v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    BOOL v9 = (char *)(v7 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v7 + 13) = v8;
  id v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v9 = var0;
  *((void *)v9 + 1) = a3;
  *((void *)v9 + 2) = a4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setCommandDataCorruptModeSPI:(unint64_t)a3
{
}

- (void)setCullMode:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16268;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  *(float *)&double v11 = a5;
  -[MTLRenderCommandEncoderSPI setDepthBias:slopeScale:clamp:]( self->_baseObject,  "setDepthBias:slopeScale:clamp:",  v9,  v10,  v11);
  uint64_t v12 = v22;
  *(_DWORD *)(v22 + 8) = -16266;
  unsigned __int8 v13 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v15 = *(void *)(v21[1] + 24LL);
    uint64_t v16 = v26++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v23, v16 | 0x1800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((float *)v14 + 2) = a3;
  *((float *)v14 + 3) = a4;
  *((float *)v14 + 4) = a5;
  *((_DWORD *)v14 + 5) = 0;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setDepthCleared
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15727;
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
  uint64_t v8 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setDepthClipMode:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16267;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setDepthClipModeSPI:(unint64_t)a3
{
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
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
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLRenderCommandEncoderSPI setDepthResolveTexture:slice:depthPlane:level:]( baseObject,  "setDepthResolveTexture:slice:depthPlane:level:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16155;
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
  unsigned __int8 v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v21 = (uint64_t *)[v10 traceStream];
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

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLRenderCommandEncoderSPI setDepthResolveTexture:slice:depthPlane:level:yInvert:]( baseObject,  "setDepthResolveTexture:slice:depthPlane:level:yInvert:",  v15,  a4,  a5,  a6,  v7);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15726;
  unsigned __int8 v17 = v31;
  if (v31 > 0x10uLL)
  {
    uint64_t v19 = *(void *)(v27[1] + 24LL);
    uint64_t v20 = v32++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x3000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v31);
    v31 += 48;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((_DWORD *)v18 + 10) = v7;
  *((_DWORD *)v18 + 11) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)setDepthStencilState:(id)a3
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
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
  -[MTLRenderCommandEncoderSPI setDepthStencilState:](baseObject, "setDepthStencilState:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16254;
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
  uint64_t v13 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setDepthStoreAction:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16158;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    BOOL v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16021;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    BOOL v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setFragmentBuffer:offset:atIndex:]( baseObject,  "setFragmentBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16263;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16222;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
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
    unsigned __int8 v13 = a3;
    uint64_t v14 = &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = objc_msgSend(v16, "baseObject", location);
      --v15;
    }

    while (v15);
  }

  NSUInteger v17 = location;
  -[MTLRenderCommandEncoderSPI setFragmentBuffers:offsets:withRange:]( baseObject,  "setFragmentBuffers:offsets:withRange:",  &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  location,  length,  location);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16262;
  unsigned __int8 v19 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v21 = *(void *)(v32 + 24);
    uint64_t v22 = v37++;
    unsigned __int8 v20 = GTTraceMemPool_allocateBytes(v21, v34, v22 | 0x2000000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    unsigned __int8 v20 = (char *)(v18 + v36);
    v36 += 32;
  }

  *(_BYTE *)(v18 + 13) = v19;
  unsigned __int8 v23 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v23, v24);
  char v26 = StreamArray((uint64_t)v31, &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  char v27 = GTTraceEncoder_storeBytes((uint64_t)v31, (void *)a4, 8 * length);
  *(void *)unsigned __int8 v20 = var0;
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

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16223;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setFragmentIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setFragmentIntersectionFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15458;
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
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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
      NSUInteger v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLRenderCommandEncoderSPI setFragmentIntersectionFunctionTables:withBufferRange:]( baseObject,  "setFragmentIntersectionFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15457;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:atIndex:](baseObject, "setFragmentSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16259;
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
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16257;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v19 = a3;
  [v19 touch];
  uint64_t v12 = v19;
  if (v19)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v19);
      uint64_t v12 = v19;
    }
  }

  baseObject = self->_baseObject;
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:]( baseObject,  "setFragmentSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:",  v15,  a7,  v16,  v17,  v18);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
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
      double v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  NSUInteger v18 = location;
  id v19 = (float *)a5;
  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v35,  a5,  location,  length);
  uint64_t v20 = v38;
  *(_DWORD *)(v38 + 8) = -16256;
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
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setFragmentSamplerStates:withRange:]( baseObject,  "setFragmentSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16258;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atIndex:](baseObject, "setFragmentTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16261;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  [v10 touch];
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
    }
  }

  [v11 touch];
  if (v11)
  {
    uint64_t v13 = self->_retainedObjects;
    if (v13) {
      -[NSMutableSet addObject:](v13, "addObject:", v11);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 baseObject]);
  -[MTLRenderCommandEncoderSPI setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:]( baseObject,  "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:",  v15,  a4,  v16,  a6);

  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -16214;
  unsigned __int8 v18 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v20 = *(void *)(v30[1] + 24LL);
    uint64_t v21 = v35++;
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, v32, v21 | 0x2800000000LL) + 16;
    unsigned __int8 v18 = v21;
  }

  else
  {
    uint64_t v19 = (char *)(v17 + v34);
    v34 += 40;
  }

  *(_BYTE *)(v17 + 13) = v18;
  uint64_t v22 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v24 = (uint64_t *)[v10 traceStream];
  if (v24) {
    uint64_t v25 = *v24;
  }
  else {
    uint64_t v25 = 0LL;
  }
  unsigned __int8 v26 = (uint64_t *)[v11 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = v27;
  *((void *)v19 + 4) = a6;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setFragmentTextures:withRange:]( baseObject,  "setFragmentTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16260;
  unsigned __int8 v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v29 + 24);
    uint64_t v20 = v34++;
    unsigned __int8 v18 = GTTraceMemPool_allocateBytes(v19, v31, v20 | 0x2000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    unsigned __int8 v18 = (char *)(v16 + v33);
    v33 += 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v21, v22);
  char v24 = StreamArray((uint64_t)v28, &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  *(void *)unsigned __int8 v18 = var0;
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

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setFragmentVisibleFunctionTable:atBufferIndex:]( baseObject,  "setFragmentVisibleFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15456;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setFragmentVisibleFunctionTables:withBufferRange:]( baseObject,  "setFragmentVisibleFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15455;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setFrontFacingWinding:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16269;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setLineWidth:(float)a3
{
  *(float *)&double v5 = a3;
  -[MTLRenderCommandEncoderSPI setLineWidth:](self->_baseObject, "setLineWidth:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -16247;
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
  uint64_t v11 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshAccelerationStructure_atBufferIndex",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
  [v10 touch];
  uint64_t v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
      uint64_t v6 = v10;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLRenderCommandEncoderSPI setMeshAccelerationStructure:atBufferIndex:]( baseObject,  "setMeshAccelerationStructure:atBufferIndex:",  v9,  a4);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setMeshBuffer:offset:atIndex:](baseObject, "setMeshBuffer:offset:atIndex:", v11, a4, a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15401;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15400;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  if (length)
  {
    unsigned __int8 v13 = a3;
    uint64_t v14 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = objc_msgSend(v16, "baseObject", location);
      --v15;
    }

    while (v15);
  }

  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setMeshBuffers:offsets:withRange:]( baseObject,  "setMeshBuffers:offsets:withRange:",  &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  v18,  location,  length,  location);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15399;
  unsigned __int8 v21 = v38;
  if (v38 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v34 + 24);
    uint64_t v24 = v39++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v38);
    v38 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v33, &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)v33, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -15398;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTable_atBufferIndex",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
  [v10 touch];
  uint64_t v6 = v10;
  if (v10)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v10);
      uint64_t v6 = v10;
    }
  }

  baseObject = self->_baseObject;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  -[MTLRenderCommandEncoderSPI setMeshIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setMeshIntersectionFunctionTable:atBufferIndex:",  v9,  a4);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTables_withBufferRange",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, v10);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = (char *)&v17 - v12;
  if (length)
  {
    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*a3++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLRenderCommandEncoderSPI setMeshIntersectionFunctionTables:withBufferRange:]( baseObject,  "setMeshIntersectionFunctionTables:withBufferRange:",  v13,  location,  length);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setMeshSamplerState:atIndex:](baseObject, "setMeshSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15397;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    unint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    unint64_t v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15396;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v36 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  id v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v37);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  if (length)
  {
    double v14 = a3;
    double v15 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
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
  uint64_t v19 = a5;
  -[MTLRenderCommandEncoderSPI setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v36,  a5,  location,  length);
  uint64_t v20 = v39;
  *(_DWORD *)(v39 + 8) = -15395;
  unsigned __int8 v21 = v42;
  if (v42 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v38 + 24);
    uint64_t v24 = v43++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v40, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v42);
    v42 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v22 = var0;
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

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setMeshSamplerStates:withRange:]( baseObject,  "setMeshSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15394;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setMeshTexture:atIndex:](baseObject, "setMeshTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15393;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setMeshTextures:withRange:]( baseObject,  "setMeshTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15392;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTable_atBufferIndex",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
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
  -[MTLRenderCommandEncoderSPI setMeshVisibleFunctionTable:atBufferIndex:]( baseObject,  "setMeshVisibleFunctionTable:atBufferIndex:",  v9,  a4);
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTables_withBufferRange",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, v10);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = (char *)&v17 - v12;
  if (length)
  {
    NSUInteger v14 = (uint64_t *)((char *)&v17 - v12);
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*a3++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLRenderCommandEncoderSPI setMeshVisibleFunctionTables:withBufferRange:]( baseObject,  "setMeshVisibleFunctionTables:withBufferRange:",  v13,  location,  length);
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectAccelerationStructure_atBufferIndex",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
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
  -[MTLRenderCommandEncoderSPI setObjectAccelerationStructure:atBufferIndex:]( baseObject,  "setObjectAccelerationStructure:atBufferIndex:",  v9,  a4);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setObjectBuffer:offset:atIndex:]( baseObject,  "setObjectBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15391;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    NSUInteger v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    NSUInteger v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)NSUInteger v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15390;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  if (length)
  {
    unsigned __int8 v13 = a3;
    uint64_t v14 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = objc_msgSend(v16, "baseObject", location);
      --v15;
    }

    while (v15);
  }

  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setObjectBuffers:offsets:withRange:]( baseObject,  "setObjectBuffers:offsets:withRange:",  &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  v18,  location,  length,  location);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -15389;
  unsigned __int8 v21 = v38;
  if (v38 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v34 + 24);
    uint64_t v24 = v39++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v38);
    v38 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v33, &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)v33, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -15388;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTable_atBufferIndex",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
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
  -[MTLRenderCommandEncoderSPI setObjectIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setObjectIntersectionFunctionTable:atBufferIndex:",  v9,  a4);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTables_withBufferRange",  (uint64_t)"Mesh shaders with Raytracing",  0LL,  0LL);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, v10);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = (char *)&v17 - v12;
  if (length)
  {
    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
    NSUInteger v15 = length;
    do
    {
      char v16 = (void *)*a3++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLRenderCommandEncoderSPI setObjectIntersectionFunctionTables:withBufferRange:]( baseObject,  "setObjectIntersectionFunctionTables:withBufferRange:",  v13,  location,  length);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setObjectSamplerState:atIndex:](baseObject, "setObjectSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15387;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    unint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    unint64_t v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15386;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v36 = a4;
  RetainArray(self->_retainedObjects, (id *)a3, a6.length);
  id v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v37);
  baseObject = self->_baseObject;
  uint64_t v12 = 8 * length;
  __chkstk_darwin(v10, v13);
  if (length)
  {
    double v14 = a3;
    double v15 = (uint64_t *)((char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
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
  uint64_t v19 = a5;
  -[MTLRenderCommandEncoderSPI setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v36,  a5,  location,  length);
  uint64_t v20 = v39;
  *(_DWORD *)(v39 + 8) = -15385;
  unsigned __int8 v21 = v42;
  if (v42 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v38 + 24);
    uint64_t v24 = v43++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v40, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v42);
    v42 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v22 = var0;
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

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setObjectSamplerStates:withRange:]( baseObject,  "setObjectSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15384;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setObjectTexture:atIndex:](baseObject, "setObjectTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15383;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setObjectTextures:withRange:]( baseObject,  "setObjectTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15382;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15381;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTable_atBufferIndex",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
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
  -[MTLRenderCommandEncoderSPI setObjectVisibleFunctionTable:atBufferIndex:]( baseObject,  "setObjectVisibleFunctionTable:atBufferIndex:",  v9,  a4);
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTables_withBufferRange",  (uint64_t)"Mesh shaders with Function Pointers",  0LL,  0LL);
  RetainArray(self->_retainedObjects, (id *)a3, length);
  baseObject = self->_baseObject;
  __chkstk_darwin(v9, v10);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = (char *)&v17 - v12;
  if (length)
  {
    uint64_t v14 = (uint64_t *)((char *)&v17 - v12);
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*a3++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLRenderCommandEncoderSPI setObjectVisibleFunctionTables:withBufferRange:]( baseObject,  "setObjectVisibleFunctionTables:withBufferRange:",  v13,  location,  length);
}

- (void)setPointSize:(float)a3
{
  *(float *)&double v5 = a3;
  -[MTLRenderCommandEncoderSPI setPointSize:](self->_baseObject, "setPointSize:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -15988;
  unsigned __int8 v7 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    unsigned __int8 v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    unsigned __int8 v8 = (char *)(v6 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLRenderCommandEncoderSPI setPrimitiveRestartEnabled:](self->_baseObject, "setPrimitiveRestartEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15970;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    unsigned __int8 v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    unsigned __int8 v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  BOOL v5 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v16);
  -[MTLRenderCommandEncoderSPI setPrimitiveRestartEnabled:index:]( self->_baseObject,  "setPrimitiveRestartEnabled:index:",  v5,  a4);
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15984;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  *((void *)v9 + 1) = a4;
  *((_DWORD *)v9 + 4) = v5;
  *((_DWORD *)v9 + 5) = 0;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15725;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setRenderPipelineState:(id)a3
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
  -[MTLRenderCommandEncoderSPI setRenderPipelineState:](baseObject, "setRenderPipelineState:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16279;
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
  uint64_t v13 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setScissorRect:(id *)a3
{
  baseObject = self->_baseObject;
  __int128 v6 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v6;
  -[MTLRenderCommandEncoderSPI setScissorRect:](baseObject, "setScissorRect:", v17);
  uint64_t v7 = v20;
  *(_DWORD *)(v20 + 8) = -16265;
  unsigned __int8 v8 = v23;
  if (v23 > 0x18uLL)
  {
    uint64_t v10 = *(void *)(v19 + 24);
    uint64_t v11 = v24++;
    unsigned __int8 v9 = GTTraceMemPool_allocateBytes(v10, v21, v11 | 0x2800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    unsigned __int8 v9 = (char *)(v7 + v23);
    v23 += 40;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v9 = var0;
  __int128 v14 = *(_OWORD *)&a3->var2;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0;
  *(_OWORD *)(v9 + 24) = v14;
  s();
  *(void *)uint64_t v15 = v16;
  *(_BYTE *)(v15 + 8) = v22;
  *(_BYTE *)(v20 + 15) |= 8u;
}

- (void)setStencilCleared
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -15724;
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
  unsigned __int8 v8 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v16);
  -[MTLRenderCommandEncoderSPI setStencilFrontReferenceValue:backReferenceValue:]( self->_baseObject,  "setStencilFrontReferenceValue:backReferenceValue:",  v5,  v4);
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16219;
  unsigned __int8 v8 = v20;
  if (v20 > 0x30uLL)
  {
    uint64_t v10 = *(void *)(v16[1] + 24LL);
    uint64_t v11 = v21++;
    unsigned __int8 v9 = GTTraceMemPool_allocateBytes(v10, v18, v11 | 0x1000000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    unsigned __int8 v9 = (char *)(v7 + v20);
    v20 += 16;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned __int8 v9 = var0;
  *((_DWORD *)v9 + 2) = v5;
  *((_DWORD *)v9 + 3) = v4;
  s();
  *(void *)uint64_t v14 = v15;
  *(_BYTE *)(v14 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLRenderCommandEncoderSPI setStencilReferenceValue:](self->_baseObject, "setStencilReferenceValue:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16253;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
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
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  -[MTLRenderCommandEncoderSPI setStencilResolveTexture:slice:depthPlane:level:]( baseObject,  "setStencilResolveTexture:slice:depthPlane:level:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15723;
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
  unsigned __int8 v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v21 = (uint64_t *)[v10 traceStream];
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

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  [v12 touch];
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects) {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
    }
  }

  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLRenderCommandEncoderSPI setStencilResolveTexture:slice:depthPlane:level:yInvert:]( baseObject,  "setStencilResolveTexture:slice:depthPlane:level:yInvert:",  v15,  a4,  a5,  a6,  v7);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15722;
  unsigned __int8 v17 = v31;
  if (v31 > 0x10uLL)
  {
    uint64_t v19 = *(void *)(v27[1] + 24LL);
    uint64_t v20 = v32++;
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x3000000000LL) + 16;
    unsigned __int8 v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v31);
    v31 += 48;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = a6;
  *((_DWORD *)v18 + 10) = v7;
  *((_DWORD *)v18 + 11) = 0;
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16157;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    BOOL v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16020;
  unsigned __int8 v6 = v18;
  if (v18 > 0x30uLL)
  {
    uint64_t v8 = *(void *)(v14[1] + 24LL);
    uint64_t v9 = v19++;
    BOOL v7 = GTTraceMemPool_allocateBytes(v8, v16, v9 | 0x1000000000LL) + 16;
    unsigned __int8 v6 = v9;
  }

  else
  {
    BOOL v7 = (char *)(v5 + v18);
    v18 += 16;
  }

  *(_BYTE *)(v5 + 13) = v6;
  id v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)BOOL v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setTessellationFactorBuffer:offset:instanceStride:]( baseObject,  "setTessellationFactorBuffer:offset:instanceStride:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16148;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setTessellationFactorScale:(float)a3
{
  *(float *)&double v5 = a3;
  -[MTLRenderCommandEncoderSPI setTessellationFactorScale:](self->_baseObject, "setTessellationFactorScale:", v5);
  uint64_t v6 = v16;
  *(_DWORD *)(v16 + 8) = -16132;
  unsigned __int8 v7 = v19;
  if (v19 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v15[1] + 24LL);
    uint64_t v10 = v20++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v17, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v19);
    v19 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  uint64_t v11 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((float *)v8 + 2) = a3;
  *((_DWORD *)v8 + 3) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v18;
  *(_BYTE *)(v16 + 15) |= 8u;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -16074;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setTileBuffer:offset:atIndex:](baseObject, "setTileBuffer:offset:atIndex:", v11, a4, a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16142;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16141;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  RetainArray(self->_retainedObjects, (id *)a3, a5.length);
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v33);
  baseObject = self->_baseObject;
  uint64_t v11 = 8 * length;
  __chkstk_darwin(v9, v12);
  if (length)
  {
    unsigned __int8 v13 = a3;
    uint64_t v14 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    NSUInteger v15 = length;
    do
    {
      uint64_t v16 = (void *)*v13++;
      *v14++ = objc_msgSend(v16, "baseObject", location);
      --v15;
    }

    while (v15);
  }

  uint64_t v17 = a4;
  uint64_t v18 = a4;
  NSUInteger v19 = location;
  -[MTLRenderCommandEncoderSPI setTileBuffers:offsets:withRange:]( baseObject,  "setTileBuffers:offsets:withRange:",  &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  v18,  location,  length,  location);
  uint64_t v20 = v35;
  *(_DWORD *)(v35 + 8) = -16087;
  unsigned __int8 v21 = v38;
  if (v38 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v34 + 24);
    uint64_t v24 = v39++;
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v36, v24 | 0x2000000000LL) + 16;
    unsigned __int8 v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v38);
    v38 += 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v25, v26);
  char v28 = StreamArray((uint64_t)v33, &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, length);
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v29 = GTTraceEncoder_storeBlob((uint64_t)v33, v17, length);
  }
  else {
    char v29 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v19;
  *((void *)v22 + 2) = length;
  v22[24] = v28;
  v22[25] = v29;
  *(_DWORD *)(v22 + 26) = 0;
  *((_WORD *)v22 + 15) = 0;
  s();
  *(void *)uint64_t v30 = v31;
  *(_BYTE *)(v30 + 8) = v37;
  *(_BYTE *)(v35 + 15) |= 8u;
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16143;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setTileIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setTileIntersectionFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15453;
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
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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
      NSUInteger v15 = (void *)*v12++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLRenderCommandEncoderSPI setTileIntersectionFunctionTables:withBufferRange:]( baseObject,  "setTileIntersectionFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15452;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setTileSamplerState:atIndex:](baseObject, "setTileSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16139;
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
  NSUInteger v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16138;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v35 = (float *)a4;
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
  -[MTLRenderCommandEncoderSPI setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v35,  a5,  location,  length);
  uint64_t v20 = v38;
  *(_DWORD *)(v38 + 8) = -16084;
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
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setTileSamplerStates:withRange:]( baseObject,  "setTileSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16085;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setTileTexture:atIndex:](baseObject, "setTileTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16140;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setTileTextures:withRange:]( baseObject,  "setTileTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16086;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setTileVisibleFunctionTable:atBufferIndex:]( baseObject,  "setTileVisibleFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15451;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setTileVisibleFunctionTables:withBufferRange:]( baseObject,  "setTileVisibleFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15450;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTransformFeedbackState:(unint64_t)a3
{
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16264;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15721;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -15812;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
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
  -[MTLRenderCommandEncoderSPI setVertexBuffer:offset:atIndex:]( baseObject,  "setVertexBuffer:offset:atIndex:",  v11,  a4,  a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16278;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = (uint64_t *)[v8 traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setVertexBuffer:offset:attributeStride:atIndex:]( baseObject,  "setVertexBuffer:offset:attributeStride:atIndex:",  v13,  a4,  a5,  a6);

  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15275;
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
  char v19 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16224;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v19;
  *(_DWORD *)(v19 + 8) = -15274;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v36 = a4;
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
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:attributeStrides:withRange:]( baseObject,  "setVertexBuffers:offsets:attributeStrides:withRange:",  (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v36,  a5,  location,  length);
  uint64_t v20 = v39;
  *(_DWORD *)(v39 + 8) = -15273;
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
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
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
  -[MTLRenderCommandEncoderSPI setVertexBuffers:offsets:withRange:]( baseObject,  "setVertexBuffers:offsets:withRange:",  &v31[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  location,  length,  location);
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -16277;
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
  uint64_t v23 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9 = v20;
  *(_DWORD *)(v20 + 8) = -16225;
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
  uint64_t v14 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  uint64_t v11 = v22;
  *(_DWORD *)(v22 + 8) = -15272;
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
  char v16 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setVertexIntersectionFunctionTable:atBufferIndex:]( baseObject,  "setVertexIntersectionFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15448;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    unsigned __int8 v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    unsigned __int8 v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unsigned __int8 v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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
    unsigned __int8 v12 = a3;
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

  -[MTLRenderCommandEncoderSPI setVertexIntersectionFunctionTables:withBufferRange:]( baseObject,  "setVertexIntersectionFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15447;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:atIndex:](baseObject, "setVertexSamplerState:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16274;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    unsigned __int8 v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    unsigned __int8 v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  uint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unsigned __int8 v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
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
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:]( baseObject,  "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:",  v13,  a6,  v14,  v15);

  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16272;
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
  uint64_t v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v19 = a3;
  [v19 touch];
  unsigned __int8 v12 = v19;
  if (v19)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v19);
      unsigned __int8 v12 = v19;
    }
  }

  baseObject = self->_baseObject;
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  -[MTLRenderCommandEncoderSPI setVertexSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:]( baseObject,  "setVertexSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:",  v15,  a7,  v16,  v17,  v18);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
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
      double v17 = (void *)*v14++;
      *v15++ = [v17 baseObject];
      --v16;
    }

    while (v16);
  }

  NSUInteger v18 = location;
  id v19 = (float *)a5;
  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:]( baseObject,  "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:",  (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v35,  a5,  location,  length);
  uint64_t v20 = v38;
  *(_DWORD *)(v38 + 8) = -16271;
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
  uint64_t v25 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setVertexSamplerStates:withRange:]( baseObject,  "setVertexSamplerStates:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16273;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setVertexTexture:atIndex:](baseObject, "setVertexTexture:atIndex:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16276;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setVertexTextures:withRange:]( baseObject,  "setVertexTextures:withRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -16275;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI setVertexVisibleFunctionTable:atBufferIndex:]( baseObject,  "setVertexVisibleFunctionTable:atBufferIndex:",  v9,  a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15446;
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
  double v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
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

  -[MTLRenderCommandEncoderSPI setVertexVisibleFunctionTables:withBufferRange:]( baseObject,  "setVertexVisibleFunctionTables:withBufferRange:",  &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  location,  length);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15445;
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
  unsigned __int8 v21 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setViewport:(id *)a3
{
  baseObject = self->_baseObject;
  __int128 v6 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v6;
  void v18[2] = *(_OWORD *)&a3->var4;
  -[MTLRenderCommandEncoderSPI setViewport:](baseObject, "setViewport:", v18);
  uint64_t v7 = v21;
  *(_DWORD *)(v21 + 8) = -16270;
  unsigned __int8 v8 = v24;
  if (v24 > 8uLL)
  {
    uint64_t v10 = *(void *)(v20 + 24);
    uint64_t v11 = v25++;
    uint64_t v9 = GTTraceMemPool_allocateBytes(v10, v22, v11 | 0x3800000000LL) + 16;
    unsigned __int8 v8 = v11;
  }

  else
  {
    uint64_t v9 = (char *)(v7 + v24);
    v24 += 56;
  }

  *(_BYTE *)(v7 + 13) = v8;
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v12) {
    unint64_t var0 = v12->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)uint64_t v9 = var0;
  __int128 v14 = *(_OWORD *)&a3->var2;
  __int128 v15 = *(_OWORD *)&a3->var4;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)&a3->var0;
  *(_OWORD *)(v9 + 24) = v14;
  *(_OWORD *)(v9 + 40) = v15;
  s();
  *(void *)uint64_t v16 = v17;
  *(_BYTE *)(v16 + 8) = v23;
  *(_BYTE *)(v21 + 15) |= 8u;
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLRenderCommandEncoderSPI setViewportTransformEnabled:](self->_baseObject, "setViewportTransformEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15720;
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
  uint64_t v10 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v7 = v17;
  *(_DWORD *)(v17 + 8) = -16252;
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
  uint64_t v12 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI updateFence:afterStages:](baseObject, "updateFence:afterStages:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16126;
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
  uint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  -[MTLRenderCommandEncoderSPI useHeap:](baseObject, "useHeap:", v7);

  uint64_t v8 = v20;
  *(_DWORD *)(v20 + 8) = -16041;
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
  uint64_t v13 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useHeap:(id)a3 stages:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI useHeap:stages:](baseObject, "useHeap:stages:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -15821;
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
  uint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v27);
  baseObject = self->_baseObject;
  unint64_t v9 = 8 * a4;
  __chkstk_darwin(v7, v10);
  if (a4)
  {
    unsigned __int8 v11 = a3;
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

  -[MTLRenderCommandEncoderSPI useHeaps:count:]( baseObject,  "useHeaps:count:",  &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4);
  uint64_t v15 = v29;
  *(_DWORD *)(v29 + 8) = -16040;
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
  uint64_t v20 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  unint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  if (a4)
  {
    unint64_t v13 = a3;
    uint64_t v14 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v15 = a4;
    do
    {
      unsigned __int8 v16 = (void *)*v13++;
      *v14++ = [v16 baseObject];
      --v15;
    }

    while (v15);
  }

  -[MTLRenderCommandEncoderSPI useHeaps:count:stages:]( baseObject,  "useHeaps:count:stages:",  &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  a5);
  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -15820;
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
  uint64_t v22 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useResidencySet:(id)a3
{
  id v8 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_useResidencySet",  (uint64_t)"Deprecated Residency Set API",  0LL,  0LL);
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
  -[MTLRenderCommandEncoderSPI useResidencySet:](baseObject, "useResidencySet:", v7);
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
      unint64_t v15 = (void *)*a3++;
      *v13++ = [v15 baseObject];
      --v14;
    }

    while (v14);
  }

  -[MTLRenderCommandEncoderSPI useResidencySets:count:](baseObject, "useResidencySets:count:", v12, a4);
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
  -[MTLRenderCommandEncoderSPI useResource:usage:](baseObject, "useResource:usage:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16043;
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
  unint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
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
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLRenderCommandEncoderSPI useResource:usage:stages:](baseObject, "useResource:usage:stages:", v11, a4, a5);

  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15819;
  unsigned __int8 v13 = v27;
  if (v27 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v27);
    v27 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a4;
  *((void *)v14 + 3) = a5;
  s();
  *(void *)uint64_t v21 = v22;
  *(_BYTE *)(v21 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  id v12 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLRenderCommandEncoder_useResourceGroup_usage_stages",  (uint64_t)"Resource groups",  0LL,  0LL);
  [v12 touch];
  id v8 = v12;
  if (v12)
  {
    retainedObjects = self->_retainedObjects;
    if (retainedObjects)
    {
      -[NSMutableSet addObject:](retainedObjects, "addObject:", v12);
      id v8 = v12;
    }
  }

  baseObject = self->_baseObject;
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  -[MTLRenderCommandEncoderSPI useResourceGroup:usage:stages:]( baseObject,  "useResourceGroup:usage:stages:",  v11,  a4,  a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v29);
  baseObject = self->_baseObject;
  unint64_t v11 = 8 * a4;
  __chkstk_darwin(v9, v12);
  if (a4)
  {
    unsigned __int8 v13 = a3;
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

  -[MTLRenderCommandEncoderSPI useResources:count:usage:]( baseObject,  "useResources:count:usage:",  &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  a5);
  uint64_t v17 = v31;
  *(_DWORD *)(v31 + 8) = -16042;
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
  uint64_t v22 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  unint64_t v30 = a6;
  RetainArray(self->_retainedObjects, (id *)a3, a4);
  uint64_t v10 = GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v31);
  baseObject = self->_baseObject;
  unint64_t v12 = 8 * a4;
  __chkstk_darwin(v10, v13);
  if (a4)
  {
    uint64_t v14 = a3;
    unint64_t v15 = &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    unint64_t v16 = a4;
    do
    {
      uint64_t v17 = (void *)*v14++;
      *v15++ = objc_msgSend(v17, "baseObject", v30);
      --v16;
    }

    while (v16);
  }

  unint64_t v18 = v30;
  -[MTLRenderCommandEncoderSPI useResources:count:usage:stages:]( baseObject,  "useResources:count:usage:stages:",  &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8],  a4,  a5,  v30,  v30);
  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -15818;
  unsigned __int8 v20 = v36;
  if (v36 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v32 + 24);
    uint64_t v23 = v37++;
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v34, v23 | 0x2800000000LL) + 16;
    unsigned __int8 v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    v36 += 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  uint64_t v24 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __chkstk_darwin(v24, v25);
  char v27 = StreamArray((uint64_t)v31, &v31[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8], (id *)a3, a4);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = a4;
  *((void *)v21 + 2) = a5;
  *((void *)v21 + 3) = v18;
  v21[32] = v27;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v35;
  *(_BYTE *)(v33 + 15) |= 8u;
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
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
  -[MTLRenderCommandEncoderSPI waitForFence:beforeStages:](baseObject, "waitForFence:beforeStages:", v9, a4);

  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16125;
  unsigned __int8 v11 = v25;
  if (v25 > 0x28uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    unint64_t v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x1800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    unint64_t v12 = (char *)(v10 + v25);
    v25 += 24;
  }

  *(_BYTE *)(v10 + 13) = v11;
  unint64_t v15 = -[CaptureMTLRenderCommandEncoder traceStream](self, "traceStream");
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
  *(void *)unint64_t v12 = var0;
  *((void *)v12 + 1) = v18;
  *((void *)v12 + 2) = a4;
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

- (void).cxx_destruct
{
}

float __94__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset___block_invoke( uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      id v6 = (void *)(v5 + 16);
    }
    else {
      id v6 = 0LL;
    }
    id v7 = v4;
    memcpy(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  }

  id v8 = [*(id *)(a1 + 56) contents];
  uint64_t v9 = *(void *)(a1 + 72);
  if (v9) {
    uint64_t v10 = (_OWORD *)(v9 + 16);
  }
  else {
    uint64_t v10 = 0LL;
  }
  *(void *)&__int128 v11 = *v8;
  *((void *)&v11 + 1) = HIDWORD(*v8);
  LODWORD(result) = *v8;
  _OWORD *v10 = v11;
  return result;
}

void __68__CaptureMTLRenderCommandEncoder_executeCommandsInBuffer_withRange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = GTMTLDecodeIndirectCommandBuffer(v2, *(void **)(a1 + 48));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      id v6 = (void *)(v5 + 16);
    }
    else {
      id v6 = 0LL;
    }
    id v7 = v4;
    memcpy(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  }

@end