@interface GTMTLReplayObjectMap
- (CGRect)contentRect;
- (CGRect)windowRect;
- (Class)layerClass;
- (GTMTLReplayObjectMap)initWithDevice:(id)a3;
- (GTMTLReplayObjectMap)initWithObjectMap:(id)a3;
- (MTLCommandQueue)defaultCommandQueue;
- (MTLDevice)defaultDevice;
- (id)accelerationStructureCommandEncoderForKey:(unint64_t)a3;
- (id)accelerationStructureForKey:(unint64_t)a3;
- (id)accelerationStructurePassDescriptorMap;
- (id)allocationForKey:(unint64_t)a3;
- (id)argumentEncoderForKey:(unint64_t)a3;
- (id)binaryArchiveForKey:(unint64_t)a3;
- (id)blitCommandEncoderForKey:(unint64_t)a3;
- (id)blitPassDescriptorMap;
- (id)bufferForHeapKey:(unint64_t)a3;
- (id)bufferForKey:(unint64_t)a3;
- (id)commandBufferForKey:(unint64_t)a3;
- (id)commandQueueForKey:(unint64_t)a3;
- (id)computeCommandEncoderForKey:(unint64_t)a3;
- (id)computePassDescriptorMap;
- (id)computePipelineDescriptorMap;
- (id)computePipelineStateForKey:(unint64_t)a3;
- (id)counterSampleBufferForKey:(unint64_t)a3;
- (id)depthStencilStateForKey:(unint64_t)a3;
- (id)deviceForKey:(unint64_t)a3;
- (id)drawableForKey:(unint64_t)a3;
- (id)dynamicLibraries;
- (id)dynamicLibraryForKey:(unint64_t)a3;
- (id)encoderForKey:(unint64_t)a3 ofType:(BOOL)a4;
- (id)eventForKey:(unint64_t)a3;
- (id)executeIndirectCommandBufferMap;
- (id)fenceForKey:(unint64_t)a3;
- (id)functionForKey:(unint64_t)a3;
- (id)functionHandleForKey:(unint64_t)a3;
- (id)functionMap;
- (id)functionPointerHandleForKey:(unint64_t)a3;
- (id)functionPrivateArgumentForKey:(unint64_t)a3;
- (id)heapForKey:(unint64_t)a3;
- (id)iOCommandBufferForKey:(unint64_t)a3;
- (id)iOCommandQueueForKey:(unint64_t)a3;
- (id)iOHandleForKey:(unint64_t)a3;
- (id)iOScratchBufferAllocatorForKey:(unint64_t)a3;
- (id)iOScratchBufferForKey:(unint64_t)a3;
- (id)indirectCommandBufferForKey:(unint64_t)a3;
- (id)indirectComputeCommandForKey:(unint64_t)a3;
- (id)indirectRenderCommandForKey:(unint64_t)a3;
- (id)intersectionFunctionTableForKey:(unint64_t)a3;
- (id)iosurfaceForProperties:(id)a3;
- (id)lateEvalEventForKey:(unint64_t)a3;
- (id)layerForKey:(unint64_t)a3;
- (id)libraries;
- (id)libraryForKey:(unint64_t)a3;
- (id)logStateForKey:(unint64_t)a3;
- (id)logStateMap;
- (id)objectPayloadBindingForKey:(unint64_t)a3;
- (id)parallelRenderCommandEncoderForKey:(unint64_t)a3;
- (id)pipelineLibraryForKey:(unint64_t)a3;
- (id)rasterizationRateMapForKey:(unint64_t)a3;
- (id)renderCommandEncoderForKey:(unint64_t)a3;
- (id)renderPassDescriptorMap;
- (id)renderPassDescriptorMapWithMemorylessSubstitutes:(id)a3;
- (id)renderPipelineDescriptorMap;
- (id)renderPipelineStateForKey:(unint64_t)a3;
- (id)residencySetForKey:(unint64_t)a3;
- (id)resourceForKey:(unint64_t)a3;
- (id)resourceGroupSPIForKey:(unint64_t)a3;
- (id)resourceStateCommandEncoderForKey:(unint64_t)a3;
- (id)resourceStatePassDescriptorMap;
- (id)resources;
- (id)restoreIndirectCommandBufferDataMap;
- (id)samplerStateForKey:(unint64_t)a3;
- (id)sharedEventForKey:(unint64_t)a3;
- (id)sharedEventHandleForKey:(unint64_t)a3;
- (id)spatialScalerForKey:(unint64_t)a3;
- (id)temporalScalerForKey:(unint64_t)a3;
- (id)textureForKey:(unint64_t)a3;
- (id)unusedResourceKeys;
- (id)visibleFunctionTableForKey:(unint64_t)a3;
- (id)windowProperties;
- (int64_t)interfaceOrientation;
- (unsigned)globalTraceIdForEncoder:(unint64_t)a3 ofType:(BOOL)a4;
- (void)addEntriesFromObjectMap:(id)a3;
- (void)addUnusedResourceKey:(unint64_t)a3;
- (void)commitCommandBuffers;
- (void)endEncodingForRenderCommandEncoder:(unint64_t)a3;
- (void)presentDrawableWithKey:(unint64_t)a3;
- (void)removeAccelerationStructureCommandEncoderForKey:(unint64_t)a3;
- (void)removeAccelerationStructureForKey:(unint64_t)a3;
- (void)removeAliasableResourceForKey:(id)a3;
- (void)removeArgumentEncoderForKey:(unint64_t)a3;
- (void)removeBlitCommandEncoderForKey:(unint64_t)a3;
- (void)removeBufferForHeapKey:(unint64_t)a3;
- (void)removeBufferForKey:(unint64_t)a3;
- (void)removeCommandBufferForKey:(unint64_t)a3;
- (void)removeCommandQueueForKey:(unint64_t)a3;
- (void)removeComputeCommandEncoderForKey:(unint64_t)a3;
- (void)removeComputePipelineStateForKey:(unint64_t)a3;
- (void)removeCounterSampleBuffer:(unint64_t)a3;
- (void)removeCounterSampleBufferForKey:(unint64_t)a3;
- (void)removeDeadlineProfileForKey:(unint64_t)a3;
- (void)removeDepthStencilStateForKey:(unint64_t)a3;
- (void)removeDeviceForKey:(unint64_t)a3;
- (void)removeDynamicLibraryForKey:(unint64_t)a3;
- (void)removeEventForKey:(unint64_t)a3;
- (void)removeFenceForKey:(unint64_t)a3;
- (void)removeFunctionForKey:(unint64_t)a3;
- (void)removeFunctionHandleForKey:(unint64_t)a3;
- (void)removeFunctionPointerHandleForKey:(unint64_t)a3;
- (void)removeFunctionPrivateArgumentForKey:(unint64_t)a3;
- (void)removeHeapForKey:(unint64_t)a3;
- (void)removeIOCommandBufferForKey:(unint64_t)a3;
- (void)removeIOCommandQueueForKey:(unint64_t)a3;
- (void)removeIOHandleForKey:(unint64_t)a3;
- (void)removeIOScratchBufferAllocatorForKey:(unint64_t)a3;
- (void)removeIOScratchBufferForKey:(unint64_t)a3;
- (void)removeIndirectCommandBufferForKey:(unint64_t)a3;
- (void)removeIndirectComputeCommandForKey:(unint64_t)a3;
- (void)removeIndirectRenderCommandForKey:(unint64_t)a3;
- (void)removeIntersectionFunctionTableForKey:(unint64_t)a3;
- (void)removeLateEvalEventForKey:(unint64_t)a3;
- (void)removeLibraryForKey:(unint64_t)a3;
- (void)removeLogStateForKey:(unint64_t)a3;
- (void)removeMotionEstimationPipelineForKey:(unint64_t)a3;
- (void)removeObjectPayloadBindingForKey:(unint64_t)a3;
- (void)removeParallelRenderCommandEncoderForKey:(unint64_t)a3;
- (void)removePipelineLibraryForKey:(unint64_t)a3;
- (void)removeRasterizationRateMapForKey:(unint64_t)a3;
- (void)removeRenderCommandEncoderForKey:(unint64_t)a3;
- (void)removeRenderPipelineStateForKey:(unint64_t)a3;
- (void)removeResidencySetForKey:(unint64_t)a3;
- (void)removeResourceGroupForKey:(unint64_t)a3;
- (void)removeResourceGroupSPIForKey:(unint64_t)a3;
- (void)removeResourceStateCommandEncoderForKey:(unint64_t)a3;
- (void)removeResourcesForKeys:(id)a3;
- (void)removeSamplerStateForKey:(unint64_t)a3;
- (void)removeSharedEventForKey:(unint64_t)a3;
- (void)removeSpatialScalerForKey:(unint64_t)a3;
- (void)removeTemporalScalerForKey:(unint64_t)a3;
- (void)removeTextureForKey:(unint64_t)a3;
- (void)removeVideoCommandEncoderForKey:(unint64_t)a3;
- (void)removeVisibleFunctionHandleForKey:(unint64_t)a3;
- (void)removeVisibleFunctionTableForKey:(unint64_t)a3;
- (void)setAccelerationStructure:(id)a3 forKey:(unint64_t)a4;
- (void)setAccelerationStructureCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setArgumentEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setBlitCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setBuffer:(id)a3 forHeapKey:(unint64_t)a4;
- (void)setBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setCommandQueue:(id)a3 forKey:(unint64_t)a4;
- (void)setComputeCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setComputePipelineState:(id)a3 forKey:(unint64_t)a4;
- (void)setContentRect:(CGRect)a3 windowRect:(CGRect)a4 properties:(id)a5;
- (void)setCounterSampleBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setDeadlineProfile:(id)a3 forKey:(unint64_t)a4;
- (void)setDebugCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setDefaultCommandQueue:(id)a3;
- (void)setDepthStencilState:(id)a3 forKey:(unint64_t)a4;
- (void)setDevice:(id)a3 forKey:(unint64_t)a4;
- (void)setDrawable:(id)a3 forKey:(unint64_t)a4;
- (void)setDynamicLibrary:(id)a3 forKey:(unint64_t)a4;
- (void)setDynamicLibrary:(id)a3 forPath:(const char *)a4;
- (void)setEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setFence:(id)a3 forKey:(unint64_t)a4;
- (void)setFunction:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionPointerHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionPrivateArgument:(id)a3 forKey:(unint64_t)a4;
- (void)setHeap:(id)a3 forKey:(unint64_t)a4;
- (void)setIOCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIOCommandQueue:(id)a3 forKey:(unint64_t)a4;
- (void)setIOScratchBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIOScratchBufferAllocator:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectComputeCommand:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectRenderCommand:(id)a3 forKey:(unint64_t)a4;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setIntersectionFunctionTable:(id)a3 forKey:(unint64_t)a4;
- (void)setLateEvalEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setLayer:(id)a3 forKey:(unint64_t)a4;
- (void)setLayerClass:(Class)a3;
- (void)setLibrary:(id)a3 forKey:(unint64_t)a4;
- (void)setLogState:(id)a3 forKey:(unint64_t)a4;
- (void)setObjectPayloadBinding:(id)a3 forKey:(unint64_t)a4;
- (void)setParallelRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setPipelineLibrarySPI:(id)a3 forKey:(unint64_t)a4;
- (void)setRasterizationRateMap:(id)a3 forKey:(unint64_t)a4;
- (void)setRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3 forKey:(unint64_t)a4;
- (void)setResidencySet:(id)a3 forKey:(unint64_t)a4;
- (void)setResourceGroupSPI:(id)a3 forKey:(unint64_t)a4;
- (void)setResourceStateCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setSamplerState:(id)a3 forKey:(unint64_t)a4;
- (void)setSharedEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setSharedEventHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setTexture:(id)a3 forKey:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 forKey:(unint64_t)a4;
@end

@implementation GTMTLReplayObjectMap

- (GTMTLReplayObjectMap)initWithDevice:(id)a3
{
  id v5 = a3;
  v100.receiver = self;
  v100.super_class = (Class)&OBJC_CLASS___GTMTLReplayObjectMap;
  v6 = -[GTMTLReplayObjectMap init](&v100, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultDevice, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    argumentEncoders = v7->_argumentEncoders;
    v7->_argumentEncoders = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    commandBuffers = v7->_commandBuffers;
    v7->_commandBuffers = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    commandEncoders = v7->_commandEncoders;
    v7->_commandEncoders = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ioCommandQueues = v7->_ioCommandQueues;
    v7->_ioCommandQueues = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ioCommandBuffers = v7->_ioCommandBuffers;
    v7->_ioCommandBuffers = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ioHandles = v7->_ioHandles;
    v7->_ioHandles = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ioScratchBuffers = v7->_ioScratchBuffers;
    v7->_ioScratchBuffers = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    ioScratchBufferAllocators = v7->_ioScratchBufferAllocators;
    v7->_ioScratchBufferAllocators = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    commandQueues = v7->_commandQueues;
    v7->_commandQueues = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    computePipelineStates = v7->_computePipelineStates;
    v7->_computePipelineStates = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    counterSampleBuffers = v7->_counterSampleBuffers;
    v7->_counterSampleBuffers = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    depthStencilStates = v7->_depthStencilStates;
    v7->_depthStencilStates = v30;

    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    devices = v7->_devices;
    v7->_devices = v32;

    v34 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    drawables = v7->_drawables;
    v7->_drawables = v34;

    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    events = v7->_events;
    v7->_events = v36;

    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    fences = v7->_fences;
    v7->_fences = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    functions = v7->_functions;
    v7->_functions = v40;

    v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    heaps = v7->_heaps;
    v7->_heaps = v42;

    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    indirectComputeCommands = v7->_indirectComputeCommands;
    v7->_indirectComputeCommands = v44;

    v46 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    indirectRenderCommands = v7->_indirectRenderCommands;
    v7->_indirectRenderCommands = v46;

    v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    iosurfaces = v7->_iosurfaces;
    v7->_iosurfaces = v48;

    v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    layers = v7->_layers;
    v7->_layers = v50;

    v52 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    libraries = v7->_libraries;
    v7->_libraries = v52;

    v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dynamicLibraries = v7->_dynamicLibraries;
    v7->_dynamicLibraries = v54;

    v56 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    motionEstimationPipelines = v7->_motionEstimationPipelines;
    v7->_motionEstimationPipelines = v56;

    v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    parallelRenderCommandEncoders = v7->_parallelRenderCommandEncoders;
    v7->_parallelRenderCommandEncoders = v58;

    v60 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objectPayloadBinding = v7->_objectPayloadBinding;
    v7->_objectPayloadBinding = v60;

    v62 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pipelineLibraries = v7->_pipelineLibraries;
    v7->_pipelineLibraries = v62;

    v64 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    rasterizationRateMaps = v7->_rasterizationRateMaps;
    v7->_rasterizationRateMaps = v64;

    v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    renderPipelineStates = v7->_renderPipelineStates;
    v7->_renderPipelineStates = v66;

    v68 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    residencySets = v7->_residencySets;
    v7->_residencySets = v68;

    v70 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    resourceGroups = v7->_resourceGroups;
    v7->_resourceGroups = v70;

    v72 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    resources = v7->_resources;
    v7->_resources = v72;

    v74 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    samplerStates = v7->_samplerStates;
    v7->_samplerStates = v74;

    v76 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    sharedEventHandles = v7->_sharedEventHandles;
    v7->_sharedEventHandles = v76;

    v78 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    functionHandles = v7->_functionHandles;
    v7->_functionHandles = v78;

    v80 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    functionPointerHandles = v7->_functionPointerHandles;
    v7->_functionPointerHandles = v80;

    v82 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    functionPrivateArguments = v7->_functionPrivateArguments;
    v7->_functionPrivateArguments = v82;

    v84 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    deadlineProfiles = v7->_deadlineProfiles;
    v7->_deadlineProfiles = v84;

    v86 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    spatialScalers = v7->_spatialScalers;
    v7->_spatialScalers = v86;

    v88 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    temporalScalers = v7->_temporalScalers;
    v7->_temporalScalers = v88;

    v90 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    logStates = v7->_logStates;
    v7->_logStates = v90;

    v92 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mpsExternalPluginBases = v7->_mpsExternalPluginBases;
    v7->_mpsExternalPluginBases = v92;

    v7->_layerClass = (Class)objc_opt_class(&OBJC_CLASS___DYMetalLayer, v94);
    v95 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    unusedResources = v7->_unusedResources;
    v7->_unusedResources = v95;

    v97 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bufferForHeap = v7->_bufferForHeap;
    v7->_bufferForHeap = v97;
  }

  return v7;
}

- (GTMTLReplayObjectMap)initWithObjectMap:(id)a3
{
  id v4 = a3;
  v137.receiver = self;
  v137.super_class = (Class)&OBJC_CLASS___GTMTLReplayObjectMap;
  id v5 = -[GTMTLReplayObjectMap init](&v137, "init");

  if (v5)
  {
    objc_storeStrong((id *)&v5->_defaultDevice, *((id *)v4 + 58));
    objc_storeStrong((id *)&v5->_defaultCommandQueue, *((id *)v4 + 59));
    if ([*((id *)v4 + 1) count])
    {
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 1) allKeys]);
      argumentEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  argumentEncoders));
      objc_storeStrong((id *)&v5->_argumentEncoders, v8);
    }

    else
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      argumentEncoders = v5->_argumentEncoders;
      v5->_argumentEncoders = v6;
    }

    if ([*((id *)v4 + 2) count])
    {
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 2) allKeys]);
      commandBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  commandBuffers));
      objc_storeStrong((id *)&v5->_commandBuffers, v11);
    }

    else
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      commandBuffers = v5->_commandBuffers;
      v5->_commandBuffers = v9;
    }

    if ([*((id *)v4 + 3) count])
    {
      v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 3) allKeys]);
      commandEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  commandEncoders));
      objc_storeStrong((id *)&v5->_commandEncoders, v14);
    }

    else
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      commandEncoders = v5->_commandEncoders;
      v5->_commandEncoders = v12;
    }

    if ([*((id *)v4 + 4) count])
    {
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 4) allKeys]);
      commandQueues = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v15));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  commandQueues));
      objc_storeStrong((id *)&v5->_commandQueues, v17);
    }

    else
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      commandQueues = v5->_commandQueues;
      v5->_commandQueues = v15;
    }

    if ([*((id *)v4 + 5) count])
    {
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 5) allKeys]);
      ioCommandBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  ioCommandBuffers));
      objc_storeStrong((id *)&v5->_ioCommandBuffers, v20);
    }

    else
    {
      v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      ioCommandBuffers = v5->_ioCommandBuffers;
      v5->_ioCommandBuffers = v18;
    }

    if ([*((id *)v4 + 7) count])
    {
      v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 7) allKeys]);
      ioScratchBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v21));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  ioScratchBuffers));
      objc_storeStrong((id *)&v5->_ioScratchBuffers, v23);
    }

    else
    {
      v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      ioScratchBuffers = v5->_ioScratchBuffers;
      v5->_ioScratchBuffers = v21;
    }

    if ([*((id *)v4 + 8) count])
    {
      v24 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 8) allKeys]);
      ioScratchBufferAllocators = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  ioScratchBufferAllocators));
      objc_storeStrong((id *)&v5->_ioScratchBufferAllocators, v26);
    }

    else
    {
      v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      ioScratchBufferAllocators = v5->_ioScratchBufferAllocators;
      v5->_ioScratchBufferAllocators = v24;
    }

    if ([*((id *)v4 + 6) count])
    {
      v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 6) allKeys]);
      ioHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  ioHandles));
      objc_storeStrong((id *)&v5->_ioHandles, v29);
    }

    else
    {
      v27 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      ioHandles = v5->_ioHandles;
      v5->_ioHandles = v27;
    }

    if ([*((id *)v4 + 9) count])
    {
      v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 9) allKeys]);
      ioCommandQueues = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v30));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  ioCommandQueues));
      objc_storeStrong((id *)&v5->_ioCommandQueues, v32);
    }

    else
    {
      v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      ioCommandQueues = v5->_ioCommandQueues;
      v5->_ioCommandQueues = v30;
    }

    if ([*((id *)v4 + 10) count])
    {
      v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 10) allKeys]);
      computePipelineStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  computePipelineStates));
      objc_storeStrong((id *)&v5->_computePipelineStates, v35);
    }

    else
    {
      v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      computePipelineStates = v5->_computePipelineStates;
      v5->_computePipelineStates = v33;
    }

    if ([*((id *)v4 + 11) count])
    {
      v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 11) allKeys]);
      counterSampleBuffers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v36));
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  counterSampleBuffers));
      objc_storeStrong((id *)&v5->_counterSampleBuffers, v38);
    }

    else
    {
      v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      counterSampleBuffers = v5->_counterSampleBuffers;
      v5->_counterSampleBuffers = v36;
    }

    if ([*((id *)v4 + 12) count])
    {
      v39 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 12) allKeys]);
      depthStencilStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v39));
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  depthStencilStates));
      objc_storeStrong((id *)&v5->_depthStencilStates, v41);
    }

    else
    {
      v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      depthStencilStates = v5->_depthStencilStates;
      v5->_depthStencilStates = v39;
    }

    if ([*((id *)v4 + 13) count])
    {
      v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 13) allKeys]);
      devices = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v42));
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  devices));
      objc_storeStrong((id *)&v5->_devices, v44);
    }

    else
    {
      v42 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      devices = v5->_devices;
      v5->_devices = v42;
    }

    if ([*((id *)v4 + 14) count])
    {
      v45 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 14) allKeys]);
      drawables = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v45));
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  drawables));
      objc_storeStrong((id *)&v5->_drawables, v47);
    }

    else
    {
      v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      drawables = v5->_drawables;
      v5->_drawables = v45;
    }

    if ([*((id *)v4 + 15) count])
    {
      v48 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 15) allKeys]);
      events = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v48));
      v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  events));
      objc_storeStrong((id *)&v5->_events, v50);
    }

    else
    {
      v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      events = v5->_events;
      v5->_events = v48;
    }

    if ([*((id *)v4 + 16) count])
    {
      v51 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 16) allKeys]);
      fences = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v51));
      v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  fences));
      objc_storeStrong((id *)&v5->_fences, v53);
    }

    else
    {
      v51 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      fences = v5->_fences;
      v5->_fences = v51;
    }

    if ([*((id *)v4 + 17) count])
    {
      v54 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 17) allKeys]);
      functions = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v54));
      v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  functions));
      objc_storeStrong((id *)&v5->_functions, v56);
    }

    else
    {
      v54 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      functions = v5->_functions;
      v5->_functions = v54;
    }

    if ([*((id *)v4 + 18) count])
    {
      v57 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 18) allKeys]);
      heaps = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v57));
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  heaps));
      objc_storeStrong((id *)&v5->_heaps, v59);
    }

    else
    {
      v57 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      heaps = v5->_heaps;
      v5->_heaps = v57;
    }

    if ([*((id *)v4 + 19) count])
    {
      v60 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 19) allKeys]);
      indirectComputeCommands = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v60));
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  indirectComputeCommands));
      objc_storeStrong((id *)&v5->_indirectComputeCommands, v62);
    }

    else
    {
      v60 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      indirectComputeCommands = v5->_indirectComputeCommands;
      v5->_indirectComputeCommands = v60;
    }

    if ([*((id *)v4 + 20) count])
    {
      v63 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 20) allKeys]);
      indirectRenderCommands = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v63));
      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  indirectRenderCommands));
      objc_storeStrong((id *)&v5->_indirectRenderCommands, v65);
    }

    else
    {
      v63 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      indirectRenderCommands = v5->_indirectRenderCommands;
      v5->_indirectRenderCommands = v63;
    }

    if ([*((id *)v4 + 21) count])
    {
      v66 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 21) allKeys]);
      iosurfaces = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v66));
      v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  iosurfaces));
      objc_storeStrong((id *)&v5->_iosurfaces, v68);
    }

    else
    {
      v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      iosurfaces = v5->_iosurfaces;
      v5->_iosurfaces = v66;
    }

    if ([*((id *)v4 + 22) count])
    {
      v69 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 22) allKeys]);
      layers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v69));
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  layers));
      objc_storeStrong((id *)&v5->_layers, v71);
    }

    else
    {
      v69 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      layers = v5->_layers;
      v5->_layers = v69;
    }

    if ([*((id *)v4 + 23) count])
    {
      v72 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 23) allKeys]);
      libraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v72));
      v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  libraries));
      objc_storeStrong((id *)&v5->_libraries, v74);
    }

    else
    {
      v72 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      libraries = v5->_libraries;
      v5->_libraries = v72;
    }

    if ([*((id *)v4 + 24) count])
    {
      v75 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 24) allKeys]);
      dynamicLibraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v75));
      v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  dynamicLibraries));
      objc_storeStrong((id *)&v5->_dynamicLibraries, v77);
    }

    else
    {
      v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      dynamicLibraries = v5->_dynamicLibraries;
      v5->_dynamicLibraries = v75;
    }

    if ([*((id *)v4 + 25) count])
    {
      v78 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 25) allKeys]);
      motionEstimationPipelines = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v78));
      v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  motionEstimationPipelines));
      objc_storeStrong((id *)&v5->_motionEstimationPipelines, v80);
    }

    else
    {
      v78 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      motionEstimationPipelines = v5->_motionEstimationPipelines;
      v5->_motionEstimationPipelines = v78;
    }

    if ([*((id *)v4 + 26) count])
    {
      v81 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 26) allKeys]);
      parallelRenderCommandEncoders = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v81));
      v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  parallelRenderCommandEncoders));
      objc_storeStrong((id *)&v5->_parallelRenderCommandEncoders, v83);
    }

    else
    {
      v81 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      parallelRenderCommandEncoders = v5->_parallelRenderCommandEncoders;
      v5->_parallelRenderCommandEncoders = v81;
    }

    if ([*((id *)v4 + 27) count])
    {
      v84 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 27) allKeys]);
      objectPayloadBinding = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v84));
      v86 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  objectPayloadBinding));
      objc_storeStrong((id *)&v5->_objectPayloadBinding, v86);
    }

    else
    {
      v84 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      objectPayloadBinding = v5->_objectPayloadBinding;
      v5->_objectPayloadBinding = v84;
    }

    if ([*((id *)v4 + 28) count])
    {
      v87 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 28) allKeys]);
      pipelineLibraries = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v87));
      v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  pipelineLibraries));
      objc_storeStrong((id *)&v5->_pipelineLibraries, v89);
    }

    else
    {
      v87 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      pipelineLibraries = v5->_pipelineLibraries;
      v5->_pipelineLibraries = v87;
    }

    if ([*((id *)v4 + 29) count])
    {
      v90 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 29) allKeys]);
      rasterizationRateMaps = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v90));
      v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  rasterizationRateMaps));
      objc_storeStrong((id *)&v5->_rasterizationRateMaps, v92);
    }

    else
    {
      v90 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      rasterizationRateMaps = v5->_rasterizationRateMaps;
      v5->_rasterizationRateMaps = v90;
    }

    if ([*((id *)v4 + 30) count])
    {
      v93 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 30) allKeys]);
      renderPipelineStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v93));
      v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  renderPipelineStates));
      objc_storeStrong((id *)&v5->_renderPipelineStates, v95);
    }

    else
    {
      v93 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      renderPipelineStates = v5->_renderPipelineStates;
      v5->_renderPipelineStates = v93;
    }

    if ([*((id *)v4 + 31) count])
    {
      v96 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 31) allKeys]);
      residencySets = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v96));
      v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  residencySets));
      objc_storeStrong((id *)&v5->_residencySets, v98);
    }

    else
    {
      v96 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      residencySets = v5->_residencySets;
      v5->_residencySets = v96;
    }

    if ([*((id *)v4 + 32) count])
    {
      v99 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 32) allKeys]);
      resourceGroups = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v99));
      v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  resourceGroups));
      objc_storeStrong((id *)&v5->_resourceGroups, v101);
    }

    else
    {
      v99 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      resourceGroups = v5->_resourceGroups;
      v5->_resourceGroups = v99;
    }

    if ([*((id *)v4 + 33) count])
    {
      v102 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 33) allKeys]);
      resources = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v102));
      v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  resources));
      objc_storeStrong((id *)&v5->_resources, v104);
    }

    else
    {
      v102 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      resources = v5->_resources;
      v5->_resources = v102;
    }

    if ([*((id *)v4 + 35) count])
    {
      v105 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 35) allKeys]);
      samplerStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v105));
      v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  samplerStates));
      objc_storeStrong((id *)&v5->_samplerStates, v107);
    }

    else
    {
      v105 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      samplerStates = v5->_samplerStates;
      v5->_samplerStates = v105;
    }

    if ([*((id *)v4 + 36) count])
    {
      v108 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 36) allKeys]);
      sharedEventHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v108));
      v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  sharedEventHandles));
      objc_storeStrong((id *)&v5->_sharedEventHandles, v110);
    }

    else
    {
      v108 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      sharedEventHandles = v5->_sharedEventHandles;
      v5->_sharedEventHandles = v108;
    }

    if ([*((id *)v4 + 37) count])
    {
      v111 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 37) allKeys]);
      functionHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v111));
      v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  functionHandles));
      objc_storeStrong((id *)&v5->_functionHandles, v113);
    }

    else
    {
      v111 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      functionHandles = v5->_functionHandles;
      v5->_functionHandles = v111;
    }

    if ([*((id *)v4 + 39) count])
    {
      v114 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 39) allKeys]);
      functionPointerHandles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v114));
      v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  functionPointerHandles));
      objc_storeStrong((id *)&v5->_functionPointerHandles, v116);
    }

    else
    {
      v114 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      functionPointerHandles = v5->_functionPointerHandles;
      v5->_functionPointerHandles = v114;
    }

    if ([*((id *)v4 + 40) count])
    {
      v117 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 40) allKeys]);
      functionPrivateArguments = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v117));
      v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  functionPrivateArguments));
      objc_storeStrong((id *)&v5->_functionPrivateArguments, v119);
    }

    else
    {
      v117 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      functionPrivateArguments = v5->_functionPrivateArguments;
      v5->_functionPrivateArguments = v117;
    }

    if ([*((id *)v4 + 41) count])
    {
      v120 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 41) allKeys]);
      mpsExternalPluginBases = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v120));
      v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  mpsExternalPluginBases));
      objc_storeStrong((id *)&v5->_mpsExternalPluginBases, v122);
    }

    else
    {
      v120 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      mpsExternalPluginBases = v5->_mpsExternalPluginBases;
      v5->_mpsExternalPluginBases = v120;
    }

    if ([*((id *)v4 + 42) count])
    {
      v123 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 42) allKeys]);
      deadlineProfiles = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v123));
      v125 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  deadlineProfiles));
      objc_storeStrong((id *)&v5->_deadlineProfiles, v125);
    }

    else
    {
      v123 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      deadlineProfiles = v5->_deadlineProfiles;
      v5->_deadlineProfiles = v123;
    }

    if ([*((id *)v4 + 43) count])
    {
      v126 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 43) allKeys]);
      spatialScalers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v126));
      v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  spatialScalers));
      objc_storeStrong((id *)&v5->_spatialScalers, v128);
    }

    else
    {
      v126 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      spatialScalers = v5->_spatialScalers;
      v5->_spatialScalers = v126;
    }

    if ([*((id *)v4 + 44) count])
    {
      v129 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 44) allKeys]);
      temporalScalers = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v129));
      v131 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  temporalScalers));
      objc_storeStrong((id *)&v5->_temporalScalers, v131);
    }

    else
    {
      v129 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      temporalScalers = v5->_temporalScalers;
      v5->_temporalScalers = v129;
    }

    if ([*((id *)v4 + 45) count])
    {
      v132 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([*((id *)v4 + 45) allKeys]);
      logStates = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary sharedKeySetForKeys:]( &OBJC_CLASS___NSDictionary,  "sharedKeySetForKeys:",  v132));
      v134 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithSharedKeySet:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithSharedKeySet:",  logStates));
      objc_storeStrong((id *)&v5->_logStates, v134);
    }

    else
    {
      v132 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      logStates = v5->_logStates;
      v5->_logStates = v132;
    }

    v5->_layerClass = (Class)*((void *)v4 + 47);
    -[GTMTLReplayObjectMap addEntriesFromObjectMap:](v5, "addEntriesFromObjectMap:", v4);
  }

  v135 = v5;

  return v135;
}

- (void)addEntriesFromObjectMap:(id)a3
{
  argumentEncoders = self->_argumentEncoders;
  uint64_t v5 = *((void *)a3 + 1);
  v6 = a3;
  -[NSMutableDictionary addEntriesFromDictionary:](argumentEncoders, "addEntriesFromDictionary:", v5);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandBuffers, "addEntriesFromDictionary:", v6[2]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandEncoders, "addEntriesFromDictionary:", v6[3]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_commandQueues, "addEntriesFromDictionary:", v6[4]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioCommandQueues, "addEntriesFromDictionary:", v6[9]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioCommandBuffers, "addEntriesFromDictionary:", v6[5]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioScratchBuffers, "addEntriesFromDictionary:", v6[7]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioScratchBufferAllocators, "addEntriesFromDictionary:", v6[8]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_ioHandles, "addEntriesFromDictionary:", v6[6]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_computePipelineStates, "addEntriesFromDictionary:", v6[10]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_counterSampleBuffers, "addEntriesFromDictionary:", v6[11]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_depthStencilStates, "addEntriesFromDictionary:", v6[12]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_devices, "addEntriesFromDictionary:", v6[13]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_drawables, "addEntriesFromDictionary:", v6[14]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_events, "addEntriesFromDictionary:", v6[15]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_fences, "addEntriesFromDictionary:", v6[16]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functions, "addEntriesFromDictionary:", v6[17]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_heaps, "addEntriesFromDictionary:", v6[18]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_indirectComputeCommands, "addEntriesFromDictionary:", v6[19]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_indirectRenderCommands, "addEntriesFromDictionary:", v6[20]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_iosurfaces, "addEntriesFromDictionary:", v6[21]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_layers, "addEntriesFromDictionary:", v6[22]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_libraries, "addEntriesFromDictionary:", v6[23]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_dynamicLibraries, "addEntriesFromDictionary:", v6[24]);
  -[NSMutableDictionary addEntriesFromDictionary:]( self->_motionEstimationPipelines,  "addEntriesFromDictionary:",  v6[25]);
  -[NSMutableDictionary addEntriesFromDictionary:]( self->_parallelRenderCommandEncoders,  "addEntriesFromDictionary:",  v6[26]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_objectPayloadBinding, "addEntriesFromDictionary:", v6[27]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_pipelineLibraries, "addEntriesFromDictionary:", v6[28]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_rasterizationRateMaps, "addEntriesFromDictionary:", v6[29]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_renderPipelineStates, "addEntriesFromDictionary:", v6[30]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_residencySets, "addEntriesFromDictionary:", v6[31]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_resourceGroups, "addEntriesFromDictionary:", v6[33]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_resources, "addEntriesFromDictionary:", v6[33]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_samplerStates, "addEntriesFromDictionary:", v6[35]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_sharedEventHandles, "addEntriesFromDictionary:", v6[36]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionHandles, "addEntriesFromDictionary:", v6[37]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionPointerHandles, "addEntriesFromDictionary:", v6[39]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_functionPrivateArguments, "addEntriesFromDictionary:", v6[40]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_deadlineProfiles, "addEntriesFromDictionary:", v6[42]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_mpsExternalPluginBases, "addEntriesFromDictionary:", v6[41]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_spatialScalers, "addEntriesFromDictionary:", v6[43]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_temporalScalers, "addEntriesFromDictionary:", v6[44]);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_logStates, "addEntriesFromDictionary:", v6[45]);
  unusedResources = self->_unusedResources;
  uint64_t v8 = v6[46];

  -[NSMutableSet unionSet:](unusedResources, "unionSet:", v8);
}

- (void)removeResourcesForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectsForKeys:notFoundMarker:]( self->_resources,  "objectsForKeys:notFoundMarker:",  v4,  v6,  0LL));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v11);
        if (v12 != v6) {
          MakeRootResourceAliasable(v12);
        }
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_argumentEncoders, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_commandQueues, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_ioCommandQueues, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_computePipelineStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_counterSampleBuffers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_depthStencilStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_drawables, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_events, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_fences, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functions, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_heaps, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_indirectComputeCommands, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_indirectRenderCommands, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_iosurfaces, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_layers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_libraries, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_dynamicLibraries, "removeObjectForKey:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_motionEstimationPipelines, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_objectPayloadBinding, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_pipelineLibraries, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_rasterizationRateMaps, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_renderPipelineStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_residencySets, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_resourceGroups, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_resources, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_samplerStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionHandles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionPointerHandles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_functionPrivateArguments, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_deadlineProfiles, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_spatialScalers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_temporalScalers, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_logStates, "removeObjectsForKeys:", v4);
  -[NSMutableDictionary removeObjectsForKeys:](self->_mpsExternalPluginBases, "removeObjectsForKeys:", v4);

  objc_autoreleasePoolPop(v5);
}

- (Class)layerClass
{
  return self->_layerClass;
}

- (void)setLayerClass:(Class)a3
{
  if (self->_layerClass != a3)
  {
    uint64_t v5 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](self->_layers, "count"));
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    obj = self->_layers;
    id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_layers,  "objectForKeyedSubscript:",  v10));
          id v12 = objc_alloc_init(a3);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 device]);
          [v12 setDevice:v13];

          objc_msgSend(v12, "setColorspace:", objc_msgSend(v11, "colorspace"));
          objc_msgSend(v12, "setPixelFormat:", objc_msgSend(v11, "pixelFormat"));
          objc_msgSend(v12, "setFramebufferOnly:", objc_msgSend(v11, "framebufferOnly"));
          [v11 drawableSize];
          objc_msgSend(v12, "setDrawableSize:");
          [v11 bounds];
          objc_msgSend(v12, "setBounds:");
          [v11 contentsScale];
          objc_msgSend(v12, "setContentsScale:");
          if (v11)
          {
            [v11 transform];
          }

          else
          {
            __int128 v23 = 0u;
            __int128 v24 = 0u;
            __int128 v21 = 0u;
            __int128 v22 = 0u;
            __int128 v19 = 0u;
            __int128 v20 = 0u;
            __int128 v17 = 0u;
            __int128 v18 = 0u;
          }

          v16[4] = v21;
          v16[5] = v22;
          v16[6] = v23;
          v16[7] = v24;
          v16[0] = v17;
          v16[1] = v18;
          v16[2] = v19;
          v16[3] = v20;
          [v12 setTransform:v16];
          [v11 anchorPoint];
          objc_msgSend(v12, "setAnchorPoint:");
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v10);
        }

        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      }

      while (v7);
    }

    layers = self->_layers;
    self->_layers = v5;

    self->_layerClass = a3;
  }

- (void)setArgumentEncoder:(id)a3 forKey:(unint64_t)a4
{
  argumentEncoders = self->_argumentEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](argumentEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setBlitCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setBuffer:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setBuffer:(id)a3 forHeapKey:(unint64_t)a4
{
  bufferForHeap = self->_bufferForHeap;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](bufferForHeap, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  commandBuffers = self->_commandBuffers;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandBuffers, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  commandQueues = self->_commandQueues;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandQueues, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIOCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  ioCommandQueues = self->_ioCommandQueues;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioCommandQueues, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIOCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioCommandBuffers, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIOScratchBuffer:(id)a3 forKey:(unint64_t)a4
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioScratchBuffers, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIOScratchBufferAllocator:(id)a3 forKey:(unint64_t)a4
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](ioScratchBufferAllocators, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setComputeCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setComputePipelineState:(id)a3 forKey:(unint64_t)a4
{
  computePipelineStates = self->_computePipelineStates;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](computePipelineStates, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setCounterSampleBuffer:(id)a3 forKey:(unint64_t)a4
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](counterSampleBuffers, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDebugCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDepthStencilState:(id)a3 forKey:(unint64_t)a4
{
  depthStencilStates = self->_depthStencilStates;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](depthStencilStates, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDevice:(id)a3 forKey:(unint64_t)a4
{
  devices = self->_devices;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDrawable:(id)a3 forKey:(unint64_t)a4
{
  drawables = self->_drawables;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](drawables, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setFence:(id)a3 forKey:(unint64_t)a4
{
  fences = self->_fences;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](fences, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setFunction:(id)a3 forKey:(unint64_t)a4
{
  functions = self->_functions;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functions, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setHeap:(id)a3 forKey:(unint64_t)a4
{
  heaps = self->_heaps;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](heaps, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIndirectCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIndirectComputeCommand:(id)a3 forKey:(unint64_t)a4
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](indirectComputeCommands, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIndirectRenderCommand:(id)a3 forKey:(unint64_t)a4
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](indirectRenderCommands, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setLayer:(id)a3 forKey:(unint64_t)a4
{
  layers = self->_layers;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](layers, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setLibrary:(id)a3 forKey:(unint64_t)a4
{
  libraries = self->_libraries;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](libraries, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setParallelRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( parallelRenderCommandEncoders,  "setObject:forKeyedSubscript:",  v6,  v7);
}

- (void)setObjectPayloadBinding:(id)a3 forKey:(unint64_t)a4
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](objectPayloadBinding, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setPipelineLibrarySPI:(id)a3 forKey:(unint64_t)a4
{
  pipelineLibraries = self->_pipelineLibraries;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](pipelineLibraries, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setRasterizationRateMap:(id)a3 forKey:(unint64_t)a4
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](rasterizationRateMaps, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setRenderPipelineState:(id)a3 forKey:(unint64_t)a4
{
  renderPipelineStates = self->_renderPipelineStates;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](renderPipelineStates, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setResourceStateCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setSamplerState:(id)a3 forKey:(unint64_t)a4
{
  samplerStates = self->_samplerStates;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](samplerStates, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setSharedEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setSharedEventHandle:(id)a3 forKey:(unint64_t)a4
{
  sharedEventHandles = self->_sharedEventHandles;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](sharedEventHandles, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setTexture:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDynamicLibrary:(id)a3 forKey:(unint64_t)a4
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](dynamicLibraries, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDynamicLibrary:(id)a3 forPath:(const char *)a4
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](dynamicLibraries, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setVisibleFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setFunctionHandle:(id)a3 forKey:(unint64_t)a4
{
  functionHandles = self->_functionHandles;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionHandles, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setAccelerationStructureCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](commandEncoders, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setAccelerationStructure:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setIntersectionFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resources, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setResidencySet:(id)a3 forKey:(unint64_t)a4
{
  residencySets = self->_residencySets;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](residencySets, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setResourceGroupSPI:(id)a3 forKey:(unint64_t)a4
{
  resourceGroups = self->_resourceGroups;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](resourceGroups, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setLateEvalEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](events, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setFunctionPointerHandle:(id)a3 forKey:(unint64_t)a4
{
  functionPointerHandles = self->_functionPointerHandles;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionPointerHandles, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setFunctionPrivateArgument:(id)a3 forKey:(unint64_t)a4
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](functionPrivateArguments, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setDeadlineProfile:(id)a3 forKey:(unint64_t)a4
{
  deadlineProfiles = self->_deadlineProfiles;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](deadlineProfiles, "setObject:forKeyedSubscript:", v6, v7);
}

- (void)setLogState:(id)a3 forKey:(unint64_t)a4
{
  logStates = self->_logStates;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](logStates, "setObject:forKeyedSubscript:", v6, v7);
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)windowRect
{
  double x = self->_windowRect.origin.x;
  double y = self->_windowRect.origin.y;
  double width = self->_windowRect.size.width;
  double height = self->_windowRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)windowProperties
{
  return self->_windowProperties;
}

- (int64_t)interfaceOrientation
{
  return self->_orientation;
}

- (void)setContentRect:(CGRect)a3 windowRect:(CGRect)a4 properties:(id)a5
{
  self->_contentRect = a3;
  self->_windowRect = a4;
  objc_storeStrong((id *)&self->_windowProperties, a5);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (id)accelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)argumentEncoderForKey:(unint64_t)a3
{
  argumentEncoders = self->_argumentEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](argumentEncoders, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)blitCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)bufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)commandBufferForKey:(unint64_t)a3
{
  commandBuffers = self->_commandBuffers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOCommandBufferForKey:(unint64_t)a3
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioCommandBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOHandleForKey:(unint64_t)a3
{
  ioHandles = self->_ioHandles;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioHandles, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOScratchBufferForKey:(unint64_t)a3
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioScratchBuffers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)iOScratchBufferAllocatorForKey:(unint64_t)a3
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( ioScratchBufferAllocators,  "objectForKeyedSubscript:",  v4));

  return v5;
}

- (id)iOCommandQueueForKey:(unint64_t)a3
{
  ioCommandQueues = self->_ioCommandQueues;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](ioCommandQueues, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)commandQueueForKey:(unint64_t)a3
{
  commandQueues = self->_commandQueues;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandQueues, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)computeCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)computePipelineStateForKey:(unint64_t)a3
{
  computePipelineStates = self->_computePipelineStates;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](computePipelineStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)counterSampleBufferForKey:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](counterSampleBuffers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)depthStencilStateForKey:(unint64_t)a3
{
  depthStencilStates = self->_depthStencilStates;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](depthStencilStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)deviceForKey:(unint64_t)a3
{
  return self->_defaultDevice;
}

- (id)drawableForKey:(unint64_t)a3
{
  drawables = self->_drawables;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](drawables, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)eventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)fenceForKey:(unint64_t)a3
{
  fences = self->_fences;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](fences, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)functionForKey:(unint64_t)a3
{
  functions = self->_functions;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functions, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)heapForKey:(unint64_t)a3
{
  heaps = self->_heaps;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](heaps, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)indirectCommandBufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v4));

  else {
    id v6 = 0LL;
  }
  id v7 = v6;

  return v7;
}

- (id)indirectComputeCommandForKey:(unint64_t)a3
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( indirectComputeCommands,  "objectForKeyedSubscript:",  v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)indirectRenderCommandForKey:(unint64_t)a3
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](indirectRenderCommands, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)iosurfaceForProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (IOSurface *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_iosurfaces, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    uint64_t v5 = -[IOSurface initWithProperties:](objc_alloc(&OBJC_CLASS___IOSurface), "initWithProperties:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iosurfaces, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)layerForKey:(unint64_t)a3
{
  layers = self->_layers;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](layers, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)libraryForKey:(unint64_t)a3
{
  libraries = self->_libraries;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](libraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)parallelRenderCommandEncoderForKey:(unint64_t)a3
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( parallelRenderCommandEncoders,  "objectForKeyedSubscript:",  v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)objectPayloadBindingForKey:(unint64_t)a3
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](objectPayloadBinding, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)pipelineLibraryForKey:(unint64_t)a3
{
  pipelineLibraries = self->_pipelineLibraries;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pipelineLibraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)rasterizationRateMapForKey:(unint64_t)a3
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](rasterizationRateMaps, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)residencySetForKey:(unint64_t)a3
{
  residencySets = self->_residencySets;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](residencySets, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)renderCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)renderPipelineStateForKey:(unint64_t)a3
{
  renderPipelineStates = self->_renderPipelineStates;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](renderPipelineStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)resourceForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)resourceStateCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](commandEncoders, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)samplerStateForKey:(unint64_t)a3
{
  samplerStates = self->_samplerStates;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](samplerStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)sharedEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)sharedEventHandleForKey:(unint64_t)a3
{
  sharedEventHandles = self->_sharedEventHandles;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sharedEventHandles, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)textureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)binaryArchiveForKey:(unint64_t)a3
{
  return 0LL;
}

- (id)dynamicLibraryForKey:(unint64_t)a3
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](dynamicLibraries, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)visibleFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)functionHandleForKey:(unint64_t)a3
{
  functionHandles = self->_functionHandles;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functionHandles, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)accelerationStructureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)intersectionFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)resourceGroupSPIForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resourceGroups, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)lateEvalEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](events, "objectForKeyedSubscript:", v6));

  else {
    uint64_t v8 = 0LL;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v11);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)functionPointerHandleForKey:(unint64_t)a3
{
  functionPointerHandles = self->_functionPointerHandles;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](functionPointerHandles, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)functionPrivateArgumentForKey:(unint64_t)a3
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( functionPrivateArguments,  "objectForKeyedSubscript:",  v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)spatialScalerForKey:(unint64_t)a3
{
  spatialScalers = self->_spatialScalers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](spatialScalers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)temporalScalerForKey:(unint64_t)a3
{
  temporalScalers = self->_temporalScalers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](temporalScalers, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)logStateForKey:(unint64_t)a3
{
  logStates = self->_logStates;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](logStates, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    LODWORD(unusedResources) = -[NSMutableSet containsObject:](unusedResources, "containsObject:", v9);

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)bufferForHeapKey:(unint64_t)a3
{
  bufferForHeap = self->_bufferForHeap;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](bufferForHeap, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)allocationForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](resources, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    heaps = self->_heaps;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](heaps, "objectForKeyedSubscript:", v9));
  }

  return v7;
}

- (void)presentDrawableWithKey:(unint64_t)a3
{
  drawables = self->_drawables;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](drawables, "removeObjectForKey:", v4);
}

- (void)removeAliasableResourceForKey:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_resources, "objectForKeyedSubscript:"));
  uint64_t v5 = v4;
  if (v4)
  {
    MakeRootResourceAliasable(v4);
    -[NSMutableDictionary removeObjectForKey:](self->_resources, "removeObjectForKey:", v6);
  }
}

- (void)removeArgumentEncoderForKey:(unint64_t)a3
{
  argumentEncoders = self->_argumentEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](argumentEncoders, "removeObjectForKey:", v4);
}

- (void)removeBlitCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeBufferForKey:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);
}

- (void)removeBufferForHeapKey:(unint64_t)a3
{
  bufferForHeap = self->_bufferForHeap;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](bufferForHeap, "removeObjectForKey:", v4);
}

- (void)removeCommandBufferForKey:(unint64_t)a3
{
  commandBuffers = self->_commandBuffers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandBuffers, "removeObjectForKey:", v4);
}

- (void)removeCommandQueueForKey:(unint64_t)a3
{
  commandQueues = self->_commandQueues;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandQueues, "removeObjectForKey:", v4);
}

- (void)removeIOCommandBufferForKey:(unint64_t)a3
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioCommandBuffers, "removeObjectForKey:", v4);
}

- (void)removeIOCommandQueueForKey:(unint64_t)a3
{
  ioCommandQueues = self->_ioCommandQueues;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioCommandQueues, "removeObjectForKey:", v4);
}

- (void)removeIOHandleForKey:(unint64_t)a3
{
  ioHandles = self->_ioHandles;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioHandles, "removeObjectForKey:", v4);
}

- (void)removeIOScratchBufferForKey:(unint64_t)a3
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioScratchBuffers, "removeObjectForKey:", v4);
}

- (void)removeIOScratchBufferAllocatorForKey:(unint64_t)a3
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](ioScratchBufferAllocators, "removeObjectForKey:", v4);
}

- (void)removeComputeCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeComputePipelineStateForKey:(unint64_t)a3
{
  computePipelineStates = self->_computePipelineStates;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](computePipelineStates, "removeObjectForKey:", v4);
}

- (void)removeCounterSampleBufferForKey:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](counterSampleBuffers, "removeObjectForKey:", v4);
}

- (void)removeCounterSampleBuffer:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](counterSampleBuffers, "removeObjectForKey:", v4);
}

- (void)removeDepthStencilStateForKey:(unint64_t)a3
{
  depthStencilStates = self->_depthStencilStates;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](depthStencilStates, "removeObjectForKey:", v4);
}

- (void)removeDeviceForKey:(unint64_t)a3
{
  devices = self->_devices;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](devices, "removeObjectForKey:", v4);
}

- (void)removeEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);
}

- (void)removeFenceForKey:(unint64_t)a3
{
  fences = self->_fences;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](fences, "removeObjectForKey:", v4);
}

- (void)removeFunctionForKey:(unint64_t)a3
{
  functions = self->_functions;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functions, "removeObjectForKey:", v4);
}

- (void)removeHeapForKey:(unint64_t)a3
{
  heaps = self->_heaps;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](heaps, "removeObjectForKey:", v4);
}

- (void)removeIndirectCommandBufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);
}

- (void)removeIndirectComputeCommandForKey:(unint64_t)a3
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](indirectComputeCommands, "removeObjectForKey:", v4);
}

- (void)removeIndirectRenderCommandForKey:(unint64_t)a3
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](indirectRenderCommands, "removeObjectForKey:", v4);
}

- (void)removeLibraryForKey:(unint64_t)a3
{
  libraries = self->_libraries;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](libraries, "removeObjectForKey:", v4);
}

- (void)removeMotionEstimationPipelineForKey:(unint64_t)a3
{
  motionEstimationPipelines = self->_motionEstimationPipelines;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](motionEstimationPipelines, "removeObjectForKey:", v4);
}

- (void)removeParallelRenderCommandEncoderForKey:(unint64_t)a3
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](parallelRenderCommandEncoders, "removeObjectForKey:", v4);
}

- (void)removeObjectPayloadBindingForKey:(unint64_t)a3
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](objectPayloadBinding, "removeObjectForKey:", v4);
}

- (void)removePipelineLibraryForKey:(unint64_t)a3
{
  pipelineLibraries = self->_pipelineLibraries;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](pipelineLibraries, "removeObjectForKey:", v4);
}

- (void)removeRasterizationRateMapForKey:(unint64_t)a3
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](rasterizationRateMaps, "removeObjectForKey:", v4);
}

- (void)removeRenderCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeRenderPipelineStateForKey:(unint64_t)a3
{
  renderPipelineStates = self->_renderPipelineStates;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](renderPipelineStates, "removeObjectForKey:", v4);
}

- (void)removeResidencySetForKey:(unint64_t)a3
{
  residencySets = self->_residencySets;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](residencySets, "removeObjectForKey:", v4);
}

- (void)removeResourceGroupForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resourceGroups, "removeObjectForKey:", v4);
}

- (void)removeResourceStateCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeSamplerStateForKey:(unint64_t)a3
{
  samplerStates = self->_samplerStates;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](samplerStates, "removeObjectForKey:", v4);
}

- (void)removeSharedEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);
}

- (void)removeTextureForKey:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);
}

- (void)removeVideoCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeDynamicLibraryForKey:(unint64_t)a3
{
  dynamicLibraries = self->_dynamicLibraries;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](dynamicLibraries, "removeObjectForKey:", v4);
}

- (void)removeVisibleFunctionHandleForKey:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[GTMTLReplayObjectMap removeAliasableResourceForKey:](self, "removeAliasableResourceForKey:", v4);
}

- (void)removeFunctionHandleForKey:(unint64_t)a3
{
  functionHandles = self->_functionHandles;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionHandles, "removeObjectForKey:", v4);
}

- (void)removeAccelerationStructureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);
}

- (void)removeAccelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](commandEncoders, "removeObjectForKey:", v4);
}

- (void)removeIntersectionFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);
}

- (void)removeResourceGroupSPIForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resourceGroups, "removeObjectForKey:", v4);
}

- (void)removeLateEvalEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v4);
}

- (void)removeFunctionPointerHandleForKey:(unint64_t)a3
{
  functionPointerHandles = self->_functionPointerHandles;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionPointerHandles, "removeObjectForKey:", v4);
}

- (void)removeFunctionPrivateArgumentForKey:(unint64_t)a3
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](functionPrivateArguments, "removeObjectForKey:", v4);
}

- (void)removeVisibleFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](resources, "removeObjectForKey:", v4);
}

- (void)removeDeadlineProfileForKey:(unint64_t)a3
{
  deadlineProfiles = self->_deadlineProfiles;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](deadlineProfiles, "removeObjectForKey:", v4);
}

- (void)removeSpatialScalerForKey:(unint64_t)a3
{
  spatialScalers = self->_spatialScalers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](spatialScalers, "removeObjectForKey:", v4);
}

- (void)removeTemporalScalerForKey:(unint64_t)a3
{
  temporalScalers = self->_temporalScalers;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](temporalScalers, "removeObjectForKey:", v4);
}

- (void)removeLogStateForKey:(unint64_t)a3
{
  logStates = self->_logStates;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](logStates, "removeObjectForKey:", v4);
}

- (id)libraries
{
  return self->_libraries;
}

- (id)dynamicLibraries
{
  return self->_dynamicLibraries;
}

- (id)resources
{
  return self->_resources;
}

- (id)executeIndirectCommandBufferMap
{
  return self->_resources;
}

- (id)functionMap
{
  return self->_functions;
}

- (id)renderPipelineDescriptorMap
{
  id v3 = -[NSMutableDictionary mutableCopy](self->_functions, "mutableCopy");
  [v3 addEntriesFromDictionary:self->_dynamicLibraries];
  [v3 addEntriesFromDictionary:self->_pipelineLibraries];
  id v4 = [v3 copy];

  return v4;
}

- (id)computePipelineDescriptorMap
{
  id v3 = -[NSMutableDictionary mutableCopy](self->_functions, "mutableCopy");
  [v3 addEntriesFromDictionary:self->_dynamicLibraries];
  [v3 addEntriesFromDictionary:self->_pipelineLibraries];
  return v3;
}

- (id)blitPassDescriptorMap
{
  return self->_resources;
}

- (id)computePassDescriptorMap
{
  return self->_resources;
}

- (id)resourceStatePassDescriptorMap
{
  return self->_resources;
}

- (id)accelerationStructurePassDescriptorMap
{
  return self->_resources;
}

- (id)logStateMap
{
  return self->_logStates;
}

- (id)renderPassDescriptorMapWithMemorylessSubstitutes:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableDictionary mutableCopy](self->_resources, "mutableCopy");
  if ([v4 count]) {
    [v5 addEntriesFromDictionary:v4];
  }
  [v5 addEntriesFromDictionary:self->_rasterizationRateMaps];
  id v6 = [v5 copy];

  return v6;
}

- (id)renderPassDescriptorMap
{
  return -[GTMTLReplayObjectMap renderPassDescriptorMapWithMemorylessSubstitutes:]( self,  "renderPassDescriptorMapWithMemorylessSubstitutes:",  0LL);
}

- (id)restoreIndirectCommandBufferDataMap
{
  id v3 = -[NSMutableDictionary mutableCopy](self->_resources, "mutableCopy");
  [v3 addEntriesFromDictionary:self->_renderPipelineStates];
  [v3 addEntriesFromDictionary:self->_computePipelineStates];
  id v4 = [v3 copy];

  return v4;
}

- (void)endEncodingForRenderCommandEncoder:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[GTMTLReplayObjectMap renderCommandEncoderForKey:](self, "renderCommandEncoderForKey:"));
  [v5 endEncoding];
  -[GTMTLReplayObjectMap removeRenderCommandEncoderForKey:](self, "removeRenderCommandEncoderForKey:", a3);
}

- (unsigned)globalTraceIdForEncoder:(unint64_t)a3 ofType:(BOOL)a4
{
  if (a4) {
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  }
  else {
    parallelRenderCommandEncoders = self->_commandEncoders;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( parallelRenderCommandEncoders,  "objectForKeyedSubscript:",  v5));
  unsigned int v7 = [v6 globalTraceObjectID];

  return v7;
}

- (id)encoderForKey:(unint64_t)a3 ofType:(BOOL)a4
{
  if (a4) {
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  }
  else {
    parallelRenderCommandEncoders = self->_commandEncoders;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( parallelRenderCommandEncoders,  "objectForKeyedSubscript:",  v5));

  else {
    unsigned int v7 = 0LL;
  }
  id v8 = v7;

  return v8;
}

- (void)commitCommandBuffers
{
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v3 = self->_commandEncoders;
  id v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_commandEncoders,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i)));
        [v8 endEncoding];
      }

      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v30,  v36,  16LL);
    }

    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_commandEncoders, "removeAllObjects");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = self->_parallelRenderCommandEncoders;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_parallelRenderCommandEncoders,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v26 + 1) + 8LL * (void)j)));
        [v14 endEncoding];
      }

      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v35,  16LL);
    }

    while (v11);
  }

  -[NSMutableDictionary removeAllObjects](self->_parallelRenderCommandEncoders, "removeAllObjects");
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v15 = self->_commandBuffers;
  id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (k = 0LL; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        __int128 v20 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)k);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_commandBuffers,  "objectForKeyedSubscript:",  v20,  (void)v22));
        objc_msgSend((id)g_activityLog, "logCommandBuffer:withKey:", v21, objc_msgSend(v20, "unsignedLongLongValue"));
        GTMTLReplay_commitCommandBuffer(v21);
      }

      id v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v22,  v34,  16LL);
    }

    while (v17);
  }

  -[NSMutableDictionary removeAllObjects](self->_commandBuffers, "removeAllObjects");
}

- (void)addUnusedResourceKey:(unint64_t)a3
{
  unusedResources = self->_unusedResources;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableSet addObject:](unusedResources, "addObject:", v4);
}

- (id)unusedResourceKeys
{
  return -[NSMutableSet copy](self->_unusedResources, "copy");
}

- (MTLDevice)defaultDevice
{
  return self->_defaultDevice;
}

- (MTLCommandQueue)defaultCommandQueue
{
  return self->_defaultCommandQueue;
}

- (void)setDefaultCommandQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end