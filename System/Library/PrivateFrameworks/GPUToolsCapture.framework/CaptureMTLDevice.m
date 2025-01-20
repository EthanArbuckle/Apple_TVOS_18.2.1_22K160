@interface CaptureMTLDevice
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats;
- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6;
- (BOOL)areGPUAssertionsEnabled;
- (BOOL)areProgrammableSamplePositionsSupported;
- (BOOL)areRasterOrderGroupsSupported;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)bufferPinningEnabled;
- (BOOL)captureRaytracingEnabled;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)copyShaderCacheToPath:(id)a3;
- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3;
- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3;
- (BOOL)isBCTextureCompressionSupported;
- (BOOL)isClampToHalfBorderSupported;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)isCustomBorderColorSupported;
- (BOOL)isFixedLinePointFillDepthGradientSupported;
- (BOOL)isFloat32FilteringSupported;
- (BOOL)isLargeMRTSupported;
- (BOOL)isMsaa32bSupported;
- (BOOL)isPlacementHeapSupported;
- (BOOL)isQuadDataSharingSupported;
- (BOOL)isRGB10A2GammaSupported;
- (BOOL)isRTZRoundingSupported;
- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6;
- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5;
- (BOOL)metalAssertionsEnabled;
- (BOOL)newCaptureDepthStencilState:(id *)a3 associatedWithBaseDepthStencilState:(id)a4;
- (BOOL)newCaptureFunction:(id *)a3 associatedWithBaseFunction:(id)a4 captureLibrary:(id)a5;
- (BOOL)newCaptureSamplerState:(id *)a3 associatedWithBaseSamplerState:(id)a4;
- (BOOL)requiresBFloat16Emulation;
- (BOOL)requiresRaytracingEmulation;
- (BOOL)reserveGPUAddressRange:(_NSRange)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shaderDebugInfoCaching;
- (BOOL)supportPriorityBand;
- (BOOL)supportsCounterSampling:(unint64_t)a3;
- (BOOL)supportsFamily:(int64_t)a3;
- (BOOL)supportsFeatureSet:(unint64_t)a3;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3;
- (BOOL)supportsSampleCount:(unint64_t)a3;
- (BOOL)supportsTextureSampleCount:(unint64_t)a3;
- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5;
- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4;
- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4;
- (CaptureMTLDevice)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTResourceDownloader)downloader;
- (GTResourceHarvester)harvester;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities;
- (MTLArchitecture)architecture;
- (MTLComputePipelineState)computePipelineCopyBuffer;
- (MTLComputePipelineState)computePipelineCopyIndirectCommandBuffer;
- (MTLDevice)baseObject;
- (MTLFunction)computeFunctionCopyIndirectCommandBuffer;
- (MTLFunction)renderFunctionCopyIndirectCommandBuffer;
- (MTLGPUBVHBuilder)GPUBVHBuilder;
- (MTLRenderPipelineState)renderPipelineCopyBuffer;
- (MTLRenderPipelineState)renderPipelineCopyIndirectCommandBuffer;
- (MTLSharedEventListener)captureEventListener;
- (MTLTargetDeviceArchitecture)targetDeviceArchitecture;
- (NSArray)counterSets;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_group)dispatchGroup;
- (const)limits;
- (const)targetDeviceInfo;
- (float)maxLineWidth;
- (float)maxPointSize;
- (id)copyIOSurfaceSharedTextureProperties:(id)a3;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)dummyArgumentEncoder;
- (id)dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeICBIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withMeshDescriptor:(id)a4;
- (id)dummyEncodeSamplerIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeTextureIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)endCollectingPipelineDescriptors;
- (id)familyName;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getRawBVHBuilderPtr;
- (id)indirectArgumentBufferDecodingData;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFence;
- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectArgumentEncoderWithArguments:(id)a3;
- (id)newIndirectArgumentEncoderWithLayout:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3;
- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLateEvalEvent;
- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newSharedEvent;
- (id)newSharedEventWithHandle:(id)a3;
- (id)newSharedEventWithMachPort:(unsigned int)a3;
- (id)newSharedEventWithOptions:(int64_t)a3;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)originalObject;
- (id)productName;
- (id)serializeTileRenderPipelineDescriptor:(id)a3;
- (id)vendorName;
- (int64_t)defaultTextureWriteRoundingMode;
- (os_unfair_lock_s)getBVHBuilderLock;
- (unint64_t)argumentBuffersSupport;
- (unint64_t)bufferRobustnessSupport;
- (unint64_t)commandBufferErrorOptions;
- (unint64_t)currentAllocatedSize;
- (unint64_t)dedicatedMemorySize;
- (unint64_t)deviceCreationFlags;
- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes;
- (unint64_t)deviceLinearTextureAlignmentBytes;
- (unint64_t)doubleFPConfig;
- (unint64_t)featureProfile;
- (unint64_t)halfFPConfig;
- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes;
- (unint64_t)iosurfaceTextureAlignmentBytes;
- (unint64_t)latestSupportedGenericBVHVersion;
- (unint64_t)linearTextureAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentSlice;
- (unint64_t)maxAccelerationStructureLevels;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxArgumentBufferSamplerCount;
- (unint64_t)maxBufferLength;
- (unint64_t)maxColorAttachments;
- (unint64_t)maxComputeAttributes;
- (unint64_t)maxComputeBuffers;
- (unint64_t)maxComputeInlineDataSize;
- (unint64_t)maxComputeLocalMemorySizes;
- (unint64_t)maxComputeSamplers;
- (unint64_t)maxComputeTextures;
- (unint64_t)maxComputeThreadgroupMemory;
- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes;
- (unint64_t)maxCustomSamplePositions;
- (unint64_t)maxFenceInstances;
- (unint64_t)maxFragmentBuffers;
- (unint64_t)maxFragmentInlineDataSize;
- (unint64_t)maxFragmentSamplers;
- (unint64_t)maxFragmentTextures;
- (unint64_t)maxFramebufferStorageBits;
- (unint64_t)maxFunctionConstantIndices;
- (unint64_t)maxIOCommandsInFlight;
- (unint64_t)maxIndirectBuffers;
- (unint64_t)maxIndirectSamplers;
- (unint64_t)maxIndirectSamplersPerDevice;
- (unint64_t)maxIndirectTextures;
- (unint64_t)maxInterpolants;
- (unint64_t)maxInterpolatedComponents;
- (unint64_t)maxPredicatedNestingDepth;
- (unint64_t)maxRasterizationRateLayerCount;
- (unint64_t)maxTessellationFactor;
- (unint64_t)maxTextureBufferWidth;
- (unint64_t)maxTextureDepth3D;
- (unint64_t)maxTextureDimensionCube;
- (unint64_t)maxTextureHeight2D;
- (unint64_t)maxTextureHeight3D;
- (unint64_t)maxTextureLayers;
- (unint64_t)maxTextureWidth1D;
- (unint64_t)maxTextureWidth2D;
- (unint64_t)maxTextureWidth3D;
- (unint64_t)maxThreadgroupMemoryLength;
- (unint64_t)maxTileBuffers;
- (unint64_t)maxTileInlineDataSize;
- (unint64_t)maxTileSamplers;
- (unint64_t)maxTileTextures;
- (unint64_t)maxTotalComputeThreadsPerThreadgroup;
- (unint64_t)maxVertexAmplificationCount;
- (unint64_t)maxVertexAmplificationFactor;
- (unint64_t)maxVertexAttributes;
- (unint64_t)maxVertexBuffers;
- (unint64_t)maxVertexInlineDataSize;
- (unint64_t)maxVertexSamplers;
- (unint64_t)maxVertexTextures;
- (unint64_t)maxViewportCount;
- (unint64_t)maxVisibilityQueryOffset;
- (unint64_t)minBufferNoCopyAlignmentBytes;
- (unint64_t)minConstantBufferAlignmentBytes;
- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minTilePixels;
- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)readWriteTextureSupport;
- (unint64_t)recommendedMaxWorkingSetSize;
- (unint64_t)registryID;
- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3;
- (unint64_t)sharedMemorySize;
- (unint64_t)singleFPConfig;
- (unint64_t)sparseTexturesSupport;
- (unint64_t)sparseTileSizeInBytes;
- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3;
- (unint64_t)streamReference;
- (unsigned)acceleratorPort;
- (unsigned)maximumComputeSubstreams;
- (void)_initArgumentBufferPatchingTypes;
- (void)_initDummyEncoder;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (void)compilerPropagatesThreadPriority:(BOOL)a3;
- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7;
- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6;
- (void)dealloc;
- (void)deallocateResource:(id)a3;
- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4;
- (void)getShaderCacheKeys;
- (void)invalidateHarvester;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)purgeDeallocatedObjects;
- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5;
- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4;
- (void)setCommandBufferErrorOptions:(unint64_t)a3;
- (void)setGPUAssertionsEnabled:(BOOL)a3;
- (void)setIndirectArgumentBufferDecodingData:(id)a3;
- (void)setMetalAssertionsEnabled:(BOOL)a3;
- (void)setRawBVHBuilderPtr:(id)a3;
- (void)setShaderDebugInfoCaching:(BOOL)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3;
- (void)startCollectingPipelineDescriptors;
- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3;
- (void)touch;
- (void)unloadShaderCaches;
- (void)unmapShaderSampleBuffer;
@end

@implementation CaptureMTLDevice

- (void)_initArgumentBufferPatchingTypes
{
  id v3 = DEVICEOBJECT(self->_baseObject);
  id v8 = (id)objc_claimAutoreleasedReturnValue(v3);
  char v4 = objc_opt_respondsToSelector(v8, "resourcePatchingTypeForResourceType:");
  uint64_t v5 = 0LL;
  isArgumentBufferPatchingTypeIndexed = self->isArgumentBufferPatchingTypeIndexed;
  do
  {
    BOOL v7 = (v4 & 1) != 0 && [v8 resourcePatchingTypeForResourceType:v5] == (char *)&dword_0 + 1;
    isArgumentBufferPatchingTypeIndexed[v5++] = v7;
  }

  while (v5 != 9);
}

- (id)dummyArgumentEncoder
{
  int64_t dummyArgEncOnceToken = self->_dummyArgEncOnceToken;
  p_int64_t dummyArgEncOnceToken = &self->_dummyArgEncOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__CaptureMTLDevice_dummyArgumentEncoder__block_invoke;
  block[3] = &unk_20E0C8;
  block[4] = self;
  if (dummyArgEncOnceToken != -1) {
    dispatch_once(p_dummyArgEncOnceToken, block);
  }
  return self->_dummyArgumentEncoder;
}

- (void)_initDummyEncoder
{
  v29 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v3 = DEVICEOBJECT(self->_baseObject);
  char v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = 0LL;
  v6 = &qword_1C2B70;
  do
  {
    BOOL v7 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
    -[MTLArgumentDescriptor setDataType:](v7, "setDataType:", 58LL);
    else {
      uint64_t v8 = 2LL;
    }
    -[MTLArgumentDescriptor setTextureType:](v7, "setTextureType:", v8);
    -[MTLArgumentDescriptor setIndex:](v7, "setIndex:", v5);
    -[NSMutableArray addObject:](v29, "addObject:", v7);

    ++v5;
    v6 += 2;
  }

  while (v5 != 10);
  self->_dummySamplerIndex = (unint64_t)-[NSMutableArray count](v29, "count");
  v9 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
  -[MTLArgumentDescriptor setDataType:](v9, "setDataType:", 59LL);
  -[MTLArgumentDescriptor setIndex:](v9, "setIndex:", self->_dummySamplerIndex);
  -[NSMutableArray addObject:](v29, "addObject:", v9);

  v10 = (MTLArgumentEncoder *)[v4 newArgumentEncoderWithArguments:v29];
  dummyArgumentEncoder = self->_dummyArgumentEncoder;
  self->_dummyArgumentEncoder = v10;

  self->_dummyICBIndex = (unint64_t)-[NSMutableArray count](v29, "count");
  v12 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
  -[MTLArgumentDescriptor setDataType:](v12, "setDataType:", 80LL);
  -[MTLArgumentDescriptor setIndex:](v12, "setIndex:", self->_dummyICBIndex);
  -[NSMutableArray addObject:](v29, "addObject:", v12);

  self->_dummyRenderPSOIndex = (unint64_t)-[NSMutableArray count](v29, "count");
  v13 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
  -[MTLArgumentDescriptor setDataType:](v13, "setDataType:", 78LL);
  -[MTLArgumentDescriptor setIndex:](v13, "setIndex:", self->_dummyRenderPSOIndex);
  -[NSMutableArray addObject:](v29, "addObject:", v13);

  id v14 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  char v16 = objc_opt_respondsToSelector(v15, "setComputePipelineState:atIndex:");

  if ((v16 & 1) != 0)
  {
    self->_dummyComputePSOIndex = (unint64_t)-[NSMutableArray count](v29, "count");
    v17 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
    -[MTLArgumentDescriptor setDataType:](v17, "setDataType:", 79LL);
    -[MTLArgumentDescriptor setIndex:](v17, "setIndex:", self->_dummyComputePSOIndex);
    -[NSMutableArray addObject:](v29, "addObject:", v17);
  }

  id v18 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  char v20 = objc_opt_respondsToSelector(v19, "setVisibleFunctionTable:atIndex:");

  if ((v20 & 1) != 0)
  {
    self->_dummyVisibleFunctionTableIndex = (unint64_t)-[NSMutableArray count](v29, "count");
    v21 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
    -[MTLArgumentDescriptor setDataType:](v21, "setDataType:", 115LL);
    -[MTLArgumentDescriptor setIndex:](v21, "setIndex:", self->_dummyVisibleFunctionTableIndex);
    -[NSMutableArray addObject:](v29, "addObject:", v21);
  }

  id v22 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  char v24 = objc_opt_respondsToSelector(v23, "setIntersectionFunctionTable:atIndex:");

  if ((v24 & 1) != 0)
  {
    self->_dummyIntersectionFunctionTableIndex = (unint64_t)-[NSMutableArray count](v29, "count");
    v25 = objc_alloc_init(&OBJC_CLASS___MTLArgumentDescriptor);
    -[MTLArgumentDescriptor setDataType:](v25, "setDataType:", 116LL);
    -[MTLArgumentDescriptor setIndex:](v25, "setIndex:", self->_dummyIntersectionFunctionTableIndex);
    -[NSMutableArray addObject:](v29, "addObject:", v25);
  }

  v26 = (MTLArgumentEncoder *)[v4 newArgumentEncoderWithArguments:v29];
  v27 = self->_dummyArgumentEncoder;
  self->_dummyArgumentEncoder = v26;

  id v28 = objc_msgSend( v4,  "newBufferWithLength:options:",  -[MTLArgumentEncoder encodedLength](self->_dummyArgumentEncoder, "encodedLength"),  0);
  -[MTLArgumentEncoder setArgumentBuffer:offset:](self->_dummyArgumentEncoder, "setArgumentBuffer:offset:", v28, 0LL);
}

- (id)dummyEncodeTextureIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[0])
  {
    id v8 = DEVICEOBJECT(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      if (![v9 resourceIndex])
      {
        id v10 = [v9 textureType];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v11 setTexture:v9 atIndex:v10];
      }

      if (v7)
      {
        id v12 = [v7 copy];

        objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v9, "resourceIndex"));
        objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v9, "resourceIndex") != 0);
        id v7 = v12;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeSamplerIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[1] && [v7 supportArgumentBuffers])
  {
    id v9 = DEVICEOBJECT(v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v10, "resourceIndex") & 1) != 0)
    {
      if (![v10 resourceIndex])
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v11 setSamplerState:v10 atIndex:self->_dummySamplerIndex];
      }

      id v12 = [v8 copy];

      objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v10, "resourceIndex"));
      objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v10, "resourceIndex") != 0);
      id v8 = v12;
    }
  }

  id v13 = v8;

  return v13;
}

- (id)dummyEncodeICBIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = v7;
  if (v6)
  {
    id v9 = v7;
    if (self->isArgumentBufferPatchingTypeIndexed[5])
    {
      id v10 = DEVICEOBJECT(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v9 = v8;
      if ((objc_opt_respondsToSelector(v11, "resourceIndex") & 1) != 0)
      {
        id v9 = v8;
        if ((objc_opt_respondsToSelector(v8, "resourceIndex") & 1) != 0)
        {
          id v12 = [v11 resourceIndex];
          if (v12 == (id)_MTLInvalidResourceIndex)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
            [v13 setIndirectCommandBuffer:v11 atIndex:self->_dummyICBIndex];
          }

          id v9 = [v8 copy];

          objc_msgSend(v9, "setResourceIndex:", objc_msgSend(v11, "resourceIndex"));
        }
      }
    }
  }

  id v14 = v9;

  return v14;
}

- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      id v10 = [v9 resourceIndex];
      id v11 = (id)_MTLInvalidResourceIndex;
      if (v10 == (id)_MTLInvalidResourceIndex)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v12 setRenderPipelineState:v9 atIndex:self->_dummyRenderPSOIndex];
      }

      if (v7)
      {
        id v13 = [v7 copy];

        objc_msgSend(v13, "setResourceIndex:", objc_msgSend(v9, "resourceIndex"));
        objc_msgSend(v13, "setForceResourceIndex:", objc_msgSend(v9, "resourceIndex") != v11);
        id v7 = v13;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withMeshDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      id v10 = [v9 resourceIndex];
      id v11 = (id)_MTLInvalidResourceIndex;
      if (v10 == (id)_MTLInvalidResourceIndex)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v12 setRenderPipelineState:v9 atIndex:self->_dummyRenderPSOIndex];
      }

      if (v7)
      {
        id v13 = [v7 copy];

        objc_msgSend(v13, "setResourceIndex:", objc_msgSend(v9, "resourceIndex"));
        objc_msgSend(v13, "setForceResourceIndex:", objc_msgSend(v9, "resourceIndex") != v11);
        id v7 = v13;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (objc_opt_respondsToSelector(v6, "supportIndirectCommandBuffers") & 1) != 0
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      id v10 = [v9 resourceIndex];
      id v11 = (id)_MTLInvalidResourceIndex;
      if (v10 == (id)_MTLInvalidResourceIndex)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v12 setComputePipelineState:v9 atIndex:self->_dummyComputePSOIndex];
      }

      if (v7)
      {
        id v13 = [v7 copy];

        objc_msgSend(v13, "setResourceIndex:", objc_msgSend(v9, "resourceIndex"));
        objc_msgSend(v13, "setForceResourceIndex:", objc_msgSend(v9, "resourceIndex") != v11);
        id v7 = v13;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[6])
  {
    id v8 = DEVICEOBJECT(v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)v9;
    if (v7 && (objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      id v11 = [v10 resourceIndex];
      id v12 = (id)_MTLInvalidResourceIndex;
      if (v11 == (id)_MTLInvalidResourceIndex)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v13 setVisibleFunctionTable:v10 atIndex:self->_dummyVisibleFunctionTableIndex];
      }

      id v14 = [v7 copy];

      objc_msgSend(v14, "setResourceIndex:", objc_msgSend(v10, "resourceIndex"));
      objc_msgSend(v14, "setForceResourceIndex:", objc_msgSend(v10, "resourceIndex") != v12);
      id v7 = v14;
    }
  }

  id v15 = v7;

  return v15;
}

- (id)dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[7])
  {
    id v8 = DEVICEOBJECT(v6);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)v9;
    if (v7 && (objc_opt_respondsToSelector(v9, "resourceIndex") & 1) != 0)
    {
      id v11 = [v10 resourceIndex];
      id v12 = (id)_MTLInvalidResourceIndex;
      if (v11 == (id)_MTLInvalidResourceIndex)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLDevice dummyArgumentEncoder](self, "dummyArgumentEncoder"));
        [v13 setIntersectionFunctionTable:v10 atIndex:self->_dummyIntersectionFunctionTableIndex];
      }

      id v14 = [v7 copy];

      objc_msgSend(v14, "setResourceIndex:", objc_msgSend(v10, "resourceIndex"));
      objc_msgSend(v14, "setForceResourceIndex:", objc_msgSend(v10, "resourceIndex") != v12);
      id v7 = v14;
    }
  }

  id v15 = v7;

  return v15;
}

- (GTResourceDownloader)downloader
{
  int64_t downloaderOnceToken = self->_downloaderOnceToken;
  p_int64_t downloaderOnceToken = &self->_downloaderOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __30__CaptureMTLDevice_downloader__block_invoke;
  block[3] = &unk_20E0C8;
  block[4] = self;
  if (downloaderOnceToken != -1) {
    dispatch_once(p_downloaderOnceToken, block);
  }
  return self->_downloader;
}

- (MTLFunction)renderFunctionCopyIndirectCommandBuffer
{
  return self->_renderFunctionCopyIndirectCommandBuffer;
}

- (MTLRenderPipelineState)renderPipelineCopyIndirectCommandBuffer
{
  return self->_renderPipelineCopyIndirectCommandBuffer;
}

- (MTLRenderPipelineState)renderPipelineCopyBuffer
{
  return self->_renderPipelineCopyBuffer;
}

- (MTLFunction)computeFunctionCopyIndirectCommandBuffer
{
  return self->_computeFunctionCopyIndirectCommandBuffer;
}

- (MTLComputePipelineState)computePipelineCopyIndirectCommandBuffer
{
  return self->_computePipelineCopyIndirectCommandBuffer;
}

- (MTLComputePipelineState)computePipelineCopyBuffer
{
  return self->_computePipelineCopyBuffer;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (MTLDevice)baseObject
{
  return self->_baseObject;
}

- (CaptureMTLDevice)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___CaptureMTLDevice;
  id v8 = -[CaptureMTLDevice init](&v42, "init");
  unint64_t v9 = (unint64_t)v8;
  if (v8)
  {
    p_baseObject = (id *)&v8->_baseObject;
    objc_storeStrong((id *)&v8->_baseObject, a3);
    *(void *)(v9 + 16) = a4;
    id v11 = DEVICEOBJECT(v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(void *)(v9 + 24) = GTTraceContext_openStream((uint64_t)a4, (unint64_t)v12, v9);

    Class v13 = NSClassFromString(@"MTLGPUDebugDevice");
    Class v14 = NSClassFromString(@"MTLLegacySVDevice");
    id v15 = DEVICEOBJECT(v7);
    char v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    char v17 = objc_opt_respondsToSelector(v16, "resourcePatchingTypeForResourceType:");

    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v19 = *(void **)(v9 + 280);
    *(void *)(v9 + 280) = v18;

    pthread_mutex_init((pthread_mutex_t *)(v9 + 216), 0LL);
    if ((qword_23A448 & 8) != 0)
    {
      char v22 = 1;
    }

    else
    {
      char v20 = (void *)objc_claimAutoreleasedReturnValue([*p_baseObject name]);
      unsigned int v21 = [v20 containsString:@"AMD"];

      if (v21) {
        char v22 = [*p_baseObject supportsRaytracing]
      }
      else {
        char v22 = *(_BYTE *)(v9 + 324);
      }
    }

    *(_BYTE *)(v9 + 326) = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v7 targetDeviceArchitecture]);
    unsigned int v24 = [v23 cpuType];

    if (v24 != 16777235) {
      qword_23A448 |= 0x100uLL;
    }
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___MTLDebugDevice, v25);
    if ((objc_opt_isKindOfClass(v7, v26) & 1) != 0 || (objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      char isKindOfClass = 1;
    }

    else if (v14)
    {
      char isKindOfClass = objc_opt_isKindOfClass(v7, v14);
    }

    else
    {
      char isKindOfClass = 0;
    }

    *(_BYTE *)(v9 + 325) = isKindOfClass & 1;
    apr_pool_create_ex((apr_pool_t **)(v9 + 32), 0LL, 0LL, 0LL);
    dispatch_group_t v28 = dispatch_group_create();
    v29 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v28;

    *(void *)(v9 + 328) = GTResourceHarvesterMake(*(apr_pool_t **)(v9 + 32));
    [(id)v9 _initArgumentBufferPatchingTypes];
    v30 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  2LL,  5LL,  8LL);
    v31 = *(void **)(v9 + 288);
    *(void *)(v9 + 288) = v30;

    v32 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  2LL,  5LL,  32LL);
    v33 = *(void **)(v9 + 296);
    *(void *)(v9 + 296) = v32;

    v34 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  2LL,  5LL,  8LL);
    v35 = *(void **)(v9 + 304);
    *(void *)(v9 + 304) = v34;

    *(void *)(v9 + 312) = 0LL;
    *(_DWORD *)(v9 + 320) = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 baseObject]);
    [v36 _setDeviceWrapper:v9];

    dispatch_queue_t v37 = dispatch_queue_create("com.apple.dt.GPUTools.eventsQueue", 0LL);
    v38 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = v37;

    v39 = -[MTLSharedEventListener initWithDispatchQueue:]( objc_alloc(&OBJC_CLASS___MTLSharedEventListener),  "initWithDispatchQueue:",  *(void *)(v9 + 120));
    v40 = *(void **)(v9 + 128);
    *(void *)(v9 + 128) = v39;

    GTMTLGuestAppClient_addCaptureDevice(g_guestAppClientMTL, (void *)v9);
  }

  return (CaptureMTLDevice *)v9;
}

- (BOOL)newCaptureFunction:(id *)a3 associatedWithBaseFunction:(id)a4 captureLibrary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_cachedFunctionLock);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cachedFunctionMap, "objectForKey:", v8));
  id v11 = *a3;
  *a3 = v10;

  id v12 = *a3;
  if (!*a3)
  {
    Class v13 = -[CaptureMTLFunction initWithBaseObject:captureLibrary:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureLibrary:",  v8,  v9);
    id v14 = *a3;
    *a3 = v13;

    -[NSMapTable setObject:forKey:](self->_cachedFunctionMap, "setObject:forKey:", *a3, v8);
  }

  os_unfair_lock_unlock(&self->_cachedFunctionLock);

  return v12 == 0LL;
}

- (BOOL)newCaptureDepthStencilState:(id *)a3 associatedWithBaseDepthStencilState:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_cachedDepthStencilStateLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cachedDepthStencilStateMap, "objectForKey:", v6));
  id v8 = *a3;
  *a3 = v7;

  id v9 = *a3;
  if (!*a3)
  {
    id v10 = -[CaptureMTLDepthStencilState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDepthStencilState),  "initWithBaseObject:captureDevice:",  v6,  self);
    id v11 = *a3;
    *a3 = v10;

    -[NSMapTable setObject:forKey:](self->_cachedDepthStencilStateMap, "setObject:forKey:", *a3, v6);
  }

  os_unfair_lock_unlock(&self->_cachedDepthStencilStateLock);

  return v9 == 0LL;
}

- (BOOL)newCaptureSamplerState:(id *)a3 associatedWithBaseSamplerState:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_cachedSamplerStateLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_cachedSamplerStateMap, "objectForKey:", v6));
  id v8 = *a3;
  *a3 = v7;

  id v9 = *a3;
  if (!*a3)
  {
    id v10 = -[CaptureMTLSamplerState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLSamplerState),  "initWithBaseObject:captureDevice:",  v6,  self);
    id v11 = *a3;
    *a3 = v10;

    -[NSMapTable setObject:forKey:](self->_cachedSamplerStateMap, "setObject:forKey:", *a3, v6);
  }

  os_unfair_lock_unlock(&self->_cachedSamplerStateLock);

  return v9 == 0LL;
}

- (void)invalidateHarvester
{
  self->_harvester = (GTResourceHarvester *)GTResourceHarvesterMake(self->_harvesterPool);
  id v3 = -[GTResourceDownloader initWithDevice:](objc_alloc(&OBJC_CLASS___GTResourceDownloader), "initWithDevice:", self);
  downloader = self->_downloader;
  self->_downloader = v3;
}

- (void)deallocateResource:(id)a3
{
  id v4 = a3;
  if (*(_DWORD *)(boundaryTrackerInstance + 20))
  {
    if (self->_bufferPinningEnabled)
    {
      char v17 = v4;
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___CaptureMTLBuffer, v4);
      char isKindOfClass = objc_opt_isKindOfClass(v17, v5);
      id v4 = v17;
      if ((isKindOfClass & 1) == 0
        || (v7 = (void *)objc_claimAutoreleasedReturnValue([v17 heap]), v7, id v4 = v17, !v7))
      {
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___CaptureMTLAccelerationStructure, v4);
        char v9 = objc_opt_isKindOfClass(v17, v8);
        id v4 = v17;
        if ((v9 & 1) == 0
          || (id v10 = (void *)objc_claimAutoreleasedReturnValue([v17 heap]),
              v10,
              id v4 = v17,
              !v10))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 baseObject]);
          [v11 setPurgeableState:3];

          p_retainMutex = &self->_retainMutex;
          pthread_mutex_lock(&self->_retainMutex);
          retainObjects = self->_retainObjects;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v17 baseObject]);
          id v15 = DEVICEOBJECT(v14);
          char v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          -[NSMutableArray addObject:](retainObjects, "addObject:", v16);

          pthread_mutex_unlock(p_retainMutex);
          id v4 = v17;
        }
      }
    }
  }
}

- (void)purgeDeallocatedObjects
{
  p_retainMutex = &self->_retainMutex;
  pthread_mutex_lock(&self->_retainMutex);
  -[NSMutableArray removeAllObjects](self->_retainObjects, "removeAllObjects");
  pthread_mutex_unlock(p_retainMutex);
}

- (BOOL)bufferPinningEnabled
{
  return self->_bufferPinningEnabled;
}

- (BOOL)captureRaytracingEnabled
{
  return self->_captureRaytracingEnabled;
}

- (MTLSharedEventListener)captureEventListener
{
  return self->_eventListener;
}

- (void)dealloc
{
  uint64_t v3 = v15;
  *(_DWORD *)(v15 + 8) = -16317;
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
  uint64_t v8 = -[CaptureMTLDevice traceStream](self, "traceStream");
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
  v12.super_class = (Class)&OBJC_CLASS___CaptureMTLDevice;
  -[CaptureMTLDevice dealloc](&v12, "dealloc");
}

- (BOOL)conformsToProtocol:(id)a3
{
  unsigned __int8 v4 = (Protocol *)a3;
  Protocol = objc_getProtocol("MPSPlugin");
  uint64_t v6 = (Protocol *)objc_claimAutoreleasedReturnValue(Protocol);
  BOOL isEqual = protocol_isEqual(v4, v6);

  if (isEqual) {
    goto LABEL_5;
  }
  uint64_t v8 = objc_getProtocol("MPSNeuralNetworkPlugin");
  char v9 = (Protocol *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = protocol_isEqual(v4, v9);

  if (v10) {
    goto LABEL_5;
  }
  uint64_t v11 = objc_getProtocol("MPSMatrixPlugin");
  objc_super v12 = (Protocol *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = protocol_isEqual(v4, v12);

  if (v13
    || (uint64_t v14 = objc_getProtocol("MPSNDArrayPlugin"),
        uint64_t v15 = (Protocol *)objc_claimAutoreleasedReturnValue(v14),
        BOOL v16 = protocol_isEqual(v4, v15),
        v15,
        v16))
  {
LABEL_5:
    id v17 = DEVICEOBJECT(self->_baseObject);
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    unsigned __int8 v19 = [v18 conformsToProtocol:v4];
  }

  else
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___CaptureMTLDevice;
    unsigned __int8 v19 = -[CaptureMTLDevice conformsToProtocol:](&v21, "conformsToProtocol:", v4);
  }

  return v19;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_getUid("newCNNConvolutionWithDescriptor:dataSource:fullyConnected:") == a3
    || sel_getUid("newCNNConvolutionWithDescriptor:convolutionData:") == a3
    || sel_getUid("newCNNConvolutionGradientWithDescriptor:convolutionData:") == a3
    || sel_getUid("newCNNNeuronWithNeuronType:neuronParameterA:neuronParameterB:neuronParameterC:") == a3
    || sel_getUid("newCNNNeuronWithNeuronType:neuronParameterAArray:count:") == a3
    || sel_getUid("newMatrixMultiplicationWithTransposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:") == a3
    || sel_getUid("newMatrixVectorMultiplicationWithTranspose:rows:columns:alpha:beta:") == a3
    || sel_getUid("newMatrixFullyConnected") == a3
    || sel_getUid("newCNNPoolingMaxWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:") == a3
    || sel_getUid("newCNNPoolingAverageWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:") == a3
    || sel_getUid( "newCNNDilatedPoolingMaxWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:dilationRateX:dilationRateY:") == a3 || sel_getUid("newCNNSoftMax") == a3 || sel_getUid("newNDArrayConvolution2DWithDescriptor:") == a3)
  {
    baseObject = self->_baseObject;
  }

  else
  {
    Uid = sel_getUid("newNDArrayConvolution2DGradientWithDescriptor:");
    baseObject = self->_baseObject;
    if (Uid != a3) {
      return CaptureRespondsToSelector((uint64_t)baseObject, a3);
    }
  }

  id v8 = DEVICEOBJECT(baseObject);
  char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  char v10 = objc_opt_respondsToSelector(v9, a3);

  return v10 & 1;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned int v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  char v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLDeviceSPI newArgumentEncoderWithArguments:](self->_baseObject, "newArgumentEncoderWithArguments:", v4);
  if (v12) {
    BOOL v13 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    BOOL v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16037;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    BOOL v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    BOOL v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  objc_super v21 = -[CaptureMTLArgumentEncoder traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)BOOL v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v4;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  objc_super v42 = traceContext;
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  unint64_t v45 = v11;
  s();
  BOOL v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v46 = v14;
  char v47 = *((_BYTE *)v12 + 8);
  __int16 v48 = 16400;
  int v49 = 0;
  char v50 = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapNSArray(v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = -[MTLDeviceSPI newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:]( baseObject,  "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:",  v18,  a4,  a5);

  id v20 = [v19 newFunctionWithName:@"ciKernelMain"];
  objc_super v21 = self->_baseObject;
  id v41 = 0LL;
  id v22 = -[MTLDeviceSPI newComputePipelineStateWithFunction:options:reflection:error:]( v21,  "newComputePipelineStateWithFunction:options:reflection:error:",  v20,  0LL,  &v41,  a5);
  id v40 = v41;
  if (v22) {
    v23 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v22,  self);
  }
  else {
    v23 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v42, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v23, "traceStream"));
  uint64_t v24 = v44;
  *(_DWORD *)(v44 + 8) = -16101;
  char v25 = v48;
  id v37 = v19;
  v39 = ($D92F08544D6F25E5EC20014A7976C0F4 *)a4;
  if (v48 > 0x20uLL)
  {
    uint64_t v27 = *(void *)(v43 + 24);
    uint64_t v28 = HIBYTE(v48);
    ++HIBYTE(v48);
    uint64_t v26 = GTTraceMemPool_allocateBytes(v27, v45, v28 | 0x2000000000LL) + 16;
    char v25 = v28;
  }

  else
  {
    uint64_t v26 = (char *)(v24 + v48);
    LOBYTE(v48) = v48 + 32;
  }

  *(_BYTE *)(v24 + 13) = v25;
  SaveMTLComputePipelineReflection((uint64_t)&v42, v22, v40, 0LL, v20);
  char v29 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  int v31 = -[CaptureMTLComputePipelineState traceStream](v23, "traceStream", v37);
  if (!v31)
  {
    unint64_t v32 = 0LL;
    if (a5) {
      goto LABEL_14;
    }
LABEL_16:
    id v33 = 0LL;
    goto LABEL_17;
  }

  unint64_t v32 = v31->var0;
  if (!a5) {
    goto LABEL_16;
  }
LABEL_14:
  id v33 = *a5;
LABEL_17:
  char v34 = StreamMTLNameArray((uint64_t)&v42, v8);
  char v35 = SaveImageFilterFunctionInfo((uint64_t)&v42, (char *)&v39->var0, (int)[v8 count]);
  *(void *)uint64_t v26 = var0;
  *((void *)v26 + 1) = v32;
  *((void *)v26 + 2) = v33;
  v26[24] = v34;
  v26[25] = v35;
  *(_DWORD *)(v26 + 26) = 0;
  *((_WORD *)v26 + 15) = 0;
  uint64_t *v13 = v46;
  *((_BYTE *)v13 + 8) = v47;
  *(_BYTE *)(v44 + 15) |= 8u;

  return v23;
}

- (id)newSharedEvent
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v5;
  s();
  unint64_t v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v28 = v8;
  char v29 = *((_BYTE *)v6 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v10 = -[MTLDeviceSPI newSharedEvent](self->_baseObject, "newSharedEvent");
  if (v10) {
    unint64_t v11 = -[CaptureMTLSharedEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLSharedEvent),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    unint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLSharedEvent traceStream](v11, "traceStream"));
  id v12 = [v10 newSharedEventHandle];
  uint64_t v13 = v26;
  *(_DWORD *)(v26 + 8) = -15996;
  char v14 = v30;
  if (v30 > 0x20uLL)
  {
    uint64_t v16 = *(void *)(v25 + 24);
    uint64_t v17 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v27, v17 | 0x2000000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v30);
    LOBYTE(v30) = v30 + 32;
  }

  *(_BYTE *)(v13 + 13) = v14;
  uint64_t v18 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v20 = -[CaptureMTLSharedEvent traceStream](v11, "traceStream");
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0LL;
  }
  unsigned int v22 = [v12 eventPort];
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v12;
  *((_DWORD *)v15 + 6) = v22;
  *((_DWORD *)v15 + 7) = 0;
  *unint64_t v7 = v28;
  *((_BYTE *)v7 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v11;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v30 = v10;
  char v31 = *((_BYTE *)v8 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v12 = -[MTLDeviceSPI newSharedEventWithHandle:](self->_baseObject, "newSharedEventWithHandle:", v4);
  if (v12) {
    uint64_t v13 = -[CaptureMTLSharedEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLSharedEvent),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLSharedEvent traceStream](v13, "traceStream"));
  uint64_t v14 = v28;
  *(_DWORD *)(v28 + 8) = -15909;
  char v15 = v32;
  if (v32 > 0x18uLL)
  {
    uint64_t v17 = *(void *)(v27 + 24);
    uint64_t v18 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v29, v18 | 0x2800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v32);
    LOBYTE(v32) = v32 + 40;
  }

  *(_BYTE *)(v14 + 13) = v15;
  id v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v21 = -[CaptureMTLSharedEvent traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  id v23 = [v12 signaledValue];
  unsigned int v24 = [v4 eventPort];
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v4;
  *((void *)v16 + 3) = v23;
  *((_DWORD *)v16 + 8) = v24;
  *((_DWORD *)v16 + 9) = 0;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v13;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v38 = v10;
  char v39 = *((_BYTE *)v8 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  id v12 = -[MTLDeviceSPI newSharedEventWithMachPort:](self->_baseObject, "newSharedEventWithMachPort:", v3);
  if (v12) {
    uint64_t v13 = -[CaptureMTLSharedEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLSharedEvent),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLSharedEvent traceStream](v13, "traceStream"));
  uint64_t v14 = v36;
  *(_DWORD *)(v36 + 8) = -15912;
  char v15 = v40;
  if (v40 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v35 + 24);
    uint64_t v18 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v37, v18 | 0x2000000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v40);
    LOBYTE(v40) = v40 + 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  id v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v21 = -[CaptureMTLSharedEvent traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  id v23 = [v12 signaledValue];
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v23;
  *((_DWORD *)v16 + 6) = v3;
  *((_DWORD *)v16 + 7) = 0;
  uint64_t *v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  unsigned int v24 = self->_traceContext;
  -[CaptureMTLSharedEvent traceStream](v13, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v24, (uint64_t)&v34);
  *((_BYTE *)v9 + 8) |= 0x40u;
  id v25 = -[CaptureMTLSharedEvent newSharedEventHandle](v13, "newSharedEventHandle");
  uint64_t v26 = v36;
  *(_DWORD *)(v36 + 8) = -15907;
  char v27 = v40;
  if (v40 > 0x30uLL)
  {
    uint64_t v29 = *(void *)(v35 + 24);
    uint64_t v30 = HIBYTE(v40);
    ++HIBYTE(v40);
    uint64_t v28 = GTTraceMemPool_allocateBytes(v29, v37, v30 | 0x1000000000LL) + 16;
    char v27 = v30;
  }

  else
  {
    uint64_t v28 = (char *)(v26 + v40);
    LOBYTE(v40) = v40 + 16;
  }

  *(_BYTE *)(v26 + 13) = v27;
  char v31 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v31) {
    unint64_t v32 = v31->var0;
  }
  else {
    unint64_t v32 = 0LL;
  }
  *(void *)uint64_t v28 = v32;
  *((void *)v28 + 1) = v25;
  uint64_t *v9 = v38;
  *((_BYTE *)v9 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  return v13;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  char v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v38 = v14;
  char v39 = *((_BYTE *)v12 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapNSArray(v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = -[MTLDeviceSPI newLibraryWithCIFilters:imageFilterFunctionInfo:error:]( baseObject,  "newLibraryWithCIFilters:imageFilterFunctionInfo:error:",  v18,  a4,  a5);

  if (v19) {
    id v20 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v19,  self);
  }
  else {
    id v20 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLLibrary traceStream](v20, "traceStream"));
  uint64_t v21 = v36;
  *(_DWORD *)(v36 + 8) = -16029;
  char v22 = v40;
  if (v40 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v35 + 24);
    uint64_t v25 = HIBYTE(v40);
    ++HIBYTE(v40);
    id v23 = GTTraceMemPool_allocateBytes(v24, v37, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    id v23 = (char *)(v21 + v40);
    LOBYTE(v40) = v40 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLLibraryInfoWithPath((uint64_t)&v34, v19, 0LL);
  uint64_t v26 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLLibrary traceStream](v20, "traceStream");
  if (!v28)
  {
    unint64_t v29 = 0LL;
    if (a5) {
      goto LABEL_14;
    }
LABEL_16:
    id v30 = 0LL;
    goto LABEL_17;
  }

  unint64_t v29 = v28->var0;
  if (!a5) {
    goto LABEL_16;
  }
LABEL_14:
  id v30 = *a5;
LABEL_17:
  char v31 = SaveMTLArray((uint64_t)&v34, v8);
  char v32 = SaveImageFilterFunctionInfo((uint64_t)&v34, (char *)&a4->var0, (int)[v8 count]);
  *(void *)id v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v30;
  v23[24] = v31;
  v23[25] = v32;
  *(_DWORD *)(v23 + 26) = 0;
  *((_WORD *)v23 + 15) = 0;
  uint64_t *v13 = v38;
  *((_BYTE *)v13 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  return v20;
}

- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  char v34 = traceContext;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  unint64_t v37 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v38 = v14;
  char v39 = *((_BYTE *)v12 + 8);
  __int16 v40 = 16400;
  int v41 = 0;
  char v42 = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapNSArray(v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = -[MTLDeviceSPI newLibraryWithCIFiltersForComputePipeline:imageFilterFunctionInfo:error:]( baseObject,  "newLibraryWithCIFiltersForComputePipeline:imageFilterFunctionInfo:error:",  v18,  a4,  a5);

  if (v19) {
    id v20 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v19,  self);
  }
  else {
    id v20 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)-[CaptureMTLLibrary traceStream](v20, "traceStream"));
  uint64_t v21 = v36;
  *(_DWORD *)(v36 + 8) = -16018;
  char v22 = v40;
  if (v40 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v35 + 24);
    uint64_t v25 = HIBYTE(v40);
    ++HIBYTE(v40);
    id v23 = GTTraceMemPool_allocateBytes(v24, v37, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    id v23 = (char *)(v21 + v40);
    LOBYTE(v40) = v40 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLLibraryInfoWithPath((uint64_t)&v34, v19, 0LL);
  uint64_t v26 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLLibrary traceStream](v20, "traceStream");
  if (!v28)
  {
    unint64_t v29 = 0LL;
    if (a5) {
      goto LABEL_14;
    }
LABEL_16:
    id v30 = 0LL;
    goto LABEL_17;
  }

  unint64_t v29 = v28->var0;
  if (!a5) {
    goto LABEL_16;
  }
LABEL_14:
  id v30 = *a5;
LABEL_17:
  char v31 = SaveMTLArray((uint64_t)&v34, v8);
  char v32 = SaveImageFilterFunctionInfo((uint64_t)&v34, (char *)&a4->var0, (int)[v8 count]);
  *(void *)id v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v30;
  v23[24] = v31;
  v23[25] = v32;
  *(_DWORD *)(v23 + 26) = 0;
  *((_WORD *)v23 + 15) = 0;
  uint64_t *v13 = v38;
  *((_BYTE *)v13 + 8) = v39;
  *(_BYTE *)(v36 + 15) |= 8u;

  return v20;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  int v33 = traceContext;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  unint64_t v36 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v37 = v12;
  char v38 = *((_BYTE *)v10 + 8);
  __int16 v39 = 16400;
  int v40 = 0;
  char v41 = 0;
  id v14 = -[MTLDeviceSPI newLibraryWithFile:error:](self->_baseObject, "newLibraryWithFile:error:", v6, a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v33, (uint64_t)-[CaptureMTLLibrary traceStream](v15, "traceStream"));
  uint64_t v16 = v35;
  *(_DWORD *)(v35 + 8) = -16307;
  char v17 = v39;
  if (v39 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v34 + 24);
    uint64_t v20 = HIBYTE(v39);
    ++HIBYTE(v39);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v36, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v39);
    LOBYTE(v39) = v39 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  id v21 = v6;
  SaveMTLLibraryInfoWithPath((uint64_t)&v33, v14, (const char *)[v21 fileSystemRepresentation]);
  char v22 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLLibrary traceStream](v15, "traceStream");
  if (v24)
  {
    unint64_t v25 = v24->var0;
    if (a4)
    {
LABEL_14:
      id v26 = *a4;
      goto LABEL_17;
    }
  }

  else
  {
    unint64_t v25 = 0LL;
    if (a4) {
      goto LABEL_14;
    }
  }

  id v26 = 0LL;
LABEL_17:
  id v27 = v21;
  id v28 = [v27 UTF8String];
  if (v28)
  {
    id v29 = v27;
    id v30 = [v29 UTF8String];
    size_t v31 = strlen((const char *)[v29 UTF8String]);
    LOBYTE(v28) = GTTraceEncoder_storeBytes((uint64_t)&v33, v30, v31 + 1);
  }

  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v25;
  *((void *)v18 + 2) = v26;
  v18[24] = (char)v28;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v37;
  *((_BYTE *)v11 + 8) = v38;
  *(_BYTE *)(v35 + 15) |= 8u;

  return v15;
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  int v40 = traceContext;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  unint64_t v43 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v44 = v14;
  char v45 = *((_BYTE *)v12 + 8);
  __int16 v46 = 16400;
  int v47 = 0;
  char v48 = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapNSArray(v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = -[MTLDeviceSPI newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:]( baseObject,  "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:",  v18,  a4,  a5);

  __int16 v39 = ($D92F08544D6F25E5EC20014A7976C0F4 *)a4;
  if (v19) {
    uint64_t v20 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:captureFunctions:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:captureFunctions:",  v19,  self,  v8);
  }
  else {
    uint64_t v20 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v40, (uint64_t)-[CaptureMTLLibrary traceStream](v20, "traceStream", v39));
  uint64_t v21 = v42;
  *(_DWORD *)(v42 + 8) = -15847;
  char v22 = v46;
  if (v46 > 0x18uLL)
  {
    uint64_t v24 = *(void *)(v41 + 24);
    uint64_t v25 = HIBYTE(v46);
    ++HIBYTE(v46);
    id v23 = GTTraceMemPool_allocateBytes(v24, v43, v25 | 0x2800000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    id v23 = (char *)(v21 + v46);
    LOBYTE(v46) = v46 + 40;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLLibraryInfoWithPath((uint64_t)&v40, v19, 0LL);
  id v26 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v28 = -[CaptureMTLLibrary traceStream](v20, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  id v30 = [v8 count];
  if (a5) {
    id v31 = *a5;
  }
  else {
    id v31 = 0LL;
  }
  id v32 = [v8 count];
  __chkstk_darwin(v32, v33);
  char v35 = StreamNSArray((uint64_t)&v40, ($D92F08544D6F25E5EC20014A7976C0F4 **)((char *)&v39 - v34), v8);
  int v36 = [v8 count];
  char v37 = SaveImageFilterFunctionInfo((uint64_t)&v40, (char *)&v39->var0, v36);
  *(void *)id v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v30;
  *((void *)v23 + 3) = v31;
  v23[32] = v35;
  v23[33] = v37;
  *(_DWORD *)(v23 + 34) = 0;
  *((_WORD *)v23 + 19) = 0;
  uint64_t *v13 = v44;
  *((_BYTE *)v13 + 8) = v45;
  *(_BYTE *)(v42 + 15) |= 8u;

  return v20;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  unint64_t v43 = traceContext;
  uint64_t v44 = 0LL;
  uint64_t v45 = 0LL;
  unint64_t v46 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v47 = v15;
  char v48 = *((_BYTE *)v13 + 8);
  __int16 v49 = 16400;
  int v50 = 0;
  char v51 = 0;
  if (v9)
  {
    id v17 = unwrapMTLCompileOptions(v9);
    uint64_t v18 = (MTLCompileOptions *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
  }

  id v19 = v18;
  -[MTLCompileOptions setDebuggingEnabled:](v18, "setDebuggingEnabled:", 1LL);
  id v20 = -[MTLDeviceSPI newLibraryWithSource:options:error:]( self->_baseObject,  "newLibraryWithSource:options:error:",  v8,  v19,  a5);
  id v42 = v8;
  if (v20) {
    uint64_t v21 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v20,  self);
  }
  else {
    uint64_t v21 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v43, (uint64_t)-[CaptureMTLLibrary traceStream](v21, "traceStream"));
  -[CaptureMTLLibrary setOptions:](v21, "setOptions:", v9);
  uint64_t v22 = v45;
  *(_DWORD *)(v45 + 8) = -16305;
  char v23 = v49;
  if (v49 > 0x20uLL)
  {
    uint64_t v25 = *(void *)(v44 + 24);
    uint64_t v26 = HIBYTE(v49);
    ++HIBYTE(v49);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, v46, v26 | 0x2000000000LL) + 16;
    char v23 = v26;
  }

  else
  {
    uint64_t v24 = (char *)(v22 + v49);
    LOBYTE(v49) = v49 + 32;
  }

  *(_BYTE *)(v22 + 13) = v23;
  SaveMTLLibraryInfoWithPath((uint64_t)&v43, v20, 0LL);
  id v27 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v29 = -[CaptureMTLLibrary traceStream](v21, "traceStream");
  if (v29)
  {
    unint64_t v31 = v29->var0;
    if (a5)
    {
LABEL_17:
      id v32 = *a5;
      goto LABEL_20;
    }
  }

  else
  {
    unint64_t v31 = 0LL;
    if (a5) {
      goto LABEL_17;
    }
  }

  id v32 = 0LL;
LABEL_20:
  uint64_t v33 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v30);
  if ((objc_opt_isKindOfClass(v20, v33) & 1) != 0)
  {
    RetainDebugObject(v20);
    char v34 = 0;
  }

  else
  {
    uint64_t v41 = v19;
    unint64_t v35 = var0;
    id v36 = v42;
    id v37 = [v36 UTF8String];
    if (v36) {
      uint64_t v38 = strlen((const char *)[v36 UTF8String]) + 1;
    }
    else {
      uint64_t v38 = 0LL;
    }
    unint64_t var0 = v35;
    char v34 = GTTraceEncoder_storeBlob((uint64_t)&v43, v37, v38);
    id v19 = v41;
  }

  char v39 = SaveMTLCompileOptions((uint64_t)&v43, v9);
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v31;
  *((void *)v24 + 2) = v32;
  v24[24] = v34;
  v24[25] = v39;
  *(_DWORD *)(v24 + 26) = 0;
  *((_WORD *)v24 + 15) = 0;
  *uint64_t v14 = v47;
  *((_BYTE *)v14 + 8) = v48;
  *(_BYTE *)(v45 + 15) |= 8u;

  return v21;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 copy];
  if (v8)
  {
    id v11 = unwrapMTLCompileOptions(v8);
    unint64_t v12 = (MTLCompileOptions *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    unint64_t v12 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
  }

  uint64_t v13 = v12;
  -[MTLCompileOptions setDebuggingEnabled:](v12, "setDebuggingEnabled:", 1LL);
  uint64_t v14 = self;
  baseObject = v14->_baseObject;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __67__CaptureMTLDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v20[3] = &unk_20D5D8;
  uint64_t v21 = v14;
  id v22 = v8;
  id v23 = v10;
  id v24 = v9;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v19 = v14;
  -[MTLDeviceSPI newLibraryWithSource:options:completionHandler:]( baseObject,  "newLibraryWithSource:options:completionHandler:",  v17,  v13,  v20);
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v33 = traceContext;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  unint64_t v36 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v37 = v12;
  char v38 = *((_BYTE *)v10 + 8);
  __int16 v39 = 16400;
  int v40 = 0;
  char v41 = 0;
  id v14 = -[MTLDeviceSPI newLibraryWithURL:error:](self->_baseObject, "newLibraryWithURL:error:", v6, a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v33, (uint64_t)-[CaptureMTLLibrary traceStream](v15, "traceStream"));
  uint64_t v16 = v35;
  *(_DWORD *)(v35 + 8) = -16039;
  char v17 = v39;
  if (v39 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v34 + 24);
    uint64_t v20 = HIBYTE(v39);
    ++HIBYTE(v39);
    id v18 = GTTraceMemPool_allocateBytes(v19, v36, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    id v18 = (char *)(v16 + v39);
    LOBYTE(v39) = v39 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  id v21 = v6;
  SaveMTLLibraryInfoWithPath((uint64_t)&v33, v14, (const char *)[v21 fileSystemRepresentation]);
  id v22 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v24 = -[CaptureMTLLibrary traceStream](v15, "traceStream");
  if (v24)
  {
    unint64_t v25 = v24->var0;
    if (a4)
    {
LABEL_14:
      id v26 = *a4;
      goto LABEL_17;
    }
  }

  else
  {
    unint64_t v25 = 0LL;
    if (a4) {
      goto LABEL_14;
    }
  }

  id v26 = 0LL;
LABEL_17:
  id v27 = v21;
  id v28 = [v27 fileSystemRepresentation];
  if (v28)
  {
    id v29 = v27;
    id v30 = [v29 fileSystemRepresentation];
    size_t v31 = strlen((const char *)[v29 fileSystemRepresentation]);
    LOBYTE(v28) = GTTraceEncoder_storeBytes((uint64_t)&v33, v30, v31 + 1);
  }

  *(void *)id v18 = var0;
  *((void *)v18 + 1) = v25;
  *((void *)v18 + 2) = v26;
  v18[24] = (char)v28;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v37;
  *((_BYTE *)v11 + 8) = v38;
  *(_BYTE *)(v35 + 15) |= 8u;

  return v15;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLRenderPipelineDescriptor(v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  BOOL isBaseObjectDebugDevice = v8->_isBaseObjectDebugDevice;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pipelineLibrary]);
  uint64_t v14 = 65539LL;
  v19[0] = _NSConcreteStackBlock;
  if (!v13) {
    uint64_t v14 = 327683LL;
  }
  v19[1] = 3221225472LL;
  v19[2] = __75__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v19[3] = &unk_20D600;
  if (isBaseObjectDebugDevice) {
    uint64_t v15 = 0LL;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v20 = v8;
  id v21 = v8;
  id v22 = v7;
  id v23 = v6;
  id v16 = v6;
  id v17 = v7;
  id v18 = v8;
  -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:options:completionHandler:]( baseObject,  "newRenderPipelineStateWithDescriptor:options:completionHandler:",  v11,  v15,  v19);
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = self;
  baseObject = v10->_baseObject;
  id v12 = unwrapMTLRenderPipelineDescriptor(v9);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  uint64_t v16 = 65539LL;
  v21[0] = _NSConcreteStackBlock;
  v21[2] = __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v21[3] = &unk_20D650;
  v21[1] = 3221225472LL;
  if (!v15) {
    uint64_t v16 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v17 = a4;
  }
  else {
    unint64_t v17 = v16 | a4 & 4;
  }
  id v22 = v10;
  id v23 = v10;
  id v25 = v8;
  unint64_t v26 = a4;
  id v24 = v9;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = v10;
  -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:options:completionHandler:]( baseObject,  "newRenderPipelineStateWithDescriptor:options:completionHandler:",  v13,  v17,  v21);
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  BOOL v11 = !v8->_isBaseObjectDebugDevice;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  if (v11) {
    uint64_t v12 = 327683LL;
  }
  else {
    uint64_t v12 = 0LL;
  }
  v16[2] = __74__CaptureMTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v16[3] = &unk_20D678;
  unint64_t v17 = v8;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = v8;
  -[MTLDeviceSPI newComputePipelineStateWithFunction:options:completionHandler:]( baseObject,  "newComputePipelineStateWithFunction:options:completionHandler:",  v10,  v12,  v16);
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self;
  baseObject = v10->_baseObject;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  BOOL v13 = !v10->_isBaseObjectDebugDevice;
  v18[0] = _NSConcreteStackBlock;
  if (v13) {
    unint64_t v14 = a4 & 4 | 0x50003;
  }
  else {
    unint64_t v14 = a4;
  }
  v18[1] = 3221225472LL;
  v18[2] = __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v18[3] = &unk_20D6C8;
  id v19 = v10;
  id v20 = v8;
  id v21 = v9;
  unint64_t v22 = a4;
  id v15 = v9;
  id v16 = v8;
  unint64_t v17 = v10;
  -[MTLDeviceSPI newComputePipelineStateWithFunction:options:completionHandler:]( baseObject,  "newComputePipelineStateWithFunction:options:completionHandler:",  v12,  v14,  v18);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = self;
  id v11 = unwrapMTLComputePipelineDescriptor(v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  baseObject = v10->_baseObject;
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  v23[0] = _NSConcreteStackBlock;
  v23[2] = __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v23[3] = &unk_20D6F0;
  uint64_t v16 = 327683LL;
  v23[1] = 3221225472LL;
  if (v15) {
    uint64_t v16 = 65539LL;
  }
  unint64_t v17 = v16 | a4 & 4;
  if (isBaseObjectDebugDevice) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = v17;
  }
  id v24 = v10;
  id v25 = v10;
  id v26 = v9;
  id v27 = v12;
  id v28 = v8;
  unint64_t v29 = a4;
  id v19 = v8;
  id v20 = v12;
  id v21 = v9;
  unint64_t v22 = v10;
  -[MTLDeviceSPI newComputePipelineStateWithDescriptor:options:completionHandler:]( baseObject,  "newComputePipelineStateWithDescriptor:options:completionHandler:",  v20,  v18,  v23);
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  id v42 = traceContext;
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  unint64_t v45 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v46 = v12;
  char v47 = *((_BYTE *)v10 + 8);
  __int16 v48 = 16400;
  int v49 = 0;
  char v50 = 0;
  id v14 = unwrapMTLComputePipelineDescriptor(v6);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  baseObject = self->_baseObject;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 pipelineLibrary]);
  uint64_t v19 = 65539LL;
  if (!v18) {
    uint64_t v19 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v20 = 0LL;
  }
  else {
    uint64_t v20 = v19;
  }
  id v41 = 0LL;
  id v21 = -[MTLDeviceSPI newComputePipelineStateWithDescriptor:options:reflection:error:]( baseObject,  "newComputePipelineStateWithDescriptor:options:reflection:error:",  v15,  v20,  &v41,  a4);
  id v22 = v41;

  if (v21) {
    id v23 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v21,  self);
  }
  else {
    id v23 = 0LL;
  }
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:withDescriptor:",  v21,  v6));

  -[CaptureMTLComputePipelineState setDescriptor:](v23, "setDescriptor:", v24);
  GTTraceEncoder_setStream((uint64_t *)&v42, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v23, "traceStream"));
  uint64_t v25 = v44;
  *(_DWORD *)(v44 + 8) = -16200;
  char v26 = v48;
  if (v48 > 0x20uLL)
  {
    uint64_t v28 = *(void *)(v43 + 24);
    id v40 = v21;
    unint64_t v29 = v11;
    id v30 = v15;
    id v31 = v22;
    id v32 = a4;
    uint64_t v33 = HIBYTE(v48);
    ++HIBYTE(v48);
    id v27 = GTTraceMemPool_allocateBytes(v28, v45, v33 | 0x2000000000LL) + 16;
    char v26 = v33;
    a4 = v32;
    id v22 = v31;
    id v15 = v30;
    id v11 = v29;
    id v21 = v40;
  }

  else
  {
    id v27 = (char *)(v25 + v48);
    LOBYTE(v48) = v48 + 32;
  }

  *(_BYTE *)(v25 + 13) = v26;
  SaveMTLComputePipelineReflection((uint64_t)&v42, v21, v22, v15, 0LL);
  uint64_t v34 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v34) {
    unint64_t var0 = v34->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v36 = -[CaptureMTLComputePipelineState traceStream](v23, "traceStream", v40);
  if (!v36)
  {
    unint64_t v37 = 0LL;
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  unint64_t v37 = v36->var0;
  if (a4) {
LABEL_21:
  }
    a4 = (id *)*a4;
LABEL_22:
  char v38 = SaveMTLComputePipelineDescriptor((uint64_t)&v42, v24);
  *(void *)id v27 = var0;
  *((void *)v27 + 1) = v37;
  *((void *)v27 + 2) = a4;
  v27[24] = v38;
  *(_DWORD *)(v27 + 25) = 0;
  *((_DWORD *)v27 + 7) = 0;
  uint64_t *v11 = v46;
  *((_BYTE *)v11 + 8) = v47;
  *(_BYTE *)(v44 + 15) |= 8u;

  return v23;
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = unwrapMTLComputePipelineDescriptor(v9);
  char v50 = (void *)objc_claimAutoreleasedReturnValue(v10);
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v13 = __ldaxr(p_var2);
  while (__stlxr(v13 + 1, p_var2));
  v54 = traceContext;
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  unint64_t v57 = v13;
  s();
  uint64_t v15 = *v14;
  *id v14 = v16;
  uint64_t v58 = v15;
  __int16 v48 = v14;
  char v59 = *((_BYTE *)v14 + 8);
  __int16 v60 = 16400;
  int v61 = 0;
  char v62 = 0;
  baseObject = self->_baseObject;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  uint64_t v20 = 65539LL;
  if (!v19) {
    uint64_t v20 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v21 = a4;
  }
  else {
    unint64_t v21 = v20 | a4 & 4;
  }
  id v53 = 0LL;
  id v22 = -[MTLDeviceSPI newComputePipelineStateWithDescriptor:options:reflection:error:]( baseObject,  "newComputePipelineStateWithDescriptor:options:reflection:error:",  v50,  v21,  &v53,  a6);
  id v23 = v53;

  if (v22) {
    id v24 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v22,  self);
  }
  else {
    id v24 = 0LL;
  }
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:withDescriptor:",  v22,  v9));
  -[CaptureMTLComputePipelineState setDescriptor:](v24, "setDescriptor:", v25);
  char v51 = v25;
  int v49 = a6;
  GTTraceEncoder_setStream((uint64_t *)&v54, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v24, "traceStream"));
  uint64_t v26 = v56;
  *(_DWORD *)(v56 + 8) = -16199;
  char v27 = v60;
  if (v60 > 0x18uLL)
  {
    uint64_t v29 = *(void *)(v55 + 24);
    uint64_t v30 = HIBYTE(v60);
    ++HIBYTE(v60);
    uint64_t v28 = GTTraceMemPool_allocateBytes(v29, v57, v30 | 0x2800000000LL) + 16;
    char v27 = v30;
  }

  else
  {
    uint64_t v28 = (char *)(v26 + v60);
    LOBYTE(v60) = v60 + 40;
  }

  *(_BYTE *)(v26 + 13) = v27;
  SaveMTLComputePipelineReflection((uint64_t)&v54, v22, v23, v50, 0LL);
  id v31 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v31) {
    unint64_t var0 = v31->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v33 = -[CaptureMTLComputePipelineState traceStream](v24, "traceStream");
  if (v33) {
    unint64_t v34 = v33->var0;
  }
  else {
    unint64_t v34 = 0LL;
  }
  uint64_t v35 = v9;
  if (v49) {
    id v36 = *v49;
  }
  else {
    id v36 = 0LL;
  }
  char v37 = SaveMTLComputePipelineDescriptor((uint64_t)&v54, v51);
  *(void *)uint64_t v28 = var0;
  *((void *)v28 + 1) = v34;
  *((void *)v28 + 2) = a4;
  *((void *)v28 + 3) = v36;
  v28[32] = v37;
  *(_DWORD *)(v28 + 33) = 0;
  *((_DWORD *)v28 + 9) = 0;
  if (a4 && a5)
  {
    if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      id v38 = DEVICEOBJECT(self->_baseObject);
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      id v40 = deviceMTLComputePipelineDescriptorWithoutResourceIndex(v35);
      id v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      id v52 = v23;
      id v42 = [v39 newComputePipelineStateWithDescriptor:v41 options:a4 reflection:&v52 error:v49];
      id v43 = v52;

      id v23 = v43;
    }

    uint64_t v44 = v50;
    unint64_t v45 = v48;
    id v23 = v23;
    *a5 = v23;
  }

  else
  {
    uint64_t v44 = v50;
    unint64_t v45 = v48;
  }

  *unint64_t v45 = v58;
  *((_BYTE *)v45 + 8) = v59;
  *(_BYTE *)(v56 + 15) |= 8u;

  return v24;
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v35 = traceContext;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  unint64_t v38 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v39 = v12;
  char v40 = *((_BYTE *)v10 + 8);
  __int16 v41 = 16400;
  int v42 = 0;
  char v43 = 0;
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  if (self->_isBaseObjectDebugDevice) {
    uint64_t v16 = 0LL;
  }
  else {
    uint64_t v16 = 327683LL;
  }
  id v34 = 0LL;
  id v17 = -[MTLDeviceSPI newComputePipelineStateWithFunction:options:reflection:error:]( baseObject,  "newComputePipelineStateWithFunction:options:reflection:error:",  v15,  v16,  &v34,  a4);
  id v18 = v34;

  if (v17) {
    uint64_t v19 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v17,  self);
  }
  else {
    uint64_t v19 = 0LL;
  }
  -[CaptureMTLComputePipelineState setFunction:](v19, "setFunction:", v6);
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v19, "traceStream"));
  uint64_t v20 = v37;
  *(_DWORD *)(v37 + 8) = -16299;
  char v21 = v41;
  if (v41 > 0x20uLL)
  {
    uint64_t v23 = *(void *)(v36 + 24);
    uint64_t v24 = HIBYTE(v41);
    ++HIBYTE(v41);
    id v22 = GTTraceMemPool_allocateBytes(v23, v38, v24 | 0x2000000000LL) + 16;
    char v21 = v24;
  }

  else
  {
    id v22 = (char *)(v20 + v41);
    LOBYTE(v41) = v41 + 32;
  }

  *(_BYTE *)(v20 + 13) = v21;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  SaveMTLComputePipelineReflection((uint64_t)&v35, v17, v18, 0LL, v25);

  uint64_t v26 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLComputePipelineState traceStream](v19, "traceStream");
  if (v28) {
    unint64_t v29 = v28->var0;
  }
  else {
    unint64_t v29 = 0LL;
  }
  uint64_t v30 = (uint64_t *)[v6 traceStream];
  if (!v30)
  {
    uint64_t v31 = 0LL;
    if (a4) {
      goto LABEL_20;
    }
LABEL_22:
    id v32 = 0LL;
    goto LABEL_23;
  }

  uint64_t v31 = *v30;
  if (!a4) {
    goto LABEL_22;
  }
LABEL_20:
  id v32 = *a4;
LABEL_23:
  *(void *)id v22 = var0;
  *((void *)v22 + 1) = v29;
  *((void *)v22 + 2) = v31;
  *((void *)v22 + 3) = v32;
  uint64_t *v11 = v39;
  *((_BYTE *)v11 + 8) = v40;
  *(_BYTE *)(v37 + 15) |= 8u;

  return v19;
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  char v47 = traceContext;
  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  unint64_t v50 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v51 = v15;
  char v52 = *((_BYTE *)v13 + 8);
  __int16 v53 = 16400;
  int v54 = 0;
  char v55 = 0;
  baseObject = self->_baseObject;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v19 = a4;
  }
  else {
    unint64_t v19 = a4 & 4 | 0x50003;
  }
  id v46 = 0LL;
  id v20 = -[MTLDeviceSPI newComputePipelineStateWithFunction:options:reflection:error:]( baseObject,  "newComputePipelineStateWithFunction:options:reflection:error:",  v18,  v19,  &v46,  a6);
  id v21 = v46;

  if (v20) {
    id v22 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v20,  self);
  }
  else {
    id v22 = 0LL;
  }
  -[CaptureMTLComputePipelineState setFunction:](v22, "setFunction:", v9, a5);
  GTTraceEncoder_setStream((uint64_t *)&v47, (uint64_t)-[CaptureMTLComputePipelineState traceStream](v22, "traceStream"));
  uint64_t v23 = v49;
  *(_DWORD *)(v49 + 8) = -16298;
  char v24 = v53;
  if (v53 > 0x10uLL)
  {
    uint64_t v26 = *(void *)(v48 + 24);
    uint64_t v27 = HIBYTE(v53);
    ++HIBYTE(v53);
    uint64_t v25 = GTTraceMemPool_allocateBytes(v26, v50, v27 | 0x3000000000LL) + 16;
    char v24 = v27;
  }

  else
  {
    uint64_t v25 = (char *)(v23 + v53);
    LOBYTE(v53) = v53 + 48;
  }

  *(_BYTE *)(v23 + 13) = v24;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);
  SaveMTLComputePipelineReflection((uint64_t)&v47, v20, v21, 0LL, v28);

  unint64_t v29 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v31 = -[CaptureMTLComputePipelineState traceStream](v22, "traceStream");
  if (v31) {
    unint64_t v32 = v31->var0;
  }
  else {
    unint64_t v32 = 0LL;
  }
  uint64_t v33 = (uint64_t *)[v9 traceStream];
  if (v33) {
    uint64_t v34 = *v33;
  }
  else {
    uint64_t v34 = 0LL;
  }
  if (a6) {
    id v35 = *a6;
  }
  else {
    id v35 = 0LL;
  }
  *(void *)uint64_t v25 = var0;
  *((void *)v25 + 1) = v32;
  *((void *)v25 + 2) = v34;
  *((void *)v25 + 3) = a4;
  *((void *)v25 + 4) = v35;
  *((void *)v25 + 5) = 0LL;
  if (a4 && v43)
  {
    if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      id v36 = DEVICEOBJECT(self->_baseObject);
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      id v38 = DEVICEOBJECT(v9);
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      id v45 = v21;
      id v40 = [v37 newComputePipelineStateWithFunction:v39 options:a4 reflection:&v45 error:a6];
      id v41 = v45;

      id v21 = v41;
    }

    id v21 = v21;
    *char v43 = v21;
  }

  *id v14 = v51;
  *((_BYTE *)v14 + 8) = v52;
  *(_BYTE *)(v49 + 15) |= 8u;

  return v22;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v39 = traceContext;
  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  unint64_t v42 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v43 = v12;
  char v44 = *((_BYTE *)v10 + 8);
  __int16 v45 = 16400;
  int v46 = 0;
  char v47 = 0;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 pipelineLibrary]);
  uint64_t v16 = 65539LL;
  if (!v15) {
    uint64_t v16 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v17 = 0LL;
  }
  else {
    uint64_t v17 = v16;
  }

  baseObject = self->_baseObject;
  id v19 = unwrapMTLRenderPipelineDescriptor(v6);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v38 = 0LL;
  id v21 = -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithDescriptor:options:reflection:error:",  v20,  v17,  &v38,  a4);
  id v22 = v38;

  if (v21) {
    uint64_t v23 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v21,  self);
  }
  else {
    uint64_t v23 = 0LL;
  }
  char v24 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withDescriptor:",  v21,  v6));

  -[CaptureMTLRenderPipelineState setDescriptor:](v23, "setDescriptor:", v24);
  if (([v24 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v24 supportAddingFragmentBinaryFunctions])
  {
    -[CaptureMTLRenderPipelineState setReflection:](v23, "setReflection:", v22);
  }

  GTTraceEncoder_setStream((uint64_t *)&v39, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v23, "traceStream"));
  uint64_t v25 = v41;
  *(_DWORD *)(v41 + 8) = -16303;
  char v26 = v45;
  if (v45 > 0x20uLL)
  {
    uint64_t v28 = *(void *)(v40 + 24);
    uint64_t v29 = HIBYTE(v45);
    ++HIBYTE(v45);
    uint64_t v27 = GTTraceMemPool_allocateBytes(v28, v42, v29 | 0x2000000000LL) + 16;
    char v26 = v29;
  }

  else
  {
    uint64_t v27 = (char *)(v25 + v45);
    LOBYTE(v45) = v45 + 32;
  }

  *(_BYTE *)(v25 + 13) = v26;
  id DynamicLibrariesForRenderPipelineDescriptor = LoadDynamicLibrariesForRenderPipelineDescriptor(v24);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v39, v21, v22, v31);

  unint64_t v32 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v32) {
    unint64_t var0 = v32->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v34 = -[CaptureMTLRenderPipelineState traceStream](v23, "traceStream");
  if (!v34)
  {
    unint64_t v35 = 0LL;
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  unint64_t v35 = v34->var0;
  if (a4) {
LABEL_22:
  }
    a4 = (id *)*a4;
LABEL_23:
  char v36 = SaveMTLRenderPipelineDescriptor((uint64_t)&v39, v24);
  *(void *)uint64_t v27 = var0;
  *((void *)v27 + 1) = v35;
  *((void *)v27 + 2) = a4;
  v27[24] = v36;
  *(_DWORD *)(v27 + 25) = 0;
  *((_DWORD *)v27 + 7) = 0;
  uint64_t *v11 = v43;
  *((_BYTE *)v11 + 8) = v44;
  *(_BYTE *)(v41 + 15) |= 8u;

  return v23;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  uint64_t v58 = traceContext;
  uint64_t v59 = 0LL;
  uint64_t v60 = 0LL;
  unint64_t v61 = v12;
  s();
  id v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v62 = v15;
  char v63 = *((_BYTE *)v13 + 8);
  __int16 v64 = 16400;
  int v65 = 0;
  char v66 = 0;
  baseObject = self->_baseObject;
  id v18 = unwrapMTLRenderPipelineDescriptor(v9);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  uint64_t v22 = 65539LL;
  if (!v21) {
    uint64_t v22 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v23 = a4;
  }
  else {
    unint64_t v23 = v22 | a4 & 4;
  }
  id v57 = 0LL;
  id v24 = -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithDescriptor:options:reflection:error:",  v19,  v23,  &v57,  a6,  a5);
  id v25 = v57;

  if (v24) {
    char v26 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v24,  self);
  }
  else {
    char v26 = 0LL;
  }
  char v55 = a6;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withDescriptor:",  v24,  v9));
  -[CaptureMTLRenderPipelineState setDescriptor:](v26, "setDescriptor:", v27);
  if (([v27 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v27 supportAddingFragmentBinaryFunctions])
  {
    -[CaptureMTLRenderPipelineState setReflection:](v26, "setReflection:", v25);
  }

  unint64_t v54 = a4;
  GTTraceEncoder_setStream((uint64_t *)&v58, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v26, "traceStream"));
  uint64_t v28 = v60;
  *(_DWORD *)(v60 + 8) = -16302;
  char v29 = v64;
  if (v64 > 0x18uLL)
  {
    uint64_t v31 = *(void *)(v59 + 24);
    uint64_t v32 = HIBYTE(v64);
    ++HIBYTE(v64);
    uint64_t v30 = GTTraceMemPool_allocateBytes(v31, v61, v32 | 0x2800000000LL) + 16;
    char v29 = v32;
  }

  else
  {
    uint64_t v30 = (char *)(v28 + v64);
    LOBYTE(v64) = v64 + 40;
  }

  *(_BYTE *)(v28 + 13) = v29;
  id DynamicLibrariesForRenderPipelineDescriptor = LoadDynamicLibrariesForRenderPipelineDescriptor(v27);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v58, v24, v25, v34);

  unint64_t v35 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v35) {
    unint64_t var0 = v35->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v37 = -[CaptureMTLRenderPipelineState traceStream](v26, "traceStream");
  __int16 v53 = v14;
  if (v37) {
    unint64_t v38 = v37->var0;
  }
  else {
    unint64_t v38 = 0LL;
  }
  uint64_t v39 = v9;
  if (v55) {
    id v40 = *v55;
  }
  else {
    id v40 = 0LL;
  }
  char v41 = SaveMTLRenderPipelineDescriptor((uint64_t)&v58, v27);
  *(void *)uint64_t v30 = var0;
  *((void *)v30 + 1) = v38;
  *((void *)v30 + 2) = v54;
  *((void *)v30 + 3) = v40;
  v30[32] = v41;
  *(_DWORD *)(v30 + 33) = 0;
  *((_DWORD *)v30 + 9) = 0;
  unint64_t v42 = v39;
  if (v54 && v52)
  {
    if ((~(_BYTE)v54 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      id v43 = DEVICEOBJECT(self->_baseObject);
      char v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      id v45 = deviceMTLRenderPipelineDescriptorWithoutResourceIndex(v39);
      int v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      id v56 = v25;
      id v47 = [v44 newRenderPipelineStateWithDescriptor:v46 options:v54 reflection:&v56 error:v55];
      id v48 = v56;

      id v25 = v48;
    }

    uint64_t v49 = v53;
    id v25 = v25;
    *char v52 = v25;
  }

  else
  {
    uint64_t v49 = v53;
  }

  *uint64_t v49 = v62;
  *((_BYTE *)v49 + 8) = v63;
  *(_BYTE *)(v60 + 15) |= 8u;

  return v26;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v37 = traceContext;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  unint64_t v40 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v41 = v12;
  char v42 = *((_BYTE *)v10 + 8);
  __int16 v43 = 16400;
  int v44 = 0;
  char v45 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLMeshRenderPipelineDescriptor(v6);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 pipelineLibrary]);
  uint64_t v19 = 65539LL;
  if (!v18) {
    uint64_t v19 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v20 = 0LL;
  }
  else {
    uint64_t v20 = v19;
  }
  id v36 = 0LL;
  id v21 = -[MTLDeviceSPI newRenderPipelineStateWithMeshDescriptor:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:",  v16,  v20,  &v36,  a4);
  id v22 = v36;

  if (v21) {
    unint64_t v23 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v21,  self);
  }
  else {
    unint64_t v23 = 0LL;
  }
  id v24 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withMeshDescriptor:]( self,  "dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withMeshDescriptor:",  v21,  v6));

  -[CaptureMTLRenderPipelineState setMeshDescriptor:](v23, "setMeshDescriptor:", v24);
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v23, "traceStream"));
  uint64_t v25 = v39;
  *(_DWORD *)(v39 + 8) = -15405;
  char v26 = v43;
  if (v43 > 0x20uLL)
  {
    uint64_t v28 = *(void *)(v38 + 24);
    uint64_t v29 = HIBYTE(v43);
    ++HIBYTE(v43);
    uint64_t v27 = GTTraceMemPool_allocateBytes(v28, v40, v29 | 0x2000000000LL) + 16;
    char v26 = v29;
  }

  else
  {
    uint64_t v27 = (char *)(v25 + v43);
    LOBYTE(v43) = v43 + 32;
  }

  *(_BYTE *)(v25 + 13) = v26;
  SaveMTLRenderPipelineReflection((uint64_t)&v37, v21, v22, 0LL);
  uint64_t v30 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v32 = -[CaptureMTLRenderPipelineState traceStream](v23, "traceStream");
  if (!v32)
  {
    unint64_t v33 = 0LL;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  unint64_t v33 = v32->var0;
  if (a4) {
LABEL_19:
  }
    a4 = (id *)*a4;
LABEL_20:
  char v34 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v37, v24);
  *(void *)uint64_t v27 = var0;
  *((void *)v27 + 1) = v33;
  *((void *)v27 + 2) = a4;
  v27[24] = v34;
  *(_DWORD *)(v27 + 25) = 0;
  *((_DWORD *)v27 + 7) = 0;
  uint64_t *v11 = v41;
  *((_BYTE *)v11 + 8) = v42;
  *(_BYTE *)(v39 + 15) |= 8u;

  return v23;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLMeshRenderPipelineDescriptor(v7);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  BOOL isBaseObjectDebugDevice = v8->_isBaseObjectDebugDevice;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pipelineLibrary]);
  uint64_t v14 = 65539LL;
  v19[0] = _NSConcreteStackBlock;
  if (!v13) {
    uint64_t v14 = 327683LL;
  }
  v19[1] = 3221225472LL;
  v19[2] = __79__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v19[3] = &unk_20D600;
  if (isBaseObjectDebugDevice) {
    uint64_t v15 = 0LL;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v20 = v8;
  id v21 = v8;
  id v22 = v7;
  id v23 = v6;
  id v16 = v6;
  id v17 = v7;
  id v18 = v8;
  -[MTLDeviceSPI newRenderPipelineStateWithMeshDescriptor:options:completionHandler:]( baseObject,  "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:",  v11,  v15,  v19);
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  __int16 v53 = traceContext;
  uint64_t v54 = 0LL;
  uint64_t v55 = 0LL;
  unint64_t v56 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v57 = v15;
  char v58 = *((_BYTE *)v13 + 8);
  __int16 v59 = 16400;
  int v60 = 0;
  char v61 = 0;
  baseObject = self->_baseObject;
  id v18 = unwrapMTLMeshRenderPipelineDescriptor(v9);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  uint64_t v22 = 65539LL;
  if (!v21) {
    uint64_t v22 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v23 = a4;
  }
  else {
    unint64_t v23 = v22 | a4 & 4;
  }
  id v52 = 0LL;
  id v24 = -[MTLDeviceSPI newRenderPipelineStateWithMeshDescriptor:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:",  v19,  v23,  &v52,  a6,  a5);
  id v25 = v52;

  id v48 = a6;
  if (v24) {
    char v26 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v24,  self);
  }
  else {
    char v26 = 0LL;
  }
  uint64_t v49 = v9;
  unint64_t v50 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withMeshDescriptor:]( self,  "dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:withMeshDescriptor:",  v24,  v9));
  -[CaptureMTLRenderPipelineState setMeshDescriptor:](v26, "setMeshDescriptor:");
  GTTraceEncoder_setStream((uint64_t *)&v53, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v26, "traceStream"));
  uint64_t v27 = v55;
  *(_DWORD *)(v55 + 8) = -15403;
  char v28 = v59;
  if (v59 > 0x18uLL)
  {
    uint64_t v30 = *(void *)(v54 + 24);
    uint64_t v31 = HIBYTE(v59);
    ++HIBYTE(v59);
    uint64_t v29 = GTTraceMemPool_allocateBytes(v30, v56, v31 | 0x2800000000LL) + 16;
    char v28 = v31;
  }

  else
  {
    uint64_t v29 = (char *)(v27 + v59);
    LOBYTE(v59) = v59 + 40;
  }

  *(_BYTE *)(v27 + 13) = v28;
  SaveMTLRenderPipelineReflection((uint64_t)&v53, v24, v25, 0LL);
  uint64_t v32 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v32) {
    unint64_t var0 = v32->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v34 = -[CaptureMTLRenderPipelineState traceStream](v26, "traceStream");
  if (v34) {
    unint64_t v35 = v34->var0;
  }
  else {
    unint64_t v35 = 0LL;
  }
  if (v48) {
    id v36 = *v48;
  }
  else {
    id v36 = 0LL;
  }
  char v37 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v53, v50);
  *(void *)uint64_t v29 = var0;
  *((void *)v29 + 1) = v35;
  *((void *)v29 + 2) = a4;
  *((void *)v29 + 3) = v36;
  v29[32] = v37;
  *(_DWORD *)(v29 + 33) = 0;
  *((_DWORD *)v29 + 9) = 0;
  if (a4)
  {
    uint64_t v38 = v49;
    if (v47)
    {
      if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        id v39 = DEVICEOBJECT(self->_baseObject);
        unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        id v41 = deviceMTLMeshRenderPipelineDescriptorWithoutResourceIndex(v49);
        char v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v51 = v25;
        id v43 = [v40 newRenderPipelineStateWithMeshDescriptor:v42 options:a4 reflection:&v51 error:v48];
        id v44 = v51;

        uint64_t v38 = v49;
        id v25 = v44;
      }

      id v25 = v25;
      *id v47 = v25;
    }
  }

  else
  {
    uint64_t v38 = v49;
  }

  *uint64_t v14 = v57;
  *((_BYTE *)v14 + 8) = v58;
  *(_BYTE *)(v55 + 15) |= 8u;

  return v26;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = self;
  baseObject = v10->_baseObject;
  id v12 = unwrapMTLMeshRenderPipelineDescriptor(v9);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 pipelineLibrary]);
  uint64_t v16 = 65539LL;
  v21[0] = _NSConcreteStackBlock;
  v21[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v21[3] = &unk_20D650;
  v21[1] = 3221225472LL;
  if (!v15) {
    uint64_t v16 = 327683LL;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v17 = a4;
  }
  else {
    unint64_t v17 = v16 | a4 & 4;
  }
  uint64_t v22 = v10;
  unint64_t v23 = v10;
  id v25 = v8;
  unint64_t v26 = a4;
  id v24 = v9;
  id v18 = v8;
  id v19 = v9;
  uint64_t v20 = v10;
  -[MTLDeviceSPI newRenderPipelineStateWithMeshDescriptor:options:completionHandler:]( baseObject,  "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:",  v13,  v17,  v21);
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unint64_t v35 = traceContext;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  unint64_t v38 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v39 = v12;
  char v40 = *((_BYTE *)v10 + 8);
  __int16 v41 = 16400;
  int v42 = 0;
  char v43 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLTileRenderPipelineDescriptor(v6);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (self->_isBaseObjectDebugDevice) {
    uint64_t v17 = 0LL;
  }
  else {
    uint64_t v17 = 327683LL;
  }
  id v34 = 0LL;
  id v18 = -[MTLDeviceSPI newRenderPipelineStateWithTileDescriptor:options:reflection:error:]( baseObject,  "newRenderPipelineStateWithTileDescriptor:options:reflection:error:",  v16,  v17,  &v34,  a4);
  id v19 = v34;

  if (v18) {
    uint64_t v20 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v18,  self);
  }
  else {
    uint64_t v20 = 0LL;
  }
  -[CaptureMTLRenderPipelineState setTileDescriptor:](v20, "setTileDescriptor:", v6);
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v20, "traceStream"));
  uint64_t v21 = v37;
  *(_DWORD *)(v37 + 8) = -16091;
  char v22 = v41;
  if (v41 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v36 + 24);
    uint64_t v25 = HIBYTE(v41);
    ++HIBYTE(v41);
    unint64_t v23 = GTTraceMemPool_allocateBytes(v24, v38, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    unint64_t v23 = (char *)(v21 + v41);
    LOBYTE(v41) = v41 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  id DynamicLibrariesForTileRenderPipelineDescriptor = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v6);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForTileRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v35, v18, v19, v27);

  char v28 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v30 = -[CaptureMTLRenderPipelineState traceStream](v20, "traceStream");
  if (!v30)
  {
    unint64_t v31 = 0LL;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  unint64_t v31 = v30->var0;
  if (a4) {
LABEL_19:
  }
    a4 = (id *)*a4;
LABEL_20:
  char v32 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v35, v6);
  *(void *)unint64_t v23 = var0;
  *((void *)v23 + 1) = v31;
  *((void *)v23 + 2) = a4;
  v23[24] = v32;
  *(_DWORD *)(v23 + 25) = 0;
  *((_DWORD *)v23 + 7) = 0;
  uint64_t *v11 = v39;
  *((_BYTE *)v11 + 8) = v40;
  *(_BYTE *)(v37 + 15) |= 8u;

  return v20;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = self;
  baseObject = v10->_baseObject;
  id v12 = unwrapMTLTileRenderPipelineDescriptor(v9);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v10->_isBaseObjectDebugDevice) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = 327683LL;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v18[3] = &unk_20D718;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  unint64_t v22 = a4;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = v10;
  -[MTLDeviceSPI newRenderPipelineStateWithTileDescriptor:options:completionHandler:]( baseObject,  "newRenderPipelineStateWithTileDescriptor:options:completionHandler:",  v13,  v14,  v18);
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  id v51 = traceContext;
  uint64_t v52 = 0LL;
  uint64_t v53 = 0LL;
  unint64_t v54 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v55 = v15;
  char v56 = *((_BYTE *)v13 + 8);
  __int16 v57 = 16400;
  int v58 = 0;
  char v59 = 0;
  baseObject = self->_baseObject;
  id v18 = unwrapMTLTileRenderPipelineDescriptor(v9);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v20 = a4;
  }
  else {
    unint64_t v20 = a4 & 4 | 0x50003;
  }
  id v50 = 0LL;
  id v21 = baseObject;
  unint64_t v22 = a6;
  id v23 = -[MTLDeviceSPI newRenderPipelineStateWithTileDescriptor:options:reflection:error:]( v21,  "newRenderPipelineStateWithTileDescriptor:options:reflection:error:",  v19,  v20,  &v50,  a6);
  id v24 = v50;

  if (v23) {
    uint64_t v25 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v23,  self);
  }
  else {
    uint64_t v25 = 0LL;
  }
  -[CaptureMTLRenderPipelineState setTileDescriptor:](v25, "setTileDescriptor:", v9);
  int v46 = a5;
  GTTraceEncoder_setStream((uint64_t *)&v51, (uint64_t)-[CaptureMTLRenderPipelineState traceStream](v25, "traceStream"));
  uint64_t v26 = v53;
  *(_DWORD *)(v53 + 8) = -16090;
  char v27 = v57;
  id v48 = v23;
  if (v57 > 0x18uLL)
  {
    uint64_t v29 = *(void *)(v52 + 24);
    uint64_t v30 = HIBYTE(v57);
    ++HIBYTE(v57);
    char v28 = GTTraceMemPool_allocateBytes(v29, v54, v30 | 0x2800000000LL) + 16;
    char v27 = v30;
    id v23 = v48;
  }

  else
  {
    char v28 = (char *)(v26 + v57);
    LOBYTE(v57) = v57 + 40;
  }

  *(_BYTE *)(v26 + 13) = v27;
  id DynamicLibrariesForTileRenderPipelineDescriptor = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v9);
  char v32 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForTileRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v51, v23, v24, v32);

  unint64_t v33 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v33) {
    unint64_t var0 = v33->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v35 = -[CaptureMTLRenderPipelineState traceStream](v25, "traceStream");
  if (v35)
  {
    unint64_t v36 = v35->var0;
    if (!a6) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  unint64_t v36 = 0LL;
  if (a6) {
LABEL_19:
  }
    unint64_t v22 = *a6;
LABEL_20:
  char v37 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v51, v9);
  *(void *)char v28 = var0;
  *((void *)v28 + 1) = v36;
  *((void *)v28 + 2) = a4;
  *((void *)v28 + 3) = v22;
  v28[32] = v37;
  *(_DWORD *)(v28 + 33) = 0;
  *((_DWORD *)v28 + 9) = 0;
  if (a4)
  {
    unint64_t v38 = v48;
    if (v46)
    {
      if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        id v39 = DEVICEOBJECT(self->_baseObject);
        char v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        id v41 = deviceMTLTileRenderPipelineDescriptor(v9);
        int v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v49 = v24;
        id v43 = [v40 newRenderPipelineStateWithTileDescriptor:v42 options:a4 reflection:&v49 error:a6];
        id v44 = v49;

        unint64_t v38 = v48;
        id v24 = v44;
      }

      id v24 = v24;
      *int v46 = v24;
    }
  }

  else
  {
    unint64_t v38 = v48;
  }

  *uint64_t v14 = v55;
  *((_BYTE *)v14 + 8) = v56;
  *(_BYTE *)(v53 + 15) |= 8u;

  return v25;
}

- (id)newDefaultLibrary
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v5;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v34 = v8;
  char v35 = *((_BYTE *)v6 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  id v10 = -[MTLDeviceSPI newDefaultLibrary](self->_baseObject, "newDefaultLibrary");
  if (v10) {
    id v11 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    id v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLLibrary traceStream](v11, "traceStream"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URLForResource:@"default" withExtension:@"metallib"]);

  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16308;
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
  id v19 = v13;
  SaveMTLLibraryInfoWithPath((uint64_t)&v30, v10, (const char *)[v19 fileSystemRepresentation]);
  unint64_t v20 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v22 = -[CaptureMTLLibrary traceStream](v11, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  id v24 = v19;
  id v25 = [v24 fileSystemRepresentation];
  if (v25)
  {
    id v26 = v24;
    id v27 = [v26 fileSystemRepresentation];
    size_t v28 = strlen((const char *)[v26 fileSystemRepresentation]);
    LOBYTE(v25) = GTTraceEncoder_storeBytes((uint64_t)&v30, v27, v28 + 1);
  }

  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v23;
  v16[16] = (char)v25;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  *id v7 = v34;
  *((_BYTE *)v7 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v11;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  char v35 = traceContext;
  uint64_t v36 = 0LL;
  uint64_t v37 = 0LL;
  unint64_t v38 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v39 = v12;
  char v40 = *((_BYTE *)v10 + 8);
  __int16 v41 = 16400;
  int v42 = 0;
  char v43 = 0;
  id v14 = -[MTLDeviceSPI newDefaultLibraryWithBundle:error:]( self->_baseObject,  "newDefaultLibraryWithBundle:error:",  v6,  a4);
  if (v14) {
    char v15 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)-[CaptureMTLLibrary traceStream](v15, "traceStream"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForResource:@"default" withExtension:@"metallib"]);
  uint64_t v17 = v37;
  *(_DWORD *)(v37 + 8) = -16095;
  char v18 = v41;
  uint64_t v34 = v6;
  if (v41 > 0x20uLL)
  {
    uint64_t v20 = *(void *)(v36 + 24);
    uint64_t v21 = HIBYTE(v41);
    ++HIBYTE(v41);
    id v19 = GTTraceMemPool_allocateBytes(v20, v38, v21 | 0x2000000000LL) + 16;
    char v18 = v21;
  }

  else
  {
    id v19 = (char *)(v17 + v41);
    LOBYTE(v41) = v41 + 32;
  }

  *(_BYTE *)(v17 + 13) = v18;
  id v22 = v16;
  SaveMTLLibraryInfoWithPath((uint64_t)&v35, v14, (const char *)[v22 fileSystemRepresentation]);
  unint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v25 = -[CaptureMTLLibrary traceStream](v15, "traceStream");
  if (v25)
  {
    unint64_t v26 = v25->var0;
    if (a4)
    {
LABEL_14:
      id v27 = *a4;
      goto LABEL_17;
    }
  }

  else
  {
    unint64_t v26 = 0LL;
    if (a4) {
      goto LABEL_14;
    }
  }

  id v27 = 0LL;
LABEL_17:
  id v28 = v22;
  id v29 = [v28 fileSystemRepresentation];
  if (v29)
  {
    id v30 = v28;
    id v31 = [v30 fileSystemRepresentation];
    size_t v32 = strlen((const char *)[v30 fileSystemRepresentation]);
    LOBYTE(v29) = GTTraceEncoder_storeBytes((uint64_t)&v35, v31, v32 + 1);
  }

  *(void *)id v19 = var0;
  *((void *)v19 + 1) = v26;
  *((void *)v19 + 2) = v27;
  v19[24] = (char)v29;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  uint64_t *v11 = v39;
  *((_BYTE *)v11 + 8) = v40;
  *(_BYTE *)(v37 + 15) |= 8u;

  return v15;
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  if ((objc_opt_respondsToSelector(self->_baseObject, "supportsPrimitiveType:") & 1) != 0) {
    unsigned int v5 = -[MTLDeviceSPI supportsPrimitiveType:](self->_baseObject, "supportsPrimitiveType:", a3);
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15902;
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
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
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

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  id v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newCounterSampleBufferWithDescriptor:error:]( self->_baseObject,  "newCounterSampleBufferWithDescriptor:error:",  v6,  a4);
  if (v14) {
    char v15 = -[CaptureMTLCounterSampleBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLCounterSampleBuffer),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLCounterSampleBuffer traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15848;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v23 = -[CaptureMTLCounterSampleBuffer traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v25 = SaveMTLCounterSampleBufferDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v36 = traceContext;
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  unint64_t v39 = v9;
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v40 = v12;
  char v41 = *((_BYTE *)v10 + 8);
  __int16 v42 = 16400;
  int v43 = 0;
  char v44 = 0;
  baseObject = self->_baseObject;
  unint64_t v15 = 8 * a4;
  __chkstk_darwin(v10, v16);
  if (a4)
  {
    char v17 = a3;
    uint64_t v18 = (uint64_t *)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    unint64_t v19 = a4;
    do
    {
      uint64_t v20 = (void *)*v17++;
      *v18++ = [v20 baseObject];
      --v19;
    }

    while (v19);
  }

  id v21 = -[MTLDeviceSPI newResourceGroupFromResources:count:]( baseObject,  "newResourceGroupFromResources:count:",  (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a4);
  if (v21) {
    id v22 = -[CaptureMTLResourceGroup initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLResourceGroup),  "initWithBaseObject:captureDevice:",  v21,  self);
  }
  else {
    id v22 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v36, (uint64_t)-[CaptureMTLResourceGroup traceStream](v22, "traceStream"));
  uint64_t v23 = v38;
  *(_DWORD *)(v38 + 8) = -15900;
  char v24 = v42;
  if (v42 > 0x20uLL)
  {
    uint64_t v26 = *(void *)(v37 + 24);
    uint64_t v27 = HIBYTE(v42);
    ++HIBYTE(v42);
    char v25 = GTTraceMemPool_allocateBytes(v26, v39, v27 | 0x2000000000LL) + 16;
    char v24 = v27;
  }

  else
  {
    char v25 = (char *)(v23 + v42);
    LOBYTE(v42) = v42 + 32;
  }

  *(_BYTE *)(v23 + 13) = v24;
  uint64_t v28 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v30 = -[CaptureMTLResourceGroup traceStream](v22, "traceStream");
  if (v30) {
    unint64_t v32 = v30->var0;
  }
  else {
    unint64_t v32 = 0LL;
  }
  __chkstk_darwin(v30, v31);
  char v33 = StreamArray((uint64_t)&v36, (uint64_t *)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)), (id *)a3, a4);
  *(void *)char v25 = var0;
  *((void *)v25 + 1) = v32;
  *((void *)v25 + 2) = a4;
  v25[24] = v33;
  *(_DWORD *)(v25 + 25) = 0;
  *((_DWORD *)v25 + 7) = 0;
  uint64_t *v11 = v40;
  *((_BYTE *)v11 + 8) = v41;
  *(_BYTE *)(v38 + 15) |= 8u;

  return v22;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v30 = v10;
  char v31 = *((_BYTE *)v8 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v12 = -[MTLDeviceSPI newSharedTextureWithDescriptor:](self->_baseObject, "newSharedTextureWithDescriptor:", v4);
  if (v12) {
    uint64_t v13 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLTexture traceStream](v13, "traceStream"));
  uint64_t v14 = v28;
  *(_DWORD *)(v28 + 8) = -15980;
  char v15 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v27 + 24);
    uint64_t v18 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v29, v18 | 0x2000000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v12,  v4));

  SaveMTLTextureInfo((uint64_t)&v26, v12);
  uint64_t v20 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v22 = -[CaptureMTLTexture traceStream](v13, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  char v24 = SaveMTLTextureDescriptor((uint64_t)&v26, v19);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v23;
  *((void *)v16 + 2) = 0LL;
  v16[24] = v24;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v13;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v33 = v10;
  char v34 = *((_BYTE *)v8 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v12 = -[MTLDeviceSPI newSharedTextureWithHandle:](self->_baseObject, "newSharedTextureWithHandle:", v4);
  if (v12) {
    uint64_t v13 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLTexture traceStream](v13, "traceStream"));
  uint64_t v14 = v31;
  *(_DWORD *)(v31 + 8) = -15980;
  char v15 = v35;
  if (v35 > 0x20uLL)
  {
    uint64_t v17 = *(void *)(v30 + 24);
    uint64_t v18 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v32, v18 | 0x2000000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v35);
    LOBYTE(v35) = v35 + 32;
  }

  *(_BYTE *)(v14 + 13) = v15;
  SaveMTLTextureInfo((uint64_t)&v29, v12);
  unint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v21 = -[CaptureMTLTexture traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  id v23 = [v4 ioSurface];
  char v24 = (void *)objc_claimAutoreleasedReturnValue(-[CaptureMTLTexture baseObject](v13, "baseObject"));
  id MTLTextureDescriptorFromTextureWithResourceIndex = MakeMTLTextureDescriptorFromTextureWithResourceIndex(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(MTLTextureDescriptorFromTextureWithResourceIndex);
  char v27 = SaveMTLTextureDescriptor((uint64_t)&v29, v26);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v23;
  v16[24] = v27;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;

  uint64_t *v9 = v33;
  *((_BYTE *)v9 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v13;
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[MTLDeviceSPI newPipelineLibraryWithFilePath:error:]( self->_baseObject,  "newPipelineLibraryWithFilePath:error:",  v6,  a4);
  if (!v7)
  {
    uint64_t v8 = 0LL;
    goto LABEL_22;
  }

  uint64_t v8 = -[CaptureMTLPipelineLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLPipelineLibrary),  "initWithBaseObject:captureDevice:",  v7,  self);
  if (v8)
  {
    if ((objc_opt_respondsToSelector(v7, "metallibPaths") & 1) == 0)
    {
      GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newPipelineLibraryWithFilePath_error",  (uint64_t)"Pipeline Libraries SPI",  (uint64_t)"metallibPaths SPI property is not available",  0LL);
      goto LABEL_22;
    }

    traceContext = self->_traceContext;
    p_var2 = &traceContext->var2;
    do
      unint64_t v11 = __ldaxr(p_var2);
    while (__stlxr(v11 + 1, p_var2));
    char v37 = traceContext;
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    unint64_t v40 = v11;
    s();
    uint64_t v13 = v12;
    uint64_t v14 = *v12;
    uint64_t *v12 = v15;
    uint64_t v41 = v14;
    char v42 = *((_BYTE *)v12 + 8);
    __int16 v43 = 16400;
    int v44 = 0;
    char v45 = 0;
    GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)-[CaptureMTLPipelineLibrary traceStream](v8, "traceStream"));
    uint64_t v16 = v39;
    *(_DWORD *)(v39 + 8) = -16075;
    char v17 = v43;
    if (v43 > 0x20uLL)
    {
      uint64_t v19 = *(void *)(v38 + 24);
      uint64_t v20 = HIBYTE(v43);
      ++HIBYTE(v43);
      uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v40, v20 | 0x2000000000LL) + 16;
      char v17 = v20;
    }

    else
    {
      uint64_t v18 = (char *)(v16 + v43);
      LOBYTE(v43) = v43 + 32;
    }

    *(_BYTE *)(v16 + 13) = v17;
    id v21 = DEVICEOBJECT(v7);
    unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = v6;
    SaveMTLPipelineLibraryInfoWithPath((uint64_t)&v37, v22, (const char *)[v23 fileSystemRepresentation]);

    char v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v24) {
      unint64_t var0 = v24->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v26 = -[CaptureMTLPipelineLibrary traceStream](v8, "traceStream");
    if (v26)
    {
      unint64_t v27 = v26->var0;
      if (a4)
      {
LABEL_16:
        id v28 = *a4;
LABEL_19:
        id v29 = v23;
        id v30 = [v29 UTF8String];
        if (v30)
        {
          id v31 = v29;
          unint64_t v32 = var0;
          id v33 = [v31 UTF8String];
          size_t v34 = strlen((const char *)[v31 UTF8String]);
          __int16 v35 = v33;
          unint64_t var0 = v32;
          LOBYTE(v30) = GTTraceEncoder_storeBytes((uint64_t)&v37, v35, v34 + 1);
        }

        *(void *)uint64_t v18 = var0;
        *((void *)v18 + 1) = v27;
        *((void *)v18 + 2) = v28;
        v18[24] = (char)v30;
        *(_DWORD *)(v18 + 25) = 0;
        *((_DWORD *)v18 + 7) = 0;
        uint64_t *v13 = v41;
        *((_BYTE *)v13 + 8) = v42;
        *(_BYTE *)(v39 + 15) |= 8u;
        goto LABEL_22;
      }
    }

    else
    {
      unint64_t v27 = 0LL;
      if (a4) {
        goto LABEL_16;
      }
    }

    id v28 = 0LL;
    goto LABEL_19;
  }

- (unint64_t)recommendedMaxWorkingSetSize
{
  return (unint64_t)-[MTLDeviceSPI recommendedMaxWorkingSetSize]( self->_baseObject,  "recommendedMaxWorkingSetSize");
}

- (unint64_t)maxTileBuffers
{
  return (unint64_t)-[MTLDeviceSPI maxTileBuffers](self->_baseObject, "maxTileBuffers");
}

- (unint64_t)maxTileInlineDataSize
{
  return (unint64_t)-[MTLDeviceSPI maxTileInlineDataSize](self->_baseObject, "maxTileInlineDataSize");
}

- (unint64_t)maxTileSamplers
{
  return (unint64_t)-[MTLDeviceSPI maxTileSamplers](self->_baseObject, "maxTileSamplers");
}

- (unint64_t)maxTileTextures
{
  return (unint64_t)-[MTLDeviceSPI maxTileTextures](self->_baseObject, "maxTileTextures");
}

- (unint64_t)minTilePixels
{
  return (unint64_t)-[MTLDeviceSPI minTilePixels](self->_baseObject, "minTilePixels");
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLCoreIR:functionType:](self->_baseObject, "newFunctionWithGLCoreIR:functionType:");
  if (v7)
  {
    uint64_t v8 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v7,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v8, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15430;
    unsigned __int8 v12 = v29;
    if (v29 > 0x20uLL)
    {
      uint64_t v14 = *(void *)(v25[1] + 24LL);
      uint64_t v15 = v30++;
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v27, v15 | 0x2000000000LL) + 16;
      unsigned __int8 v12 = v15;
    }

    else
    {
      uint64_t v13 = (char *)(v11 + v29);
      v29 += 32;
    }

    uint64_t v16 = v10 + 4;
    *(_BYTE *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)v25, v7, 0LL);
    char v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = -[CaptureMTLFunction traceStream](v8, "traceStream");
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0LL;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = (dispatch_data_s *)a4;
  id v9 = -[MTLDeviceSPI newFunctionWithGLCoreIR:inputsDescription:functionType:]( self->_baseObject,  "newFunctionWithGLCoreIR:inputsDescription:functionType:",  a3,  v8,  a5);
  if (v9)
  {
    uint64_t v10 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v9,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v10, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v30);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v31;
    *(_DWORD *)(v31 + 8) = -15429;
    unsigned __int8 v14 = v34;
    if (v34 > 0x20uLL)
    {
      uint64_t v16 = *(void *)(v30[1] + 24LL);
      uint64_t v17 = v35++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v32, v17 | 0x2000000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v34);
      v34 += 32;
    }

    uint64_t v18 = v12 + 4;
    *(_BYTE *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)v30, v9, 0LL);
    uint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    char v21 = -[CaptureMTLFunction traceStream](v10, "traceStream");
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0LL;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)v30, a3, v18);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v24);
    if ((objc_opt_isKindOfClass(v9, v25) & 1) != 0)
    {
      RetainDebugObject(v9);
      char v26 = 0;
    }

    else
    {
      char v26 = SaveDispatchData_((uint64_t)v30, v8);
    }

    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v26;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v27 = v28;
    *(_BYTE *)(v27 + 8) = v33;
    *(_BYTE *)(v31 + 15) |= 8u;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLESIR:functionType:](self->_baseObject, "newFunctionWithGLESIR:functionType:");
  if (v7)
  {
    uint64_t v8 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v7,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v8, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15428;
    unsigned __int8 v12 = v29;
    if (v29 > 0x20uLL)
    {
      uint64_t v14 = *(void *)(v25[1] + 24LL);
      uint64_t v15 = v30++;
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v27, v15 | 0x2000000000LL) + 16;
      unsigned __int8 v12 = v15;
    }

    else
    {
      uint64_t v13 = (char *)(v11 + v29);
      v29 += 32;
    }

    uint64_t v16 = v10 + 4;
    *(_BYTE *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)v25, v7, 0LL);
    uint64_t v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = -[CaptureMTLFunction traceStream](v8, "traceStream");
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0LL;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = (dispatch_data_s *)a4;
  id v9 = -[MTLDeviceSPI newFunctionWithGLESIR:inputsDescription:functionType:]( self->_baseObject,  "newFunctionWithGLESIR:inputsDescription:functionType:",  a3,  v8,  a5);
  if (v9)
  {
    uint64_t v10 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v9,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v10, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v30);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v31;
    *(_DWORD *)(v31 + 8) = -15427;
    unsigned __int8 v14 = v34;
    if (v34 > 0x20uLL)
    {
      uint64_t v16 = *(void *)(v30[1] + 24LL);
      uint64_t v17 = v35++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v32, v17 | 0x2000000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v34);
      v34 += 32;
    }

    uint64_t v18 = v12 + 4;
    *(_BYTE *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)v30, v9, 0LL);
    uint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    char v21 = -[CaptureMTLFunction traceStream](v10, "traceStream");
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0LL;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)v30, a3, v18);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v24);
    if ((objc_opt_isKindOfClass(v9, v25) & 1) != 0)
    {
      RetainDebugObject(v9);
      char v26 = 0;
    }

    else
    {
      char v26 = SaveDispatchData_((uint64_t)v30, v8);
    }

    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v26;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v27 = v28;
    *(_BYTE *)(v27 + 8) = v33;
    *(_BYTE *)(v31 + 15) |= 8u;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLIR:functionType:](self->_baseObject, "newFunctionWithGLIR:functionType:");
  if (v7)
  {
    uint64_t v8 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v7,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v8, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15731;
    unsigned __int8 v12 = v29;
    if (v29 > 0x20uLL)
    {
      uint64_t v14 = *(void *)(v25[1] + 24LL);
      uint64_t v15 = v30++;
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, v27, v15 | 0x2000000000LL) + 16;
      unsigned __int8 v12 = v15;
    }

    else
    {
      uint64_t v13 = (char *)(v11 + v29);
      v29 += 32;
    }

    uint64_t v16 = v10 + 4;
    *(_BYTE *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)v25, v7, 0LL);
    uint64_t v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    uint64_t v19 = -[CaptureMTLFunction traceStream](v8, "traceStream");
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0LL;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(_BYTE *)(v22 + 8) = v28;
    *(_BYTE *)(v26 + 15) |= 8u;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = (dispatch_data_s *)a4;
  id v9 = -[MTLDeviceSPI newFunctionWithGLIR:inputsDescription:functionType:]( self->_baseObject,  "newFunctionWithGLIR:inputsDescription:functionType:",  a3,  v8,  a5);
  if (v9)
  {
    uint64_t v10 = -[CaptureMTLFunction initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFunction),  "initWithBaseObject:captureDevice:",  v9,  self);
    traceContext = self->_traceContext;
    -[CaptureMTLFunction traceStream](v10, "traceStream");
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v30);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v31;
    *(_DWORD *)(v31 + 8) = -15730;
    unsigned __int8 v14 = v34;
    if (v34 > 0x20uLL)
    {
      uint64_t v16 = *(void *)(v30[1] + 24LL);
      uint64_t v17 = v35++;
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v32, v17 | 0x2000000000LL) + 16;
      unsigned __int8 v14 = v17;
    }

    else
    {
      uint64_t v15 = (char *)(v13 + v34);
      v34 += 32;
    }

    uint64_t v18 = v12 + 4;
    *(_BYTE *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)v30, v9, 0LL);
    uint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    char v21 = -[CaptureMTLFunction traceStream](v10, "traceStream");
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0LL;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)v30, a3, v18);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v24);
    if ((objc_opt_isKindOfClass(v9, v25) & 1) != 0)
    {
      RetainDebugObject(v9);
      char v26 = 0;
    }

    else
    {
      char v26 = SaveDispatchData_((uint64_t)v30, v8);
    }

    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v26;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v27 = v28;
    *(_BYTE *)(v27 + 8) = v33;
    *(_BYTE *)(v31 + 15) |= 8u;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v25 = traceContext;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v7;
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v29 = v10;
  char v30 = *((_BYTE *)v8 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  id v12 = -[MTLDeviceSPI newRasterizationRateMapWithDescriptor:]( self->_baseObject,  "newRasterizationRateMapWithDescriptor:",  v4);
  if (v12) {
    uint64_t v13 = -[CaptureMTLRasterizationRateMap initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRasterizationRateMap),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)-[CaptureMTLRasterizationRateMap traceStream](v13, "traceStream"));
  uint64_t v14 = v27;
  *(_DWORD *)(v27 + 8) = -15793;
  char v15 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v26 + 24);
    uint64_t v18 = HIBYTE(v31);
    ++HIBYTE(v31);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v28, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v31);
    LOBYTE(v31) = v31 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  uint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v21 = -[CaptureMTLRasterizationRateMap traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  char v23 = SaveMTLRasterizationRateMapDescriptor((uint64_t)&v25, v4);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  uint64_t *v9 = v29;
  *((_BYTE *)v9 + 8) = v30;
  *(_BYTE *)(v27 + 15) |= 8u;

  return v13;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  baseObject = self->_baseObject;
  if (baseObject)
  {
    -[MTLDeviceSPI sparseTileSizeWithTextureType:pixelFormat:sampleCount:]( baseObject,  "sparseTileSizeWithTextureType:pixelFormat:sampleCount:",  a4,  a5,  a6);
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->unint64_t var2 = 0LL;
  }

  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15737;
  unsigned __int8 v13 = v26;
  if (v26 > 8uLL)
  {
    uint64_t v15 = *(void *)(v22[1] + 24LL);
    uint64_t v16 = v27++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v24, v16 | 0x3800000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v26);
    v26 += 56;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v14 = var0;
  *(_OWORD *)(v14 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v14 + 3) = var2;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  *((void *)v14 + 6) = a6;
  s();
  result->unint64_t var0 = v21;
  LOBYTE(result->var1) = v25;
  *(_BYTE *)(v23 + 15) |= 8u;
  return result;
}

- (unint64_t)sparseTileSizeInBytes
{
  return (unint64_t)-[MTLDeviceSPI sparseTileSizeInBytes](self->_baseObject, "sparseTileSizeInBytes");
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id v10 = a6;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v13 = __ldaxr(p_var2);
  while (__stlxr(v13 + 1, p_var2));
  char v42 = traceContext;
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  unint64_t v45 = v13;
  s();
  uint64_t v15 = v14;
  uint64_t v16 = *v14;
  *uint64_t v14 = v17;
  uint64_t v46 = v16;
  char v47 = *((_BYTE *)v14 + 8);
  __int16 v48 = 16400;
  int v49 = 0;
  char v50 = 0;
  id v18 = -[MTLDeviceSPI newBufferWithBytesNoCopy:length:options:deallocator:]( self->_baseObject,  "newBufferWithBytesNoCopy:length:options:deallocator:",  a3,  a4,  a5,  v10);
  if (v18) {
    uint64_t v19 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v18,  self);
  }
  else {
    uint64_t v19 = 0LL;
  }
  unint64_t v20 = -[CaptureMTLBuffer traceStream](v19, "traceStream");
  if (v20)
  {
    p_var1 = &v20[1].var1;
    unint64_t v22 = atomic_load(&v20[1].var1);
    while (1)
    {
      unint64_t v23 = __ldaxr(p_var1);
      if (v23 != v22) {
        break;
      }
      if (__stlxr(v22 | 3, p_var1)) {
        goto LABEL_12;
      }
      int v24 = 1;
LABEL_13:
      unint64_t v22 = v23;
      if (v24) {
        goto LABEL_14;
      }
    }

    __clrex();
LABEL_12:
    int v24 = 0;
    goto LABEL_13;
  }

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v12 = __ldaxr(p_var2);
  while (__stlxr(v12 + 1, p_var2));
  unint64_t v40 = traceContext;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  unint64_t v43 = v12;
  s();
  uint64_t v14 = v13;
  uint64_t v15 = *v13;
  uint64_t *v13 = v16;
  uint64_t v44 = v15;
  char v45 = *((_BYTE *)v13 + 8);
  __int16 v46 = 16400;
  int v47 = 0;
  char v48 = 0;
  baseObject = self->_baseObject;
  id v18 = unwrapNSArray(v9);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = -[MTLDeviceSPI newLibraryWithDAG:functions:error:]( baseObject,  "newLibraryWithDAG:functions:error:",  v8,  v19,  a5);

  if (v20) {
    unint64_t v21 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:captureFunctions:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:captureFunctions:",  v20,  self,  v9);
  }
  else {
    unint64_t v21 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v40, (uint64_t)-[CaptureMTLLibrary traceStream](v21, "traceStream"));
  uint64_t v22 = v42;
  *(_DWORD *)(v42 + 8) = -15693;
  char v23 = v46;
  char v39 = v9;
  if (v46 > 0x20uLL)
  {
    uint64_t v25 = *(void *)(v41 + 24);
    uint64_t v26 = HIBYTE(v46);
    ++HIBYTE(v46);
    int v24 = GTTraceMemPool_allocateBytes(v25, v43, v26 | 0x2000000000LL) + 16;
    char v23 = v26;
  }

  else
  {
    int v24 = (char *)(v22 + v46);
    LOBYTE(v46) = v46 + 32;
  }

  *(_BYTE *)(v22 + 13) = v23;
  SaveMTLLibraryInfoWithPath((uint64_t)&v40, v20, 0LL);
  unsigned __int8 v27 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v29 = -[CaptureMTLLibrary traceStream](v21, "traceStream");
  if (v29)
  {
    unint64_t v30 = v29->var0;
    if (a5)
    {
LABEL_14:
      id v31 = *a5;
      goto LABEL_17;
    }
  }

  else
  {
    unint64_t v30 = 0LL;
    if (a5) {
      goto LABEL_14;
    }
  }

  id v31 = 0LL;
LABEL_17:
  id v32 = v8;
  if ([v32 UTF8String])
  {
    id v33 = v32;
    id v34 = [v33 UTF8String];
    size_t v35 = strlen((const char *)[v33 UTF8String]);
    char v36 = GTTraceEncoder_storeBytes((uint64_t)&v40, v34, v35 + 1);
  }

  else
  {
    char v36 = 0;
  }

  char v37 = StreamMTLNameArray((uint64_t)&v40, v39);
  *(void *)int v24 = var0;
  *((void *)v24 + 1) = v30;
  *((void *)v24 + 2) = v31;
  v24[24] = v36;
  v24[25] = v37;
  *(_DWORD *)(v24 + 26) = 0;
  *((_WORD *)v24 + 15) = 0;
  *uint64_t v14 = v44;
  *((_BYTE *)v14 + 8) = v45;
  *(_BYTE *)(v42 + 15) |= 8u;

  return v21;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  baseObject = self->_baseObject;
  id v7 = unwrapMTLComputePipelineDescriptor(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[MTLDeviceSPI loadDynamicLibrariesForComputeDescriptor:error:]( baseObject,  "loadDynamicLibrariesForComputeDescriptor:error:",  v8,  a4);

  id v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  if ([v9 count])
  {
    unint64_t v11 = 0LL;
    do
    {
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v11]);
      if (v12)
      {
        unint64_t v13 = objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v11]);
        uint64_t v15 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( v13,  "initWithBaseObject:captureDevice:",  v14,  self);
        -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", v15, v11);
      }

      else
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v10, "setObject:atIndexedSubscript:", 0LL, v11);
      }

      ++v11;
    }

    while ((unint64_t)[v9 count] > v11);
  }

  return v10;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  baseObject = self->_baseObject;
  id v9 = unwrapMTLComputePipelineDescriptor(a3);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = -[MTLDeviceSPI loadDynamicLibrariesForComputeDescriptor:options:error:]( baseObject,  "loadDynamicLibrariesForComputeDescriptor:options:error:",  v10,  a4,  a5);

  unint64_t v12 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
  if ([v11 count])
  {
    unint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v13]);
      if (v14)
      {
        uint64_t v15 = objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v13]);
        uint64_t v17 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( v15,  "initWithBaseObject:captureDevice:",  v16,  self);
        -[NSMutableArray setObject:atIndexedSubscript:](v12, "setObject:atIndexedSubscript:", v17, v13);
      }

      else
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v12, "setObject:atIndexedSubscript:", 0LL, v13);
      }

      ++v13;
    }

    while ((unint64_t)[v11 count] > v13);
  }

  return v12;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  id v8 = a4;
  baseObject = self->_baseObject;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  id v11 = unwrapNSArray(v8);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = -[MTLDeviceSPI loadDynamicLibrariesForFunction:insertLibraries:error:]( baseObject,  "loadDynamicLibrariesForFunction:insertLibraries:error:",  v10,  v12,  a5);

  uint64_t v14 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v13 count]);
  if ([v13 count])
  {
    unint64_t v15 = 0LL;
    do
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v15]);
      if (v16)
      {
        uint64_t v17 = objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v15]);
        uint64_t v19 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( v17,  "initWithBaseObject:captureDevice:",  v18,  self);
        -[NSMutableArray setObject:atIndexedSubscript:](v14, "setObject:atIndexedSubscript:", v19, v15);
      }

      else
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v14, "setObject:atIndexedSubscript:", 0LL, v15);
      }

      ++v15;
    }

    while ((unint64_t)[v13 count] > v15);
  }

  return v14;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  baseObject = self->_baseObject;
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  id v13 = unwrapNSArray(v10);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = -[MTLDeviceSPI loadDynamicLibrariesForFunction:insertLibraries:options:error:]( baseObject,  "loadDynamicLibrariesForFunction:insertLibraries:options:error:",  v12,  v14,  a5,  a6);

  uint64_t v16 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v15 count]);
  if ([v15 count])
  {
    unint64_t v17 = 0LL;
    do
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v17]);
      if (v18)
      {
        uint64_t v19 = objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndexedSubscript:v17]);
        unint64_t v21 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( v19,  "initWithBaseObject:captureDevice:",  v20,  self);
        -[NSMutableArray setObject:atIndexedSubscript:](v16, "setObject:atIndexedSubscript:", v21, v17);
      }

      else
      {
        -[NSMutableArray setObject:atIndexedSubscript:](v16, "setObject:atIndexedSubscript:", 0LL, v17);
      }

      ++v17;
    }

    while ((unint64_t)[v15 count] > v17);
  }

  return v16;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newIntersectionFunctionTableWithDescriptor",  (uint64_t)"Ray Tracing",  0LL,  0LL);
  id v5 = -[MTLDeviceSPI newIntersectionFunctionTableWithDescriptor:]( self->_baseObject,  "newIntersectionFunctionTableWithDescriptor:",  v4);
  if (v5) {
    id v6 = -[CaptureMTLIntersectionFunctionTable initWithBaseObject:captureDevice:descriptor:]( objc_alloc(&OBJC_CLASS___CaptureMTLIntersectionFunctionTable),  "initWithBaseObject:captureDevice:descriptor:",  v5,  self,  v4);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (unint64_t)maxPredicatedNestingDepth
{
  return (unint64_t)-[MTLDeviceSPI maxPredicatedNestingDepth](self->_baseObject, "maxPredicatedNestingDepth");
}

- (unint64_t)maxAccelerationStructureLevels
{
  return (unint64_t)-[MTLDeviceSPI maxAccelerationStructureLevels]( self->_baseObject,  "maxAccelerationStructureLevels");
}

- (id)newBufferWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v7;
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  uint64_t v30 = v10;
  char v31 = *((_BYTE *)v8 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v12 = -[MTLDeviceSPI newBufferWithDescriptor:](self->_baseObject, "newBufferWithDescriptor:", v4);
  if (v12) {
    id v13 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLBuffer traceStream](v13, "traceStream"));
  if ([v4 contents]) {
    char v14 = TransferBytes((uint64_t)&v26, (uint64_t *)[v4 contents], objc_msgSend(v4, "length"));
  }
  else {
    char v14 = 0;
  }
  uint64_t v15 = v28;
  *(_DWORD *)(v28 + 8) = -15509;
  char v16 = v32;
  if (v32 > 0x28uLL)
  {
    uint64_t v18 = *(void *)(v27 + 24);
    uint64_t v19 = HIBYTE(v32);
    ++HIBYTE(v32);
    unint64_t v17 = GTTraceMemPool_allocateBytes(v18, v29, v19 | 0x1800000000LL) + 16;
    char v16 = v19;
  }

  else
  {
    unint64_t v17 = (char *)(v15 + v32);
    LOBYTE(v32) = v32 + 24;
  }

  *(_BYTE *)(v15 + 13) = v16;
  SaveMTLBufferInfo((uint64_t)&v26, v12);
  id v20 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = -[CaptureMTLBuffer traceStream](v13, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  char v24 = SaveMTLBufferDescriptor((uint64_t)&v26, v4);
  *(void *)unint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  v17[17] = v14;
  *(_DWORD *)(v17 + 18) = 0;
  *((_WORD *)v17 + 11) = 0;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v13;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  char v31 = traceContext;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  unint64_t v34 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v35 = v12;
  char v36 = *((_BYTE *)v10 + 8);
  __int16 v37 = 16400;
  int v38 = 0;
  char v39 = 0;
  baseObject = self->_baseObject;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v16 = -[MTLDeviceSPI newDynamicLibrary:error:](baseObject, "newDynamicLibrary:error:", v15, a4);

  if (v16) {
    unint64_t v17 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    unint64_t v17 = 0LL;
  }
  -[CaptureMTLDynamicLibrary setParentLibrary:](v17, "setParentLibrary:", v6);
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)-[CaptureMTLDynamicLibrary traceStream](v17, "traceStream"));
  uint64_t v18 = v33;
  *(_DWORD *)(v33 + 8) = -15695;
  char v19 = v37;
  if (v37 > 0x20uLL)
  {
    uint64_t v21 = *(void *)(v32 + 24);
    uint64_t v22 = HIBYTE(v37);
    ++HIBYTE(v37);
    id v20 = GTTraceMemPool_allocateBytes(v21, v34, v22 | 0x2000000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    id v20 = (char *)(v18 + v37);
    LOBYTE(v37) = v37 + 32;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLDynamicLibraryInfo((uint64_t)&v31, v16);
  unint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = -[CaptureMTLDynamicLibrary traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  uint64_t v27 = (uint64_t *)[v6 traceStream];
  if (!v27)
  {
    uint64_t v28 = 0LL;
    if (a4) {
      goto LABEL_17;
    }
LABEL_19:
    id v29 = 0LL;
    goto LABEL_20;
  }

  uint64_t v28 = *v27;
  if (!a4) {
    goto LABEL_19;
  }
LABEL_17:
  id v29 = *a4;
LABEL_20:
  *(void *)id v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v28;
  *((void *)v20 + 3) = v29;
  uint64_t *v11 = v35;
  *((_BYTE *)v11 + 8) = v36;
  *(_BYTE *)(v33 + 15) |= 8u;

  return v17;
}

- (void)newLibraryWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLStitchedLibraryDescriptor(v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __63__CaptureMTLDevice_newLibraryWithDescriptor_completionHandler___block_invoke;
  v15[3] = &unk_20D740;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  id v12 = v6;
  id v13 = v7;
  char v14 = v8;
  -[MTLDeviceSPI newLibraryWithDescriptor:completionHandler:]( baseObject,  "newLibraryWithDescriptor:completionHandler:",  v11,  v15);
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v32 = traceContext;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  unint64_t v35 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v36 = v12;
  char v37 = *((_BYTE *)v10 + 8);
  __int16 v38 = 16400;
  int v39 = 0;
  char v40 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLStitchedLibraryDescriptor(v6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[MTLDeviceSPI newLibraryWithStitchedDescriptor:error:]( baseObject,  "newLibraryWithStitchedDescriptor:error:",  v16,  a4);

  if (v17)
  {
    id v18 = objc_alloc(&OBJC_CLASS___CaptureMTLLibrary);
    char v19 = (void *)objc_claimAutoreleasedReturnValue([v6 functions]);
    id v20 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:captureFunctions:]( v18,  "initWithBaseObject:captureDevice:captureFunctions:",  v17,  self,  v19);
  }

  else
  {
    id v20 = 0LL;
  }

  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)-[CaptureMTLLibrary traceStream](v20, "traceStream"));
  uint64_t v21 = v34;
  *(_DWORD *)(v34 + 8) = -15420;
  char v22 = v38;
  if (v38 > 0x20uLL)
  {
    uint64_t v24 = *(void *)(v33 + 24);
    uint64_t v25 = HIBYTE(v38);
    ++HIBYTE(v38);
    unint64_t v23 = GTTraceMemPool_allocateBytes(v24, v35, v25 | 0x2000000000LL) + 16;
    char v22 = v25;
  }

  else
  {
    unint64_t v23 = (char *)(v21 + v38);
    LOBYTE(v38) = v38 + 32;
  }

  *(_BYTE *)(v21 + 13) = v22;
  SaveMTLLibraryInfoWithPath((uint64_t)&v32, v17, 0LL);
  unint64_t v26 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v28 = -[CaptureMTLLibrary traceStream](v20, "traceStream");
  if (!v28)
  {
    unint64_t v29 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v29 = v28->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v30 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v32, v6);
  *(void *)unint64_t v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = a4;
  v23[24] = v30;
  *(_DWORD *)(v23 + 25) = 0;
  *((_DWORD *)v23 + 7) = 0;
  uint64_t *v11 = v36;
  *((_BYTE *)v11 + 8) = v37;
  *(_BYTE *)(v34 + 15) |= 8u;

  return v20;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  id v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLStitchedLibraryDescriptor(v7);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __71__CaptureMTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v15[3] = &unk_20D740;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  id v12 = v6;
  id v13 = v7;
  char v14 = v8;
  -[MTLDeviceSPI newLibraryWithStitchedDescriptor:completionHandler:]( baseObject,  "newLibraryWithStitchedDescriptor:completionHandler:",  v11,  v15);
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6
{
  id v10 = a4;
  traceContext = self->_traceContext;
  id v12 = a5;
  id v13 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v35);
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  id v16 = unwrapMTLFunctionDescriptor(v10);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 baseObject]);
  -[MTLDeviceSPI compileVisibleFunction:withDescriptor:destinationBinaryArchive:error:]( baseObject,  "compileVisibleFunction:withDescriptor:destinationBinaryArchive:error:",  v15,  v17,  v18,  a6);

  uint64_t v19 = v36;
  *(_DWORD *)(v36 + 8) = -15475;
  unsigned __int8 v20 = v39;
  if (v39 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v35[1] + 24LL);
    uint64_t v23 = v40++;
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v37, v23 | 0x2800000000LL) + 16;
    unsigned __int8 v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v39);
    v39 += 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  uint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v26 = (uint64_t *)[v13 traceStream];
  if (v26) {
    uint64_t v27 = *v26;
  }
  else {
    uint64_t v27 = 0LL;
  }
  uint64_t v28 = (uint64_t *)[v12 traceStream];

  if (!v28)
  {
    uint64_t v29 = 0LL;
    if (a6) {
      goto LABEL_12;
    }
LABEL_14:
    id v30 = 0LL;
    goto LABEL_15;
  }

  uint64_t v29 = *v28;
  if (!a6) {
    goto LABEL_14;
  }
LABEL_12:
  id v30 = *a6;
LABEL_15:
  char v31 = (void *)objc_claimAutoreleasedReturnValue([v13 functionConstantsDictionary]);

  char v32 = SaveMTLFunctionDescriptor((uint64_t)v35, v10, v31);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v29;
  *((void *)v21 + 3) = v30;
  v21[32] = v32;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;

  s();
  *(void *)uint64_t v33 = v34;
  *(_BYTE *)(v33 + 8) = v38;
  *(_BYTE *)(v36 + 15) |= 8u;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  traceContext = self->_traceContext;
  id v9 = a5;
  id v10 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v30);
  baseObject = self->_baseObject;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 baseObject]);
  id v13 = unwrapMTLAccelerationStructureDescriptor(v9);
  char v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[MTLDeviceSPI deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:]( baseObject,  "deserializePrimitiveAccelerationStructure:fromBytes:withDescriptor:",  v12,  a4,  v14);

  id v15 = copyAndNullifyReferencesInDescriptor(v9);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v10 setDescriptor:v16];

  id v17 = (const void *)*((void *)a4 + 1);
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15362;
  unsigned __int8 v19 = v34;
  if (v34 > 0x28uLL)
  {
    uint64_t v21 = *(void *)(v30[1] + 24LL);
    uint64_t v22 = v35++;
    unsigned __int8 v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x1800000000LL) + 16;
    unsigned __int8 v19 = v22;
  }

  else
  {
    unsigned __int8 v20 = (char *)(v18 + v34);
    v34 += 24;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = [v10 traceStream];

  if (v25) {
    uint64_t v25 = (void *)*v25;
  }
  char v26 = TransferBytes((uint64_t)v30, (uint64_t *)a4, v17);
  char v27 = SaveMTLAccelerationStructureDescriptor((uint64_t)v30, v9);

  *(void *)unsigned __int8 v20 = var0;
  *((void *)v20 + 1) = v25;
  v20[16] = v26;
  v20[17] = v27;
  *(_DWORD *)(v20 + 18) = 0;
  *((_WORD *)v20 + 11) = 0;
  s();
  *(void *)uint64_t v28 = v29;
  *(_BYTE *)(v28 + 8) = v33;
  *(_BYTE *)(v31 + 15) |= 8u;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  traceContext = self->_traceContext;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v36);
  baseObject = self->_baseObject;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 baseObject]);
  id v16 = unwrapNSArray(v12);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = unwrapMTLAccelerationStructureDescriptor(v11);
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[MTLDeviceSPI deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:]( baseObject,  "deserializeInstanceAccelerationStructure:fromBytes:primitiveAccelerationStructures:withDescriptor:",  v15,  a4,  v17,  v19);

  id v20 = copyAndNullifyReferencesInDescriptor(v11);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v13 setDescriptor:v21];

  uint64_t v22 = (const void *)*((void *)a4 + 1);
  uint64_t v23 = v37;
  *(_DWORD *)(v37 + 8) = -15363;
  unsigned __int8 v24 = v40;
  if (v40 > 0x28uLL)
  {
    uint64_t v26 = *(void *)(v36[1] + 24LL);
    uint64_t v27 = v41++;
    uint64_t v25 = GTTraceMemPool_allocateBytes(v26, v38, v27 | 0x1800000000LL) + 16;
    unsigned __int8 v24 = v27;
  }

  else
  {
    uint64_t v25 = (char *)(v23 + v40);
    v40 += 24;
  }

  *(_BYTE *)(v23 + 13) = v24;
  uint64_t v28 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v30 = [v13 traceStream];

  if (v30) {
    id v30 = (void *)*v30;
  }
  char v31 = TransferBytes((uint64_t)v36, (uint64_t *)a4, v22);
  char v32 = StreamMTLNameArray((uint64_t)v36, v12);

  char v33 = SaveMTLAccelerationStructureDescriptor((uint64_t)v36, v11);
  *(void *)uint64_t v25 = var0;
  *((void *)v25 + 1) = v30;
  v25[16] = v31;
  v25[17] = v32;
  v25[18] = v33;
  *(_DWORD *)(v25 + 19) = 0;
  v25[23] = 0;
  s();
  *(void *)uint64_t v34 = v35;
  *(_BYTE *)(v34 + 8) = v39;
  *(_BYTE *)(v37 + 15) |= 8u;
}

- (id)newEventWithOptions:(int64_t)a3
{
  id v5 = -[MTLDeviceSPI newEventWithOptions:](self->_baseObject, "newEventWithOptions:", a3);
  if (v5) {
    id v6 = -[CaptureMTLEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLEvent),  "initWithBaseObject:captureDevice:",  v5,  self);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  id v5 = -[MTLDeviceSPI newSharedEventWithOptions:](self->_baseObject, "newSharedEventWithOptions:", a3);
  if (v5) {
    id v6 = -[CaptureMTLSharedEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLSharedEvent),  "initWithBaseObject:captureDevice:",  v5,  self);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unsigned __int8 v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLDeviceSPI newArgumentEncoderWithBufferBinding:]( self->_baseObject,  "newArgumentEncoderWithBufferBinding:",  v5);

  if (v12) {
    id v13 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLArgumentEncoder traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15261;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    id v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    id v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  unsigned __int8 v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLArgumentEncoder traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)id v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = 0LL;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
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
  v8.super_class = (Class)&OBJC_CLASS___CaptureMTLDevice;
  uint64_t v3 = -[CaptureMTLDevice description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTLDeviceSPI description](self->_baseObject, "description"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ -> %@", v4, v5));

  return (NSString *)v6;
}

- (BOOL)isBCTextureCompressionSupported
{
  return -[MTLDeviceSPI isBCTextureCompressionSupported]( self->_baseObject,  "isBCTextureCompressionSupported");
}

- (BOOL)isClampToHalfBorderSupported
{
  return -[MTLDeviceSPI isClampToHalfBorderSupported]( self->_baseObject,  "isClampToHalfBorderSupported");
}

- (BOOL)isCustomBorderColorSupported
{
  return -[MTLDeviceSPI isCustomBorderColorSupported]( self->_baseObject,  "isCustomBorderColorSupported");
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return -[MTLDeviceSPI isFixedLinePointFillDepthGradientSupported]( self->_baseObject,  "isFixedLinePointFillDepthGradientSupported");
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  return (MTLGPUBVHBuilder *)-[MTLDeviceSPI GPUBVHBuilder](self->_baseObject, "GPUBVHBuilder");
}

- (BOOL)isRGB10A2GammaSupported
{
  return -[MTLDeviceSPI isRGB10A2GammaSupported](self->_baseObject, "isRGB10A2GammaSupported");
}

- (BOOL)isRTZRoundingSupported
{
  return -[MTLDeviceSPI isRTZRoundingSupported](self->_baseObject, "isRTZRoundingSupported");
}

- (unsigned)acceleratorPort
{
  return -[MTLDeviceSPI acceleratorPort](self->_baseObject, "acceleratorPort");
}

- (MTLArchitecture)architecture
{
  return (MTLArchitecture *)-[MTLDeviceSPI architecture](self->_baseObject, "architecture");
}

- (unint64_t)argumentBuffersSupport
{
  return (unint64_t)-[MTLDeviceSPI argumentBuffersSupport](self->_baseObject, "argumentBuffersSupport");
}

- (unint64_t)bufferRobustnessSupport
{
  return (unint64_t)-[MTLDeviceSPI bufferRobustnessSupport](self->_baseObject, "bufferRobustnessSupport");
}

- (unint64_t)commandBufferErrorOptions
{
  return (unint64_t)-[MTLDeviceSPI commandBufferErrorOptions](self->_baseObject, "commandBufferErrorOptions");
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15698;
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
  uint64_t v10 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)int v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(_BYTE *)(v12 + 8) = v17;
  *(_BYTE *)(v15 + 15) |= 8u;
}

- (NSArray)counterSets
{
  return (NSArray *)-[MTLDeviceSPI counterSets](self->_baseObject, "counterSets");
}

- (unint64_t)currentAllocatedSize
{
  return (unint64_t)-[MTLDeviceSPI currentAllocatedSize](self->_baseObject, "currentAllocatedSize");
}

- (unint64_t)dedicatedMemorySize
{
  return (unint64_t)-[MTLDeviceSPI dedicatedMemorySize](self->_baseObject, "dedicatedMemorySize");
}

- (int64_t)defaultTextureWriteRoundingMode
{
  return (int64_t)-[MTLDeviceSPI defaultTextureWriteRoundingMode]( self->_baseObject,  "defaultTextureWriteRoundingMode");
}

- (unint64_t)deviceCreationFlags
{
  return (unint64_t)-[MTLDeviceSPI deviceCreationFlags](self->_baseObject, "deviceCreationFlags");
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI deviceLinearReadOnlyTextureAlignmentBytes]( self->_baseObject,  "deviceLinearReadOnlyTextureAlignmentBytes");
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI deviceLinearTextureAlignmentBytes]( self->_baseObject,  "deviceLinearTextureAlignmentBytes");
}

- (unint64_t)doubleFPConfig
{
  return (unint64_t)-[MTLDeviceSPI doubleFPConfig](self->_baseObject, "doubleFPConfig");
}

- (unint64_t)featureProfile
{
  return (unint64_t)-[MTLDeviceSPI featureProfile](self->_baseObject, "featureProfile");
}

- (BOOL)isFloat32FilteringSupported
{
  return -[MTLDeviceSPI isFloat32FilteringSupported](self->_baseObject, "isFloat32FilteringSupported");
}

- (BOOL)areGPUAssertionsEnabled
{
  return -[MTLDeviceSPI areGPUAssertionsEnabled](self->_baseObject, "areGPUAssertionsEnabled");
}

- (unint64_t)halfFPConfig
{
  return (unint64_t)-[MTLDeviceSPI halfFPConfig](self->_baseObject, "halfFPConfig");
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)-[MTLDeviceSPI indirectArgumentBufferCapabilities]( self->_baseObject,  "indirectArgumentBufferCapabilities");
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI iosurfaceReadOnlyTextureAlignmentBytes]( self->_baseObject,  "iosurfaceReadOnlyTextureAlignmentBytes");
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI iosurfaceTextureAlignmentBytes]( self->_baseObject,  "iosurfaceTextureAlignmentBytes");
}

- (BOOL)isLargeMRTSupported
{
  return -[MTLDeviceSPI isLargeMRTSupported](self->_baseObject, "isLargeMRTSupported");
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  return (unint64_t)-[MTLDeviceSPI latestSupportedGenericBVHVersion]( self->_baseObject,  "latestSupportedGenericBVHVersion");
}

- (const)limits
{
  return (const $8F4FC51FDE2459731A28129D66393995 *)-[MTLDeviceSPI limits](self->_baseObject, "limits");
}

- (unint64_t)linearTextureAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI linearTextureAlignmentBytes](self->_baseObject, "linearTextureAlignmentBytes");
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI linearTextureArrayAlignmentBytes]( self->_baseObject,  "linearTextureArrayAlignmentBytes");
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  return (unint64_t)-[MTLDeviceSPI linearTextureArrayAlignmentSlice]( self->_baseObject,  "linearTextureArrayAlignmentSlice");
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return (unint64_t)-[MTLDeviceSPI maxAccelerationStructureTraversalDepth]( self->_baseObject,  "maxAccelerationStructureTraversalDepth");
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  return (unint64_t)-[MTLDeviceSPI maxArgumentBufferSamplerCount]( self->_baseObject,  "maxArgumentBufferSamplerCount");
}

- (unint64_t)maxBufferLength
{
  return (unint64_t)-[MTLDeviceSPI maxBufferLength](self->_baseObject, "maxBufferLength");
}

- (unint64_t)maxColorAttachments
{
  return (unint64_t)-[MTLDeviceSPI maxColorAttachments](self->_baseObject, "maxColorAttachments");
}

- (unint64_t)maxComputeAttributes
{
  return (unint64_t)-[MTLDeviceSPI maxComputeAttributes](self->_baseObject, "maxComputeAttributes");
}

- (unint64_t)maxComputeBuffers
{
  return (unint64_t)-[MTLDeviceSPI maxComputeBuffers](self->_baseObject, "maxComputeBuffers");
}

- (unint64_t)maxComputeInlineDataSize
{
  return (unint64_t)-[MTLDeviceSPI maxComputeInlineDataSize](self->_baseObject, "maxComputeInlineDataSize");
}

- (unint64_t)maxComputeLocalMemorySizes
{
  return (unint64_t)-[MTLDeviceSPI maxComputeLocalMemorySizes](self->_baseObject, "maxComputeLocalMemorySizes");
}

- (unint64_t)maxComputeSamplers
{
  return (unint64_t)-[MTLDeviceSPI maxComputeSamplers](self->_baseObject, "maxComputeSamplers");
}

- (unint64_t)maxComputeTextures
{
  return (unint64_t)-[MTLDeviceSPI maxComputeTextures](self->_baseObject, "maxComputeTextures");
}

- (unint64_t)maxComputeThreadgroupMemory
{
  return (unint64_t)-[MTLDeviceSPI maxComputeThreadgroupMemory](self->_baseObject, "maxComputeThreadgroupMemory");
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI maxComputeThreadgroupMemoryAlignmentBytes]( self->_baseObject,  "maxComputeThreadgroupMemoryAlignmentBytes");
}

- (unint64_t)maxCustomSamplePositions
{
  return (unint64_t)-[MTLDeviceSPI maxCustomSamplePositions](self->_baseObject, "maxCustomSamplePositions");
}

- (unint64_t)maxFenceInstances
{
  return (unint64_t)-[MTLDeviceSPI maxFenceInstances](self->_baseObject, "maxFenceInstances");
}

- (unint64_t)maxFragmentBuffers
{
  return (unint64_t)-[MTLDeviceSPI maxFragmentBuffers](self->_baseObject, "maxFragmentBuffers");
}

- (unint64_t)maxFragmentInlineDataSize
{
  return (unint64_t)-[MTLDeviceSPI maxFragmentInlineDataSize](self->_baseObject, "maxFragmentInlineDataSize");
}

- (unint64_t)maxFragmentSamplers
{
  return (unint64_t)-[MTLDeviceSPI maxFragmentSamplers](self->_baseObject, "maxFragmentSamplers");
}

- (unint64_t)maxFragmentTextures
{
  return (unint64_t)-[MTLDeviceSPI maxFragmentTextures](self->_baseObject, "maxFragmentTextures");
}

- (unint64_t)maxFramebufferStorageBits
{
  return (unint64_t)-[MTLDeviceSPI maxFramebufferStorageBits](self->_baseObject, "maxFramebufferStorageBits");
}

- (unint64_t)maxFunctionConstantIndices
{
  return (unint64_t)-[MTLDeviceSPI maxFunctionConstantIndices](self->_baseObject, "maxFunctionConstantIndices");
}

- (unint64_t)maxIndirectBuffers
{
  return (unint64_t)-[MTLDeviceSPI maxIndirectBuffers](self->_baseObject, "maxIndirectBuffers");
}

- (unint64_t)maxIndirectSamplers
{
  return (unint64_t)-[MTLDeviceSPI maxIndirectSamplers](self->_baseObject, "maxIndirectSamplers");
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  return (unint64_t)-[MTLDeviceSPI maxIndirectSamplersPerDevice]( self->_baseObject,  "maxIndirectSamplersPerDevice");
}

- (unint64_t)maxIndirectTextures
{
  return (unint64_t)-[MTLDeviceSPI maxIndirectTextures](self->_baseObject, "maxIndirectTextures");
}

- (unint64_t)maxInterpolants
{
  return (unint64_t)-[MTLDeviceSPI maxInterpolants](self->_baseObject, "maxInterpolants");
}

- (unint64_t)maxInterpolatedComponents
{
  return (unint64_t)-[MTLDeviceSPI maxInterpolatedComponents](self->_baseObject, "maxInterpolatedComponents");
}

- (float)maxLineWidth
{
  return result;
}

- (float)maxPointSize
{
  return result;
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return (unint64_t)-[MTLDeviceSPI maxRasterizationRateLayerCount]( self->_baseObject,  "maxRasterizationRateLayerCount");
}

- (unint64_t)maxTessellationFactor
{
  return (unint64_t)-[MTLDeviceSPI maxTessellationFactor](self->_baseObject, "maxTessellationFactor");
}

- (unint64_t)maxTextureBufferWidth
{
  return (unint64_t)-[MTLDeviceSPI maxTextureBufferWidth](self->_baseObject, "maxTextureBufferWidth");
}

- (unint64_t)maxTextureDepth3D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureDepth3D](self->_baseObject, "maxTextureDepth3D");
}

- (unint64_t)maxTextureDimensionCube
{
  return (unint64_t)-[MTLDeviceSPI maxTextureDimensionCube](self->_baseObject, "maxTextureDimensionCube");
}

- (unint64_t)maxTextureHeight2D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureHeight2D](self->_baseObject, "maxTextureHeight2D");
}

- (unint64_t)maxTextureHeight3D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureHeight3D](self->_baseObject, "maxTextureHeight3D");
}

- (unint64_t)maxTextureLayers
{
  return (unint64_t)-[MTLDeviceSPI maxTextureLayers](self->_baseObject, "maxTextureLayers");
}

- (unint64_t)maxTextureWidth1D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureWidth1D](self->_baseObject, "maxTextureWidth1D");
}

- (unint64_t)maxTextureWidth2D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureWidth2D](self->_baseObject, "maxTextureWidth2D");
}

- (unint64_t)maxTextureWidth3D
{
  return (unint64_t)-[MTLDeviceSPI maxTextureWidth3D](self->_baseObject, "maxTextureWidth3D");
}

- (unint64_t)maxThreadgroupMemoryLength
{
  return (unint64_t)-[MTLDeviceSPI maxThreadgroupMemoryLength](self->_baseObject, "maxThreadgroupMemoryLength");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  float result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[$F99D9A4FB75BC57F3386B8DC8EE08D7A maxThreadsPerThreadgroup]( result,  "maxThreadsPerThreadgroup");
  }
  retstr->unint64_t var0 = 0LL;
  retstr->var1 = 0LL;
  retstr->unint64_t var2 = 0LL;
  return result;
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  return (unint64_t)-[MTLDeviceSPI maxTotalComputeThreadsPerThreadgroup]( self->_baseObject,  "maxTotalComputeThreadsPerThreadgroup");
}

- (unint64_t)maxVertexAmplificationCount
{
  return (unint64_t)-[MTLDeviceSPI maxVertexAmplificationCount](self->_baseObject, "maxVertexAmplificationCount");
}

- (unint64_t)maxVertexAmplificationFactor
{
  return (unint64_t)-[MTLDeviceSPI maxVertexAmplificationFactor]( self->_baseObject,  "maxVertexAmplificationFactor");
}

- (unint64_t)maxVertexAttributes
{
  return (unint64_t)-[MTLDeviceSPI maxVertexAttributes](self->_baseObject, "maxVertexAttributes");
}

- (unint64_t)maxVertexBuffers
{
  return (unint64_t)-[MTLDeviceSPI maxVertexBuffers](self->_baseObject, "maxVertexBuffers");
}

- (unint64_t)maxVertexInlineDataSize
{
  return (unint64_t)-[MTLDeviceSPI maxVertexInlineDataSize](self->_baseObject, "maxVertexInlineDataSize");
}

- (unint64_t)maxVertexSamplers
{
  return (unint64_t)-[MTLDeviceSPI maxVertexSamplers](self->_baseObject, "maxVertexSamplers");
}

- (unint64_t)maxVertexTextures
{
  return (unint64_t)-[MTLDeviceSPI maxVertexTextures](self->_baseObject, "maxVertexTextures");
}

- (unint64_t)maxViewportCount
{
  return (unint64_t)-[MTLDeviceSPI maxViewportCount](self->_baseObject, "maxViewportCount");
}

- (unint64_t)maxVisibilityQueryOffset
{
  return (unint64_t)-[MTLDeviceSPI maxVisibilityQueryOffset](self->_baseObject, "maxVisibilityQueryOffset");
}

- (BOOL)metalAssertionsEnabled
{
  return -[MTLDeviceSPI metalAssertionsEnabled](self->_baseObject, "metalAssertionsEnabled");
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLDeviceSPI setMetalAssertionsEnabled:](self->_baseObject, "setMetalAssertionsEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16318;
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
  uint64_t v10 = -[CaptureMTLDevice traceStream](self, "traceStream");
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

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI minBufferNoCopyAlignmentBytes]( self->_baseObject,  "minBufferNoCopyAlignmentBytes");
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  return (unint64_t)-[MTLDeviceSPI minConstantBufferAlignmentBytes]( self->_baseObject,  "minConstantBufferAlignmentBytes");
}

- (BOOL)isMsaa32bSupported
{
  return -[MTLDeviceSPI isMsaa32bSupported](self->_baseObject, "isMsaa32bSupported");
}

- (NSString)name
{
  return (NSString *)-[MTLDeviceSPI name](self->_baseObject, "name");
}

- (BOOL)isPlacementHeapSupported
{
  return -[MTLDeviceSPI isPlacementHeapSupported](self->_baseObject, "isPlacementHeapSupported");
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return -[MTLDeviceSPI areProgrammableSamplePositionsSupported]( self->_baseObject,  "areProgrammableSamplePositionsSupported");
}

- (BOOL)isQuadDataSharingSupported
{
  return -[MTLDeviceSPI isQuadDataSharingSupported](self->_baseObject, "isQuadDataSharingSupported");
}

- (BOOL)areRasterOrderGroupsSupported
{
  return -[MTLDeviceSPI areRasterOrderGroupsSupported]( self->_baseObject,  "areRasterOrderGroupsSupported");
}

- (unint64_t)readWriteTextureSupport
{
  return (unint64_t)-[MTLDeviceSPI readWriteTextureSupport](self->_baseObject, "readWriteTextureSupport");
}

- (unint64_t)registryID
{
  return (unint64_t)-[MTLDeviceSPI registryID](self->_baseObject, "registryID");
}

- (BOOL)requiresBFloat16Emulation
{
  return -[MTLDeviceSPI requiresBFloat16Emulation](self->_baseObject, "requiresBFloat16Emulation");
}

- (BOOL)requiresRaytracingEmulation
{
  return -[MTLDeviceSPI requiresRaytracingEmulation](self->_baseObject, "requiresRaytracingEmulation");
}

- (BOOL)shaderDebugInfoCaching
{
  return -[MTLDeviceSPI shaderDebugInfoCaching](self->_baseObject, "shaderDebugInfoCaching");
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
}

- (unint64_t)sharedMemorySize
{
  return (unint64_t)-[MTLDeviceSPI sharedMemorySize](self->_baseObject, "sharedMemorySize");
}

- (unint64_t)singleFPConfig
{
  return (unint64_t)-[MTLDeviceSPI singleFPConfig](self->_baseObject, "singleFPConfig");
}

- (unint64_t)sparseTexturesSupport
{
  return (unint64_t)-[MTLDeviceSPI sparseTexturesSupport](self->_baseObject, "sparseTexturesSupport");
}

- (BOOL)supportPriorityBand
{
  return -[MTLDeviceSPI supportPriorityBand](self->_baseObject, "supportPriorityBand");
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  return (MTLTargetDeviceArchitecture *)-[MTLDeviceSPI targetDeviceArchitecture]( self->_baseObject,  "targetDeviceArchitecture");
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)-[MTLDeviceSPI targetDeviceInfo](self->_baseObject, "targetDeviceInfo");
}

- (BOOL)areWritableHeapsEnabled
{
  return -[MTLDeviceSPI areWritableHeapsEnabled](self->_baseObject, "areWritableHeapsEnabled");
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v14);
  -[MTLDeviceSPI setWritableHeapsEnabled:](self->_baseObject, "setWritableHeapsEnabled:", v3);
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15246;
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
  uint64_t v10 = -[CaptureMTLDevice traceStream](self, "traceStream");
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

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  baseObject = self->_baseObject;
  id v6 = unwrapMTLAccelerationStructureDescriptor(a4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (baseObject)
  {
    uint64_t v9 = v7;
    -[MTLDeviceSPI accelerationStructureSizesWithDescriptor:]( baseObject,  "accelerationStructureSizesWithDescriptor:",  v7);
    int v7 = v9;
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->unint64_t var2 = 0LL;
  }

  return result;
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_compileVisibleFunction_withDescriptor_error",  (uint64_t)"Function Pointers",  0LL,  0LL);
  baseObject = self->_baseObject;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v9 baseObject]);

  id v11 = unwrapMTLFunctionDescriptor(v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  -[MTLDeviceSPI compileVisibleFunction:withDescriptor:error:]( baseObject,  "compileVisibleFunction:withDescriptor:error:",  v13,  v12,  a5);
}

- (void)compilerPropagatesThreadPriority:(BOOL)a3
{
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a5;
  -[MTLDeviceSPI convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:]( baseObject,  "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:",  a3,  a4,  &v8,  a6,  a7);
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a5;
  -[MTLDeviceSPI convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:]( baseObject,  "convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:",  a3,  a4,  &v7,  a6);
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  return -[MTLDeviceSPI copyIOSurfaceSharedTextureProperties:]( self->_baseObject,  "copyIOSurfaceSharedTextureProperties:",  a3);
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  unsigned int v5 = -[MTLDeviceSPI copyShaderCacheToPath:](self->_baseObject, "copyShaderCacheToPath:", v4);
  uint64_t v6 = v22;
  *(_DWORD *)(v22 + 8) = -15747;
  unsigned __int8 v7 = v25;
  if (v25 > 0x30uLL)
  {
    uint64_t v9 = *(void *)(v21[1] + 24LL);
    uint64_t v10 = v26++;
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = GTTraceMemPool_allocateBytes(v9, v23, v10 | 0x1000000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = (char *)(v6 + v25);
    v25 += 16;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v13 = v4;
  id v14 = [v13 UTF8String];
  if (v14)
  {
    id v15 = v13;
    id v16 = [v15 UTF8String];
    size_t v17 = strlen((const char *)[v15 UTF8String]);
    LOBYTE(v14) = GTTraceEncoder_storeBytes((uint64_t)v21, v16, v17 + 1);
  }

  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = var0;
  *((_DWORD *)v8 + 2) = v5;
  v8[12] = (char)v14;
  *(_WORD *)(v8 + 13) = 0;
  v8[15] = 0;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;

  return v5;
}

- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4
{
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  baseObject = self->_baseObject;
  id v9 = a5;
  id v10 = unwrapNSArray(a4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = unwrapMTLAccelerationStructureDescriptor(v9);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = -[MTLDeviceSPI deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:]( baseObject,  "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:",  a3,  v11,  v13);
  if (v14) {
    id v15 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    id v15 = 0LL;
  }

  return v15;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  baseObject = self->_baseObject;
  id v7 = unwrapMTLAccelerationStructureDescriptor(a4);
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[MTLDeviceSPI deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:]( baseObject,  "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:",  a3,  v8);

  if (v9) {
    id v10 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v9,  self);
  }
  else {
    id v10 = 0LL;
  }

  return v10;
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  return -[MTLDeviceSPI deviceOrFeatureProfileSupportsFeatureSet:]( self->_baseObject,  "deviceOrFeatureProfileSupportsFeatureSet:",  a3);
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  return -[MTLDeviceSPI deviceSupportsFeatureSet:](self->_baseObject, "deviceSupportsFeatureSet:", a3);
}

- (id)endCollectingPipelineDescriptors
{
  return -[MTLDeviceSPI endCollectingPipelineDescriptors](self->_baseObject, "endCollectingPipelineDescriptors");
}

- (id)familyName
{
  return -[MTLDeviceSPI familyName](self->_baseObject, "familyName");
}

- (os_unfair_lock_s)getBVHBuilderLock
{
  return (os_unfair_lock_s *)-[MTLDeviceSPI getBVHBuilderLock](self->_baseObject, "getBVHBuilderLock");
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
}

- (id)getRawBVHBuilderPtr
{
  return -[MTLDeviceSPI getRawBVHBuilderPtr](self->_baseObject, "getRawBVHBuilderPtr");
}

- (void)getShaderCacheKeys
{
  return -[MTLDeviceSPI getShaderCacheKeys](self->_baseObject, "getShaderCacheKeys");
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = unwrapMTLAccelerationStructureDescriptor(a3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[MTLDeviceSPI heapAccelerationStructureSizeAndAlignWithDescriptor:]( baseObject,  "heapAccelerationStructureSizeAndAlignWithDescriptor:",  v5);
  unint64_t v8 = v7;

  unint64_t v9 = (unint64_t)v6;
  unint64_t v10 = v8;
  result.var1 = v10;
  result.unint64_t var0 = v9;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  id v3 = -[MTLDeviceSPI heapAccelerationStructureSizeAndAlignWithSize:]( self->_baseObject,  "heapAccelerationStructureSizeAndAlignWithSize:",  a3);
  result.var1 = v4;
  result.unint64_t var0 = (unint64_t)v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI heapBufferSizeAndAlignWithLength:options:]( self->_baseObject,  "heapBufferSizeAndAlignWithLength:options:",  a3,  a4);
  unint64_t v9 = v8;
  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16111;
  unsigned __int8 v11 = v25;
  if (v25 > 0x18uLL)
  {
    uint64_t v13 = *(void *)(v21[1] + 24LL);
    uint64_t v14 = v26++;
    id v12 = GTTraceMemPool_allocateBytes(v13, v23, v14 | 0x2800000000LL) + 16;
    unsigned __int8 v11 = v14;
  }

  else
  {
    id v12 = (char *)(v10 + v25);
    v25 += 40;
  }

  *(_BYTE *)(v10 + 13) = v11;
  id v15 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v7;
  *((void *)v12 + 2) = v9;
  *((void *)v12 + 3) = a3;
  *((void *)v12 + 4) = a4;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
  unint64_t v19 = (unint64_t)v7;
  unint64_t v20 = v9;
  result.var1 = v20;
  result.unint64_t var0 = v19;
  return result;
}

- (id)indirectArgumentBufferDecodingData
{
  return -[MTLDeviceSPI indirectArgumentBufferDecodingData](self->_baseObject, "indirectArgumentBufferDecodingData");
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  return -[MTLDeviceSPI isCompatibleWithAccelerationStructure:]( self->_baseObject,  "isCompatibleWithAccelerationStructure:",  a3);
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  return -[MTLDeviceSPI isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:]( self->_baseObject,  "isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:",  *(void *)&a3,  *(void *)&a4,  *(void *)&a5,  *(void *)&a6);
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[MTLDeviceSPI libraryCacheStats](self->_baseObject, "libraryCacheStats");
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  return -[MTLDeviceSPI mapShaderSampleBufferWithBuffer:capacity:size:]( self->_baseObject,  "mapShaderSampleBufferWithBuffer:capacity:size:",  a3,  a4,  a5);
}

- (unsigned)maximumComputeSubstreams
{
  return -[MTLDeviceSPI maximumComputeSubstreams](self->_baseObject, "maximumComputeSubstreams");
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  id v5 = -[MTLDeviceSPI minLinearTextureAlignmentForPixelFormat:]( self->_baseObject,  "minLinearTextureAlignmentForPixelFormat:",  a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16093;
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
  unsigned __int8 v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
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

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return (unint64_t)-[MTLDeviceSPI minimumLinearTextureAlignmentForPixelFormat:]( self->_baseObject,  "minimumLinearTextureAlignmentForPixelFormat:",  a3);
}

- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3
{
  return (unint64_t)-[MTLDeviceSPI minimumTextureBufferAlignmentForPixelFormat:]( self->_baseObject,  "minimumTextureBufferAlignmentForPixelFormat:",  a3);
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *unint64_t v8 = v11;
  uint64_t v32 = v10;
  char v33 = *((_BYTE *)v8 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLAccelerationStructureDescriptor(v4);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = -[MTLDeviceSPI newAccelerationStructureWithDescriptor:]( baseObject,  "newAccelerationStructureWithDescriptor:",  v14);

  if (v15) {
    id v16 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v15,  self);
  }
  else {
    id v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -15615;
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
  uint64_t v22 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v24 = -[CaptureMTLAccelerationStructure traceStream](v16, "traceStream");
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

  return v16;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  char v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *unint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLDeviceSPI newAccelerationStructureWithSize:](self->_baseObject, "newAccelerationStructureWithSize:", a3);
  if (v12) {
    id v13 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15614;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    id v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    id v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  SaveMTLAccelerationStructureInfo((uint64_t)&v24, v12);
  char v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLAccelerationStructure traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)id v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
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
  id v14 = -[MTLDeviceSPI newAccelerationStructureWithSize:resourceIndex:]( self->_baseObject,  "newAccelerationStructureWithSize:resourceIndex:",  a3,  a4);
  if (v14) {
    char v15 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v15, "traceStream"));
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15506;
  char v17 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v27 + 24);
    uint64_t v20 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLAccelerationStructureInfo((uint64_t)&v26, v14);
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLAccelerationStructure traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = a4;
  uint64_t *v11 = v30;
  *((_BYTE *)v11 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id v6 = a4;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newAccelerationStructureWithSize:withDescriptor:]( self->_baseObject,  "newAccelerationStructureWithSize:withDescriptor:",  a3,  v6);
  if (v14) {
    char v15 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15358;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLAccelerationStructureInfo((uint64_t)&v27, v14);
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLAccelerationStructure traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  char v25 = SaveMTLAccelerationStructureAllocationDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id v4 = -[MTLDeviceSPI newArgumentEncoderWithLayout:](self->_baseObject, "newArgumentEncoderWithLayout:", a3);
  if (v4) {
    id v5 = -[CaptureMTLArgumentEncoder initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLArgumentEncoder),  "initWithBaseObject:captureDevice:",  v4,  self);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newBinaryArchiveWithDescriptor:error:]( self->_baseObject,  "newBinaryArchiveWithDescriptor:error:",  v6,  a4);
  if (v14) {
    char v15 = -[CaptureMTLBinaryArchive initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBinaryArchive),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLBinaryArchive traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15717;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLBinaryArchive traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (a4) {
      goto LABEL_14;
    }
LABEL_16:
    id v25 = 0LL;
    goto LABEL_17;
  }

  unint64_t v24 = v23->var0;
  if (!a4) {
    goto LABEL_16;
  }
LABEL_14:
  id v25 = *a4;
LABEL_17:
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = v25;
  *((void *)v18 + 3) = 0LL;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id v8 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newBinaryLibraryWithOptions_url_error",  (uint64_t)"Binary Linking",  0LL,  0LL);
  id v9 = -[MTLDeviceSPI newBinaryLibraryWithOptions:url:error:]( self->_baseObject,  "newBinaryLibraryWithOptions:url:error:",  a3,  v8,  a5);

  if (v9) {
    uint64_t v10 = -[CaptureMTLBinaryArchive initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBinaryArchive),  "initWithBaseObject:captureDevice:",  v9,  self);
  }
  else {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v33 = v14;
  char v34 = *((_BYTE *)v12 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v16 = -[MTLDeviceSPI newBufferWithBytes:length:options:]( self->_baseObject,  "newBufferWithBytes:length:options:",  a3,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLBuffer traceStream](v17, "traceStream"));
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -16313;
  char v19 = v35;
  if (v35 > 0x10uLL)
  {
    uint64_t v21 = *(void *)(v30 + 24);
    uint64_t v22 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x3000000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v35);
    LOBYTE(v35) = v35 + 48;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLBufferInfo((uint64_t)&v29, v16);
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  id v25 = -[CaptureMTLBuffer traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  char v27 = TransferBytes((uint64_t)&v29, (uint64_t *)a3, (const void *)a4);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = 0LL;
  v20[40] = v27;
  *(_DWORD *)(v20 + 41) = 0;
  *((_DWORD *)v20 + 11) = 0;
  uint64_t *v13 = v33;
  *((_BYTE *)v13 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v13 = __ldaxr(p_var2);
  while (__stlxr(v13 + 1, p_var2));
  char v37 = traceContext;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  unint64_t v40 = v13;
  s();
  uint64_t v15 = v14;
  uint64_t v16 = *v14;
  *uint64_t v14 = v17;
  uint64_t v41 = v16;
  char v42 = *((_BYTE *)v14 + 8);
  __int16 v43 = 16400;
  int v44 = 0;
  char v45 = 0;
  id v18 = -[MTLDeviceSPI newBufferWithBytes:length:options:gpuAddress:]( self->_baseObject,  "newBufferWithBytes:length:options:gpuAddress:",  a3,  a4,  a5,  a6);
  if (v18) {
    char v19 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v18,  self);
  }
  else {
    char v19 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)-[CaptureMTLBuffer traceStream](v19, "traceStream"));
  uint64_t v20 = v39;
  *(_DWORD *)(v39 + 8) = -15707;
  char v21 = v43;
  if (v43 > 0x10uLL)
  {
    uint64_t v23 = *(void *)(v38 + 24);
    id v36 = v18;
    unint64_t v24 = v19;
    unint64_t v25 = a4;
    unint64_t v26 = a5;
    unint64_t v27 = a6;
    uint64_t v28 = a3;
    uint64_t v29 = HIBYTE(v43);
    ++HIBYTE(v43);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v40, v29 | 0x3000000000LL) + 16;
    char v21 = v29;
    a3 = v28;
    a6 = v27;
    a5 = v26;
    a4 = v25;
    char v19 = v24;
    id v18 = v36;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v43);
    LOBYTE(v43) = v43 + 48;
  }

  *(_BYTE *)(v20 + 13) = v21;
  SaveMTLBufferInfo((uint64_t)&v37, v18);
  uint64_t v30 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v32 = -[CaptureMTLBuffer traceStream](v19, "traceStream");
  if (v32) {
    unint64_t v33 = v32->var0;
  }
  else {
    unint64_t v33 = 0LL;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v34 = GTTraceEncoder_storeBlob((uint64_t)&v37, a3, a4);
  }
  else {
    char v34 = 0;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v33;
  *((void *)v22 + 2) = a4;
  *((void *)v22 + 3) = a5;
  *((void *)v22 + 4) = a6;
  v22[40] = v34;
  *(_DWORD *)(v22 + 41) = 0;
  *((_DWORD *)v22 + 11) = 0;
  uint64_t *v15 = v41;
  *((_BYTE *)v15 + 8) = v42;
  *(_BYTE *)(v39 + 15) |= 8u;

  return v19;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  id v8 = -[MTLDeviceSPI newBufferWithBytesNoCopy:length:options:gpuAddress:deallocator:]( self->_baseObject,  "newBufferWithBytesNoCopy:length:options:gpuAddress:deallocator:",  a3,  a4,  a5,  a6,  a7);
  if (v8) {
    id v9 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v8,  self);
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unint64_t v25 = traceContext;
  uint64_t v26 = 0LL;
  uint64_t v27 = 0LL;
  unint64_t v28 = v7;
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  uint64_t v29 = v10;
  char v30 = *((_BYTE *)v8 + 8);
  __int16 v31 = 16400;
  int v32 = 0;
  char v33 = 0;
  id v12 = -[MTLDeviceSPI newBufferWithIOSurface:](self->_baseObject, "newBufferWithIOSurface:", a3);
  if (v12) {
    unint64_t v13 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    unint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)-[CaptureMTLBuffer traceStream](v13, "traceStream"));
  uint64_t v14 = v27;
  *(_DWORD *)(v27 + 8) = -16163;
  char v15 = v31;
  if (v31 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v26 + 24);
    uint64_t v18 = HIBYTE(v31);
    ++HIBYTE(v31);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v28, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v31);
    LOBYTE(v31) = v31 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  SaveMTLBufferInfo((uint64_t)&v25, v12);
  char v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v21 = -[CaptureMTLBuffer traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  char v23 = SaveIOSurfaceRef((uint64_t)&v25, a3);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  uint64_t *v9 = v29;
  *((_BYTE *)v9 + 8) = v30;
  *(_BYTE *)(v27 + 15) |= 8u;

  return v13;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
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
  id v14 = -[MTLDeviceSPI newBufferWithLength:options:](self->_baseObject, "newBufferWithLength:options:", a3, a4);
  if (v14) {
    char v15 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLBuffer traceStream](v15, "traceStream"));
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16314;
  char v17 = v32;
  if (v32 > 0x18uLL)
  {
    uint64_t v19 = *(void *)(v27 + 24);
    uint64_t v20 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v29, v20 | 0x2800000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v32);
    LOBYTE(v32) = v32 + 40;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLBufferInfo((uint64_t)&v26, v14);
  char v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v23 = -[CaptureMTLBuffer traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = a4;
  *((void *)v18 + 4) = 0LL;
  uint64_t *v11 = v30;
  *((_BYTE *)v11 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v28 = traceContext;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v31 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v32 = v14;
  char v33 = *((_BYTE *)v12 + 8);
  __int16 v34 = 16400;
  int v35 = 0;
  char v36 = 0;
  id v16 = -[MTLDeviceSPI newBufferWithLength:options:gpuAddress:]( self->_baseObject,  "newBufferWithLength:options:gpuAddress:",  a3,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLBuffer traceStream](v17, "traceStream"));
  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -15705;
  char v19 = v34;
  if (v34 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v29 + 24);
    uint64_t v22 = HIBYTE(v34);
    ++HIBYTE(v34);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v31, v22 | 0x2800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v34);
    LOBYTE(v34) = v34 + 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLBufferInfo((uint64_t)&v28, v16);
  char v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v25 = -[CaptureMTLBuffer traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a3;
  *((void *)v20 + 3) = a4;
  *((void *)v20 + 4) = a5;
  uint64_t *v13 = v32;
  *((_BYTE *)v13 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v17;
}

- (id)newCommandQueue
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v22 = traceContext;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v25 = v5;
  s();
  unint64_t v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v26 = v8;
  char v27 = *((_BYTE *)v6 + 8);
  __int16 v28 = 16400;
  int v29 = 0;
  char v30 = 0;
  id v10 = -[MTLDeviceSPI newCommandQueue](self->_baseObject, "newCommandQueue");
  if (v10) {
    unint64_t v11 = -[CaptureMTLCommandQueue initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandQueue),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    unint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)-[CaptureMTLCommandQueue traceStream](v11, "traceStream"));
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16316;
  char v13 = v28;
  if (v28 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v23 + 24);
    uint64_t v16 = HIBYTE(v28);
    ++HIBYTE(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v28);
    LOBYTE(v28) = v28 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = -[CaptureMTLCommandQueue traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *unint64_t v7 = v26;
  *((_BYTE *)v7 + 8) = v27;
  *(_BYTE *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  __int16 v28 = traceContext;
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
  id v13 = unwrapMTLCommandQueueDescriptor(v4);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = -[MTLDeviceSPI newCommandQueueWithDescriptor:](baseObject, "newCommandQueueWithDescriptor:", v14);

  if (v15) {
    uint64_t v16 = -[CaptureMTLCommandQueue initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandQueue),  "initWithBaseObject:captureDevice:",  v15,  self);
  }
  else {
    uint64_t v16 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)-[CaptureMTLCommandQueue traceStream](v16, "traceStream"));
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -16165;
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
  uint64_t v22 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = -[CaptureMTLCommandQueue traceStream](v16, "traceStream");
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0LL;
  }
  char v26 = SaveMTLCommandQueueDescriptor((uint64_t)&v28, v4);
  *(void *)char v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  uint64_t *v9 = v32;
  *((_BYTE *)v9 + 8) = v33;
  *(_BYTE *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
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
  id v12 = -[MTLDeviceSPI newCommandQueueWithMaxCommandBufferCount:]( self->_baseObject,  "newCommandQueueWithMaxCommandBufferCount:",  a3);
  if (v12) {
    id v13 = -[CaptureMTLCommandQueue initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLCommandQueue),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    id v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLCommandQueue traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16315;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  char v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLCommandQueue traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newDagStringWithGraphs:(id)a3
{
  return -[MTLDeviceSPI newDagStringWithGraphs:](self->_baseObject, "newDagStringWithGraphs:", a3);
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newDynamicLibrary_computeDescriptor_error",  (uint64_t)"Dynamic Libraries SPI",  0LL,  0LL);
  baseObject = self->_baseObject;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 baseObject]);

  id v12 = unwrapMTLComputePipelineDescriptor(v8);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  id v14 = -[MTLDeviceSPI newDynamicLibrary:computeDescriptor:error:]( baseObject,  "newDynamicLibrary:computeDescriptor:error:",  v11,  v13,  a5);
  if (v14) {
    char v15 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }

  return v15;
}

- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newDynamicLibraryFromURL_error",  (uint64_t)"Dynamic Libraries",  0LL,  0LL);
  id v7 = -[MTLDeviceSPI newDynamicLibraryFromURL:error:](self->_baseObject, "newDynamicLibraryFromURL:error:", v6, a4);

  if (v7) {
    id v8 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v7,  self);
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v5 = -[MTLDeviceSPI newDynamicLibraryWithDescriptor:error:]( self->_baseObject,  "newDynamicLibraryWithDescriptor:error:",  a3,  a4);
  if (v5) {
    id v6 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v5,  self);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unint64_t v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newDynamicLibraryWithURL:error:](self->_baseObject, "newDynamicLibraryWithURL:error:", v6, a4);
  if (v14) {
    char v15 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLDynamicLibrary traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15613;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLDynamicLibraryInfo((uint64_t)&v27, v14);
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLDynamicLibrary traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v33 = v14;
  char v34 = *((_BYTE *)v12 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v16 = -[MTLDeviceSPI newDynamicLibraryWithURL:options:error:]( self->_baseObject,  "newDynamicLibraryWithURL:options:error:",  v8,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLDynamicLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLDynamicLibrary),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLDynamicLibrary traceStream](v17, "traceStream"));
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15531;
  char v19 = v35;
  if (v35 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v30 + 24);
    uint64_t v22 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x2800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v35);
    LOBYTE(v35) = v35 + 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLDynamicLibraryInfo((uint64_t)&v29, v16);
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v25 = -[CaptureMTLDynamicLibrary traceStream](v17, "traceStream");
  if (!v25)
  {
    unint64_t v26 = 0LL;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v26 = v25->var0;
  if (a5) {
LABEL_14:
  }
    a5 = (id *)*a5;
LABEL_15:
  unsigned __int8 v27 = SaveNSURL((uint64_t)&v29, v8);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  v20[32] = v27;
  *(_DWORD *)(v20 + 33) = 0;
  *((_DWORD *)v20 + 9) = 0;
  uint64_t *v13 = v33;
  *((_BYTE *)v13 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newEvent
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v22 = traceContext;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v25 = v5;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v26 = v8;
  char v27 = *((_BYTE *)v6 + 8);
  __int16 v28 = 16400;
  int v29 = 0;
  char v30 = 0;
  id v10 = -[MTLDeviceSPI newEvent](self->_baseObject, "newEvent");
  if (v10) {
    unint64_t v11 = -[CaptureMTLEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLEvent),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    unint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)-[CaptureMTLEvent traceStream](v11, "traceStream"));
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15997;
  char v13 = v28;
  if (v28 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v23 + 24);
    uint64_t v16 = HIBYTE(v28);
    ++HIBYTE(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v28);
    LOBYTE(v28) = v28 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = -[CaptureMTLEvent traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *id v7 = v26;
  *((_BYTE *)v7 + 8) = v27;
  *(_BYTE *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newFence
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v22 = traceContext;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v25 = v5;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v26 = v8;
  char v27 = *((_BYTE *)v6 + 8);
  __int16 v28 = 16400;
  int v29 = 0;
  char v30 = 0;
  id v10 = -[MTLDeviceSPI newFence](self->_baseObject, "newFence");
  if (v10) {
    unint64_t v11 = -[CaptureMTLFence initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLFence),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    unint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)-[CaptureMTLFence traceStream](v11, "traceStream"));
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16128;
  char v13 = v28;
  if (v28 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v23 + 24);
    uint64_t v16 = HIBYTE(v28);
    ++HIBYTE(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v28);
    LOBYTE(v28) = v28 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = -[CaptureMTLFence traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *id v7 = v26;
  *((_BYTE *)v7 + 8) = v27;
  *(_BYTE *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  char v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newIOCommandQueueWithDescriptor:error:]( self->_baseObject,  "newIOCommandQueueWithDescriptor:error:",  v6,  a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLIOCommandQueue initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOCommandQueue),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLIOCommandQueue traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15350;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLIOCommandQueue traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v25 = SaveMTLIOCommandQueueDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v33 = v14;
  char v34 = *((_BYTE *)v12 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v16 = -[MTLDeviceSPI newIOFileHandleWithURL:compressionMethod:error:]( self->_baseObject,  "newIOFileHandleWithURL:compressionMethod:error:",  v8,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLIOFileHandle initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOFileHandle),  "initWithBaseObject:captureContext:",  v16,  self->_traceContext);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLIOFileHandle traceStream](v17, "traceStream"));
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15260;
  char v19 = v35;
  if (v35 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v30 + 24);
    uint64_t v22 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x2800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v35);
    LOBYTE(v35) = v35 + 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v25 = -[CaptureMTLIOFileHandle traceStream](v17, "traceStream");
  if (!v25)
  {
    unint64_t v26 = 0LL;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v26 = v25->var0;
  if (a5) {
LABEL_14:
  }
    a5 = (id *)*a5;
LABEL_15:
  unsigned __int8 v27 = SaveNSURL((uint64_t)&v29, v8);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  v20[32] = v27;
  *(_DWORD *)(v20 + 33) = 0;
  *((_DWORD *)v20 + 9) = 0;
  uint64_t *v13 = v33;
  *((_BYTE *)v13 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unsigned __int8 v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newIOFileHandleWithURL:error:](self->_baseObject, "newIOFileHandleWithURL:error:", v6, a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLIOFileHandle initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOFileHandle),  "initWithBaseObject:captureContext:",  v14,  self->_traceContext);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLIOFileHandle traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15259;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLIOFileHandle traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v33 = v14;
  char v34 = *((_BYTE *)v12 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v16 = -[MTLDeviceSPI newIOHandleWithURL:compressionMethod:error:]( self->_baseObject,  "newIOHandleWithURL:compressionMethod:error:",  v8,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLIOFileHandle initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOFileHandle),  "initWithBaseObject:captureContext:",  v16,  self->_traceContext);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLIOFileHandle traceStream](v17, "traceStream"));
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15296;
  char v19 = v35;
  if (v35 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v30 + 24);
    uint64_t v22 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x2800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    uint64_t v20 = (char *)(v18 + v35);
    LOBYTE(v35) = v35 + 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v25 = -[CaptureMTLIOFileHandle traceStream](v17, "traceStream");
  if (!v25)
  {
    unint64_t v26 = 0LL;
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v26 = v25->var0;
  if (a5) {
LABEL_14:
  }
    a5 = (id *)*a5;
LABEL_15:
  unsigned __int8 v27 = SaveNSURL((uint64_t)&v29, v8);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  v20[32] = v27;
  *(_DWORD *)(v20 + 33) = 0;
  *((_DWORD *)v20 + 9) = 0;
  uint64_t *v13 = v33;
  *((_BYTE *)v13 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return -[MTLDeviceSPI newIndirectArgumentBufferLayoutWithStructType:]( self->_baseObject,  "newIndirectArgumentBufferLayoutWithStructType:",  a3);
}

- (id)newIndirectArgumentEncoderWithArguments:(id)a3
{
  return -[MTLDeviceSPI newIndirectArgumentEncoderWithArguments:]( self->_baseObject,  "newIndirectArgumentEncoderWithArguments:",  a3);
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
  return -[MTLDeviceSPI newIndirectArgumentEncoderWithLayout:]( self->_baseObject,  "newIndirectArgumentEncoderWithLayout:",  a3);
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v34 = v14;
  char v35 = *((_BYTE *)v12 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  id v16 = -[MTLDeviceSPI newIndirectCommandBufferWithDescriptor:maxCommandCount:options:]( self->_baseObject,  "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:",  v9,  a4,  a5);
  char v17 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeICBIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeICBIntoArgumentBufferForResourceIndex:withDescriptor:",  v16,  v9));

  if (v16) {
    uint64_t v18 = -[CaptureMTLIndirectCommandBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLIndirectCommandBuffer),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    uint64_t v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLIndirectCommandBuffer traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15969;
  char v20 = v36;
  if (v36 > 0x18uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2800000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 40;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLIndirectCommandBufferInfo((uint64_t)&v30, v16);
  unint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v26 = -[CaptureMTLIndirectCommandBuffer traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLIndirectCommandBufferDescriptor((uint64_t)&v30, v17, self);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  *((void *)v21 + 3) = a5;
  v21[32] = v28;
  *(_DWORD *)(v21 + 33) = 0;
  *((_DWORD *)v21 + 9) = 0;
  uint64_t *v13 = v34;
  *((_BYTE *)v13 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v33 = v14;
  char v34 = *((_BYTE *)v12 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v16 = -[MTLDeviceSPI newIndirectCommandBufferWithDescriptor:maxCount:options:]( self->_baseObject,  "newIndirectCommandBufferWithDescriptor:maxCount:options:",  v8,  a4,  a5);
  if (v16) {
    char v17 = -[CaptureMTLBuffer initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLBuffer),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLBuffer traceStream](v17, "traceStream"));
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15972;
  char v19 = v35;
  if (v35 > 0x18uLL)
  {
    uint64_t v21 = *(void *)(v30 + 24);
    uint64_t v22 = HIBYTE(v35);
    ++HIBYTE(v35);
    char v20 = GTTraceMemPool_allocateBytes(v21, v32, v22 | 0x2800000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    char v20 = (char *)(v18 + v35);
    LOBYTE(v35) = v35 + 40;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLBufferInfo((uint64_t)&v29, v16);
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unsigned __int8 v25 = -[CaptureMTLBuffer traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  char v27 = SaveMTLIndirectCommandBufferDescriptor((uint64_t)&v29, v8, self);
  *(void *)char v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  v20[32] = v27;
  *(_DWORD *)(v20 + 33) = 0;
  *((_DWORD *)v20 + 9) = 0;
  uint64_t *v13 = v33;
  *((_BYTE *)v13 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  id v5 = -[MTLDeviceSPI newIndirectComputeCommandEncoderWithBuffer:]( baseObject,  "newIndirectComputeCommandEncoderWithBuffer:",  v4);

  return v5;
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  id v5 = -[MTLDeviceSPI newIndirectRenderCommandEncoderWithBuffer:]( baseObject,  "newIndirectRenderCommandEncoderWithBuffer:",  v4);

  return v5;
}

- (id)newLateEvalEvent
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v5 = __ldaxr(p_var2);
  while (__stlxr(v5 + 1, p_var2));
  uint64_t v22 = traceContext;
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v25 = v5;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  uint64_t v26 = v8;
  char v27 = *((_BYTE *)v6 + 8);
  __int16 v28 = 16400;
  int v29 = 0;
  char v30 = 0;
  id v10 = -[MTLDeviceSPI newLateEvalEvent](self->_baseObject, "newLateEvalEvent");
  if (v10) {
    unint64_t v11 = -[CaptureMTLLateEvalEvent initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLateEvalEvent),  "initWithBaseObject:captureDevice:",  v10,  self);
  }
  else {
    unint64_t v11 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)-[CaptureMTLLateEvalEvent traceStream](v11, "traceStream"));
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15496;
  char v13 = v28;
  if (v28 > 0x30uLL)
  {
    uint64_t v15 = *(void *)(v23 + 24);
    uint64_t v16 = HIBYTE(v28);
    ++HIBYTE(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x1000000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v28);
    LOBYTE(v28) = v28 + 16;
  }

  *(_BYTE *)(v12 + 13) = v13;
  char v17 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v19 = -[CaptureMTLLateEvalEvent traceStream](v11, "traceStream");
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0LL;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *id v7 = v26;
  *((_BYTE *)v7 + 8) = v27;
  *(_BYTE *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id v6 = (dispatch_data_s *)a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  int v29 = traceContext;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v32 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v33 = v12;
  char v34 = *((_BYTE *)v10 + 8);
  __int16 v35 = 16400;
  int v36 = 0;
  char v37 = 0;
  id v14 = -[MTLDeviceSPI newLibraryWithData:error:](self->_baseObject, "newLibraryWithData:error:", v6, a4);
  if (v14) {
    uint64_t v15 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    uint64_t v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)-[CaptureMTLLibrary traceStream](v15, "traceStream"));
  uint64_t v16 = v31;
  *(_DWORD *)(v31 + 8) = -16306;
  char v17 = v35;
  if (v35 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v30 + 24);
    uint64_t v20 = HIBYTE(v35);
    ++HIBYTE(v35);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v32, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v35);
    LOBYTE(v35) = v35 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  SaveMTLLibraryInfoWithPath((uint64_t)&v29, v14, 0LL);
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLLibrary traceStream](v15, "traceStream");
  if (v23)
  {
    unint64_t v25 = v23->var0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v25 = 0LL;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v24);
  if ((objc_opt_isKindOfClass(v14, v26) & 1) != 0)
  {
    RetainDebugObject(v14);
    char v27 = 0;
  }

  else
  {
    char v27 = SaveDispatchData_((uint64_t)&v29, v6);
  }

  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v25;
  *((void *)v18 + 2) = a4;
  v18[24] = v27;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v33;
  *((_BYTE *)v11 + 8) = v34;
  *(_BYTE *)(v31 + 15) |= 8u;

  return v15;
}

- (id)newLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLStitchedLibraryDescriptor(v6);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[MTLDeviceSPI newLibraryWithDescriptor:error:](baseObject, "newLibraryWithDescriptor:error:", v16, a4);

  if (v17) {
    uint64_t v18 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v17,  self);
  }
  else {
    uint64_t v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLLibrary traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15435;
  char v20 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLLibraryInfoWithPath((uint64_t)&v30, v17, 0LL);
  uint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = -[CaptureMTLLibrary traceStream](v18, "traceStream");
  if (!v26)
  {
    unint64_t v27 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v27 = v26->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v28 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v30, v6);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  uint64_t *v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)newLibraryWithDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLStitchedLibraryDescriptorSPI(v6);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[MTLDeviceSPI newLibraryWithDescriptorSPI:error:](baseObject, "newLibraryWithDescriptorSPI:error:", v16, a4);

  if (v17) {
    uint64_t v18 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v17,  self);
  }
  else {
    uint64_t v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLLibrary traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15434;
  char v20 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLLibraryInfoWithPath((uint64_t)&v30, v17, 0LL);
  uint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = -[CaptureMTLLibrary traceStream](v18, "traceStream");
  if (!v26)
  {
    unint64_t v27 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v27 = v26->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v28 = SaveMTLStitchedLibraryDescriptorSPI((uint64_t)&v30, v6);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  uint64_t *v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  uint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  unint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapMTLStitchedLibraryDescriptorSPI(v6);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = -[MTLDeviceSPI newLibraryWithStitchedDescriptorSPI:error:]( baseObject,  "newLibraryWithStitchedDescriptorSPI:error:",  v16,  a4);

  if (v17) {
    uint64_t v18 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v17,  self);
  }
  else {
    uint64_t v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLLibrary traceStream](v18, "traceStream"));
  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -15419;
  char v20 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLLibraryInfoWithPath((uint64_t)&v30, v17, 0LL);
  uint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v26 = -[CaptureMTLLibrary traceStream](v18, "traceStream");
  if (!v26)
  {
    unint64_t v27 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v27 = v26->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v28 = SaveMTLStitchedLibraryDescriptorSPI((uint64_t)&v30, v6);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a4;
  v21[24] = v28;
  *(_DWORD *)(v21 + 25) = 0;
  *((_DWORD *)v21 + 7) = 0;
  uint64_t *v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v18;
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newLogStateWithDescriptor_error",  (uint64_t)"Shader logging",  0LL,  0LL);
  id v7 = -[MTLDeviceSPI newLogStateWithDescriptor:error:](self->_baseObject, "newLogStateWithDescriptor:error:", v6, a4);

  if (v7) {
    uint64_t v8 = -[CaptureMTLLogState initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLLogState),  "initWithBaseObject:captureContext:",  v7,  self->_traceContext);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  uint64_t v24 = traceContext;
  uint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  unint64_t v27 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v28 = v10;
  char v29 = *((_BYTE *)v8 + 8);
  __int16 v30 = 16400;
  int v31 = 0;
  char v32 = 0;
  id v12 = -[MTLDeviceSPI newProfileWithExecutionSize:](self->_baseObject, "newProfileWithExecutionSize:", a3);
  if (v12) {
    uint64_t v13 = -[CaptureMTLDeadlineProfile initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLDeadlineProfile),  "initWithBaseObject:captureContext:",  v12,  self->_traceContext);
  }
  else {
    uint64_t v13 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)-[CaptureMTLDeadlineProfile traceStream](v13, "traceStream"));
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15317;
  char v15 = v30;
  if (v30 > 0x28uLL)
  {
    uint64_t v17 = *(void *)(v25 + 24);
    uint64_t v18 = HIBYTE(v30);
    ++HIBYTE(v30);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, v27, v18 | 0x1800000000LL) + 16;
    char v15 = v18;
  }

  else
  {
    uint64_t v16 = (char *)(v14 + v30);
    LOBYTE(v30) = v30 + 24;
  }

  *(_BYTE *)(v14 + 13) = v15;
  uint64_t v19 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v21 = -[CaptureMTLDeadlineProfile traceStream](v13, "traceStream");
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0LL;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  uint64_t *v9 = v28;
  *((_BYTE *)v9 + 8) = v29;
  *(_BYTE *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unint64_t v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newResidencySetWithDescriptor:error:]( self->_baseObject,  "newResidencySetWithDescriptor:error:",  v6,  a4);
  if (v14) {
    char v15 = -[CaptureMTLResidencySet initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLResidencySet),  "initWithBaseObject:captureDevice:",  v14,  self);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLResidencySet traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15245;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLResidencySet traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  char v25 = SaveMTLResidencySetDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unint64_t v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newTextureLayoutWithDescriptor:isHeapOrBufferBacked:]( self->_baseObject,  "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:",  v6,  v4);
  if (v14) {
    char v15 = -[CaptureMTLTextureLayout initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLTextureLayout),  "initWithBaseObject:captureContext:",  v14,  self->_traceContext);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLTextureLayout traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -16099;
  char v17 = v33;
  if (v33 > 0x28uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x1800000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 24;
  }

  *(_BYTE *)(v16 + 13) = v17;
  uint64_t v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLTextureLayout traceStream](v15, "traceStream");
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0LL;
  }
  char v25 = SaveMTLTextureDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((_DWORD *)v18 + 4) = v4;
  v18[20] = v25;
  *(_WORD *)(v18 + 21) = 0;
  v18[23] = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id v10 = a6;
  traceContext = self->_traceContext;
  id v12 = a5;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v14 = __ldaxr(p_var2);
  while (__stlxr(v14 + 1, p_var2));
  uint64_t v39 = traceContext;
  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  unint64_t v42 = v14;
  s();
  uint64_t v16 = v15;
  uint64_t v17 = *v15;
  uint64_t *v15 = v18;
  uint64_t v43 = v17;
  char v44 = *((_BYTE *)v15 + 8);
  __int16 v45 = 16400;
  int v46 = 0;
  char v47 = 0;
  id v19 = -[MTLDeviceSPI newTextureWithBytesNoCopy:length:descriptor:deallocator:]( self->_baseObject,  "newTextureWithBytesNoCopy:length:descriptor:deallocator:",  a3,  a4,  v12,  v10);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v19,  v12));

  if (v19) {
    uint64_t v21 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v19,  self);
  }
  else {
    uint64_t v21 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v39, (uint64_t)-[CaptureMTLTexture traceStream](v21, "traceStream"));
  uint64_t v22 = v41;
  *(_DWORD *)(v41 + 8) = -16096;
  char v23 = v45;
  if (v45 > 0x18uLL)
  {
    uint64_t v25 = *(void *)(v40 + 24);
    char v38 = v21;
    unint64_t v26 = a4;
    id v27 = v10;
    uint64_t v28 = v20;
    uint64_t v29 = a3;
    uint64_t v30 = HIBYTE(v45);
    ++HIBYTE(v45);
    unint64_t v24 = GTTraceMemPool_allocateBytes(v25, v42, v30 | 0x2800000000LL) + 16;
    char v23 = v30;
    a3 = v29;
    uint64_t v20 = v28;
    id v10 = v27;
    a4 = v26;
    uint64_t v21 = v38;
  }

  else
  {
    unint64_t v24 = (char *)(v22 + v45);
    LOBYTE(v45) = v45 + 40;
  }

  *(_BYTE *)(v22 + 13) = v23;
  SaveMTLTextureInfo((uint64_t)&v39, v19);
  uint64_t v31 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v31) {
    unint64_t var0 = v31->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  __int16 v33 = -[CaptureMTLTexture traceStream](v21, "traceStream");
  if (v33) {
    unint64_t v34 = v33->var0;
  }
  else {
    unint64_t v34 = 0LL;
  }
  char v35 = TransferBytes((uint64_t)&v39, (uint64_t *)a3, (const void *)a4);
  char v36 = SaveMTLTextureDescriptor((uint64_t)&v39, v20);
  *(void *)unint64_t v24 = var0;
  *((void *)v24 + 1) = v34;
  *((void *)v24 + 2) = a4;
  *((void *)v24 + 3) = v10;
  v24[32] = v35;
  v24[33] = v36;
  *(_DWORD *)(v24 + 34) = 0;
  *((_WORD *)v24 + 19) = 0;
  *uint64_t v16 = v43;
  *((_BYTE *)v16 + 8) = v44;
  *(_BYTE *)(v41 + 15) |= 8u;

  return v21;
}

- (id)newTextureWithDescriptor:(id)a3
{
  traceContext = self->_traceContext;
  id v5 = a3;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unint64_t v26 = traceContext;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = v7;
  s();
  unint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v30 = v10;
  char v31 = *((_BYTE *)v8 + 8);
  __int16 v32 = 16400;
  int v33 = 0;
  char v34 = 0;
  id v12 = -[MTLDeviceSPI newTextureWithDescriptor:](self->_baseObject, "newTextureWithDescriptor:", v5);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v12,  v5));

  if (v12) {
    unint64_t v14 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v12,  self);
  }
  else {
    unint64_t v14 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)-[CaptureMTLTexture traceStream](v14, "traceStream"));
  uint64_t v15 = v28;
  *(_DWORD *)(v28 + 8) = -16310;
  char v16 = v32;
  if (v32 > 0x20uLL)
  {
    uint64_t v18 = *(void *)(v27 + 24);
    uint64_t v19 = HIBYTE(v32);
    ++HIBYTE(v32);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, v29, v19 | 0x2000000000LL) + 16;
    char v16 = v19;
  }

  else
  {
    uint64_t v17 = (char *)(v15 + v32);
    LOBYTE(v32) = v32 + 32;
  }

  *(_BYTE *)(v15 + 13) = v16;
  SaveMTLTextureInfo((uint64_t)&v26, v12);
  uint64_t v20 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = -[CaptureMTLTexture traceStream](v14, "traceStream");
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0LL;
  }
  char v24 = SaveMTLTextureDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  *((void *)v17 + 2) = 0LL;
  v17[24] = v24;
  *(_DWORD *)(v17 + 25) = 0;
  *((_DWORD *)v17 + 7) = 0;
  uint64_t *v9 = v30;
  *((_BYTE *)v9 + 8) = v31;
  *(_BYTE *)(v28 + 15) |= 8u;

  return v14;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  traceContext = self->_traceContext;
  id v9 = a3;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  char v31 = traceContext;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  unint64_t v34 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v35 = v14;
  char v36 = *((_BYTE *)v12 + 8);
  __int16 v37 = 16400;
  int v38 = 0;
  char v39 = 0;
  id v16 = -[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:]( self->_baseObject,  "newTextureWithDescriptor:iosurface:plane:",  v9,  a4,  a5);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v16,  v9));

  if (v16) {
    uint64_t v18 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    uint64_t v18 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)-[CaptureMTLTexture traceStream](v18, "traceStream"));
  uint64_t v19 = v33;
  *(_DWORD *)(v33 + 8) = -16294;
  char v20 = v37;
  if (v37 > 0x20uLL)
  {
    uint64_t v22 = *(void *)(v32 + 24);
    uint64_t v23 = HIBYTE(v37);
    ++HIBYTE(v37);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, v34, v23 | 0x2000000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    uint64_t v21 = (char *)(v19 + v37);
    LOBYTE(v37) = v37 + 32;
  }

  *(_BYTE *)(v19 + 13) = v20;
  SaveMTLTextureInfo((uint64_t)&v31, v16);
  char v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v26 = -[CaptureMTLTexture traceStream](v18, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLTextureDescriptor((uint64_t)&v31, v17);
  char v29 = SaveIOSurfaceRef((uint64_t)&v31, a4);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = a5;
  v21[24] = v28;
  v21[25] = v29;
  *(_DWORD *)(v21 + 26) = 0;
  *((_WORD *)v21 + 15) = 0;
  uint64_t *v13 = v35;
  *((_BYTE *)v13 + 8) = v36;
  *(_BYTE *)(v33 + 15) |= 8u;

  return v18;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg( (uint64_t)"kDYFEMTLDevice_newTextureWithDescriptor_iosurface_plane_slice",  (uint64_t)"IOSurface texture slices SPI",  0LL,  0LL);
  id v11 = -[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:slice:]( self->_baseObject,  "newTextureWithDescriptor:iosurface:plane:slice:",  v10,  a4,  a5,  a6);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeTextureIntoArgumentBufferForResourceIndex:withDescriptor:",  v11,  v10));

  if (v11) {
    uint64_t v13 = -[CaptureMTLTexture initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLTexture),  "initWithBaseObject:captureDevice:",  v11,  self);
  }
  else {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  baseObject = self->_baseObject;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 baseObject]);
  id v8 = -[MTLDeviceSPI newTileRenderPipelineDescriptorWithSerializedData:deserializationContext:]( baseObject,  "newTileRenderPipelineDescriptorWithSerializedData:deserializationContext:",  v6,  v7);

  return v8;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = [a3 copy];
  id v5 = -[MTLDeviceSPI newVisibleFunctionTableWithDescriptor:](baseObject, "newVisibleFunctionTableWithDescriptor:", v4);

  return v5;
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[MTLDeviceSPI pipelineCacheStats](self->_baseObject, "pipelineCacheStats");
}

- (id)productName
{
  return -[MTLDeviceSPI productName](self->_baseObject, "productName");
}

- (BOOL)reserveGPUAddressRange:(_NSRange)a3
{
  return -[MTLDeviceSPI reserveGPUAddressRange:]( self->_baseObject,  "reserveGPUAddressRange:",  a3.location,  a3.length);
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  return (unint64_t)-[MTLDeviceSPI resourcePatchingTypeForResourceType:]( self->_baseObject,  "resourcePatchingTypeForResourceType:",  a3);
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
}

- (id)serializeTileRenderPipelineDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = unwrapMTLTileRenderPipelineDescriptor(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = -[MTLDeviceSPI serializeTileRenderPipelineDescriptor:](baseObject, "serializeTileRenderPipelineDescriptor:", v5);

  return v6;
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
}

- (void)setIndirectArgumentBufferDecodingData:(id)a3
{
}

- (void)setRawBVHBuilderPtr:(id)a3
{
}

- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3
{
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  id v5 = -[MTLDeviceSPI sparseTileSizeInBytesForSparsePageSize:]( self->_baseObject,  "sparseTileSizeInBytesForSparsePageSize:",  a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15315;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  baseObject = self->_baseObject;
  if (baseObject)
  {
    -[MTLDeviceSPI sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:]( baseObject,  "sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:",  a4,  a5,  a6,  a7);
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->unint64_t var2 = 0LL;
  }

  uint64_t v14 = (char *)v24;
  *(_DWORD *)(v24 + 8) = -15314;
  if (v27)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x4000000000LL) + 16;
  }

  else
  {
    LOBYTE(v16) = 0;
    char v27 = 64;
    uint64_t v17 = v14;
  }

  v14[13] = v16;
  uint64_t v18 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v17 = var0;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v17 + 3) = var2;
  *((void *)v17 + 4) = a4;
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = a6;
  *((void *)v17 + 7) = a7;
  s();
  result->unint64_t var0 = v22;
  LOBYTE(result->var1) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
  return result;
}

- (void)startCollectingPipelineDescriptors
{
}

- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3
{
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return -[MTLDeviceSPI supportsCounterSampling:](self->_baseObject, "supportsCounterSampling:", a3);
}

- (BOOL)supportsFamily:(int64_t)a3
{
  return -[MTLDeviceSPI supportsFamily:](self->_baseObject, "supportsFamily:", a3);
}

- (BOOL)supportsFeatureSet:(unint64_t)a3
{
  return -[MTLDeviceSPI supportsFeatureSet:](self->_baseObject, "supportsFeatureSet:", a3);
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  unsigned int v5 = -[MTLDeviceSPI supportsRasterizationRateMapWithLayerCount:]( self->_baseObject,  "supportsRasterizationRateMapWithLayerCount:",  a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15791;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  unsigned int v5 = -[MTLDeviceSPI supportsSampleCount:](self->_baseObject, "supportsSampleCount:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16205;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsTextureSampleCount:(unint64_t)a3
{
  unsigned int v5 = -[MTLDeviceSPI supportsTextureSampleCount:](self->_baseObject, "supportsTextureSampleCount:", a3);
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16166;
  unsigned __int8 v7 = v20;
  if (v20 > 0x28uLL)
  {
    uint64_t v9 = *(void *)(v16[1] + 24LL);
    uint64_t v10 = v21++;
    id v8 = GTTraceMemPool_allocateBytes(v9, v18, v10 | 0x1800000000LL) + 16;
    unsigned __int8 v7 = v10;
  }

  else
  {
    id v8 = (char *)(v6 + v20);
    v20 += 24;
  }

  *(_BYTE *)(v6 + 13) = v7;
  id v11 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)id v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(_BYTE *)(v13 + 8) = v19;
  *(_BYTE *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return -[MTLDeviceSPI supportsTextureWriteRoundingMode:]( self->_baseObject,  "supportsTextureWriteRoundingMode:",  a3);
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  return -[MTLDeviceSPI supportsVertexAmplificationCount:]( self->_baseObject,  "supportsVertexAmplificationCount:",  a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  baseObject = self->_baseObject;
  if (baseObject)
  {
    -[MTLDeviceSPI tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:]( baseObject,  "tileSizeWithSparsePageSize:textureType:pixelFormat:sampleCount:",  a4,  a5,  a6,  a7);
  }

  else
  {
    retstr->unint64_t var0 = 0LL;
    retstr->var1 = 0LL;
    retstr->unint64_t var2 = 0LL;
  }

  uint64_t v14 = (char *)v24;
  *(_DWORD *)(v24 + 8) = -15796;
  if (v27)
  {
    uint64_t v15 = *(void *)(v23[1] + 24LL);
    uint64_t v16 = v28++;
    uint64_t v17 = GTTraceMemPool_allocateBytes(v15, v25, v16 | 0x4000000000LL) + 16;
  }

  else
  {
    LOBYTE(v16) = 0;
    char v27 = 64;
    uint64_t v17 = v14;
  }

  v14[13] = v16;
  uint64_t v18 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v17 = var0;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v17 + 3) = var2;
  *((void *)v17 + 4) = a4;
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = a6;
  *((void *)v17 + 7) = a7;
  s();
  result->unint64_t var0 = v22;
  LOBYTE(result->var1) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
  return result;
}

- (void)unloadShaderCaches
{
}

- (void)unmapShaderSampleBuffer
{
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16295;
  unsigned __int8 v4 = v16;
  if (v16 > 0x38uLL)
  {
    uint64_t v6 = *(void *)(v12[1] + 24LL);
    uint64_t v7 = v17++;
    unsigned int v5 = GTTraceMemPool_allocateBytes(v6, v14, v7 | 0x800000000LL) + 16;
    unsigned __int8 v4 = v7;
  }

  else
  {
    unsigned int v5 = (char *)(v3 + v16);
    v16 += 8;
  }

  *(_BYTE *)(v3 + 13) = v4;
  id v8 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  *(void *)unsigned int v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(_BYTE *)(v10 + 8) = v15;
  *(_BYTE *)(v13 + 15) |= 8u;
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  baseObject = self->_baseObject;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 baseObject]);
  LOBYTE(a5) = -[MTLDeviceSPI validateDynamicLibrary:state:error:]( baseObject,  "validateDynamicLibrary:state:error:",  v8,  v6,  a5);

  return (char)a5;
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLDeviceSPI validateDynamicLibraryDescriptor:error:]( self->_baseObject,  "validateDynamicLibraryDescriptor:error:",  a3,  a4);
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  return -[MTLDeviceSPI validateDynamicLibraryURL:error:]( self->_baseObject,  "validateDynamicLibraryURL:error:",  a3,  a4);
}

- (id)vendorName
{
  return -[MTLDeviceSPI vendorName](self->_baseObject, "vendorName");
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  char v27 = traceContext;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unint64_t v30 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v31 = v12;
  char v32 = *((_BYTE *)v10 + 8);
  __int16 v33 = 16400;
  int v34 = 0;
  char v35 = 0;
  id v14 = -[MTLDeviceSPI newIOHandleWithURL:error:](self->_baseObject, "newIOHandleWithURL:error:", v6, a4);
  if (v14) {
    char v15 = -[CaptureMTLIOFileHandle initWithBaseObject:captureContext:]( objc_alloc(&OBJC_CLASS___CaptureMTLIOFileHandle),  "initWithBaseObject:captureContext:",  v14,  self->_traceContext);
  }
  else {
    char v15 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)-[CaptureMTLIOFileHandle traceStream](v15, "traceStream"));
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15348;
  char v17 = v33;
  if (v33 > 0x20uLL)
  {
    uint64_t v19 = *(void *)(v28 + 24);
    uint64_t v20 = HIBYTE(v33);
    ++HIBYTE(v33);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, v30, v20 | 0x2000000000LL) + 16;
    char v17 = v20;
  }

  else
  {
    uint64_t v18 = (char *)(v16 + v33);
    LOBYTE(v33) = v33 + 32;
  }

  *(_BYTE *)(v16 + 13) = v17;
  unsigned __int8 v21 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v23 = -[CaptureMTLIOFileHandle traceStream](v15, "traceStream");
  if (!v23)
  {
    unint64_t v24 = 0LL;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_14:
  }
    a4 = (id *)*a4;
LABEL_15:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  uint64_t *v11 = v31;
  *((_BYTE *)v11 + 8) = v32;
  *(_BYTE *)(v29 + 15) |= 8u;

  return v15;
}

- (unint64_t)maxIOCommandsInFlight
{
  return (unint64_t)-[MTLDeviceSPI maxIOCommandsInFlight](self->_baseObject, "maxIOCommandsInFlight");
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = -[MTLDeviceSPI newDepthStencilStateWithDescriptor:](self->_baseObject, "newDepthStencilStateWithDescriptor:", v4);
  id v6 = v5;
  id v29 = 0LL;
  if (v5)
  {
    if (!-[CaptureMTLDevice newCaptureDepthStencilState:associatedWithBaseDepthStencilState:]( self,  "newCaptureDepthStencilState:associatedWithBaseDepthStencilState:",  &v29,  v5)) {
      goto LABEL_14;
    }
    id v5 = v29;
  }

  traceContext = self->_traceContext;
  [v5 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v22);
  uint64_t v8 = v24;
  *(_DWORD *)(v24 + 8) = -16311;
  unsigned __int8 v9 = v27;
  if (v27 > 0x28uLL)
  {
    uint64_t v11 = *(void *)(v23 + 24);
    uint64_t v12 = v28++;
    uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v25, v12 | 0x1800000000LL) + 16;
    unsigned __int8 v9 = v12;
  }

  else
  {
    uint64_t v10 = (char *)(v8 + v27);
    v27 += 24;
  }

  *(_BYTE *)(v8 + 13) = v9;
  uint64_t v13 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v15 = (uint64_t *)[v29 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0LL;
  }
  char v17 = SaveMTLDepthStencilDescriptor((uint64_t)v22, v4);
  *(void *)uint64_t v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = v17;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v18 = v19;
  *(_BYTE *)(v18 + 8) = v26;
  *(_BYTE *)(v24 + 15) |= 8u;
LABEL_14:
  id v20 = v29;

  return v20;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = -[MTLDeviceSPI newSamplerStateWithDescriptor:](self->_baseObject, "newSamplerStateWithDescriptor:", v4);
  id v29 = 0LL;
  if (v5
    && !-[CaptureMTLDevice newCaptureSamplerState:associatedWithBaseSamplerState:]( self,  "newCaptureSamplerState:associatedWithBaseSamplerState:",  &v29,  v5))
  {
    id v6 = v4;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CaptureMTLDevice dummyEncodeSamplerIntoArgumentBufferForResourceIndex:withDescriptor:]( self,  "dummyEncodeSamplerIntoArgumentBufferForResourceIndex:withDescriptor:",  v5,  v4));

    traceContext = self->_traceContext;
    [v29 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)v22);
    uint64_t v8 = v24;
    *(_DWORD *)(v24 + 8) = -16309;
    unsigned __int8 v9 = v27;
    if (v27 > 0x28uLL)
    {
      uint64_t v11 = *(void *)(v23 + 24);
      uint64_t v12 = v28++;
      uint64_t v10 = GTTraceMemPool_allocateBytes(v11, v25, v12 | 0x1800000000LL) + 16;
      unsigned __int8 v9 = v12;
    }

    else
    {
      uint64_t v10 = (char *)(v8 + v27);
      v27 += 24;
    }

    *(_BYTE *)(v8 + 13) = v9;
    SaveMTLSamplerStateInfo((uint64_t)v22, v5);
    uint64_t v13 = -[CaptureMTLDevice traceStream](self, "traceStream");
    if (v13) {
      unint64_t var0 = v13->var0;
    }
    else {
      unint64_t var0 = 0LL;
    }
    char v15 = (uint64_t *)[v29 traceStream];
    if (v15) {
      uint64_t v16 = *v15;
    }
    else {
      uint64_t v16 = 0LL;
    }
    char v17 = SaveMTLSamplerDescriptor((uint64_t)v22, v6);
    *(void *)uint64_t v10 = var0;
    *((void *)v10 + 1) = v16;
    v10[16] = v17;
    *(_DWORD *)(v10 + 17) = 0;
    *((_DWORD *)v10 + 5) = 0;
    s();
    *(void *)uint64_t v18 = v19;
    *(_BYTE *)(v18 + 8) = v26;
    *(_BYTE *)(v24 + 15) |= 8u;
  }

  id v20 = v29;

  return v20;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id v4 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v7 = __ldaxr(p_var2);
  while (__stlxr(v7 + 1, p_var2));
  unint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v7;
  s();
  unsigned __int8 v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  uint64_t v34 = v10;
  char v35 = *((_BYTE *)v8 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  if ((qword_23A448 & 0x4000) != 0)
  {
    if (newHeapWithDescriptor__onceToken != -1) {
      dispatch_once(&newHeapWithDescriptor__onceToken, &__block_literal_global_431);
    }
    id v12 = [v4 copy];

    char v15 = v12;
    uint64_t v14 = 1LL;
  }

  else
  {
    if ((qword_23A448 & 0x8000) == 0) {
      goto LABEL_13;
    }
    if (newHeapWithDescriptor__onceToken_143 != -1) {
      dispatch_once(&newHeapWithDescriptor__onceToken_143, &__block_literal_global_144);
    }
    id v12 = [v4 copy];

    [v12 setType:0];
    unint64_t v13 = (unint64_t)[v12 size];
    uint64_t v14 = v13 & ((uint64_t)(__int16)qword_23A448 >> 15);
    char v15 = v12;
  }

  [v15 setSize:v14];
  id v4 = v12;
LABEL_13:
  id v16 = -[MTLDeviceSPI newHeapWithDescriptor:](self->_baseObject, "newHeapWithDescriptor:", v4);
  if (v16) {
    char v17 = -[CaptureMTLHeap initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLHeap),  "initWithBaseObject:captureDevice:",  v16,  self);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLHeap traceStream](v17, "traceStream"));
  if (self->_bufferPinningEnabled && [v4 type] != (char *)&dword_0 + 2)
  {
    id v18 = [v4 copy];

    objc_msgSend(v18, "setPinnedGPUAddress:", objc_msgSend(v16, "gpuAddress"));
    id v4 = v18;
  }

  uint64_t v19 = v32;
  *(_DWORD *)(v32 + 8) = -16120;
  char v20 = v36;
  if (v36 > 0x28uLL)
  {
    uint64_t v22 = *(void *)(v31 + 24);
    uint64_t v23 = HIBYTE(v36);
    ++HIBYTE(v36);
    unsigned __int8 v21 = GTTraceMemPool_allocateBytes(v22, v33, v23 | 0x1800000000LL) + 16;
    char v20 = v23;
  }

  else
  {
    unsigned __int8 v21 = (char *)(v19 + v36);
    LOBYTE(v36) = v36 + 24;
  }

  *(_BYTE *)(v19 + 13) = v20;
  uint64_t v24 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v26 = -[CaptureMTLHeap traceStream](v17, "traceStream");
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0LL;
  }
  char v28 = SaveMTLHeapDescriptor((uint64_t)&v30, v4);
  *(void *)unsigned __int8 v21 = var0;
  *((void *)v21 + 1) = v27;
  v21[16] = v28;
  *(_DWORD *)(v21 + 17) = 0;
  *((_DWORD *)v21 + 5) = 0;
  uint64_t *v9 = v34;
  *((_BYTE *)v9 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v17;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v9 = __ldaxr(p_var2);
  while (__stlxr(v9 + 1, p_var2));
  unint64_t v30 = traceContext;
  uint64_t v31 = 0LL;
  uint64_t v32 = 0LL;
  unint64_t v33 = v9;
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  uint64_t *v10 = v13;
  uint64_t v34 = v12;
  char v35 = *((_BYTE *)v10 + 8);
  __int16 v36 = 16400;
  int v37 = 0;
  char v38 = 0;
  baseObject = self->_baseObject;
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v6 baseObject]);
  id v16 = -[MTLDeviceSPI newAccelerationStructureWithBuffer:offset:]( baseObject,  "newAccelerationStructureWithBuffer:offset:",  v15,  a4);

  if (v16) {
    char v17 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:captureBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:captureBuffer:",  v16,  self,  v6);
  }
  else {
    char v17 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v17, "traceStream"));
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15464;
  char v19 = v36;
  if (v36 > 0x20uLL)
  {
    uint64_t v21 = *(void *)(v31 + 24);
    uint64_t v22 = HIBYTE(v36);
    ++HIBYTE(v36);
    char v20 = GTTraceMemPool_allocateBytes(v21, v33, v22 | 0x2000000000LL) + 16;
    char v19 = v22;
  }

  else
  {
    char v20 = (char *)(v18 + v36);
    LOBYTE(v36) = v36 + 32;
  }

  *(_BYTE *)(v18 + 13) = v19;
  SaveMTLAccelerationStructureInfo((uint64_t)&v30, v16);
  uint64_t v23 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v25 = -[CaptureMTLAccelerationStructure traceStream](v17, "traceStream");
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0LL;
  }
  unint64_t v27 = (uint64_t *)[v6 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0LL;
  }
  *(void *)char v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v28;
  *((void *)v20 + 3) = a4;
  uint64_t *v11 = v34;
  *((_BYTE *)v11 + 8) = v35;
  *(_BYTE *)(v32 + 15) |= 8u;

  return v17;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  id v8 = a3;
  traceContext = self->_traceContext;
  p_unint64_t var2 = &traceContext->var2;
  do
    unint64_t v11 = __ldaxr(p_var2);
  while (__stlxr(v11 + 1, p_var2));
  uint64_t v32 = traceContext;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  unint64_t v35 = v11;
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  uint64_t *v12 = v15;
  uint64_t v36 = v14;
  char v37 = *((_BYTE *)v12 + 8);
  __int16 v38 = 16400;
  int v39 = 0;
  char v40 = 0;
  baseObject = self->_baseObject;
  char v17 = (void *)objc_claimAutoreleasedReturnValue([v8 baseObject]);
  id v18 = -[MTLDeviceSPI newAccelerationStructureWithBuffer:offset:resourceIndex:]( baseObject,  "newAccelerationStructureWithBuffer:offset:resourceIndex:",  v17,  a4,  a5);

  if (v18) {
    char v19 = -[CaptureMTLAccelerationStructure initWithBaseObject:captureDevice:captureBuffer:]( objc_alloc(&OBJC_CLASS___CaptureMTLAccelerationStructure),  "initWithBaseObject:captureDevice:captureBuffer:",  v18,  self,  v8);
  }
  else {
    char v19 = 0LL;
  }
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)-[CaptureMTLAccelerationStructure traceStream](v19, "traceStream"));
  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -15359;
  char v21 = v38;
  if (v38 > 0x18uLL)
  {
    uint64_t v23 = *(void *)(v33 + 24);
    uint64_t v24 = HIBYTE(v38);
    ++HIBYTE(v38);
    uint64_t v22 = GTTraceMemPool_allocateBytes(v23, v35, v24 | 0x2800000000LL) + 16;
    char v21 = v24;
  }

  else
  {
    uint64_t v22 = (char *)(v20 + v38);
    LOBYTE(v38) = v38 + 40;
  }

  *(_BYTE *)(v20 + 13) = v21;
  SaveMTLAccelerationStructureInfo((uint64_t)&v32, v18);
  uint64_t v25 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  unint64_t v27 = -[CaptureMTLAccelerationStructure traceStream](v19, "traceStream");
  if (v27) {
    unint64_t v28 = v27->var0;
  }
  else {
    unint64_t v28 = 0LL;
  }
  id v29 = (uint64_t *)[v8 traceStream];
  if (v29) {
    uint64_t v30 = *v29;
  }
  else {
    uint64_t v30 = 0LL;
  }
  *(void *)uint64_t v22 = var0;
  *((void *)v22 + 1) = v28;
  *((void *)v22 + 2) = v30;
  *((void *)v22 + 3) = a4;
  *((void *)v22 + 4) = a5;
  uint64_t *v13 = v36;
  *((_BYTE *)v13 + 8) = v37;
  *(_BYTE *)(v34 + 15) |= 8u;

  return v19;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  id v4 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)v21);
  if ((qword_23A448 & 0x200) != 0)
  {
    id v5 = [v4 copy];

    [v5 setCompressionType:0];
    [v5 setCompressionMode:2];
    id v4 = v5;
  }

  id v6 = -[MTLDeviceSPI heapTextureSizeAndAlignWithDescriptor:]( self->_baseObject,  "heapTextureSizeAndAlignWithDescriptor:",  v4);
  unint64_t v8 = v7;
  uint64_t v9 = v22;
  *(_DWORD *)(v22 + 8) = -16112;
  unsigned __int8 v10 = v25;
  if (v25 > 0x20uLL)
  {
    uint64_t v12 = *(void *)(v21[1] + 24LL);
    uint64_t v13 = v26++;
    unint64_t v11 = GTTraceMemPool_allocateBytes(v12, v23, v13 | 0x2000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    unint64_t v11 = (char *)(v9 + v25);
    v25 += 32;
  }

  *(_BYTE *)(v9 + 13) = v10;
  uint64_t v14 = -[CaptureMTLDevice traceStream](self, "traceStream");
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v16 = SaveMTLTextureDescriptor((uint64_t)v21, v4);
  *(void *)unint64_t v11 = var0;
  *((void *)v11 + 1) = v6;
  *((void *)v11 + 2) = v8;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(_BYTE *)(v17 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;

  unint64_t v19 = (unint64_t)v6;
  unint64_t v20 = v8;
  result.var1 = v20;
  result.unint64_t var0 = v19;
  return result;
}

- (GTResourceHarvester)harvester
{
  return self->_harvester;
}

- (void).cxx_destruct
{
}

void __71__CaptureMTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    unint64_t v7 = objc_alloc(&OBJC_CLASS___CaptureMTLLibrary);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) functions]);
    unsigned __int8 v10 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:captureFunctions:]( v7,  "initWithBaseObject:captureDevice:captureFunctions:",  v5,  v8,  v9);
  }

  else
  {
    unsigned __int8 v10 = 0LL;
  }

  id v11 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLLibrary traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)v24);
  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15421;
  unsigned __int8 v13 = v28;
  if (v28 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v24[1] + 24LL);
    uint64_t v16 = v29++;
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, v26, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    uint64_t v14 = (char *)(v12 + v28);
    v28 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  SaveMTLLibraryInfoWithPath((uint64_t)v24, v5, 0LL);
  uint64_t v17 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  unint64_t v19 = -[CaptureMTLLibrary traceStream](v10, "traceStream");
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v21 = SaveMTLStitchedLibraryDescriptor((uint64_t)v24, *(void **)(a1 + 40));
  *(void *)uint64_t v14 = v18;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = 0LL;
  v14[24] = v21;
  *(_DWORD *)(v14 + 25) = 0;
  *((_DWORD *)v14 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v22 = v23;
  *(_BYTE *)(v22 + 8) = v27;
  *(_BYTE *)(v25 + 15) |= 8u;
}

void __63__CaptureMTLDevice_newLibraryWithDescriptor_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    unint64_t v7 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v5,  *(void *)(a1 + 32));
  }
  else {
    unint64_t v7 = 0LL;
  }
  id v8 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLLibrary traceStream](v7, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v8, (uint64_t)v21);
  uint64_t v9 = v22;
  *(_DWORD *)(v22 + 8) = -15425;
  unsigned __int8 v10 = v25;
  if (v25 > 0x20uLL)
  {
    uint64_t v12 = *(void *)(v21[1] + 24LL);
    uint64_t v13 = v26++;
    id v11 = GTTraceMemPool_allocateBytes(v12, v23, v13 | 0x2000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    id v11 = (char *)(v9 + v25);
    v25 += 32;
  }

  *(_BYTE *)(v9 + 13) = v10;
  SaveMTLLibraryInfoWithPath((uint64_t)v21, v5, 0LL);
  uint64_t v14 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v14) {
    uint64_t v15 = *v14;
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v16 = -[CaptureMTLLibrary traceStream](v7, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v18 = SaveMTLStitchedLibraryDescriptor((uint64_t)v21, *(void **)(a1 + 40));
  *(void *)id v11 = v15;
  *((void *)v11 + 1) = var0;
  *((void *)v11 + 2) = 0LL;
  v11[24] = v18;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v19 = v20;
  *(_BYTE *)(v19 + 8) = v24;
  *(_BYTE *)(v22 + 15) |= 8u;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = *(id *)(a1 + 40);
  -[CaptureMTLRenderPipelineState setTileDescriptor:](v10, "setTileDescriptor:", v11);
  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v45);
  uint64_t v13 = v46;
  *(_DWORD *)(v46 + 8) = -16088;
  char v14 = BYTE9(v47);
  if (BYTE9(v47) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 24LL);
    uint64_t v17 = BYTE10(v47);
    ++BYTE10(v47);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v46 + 1), v17 | 0x2800000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v47));
    BYTE9(v47) += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  id DynamicLibrariesForTileRenderPipelineDescriptor = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v11);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForTileRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v45, v7, v8, v19);

  uint64_t v20 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = *(void *)(a1 + 56);
  char v25 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v45, v11);
  *(void *)uint64_t v15 = v21;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v24;
  *((void *)v15 + 3) = 0LL;
  v15[32] = v25;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  unsigned __int8 v26 = *(_BYTE **)(a1 + 32);
  if (!v26[325] && (~*(_DWORD *)(a1 + 56) & 3LL) != 0)
  {
    char v27 = (void *)objc_claimAutoreleasedReturnValue([v26 baseObject]);
    id v28 = DEVICEOBJECT(v27);
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = deviceMTLTileRenderPipelineDescriptor(*(void **)(a1 + 40));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v36 = 3221225472LL;
    __int128 v42 = v45;
    unint64_t v35 = _NSConcreteStackBlock;
    char v37 = __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2;
    __int16 v38 = &unk_20D628;
    __int128 v43 = v46;
    __int128 v44 = v47;
    uint64_t v32 = *(void *)(a1 + 56);
    id v41 = *(id *)(a1 + 48);
    int v39 = v10;
    id v40 = v9;
    [v29 newRenderPipelineStateWithTileDescriptor:v31 options:v32 completionHandler:&v35];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  objc_msgSend(*(id *)(a1 + 32), "traceContext", v35, v36, v37, v38);
  s();
  *(void *)uint64_t v33 = v34;
  *(_BYTE *)(v33 + 8) = BYTE8(v47);
  *(_BYTE *)(v46 + 15) |= 8u;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  void *v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  *id v7 = v8;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withMeshDescriptor:*(void *)(a1 + 48)]);
  -[CaptureMTLRenderPipelineState setMeshDescriptor:](v10, "setMeshDescriptor:", v11);
  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v43);
  uint64_t v13 = v44;
  *(_DWORD *)(v44 + 8) = -15404;
  char v14 = BYTE9(v45);
  if (BYTE9(v45) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 24LL);
    uint64_t v17 = BYTE10(v45);
    ++BYTE10(v45);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v44 + 1), v17 | 0x2800000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v45));
    BYTE9(v45) += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  SaveMTLRenderPipelineReflection((uint64_t)&v43, v7, v8, 0LL);
  char v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = *(void *)(a1 + 64);
  char v23 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v43, v11);
  *(void *)uint64_t v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v22;
  *((void *)v15 + 3) = 0LL;
  v15[32] = v23;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  uint64_t v24 = *(_BYTE **)(a1 + 32);
  if (!v24[325] && (~*(_DWORD *)(a1 + 64) & 3LL) != 0)
  {
    char v25 = (void *)objc_claimAutoreleasedReturnValue([v24 baseObject]);
    id v26 = DEVICEOBJECT(v25);
    char v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = deviceMTLMeshRenderPipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v34 = 3221225472LL;
    __int128 v40 = v43;
    uint64_t v33 = _NSConcreteStackBlock;
    unint64_t v35 = __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2;
    uint64_t v36 = &unk_20D628;
    __int128 v41 = v44;
    __int128 v42 = v45;
    uint64_t v30 = *(void *)(a1 + 64);
    id v39 = *(id *)(a1 + 56);
    char v37 = v10;
    id v38 = v9;
    [v27 newRenderPipelineStateWithMeshDescriptor:v29 options:v30 completionHandler:&v33];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  objc_msgSend(*(id *)(a1 + 32), "traceContext", v33, v34, v35, v36);
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = BYTE8(v45);
  *(_BYTE *)(v44 + 15) |= 8u;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  void *v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  *id v7 = v8;
}

void __79__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withMeshDescriptor:*(void *)(a1 + 48)]);
  -[CaptureMTLRenderPipelineState setMeshDescriptor:](v10, "setMeshDescriptor:", v11);
  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)v25);
  uint64_t v13 = v26;
  *(_DWORD *)(v26 + 8) = -15406;
  unsigned __int8 v14 = v29;
  if (v29 > 0x20uLL)
  {
    uint64_t v16 = *(void *)(v25[1] + 24LL);
    uint64_t v17 = v30++;
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v27, v17 | 0x2000000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v29);
    v29 += 32;
  }

  *(_BYTE *)(v13 + 13) = v14;
  SaveMTLRenderPipelineReflection((uint64_t)v25, v7, v8, 0LL);
  char v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v22 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)v25, v11);
  *(void *)uint64_t v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = 0LL;
  v15[24] = v22;
  *(_DWORD *)(v15 + 25) = 0;
  *((_DWORD *)v15 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v23 = v24;
  *(_BYTE *)(v23 + 8) = v28;
  *(_BYTE *)(v26 + 15) |= 8u;
}

void __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)]);
  -[CaptureMTLComputePipelineState setDescriptor:](v10, "setDescriptor:", v11);
  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v43);
  uint64_t v13 = v44;
  *(_DWORD *)(v44 + 8) = -16197;
  char v14 = BYTE9(v45);
  if (BYTE9(v45) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 24LL);
    uint64_t v17 = BYTE10(v45);
    ++BYTE10(v45);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v44 + 1), v17 | 0x2800000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v45));
    BYTE9(v45) += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  SaveMTLComputePipelineReflection((uint64_t)&v43, v7, v8, *(void **)(a1 + 56), 0LL);
  char v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = *(void *)(a1 + 72);
  char v23 = SaveMTLComputePipelineDescriptor((uint64_t)&v43, v11);
  *(void *)uint64_t v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v22;
  *((void *)v15 + 3) = 0LL;
  v15[32] = v23;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  uint64_t v24 = *(_BYTE **)(a1 + 32);
  if (!v24[325] && (~*(_DWORD *)(a1 + 72) & 3LL) != 0)
  {
    char v25 = (void *)objc_claimAutoreleasedReturnValue([v24 baseObject]);
    id v26 = DEVICEOBJECT(v25);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = deviceMTLComputePipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    unsigned __int8 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v34 = 3221225472LL;
    __int128 v40 = v43;
    uint64_t v33 = _NSConcreteStackBlock;
    unint64_t v35 = __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    uint64_t v36 = &unk_20D6A0;
    __int128 v41 = v44;
    __int128 v42 = v45;
    uint64_t v30 = *(void *)(a1 + 72);
    id v39 = *(id *)(a1 + 64);
    char v37 = v10;
    id v38 = v9;
    [v27 newComputePipelineStateWithDescriptor:v29 options:v30 completionHandler:&v33];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  objc_msgSend(*(id *)(a1 + 32), "traceContext", v33, v34, v35, v36);
  s();
  *(void *)uint64_t v31 = v32;
  *(_BYTE *)(v31 + 8) = BYTE8(v45);
  *(_BYTE *)(v44 + 15) |= 8u;
}

void __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  void *v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  *id v7 = v8;
}

void __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  -[CaptureMTLComputePipelineState setFunction:](v10, "setFunction:", *(void *)(a1 + 40));
  id v11 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)&v41);
  uint64_t v12 = v42;
  *(_DWORD *)(v42 + 8) = -16296;
  char v13 = BYTE9(v43);
  if (BYTE9(v43) > 0x18uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 24LL);
    uint64_t v16 = BYTE10(v43);
    ++BYTE10(v43);
    char v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v42 + 1), v16 | 0x2800000000LL) + 16;
    char v13 = v16;
  }

  else
  {
    char v14 = (char *)(v12 + BYTE9(v43));
    BYTE9(v43) += 40;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) baseObject]);
  SaveMTLComputePipelineReflection((uint64_t)&v41, v7, v8, 0LL, v17);

  char v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  uint64_t v24 = *(void *)(a1 + 56);
  *(void *)char v14 = v19;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = v23;
  *((void *)v14 + 3) = v24;
  *((void *)v14 + 4) = 0LL;
  char v25 = *(_BYTE **)(a1 + 32);
  if (!v25[325] && (~*(_DWORD *)(a1 + 56) & 3LL) != 0)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 baseObject]);
    id v27 = DEVICEOBJECT(v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    id v29 = DEVICEOBJECT(*(id *)(a1 + 40));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v34[1] = 3221225472LL;
    __int128 v38 = v41;
    v34[0] = _NSConcreteStackBlock;
    v34[2] = __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2;
    v34[3] = &unk_20D6A0;
    __int128 v39 = v42;
    __int128 v40 = v43;
    uint64_t v31 = *(void *)(a1 + 56);
    id v37 = *(id *)(a1 + 48);
    unint64_t v35 = v10;
    id v36 = v9;
    [v28 newComputePipelineStateWithFunction:v30 options:v31 completionHandler:v34];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v32 = v33;
  *(_BYTE *)(v32 + 8) = BYTE8(v43);
  *(_BYTE *)(v42 + 15) |= 8u;
}

void __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  void *v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  *id v7 = v8;
}

void __74__CaptureMTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLComputePipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLComputePipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  -[CaptureMTLComputePipelineState setFunction:](v10, "setFunction:", *(void *)(a1 + 40));
  id v11 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)v26);
  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -16297;
  unsigned __int8 v13 = v30;
  if (v30 > 0x20uLL)
  {
    uint64_t v15 = *(void *)(v26[1] + 24LL);
    uint64_t v16 = v31++;
    char v14 = GTTraceMemPool_allocateBytes(v15, v28, v16 | 0x2000000000LL) + 16;
    unsigned __int8 v13 = v16;
  }

  else
  {
    char v14 = (char *)(v12 + v30);
    v30 += 32;
  }

  *(_BYTE *)(v12 + 13) = v13;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) baseObject]);
  SaveMTLComputePipelineReflection((uint64_t)v26, v7, v8, 0LL, v17);

  char v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0LL;
  }
  uint64_t v20 = -[CaptureMTLComputePipelineState traceStream](v10, "traceStream");
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v22 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0LL;
  }
  *(void *)char v14 = v19;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = v23;
  *((void *)v14 + 3) = 0LL;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v24 = v25;
  *(_BYTE *)(v24 + 8) = v29;
  *(_BYTE *)(v27 + 15) |= 8u;
}

void __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)]);
  -[CaptureMTLRenderPipelineState setDescriptor:](v10, "setDescriptor:", v11);
  if (([v11 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v11 supportAddingFragmentBinaryFunctions])
  {
    -[CaptureMTLRenderPipelineState setReflection:](v10, "setReflection:", v8);
  }

  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v45);
  uint64_t v13 = v46;
  *(_DWORD *)(v46 + 8) = -16300;
  char v14 = BYTE9(v47);
  if (BYTE9(v47) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v45 + 1) + 24LL);
    uint64_t v17 = BYTE10(v47);
    ++BYTE10(v47);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v46 + 1), v17 | 0x2800000000LL) + 16;
    char v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v47));
    BYTE9(v47) += 40;
  }

  *(_BYTE *)(v13 + 13) = v14;
  id DynamicLibrariesForRenderPipelineDescriptor = LoadDynamicLibrariesForRenderPipelineDescriptor(v11);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v45, v7, v8, v19);

  uint64_t v20 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v24 = *(void *)(a1 + 64);
  char v25 = SaveMTLRenderPipelineDescriptor((uint64_t)&v45, v11);
  *(void *)uint64_t v15 = v21;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v24;
  *((void *)v15 + 3) = 0LL;
  v15[32] = v25;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  id v26 = *(_BYTE **)(a1 + 32);
  if (!v26[325] && (~*(_DWORD *)(a1 + 64) & 3LL) != 0)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 baseObject]);
    id v28 = DEVICEOBJECT(v27);
    char v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = deviceMTLRenderPipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    unsigned __int8 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    uint64_t v36 = 3221225472LL;
    __int128 v42 = v45;
    unint64_t v35 = _NSConcreteStackBlock;
    id v37 = __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    __int128 v38 = &unk_20D628;
    __int128 v43 = v46;
    __int128 v44 = v47;
    uint64_t v32 = *(void *)(a1 + 64);
    id v41 = *(id *)(a1 + 56);
    __int128 v39 = v10;
    id v40 = v9;
    [v29 newRenderPipelineStateWithDescriptor:v31 options:v32 completionHandler:&v35];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  objc_msgSend(*(id *)(a1 + 32), "traceContext", v35, v36, v37, v38);
  s();
  *(void *)uint64_t v33 = v34;
  *(_BYTE *)(v33 + 8) = BYTE8(v47);
  *(_BYTE *)(v46 + 15) |= 8u;
}

void __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  void *v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

  *id v7 = v8;
}

void __75__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    unsigned __int8 v10 = -[CaptureMTLRenderPipelineState initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLRenderPipelineState),  "initWithBaseObject:captureDevice:",  v7,  *(void *)(a1 + 32));
  }
  else {
    unsigned __int8 v10 = 0LL;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)]);
  -[CaptureMTLRenderPipelineState setDescriptor:](v10, "setDescriptor:", v11);
  if (([v11 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v11 supportAddingFragmentBinaryFunctions])
  {
    -[CaptureMTLRenderPipelineState setReflection:](v10, "setReflection:", v8);
  }

  id v12 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)v27);
  uint64_t v13 = v28;
  *(_DWORD *)(v28 + 8) = -16301;
  unsigned __int8 v14 = v31;
  if (v31 > 0x20uLL)
  {
    uint64_t v16 = *(void *)(v27[1] + 24LL);
    uint64_t v17 = v32++;
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, v29, v17 | 0x2000000000LL) + 16;
    unsigned __int8 v14 = v17;
  }

  else
  {
    uint64_t v15 = (char *)(v13 + v31);
    v31 += 32;
  }

  *(_BYTE *)(v13 + 13) = v14;
  id DynamicLibrariesForRenderPipelineDescriptor = LoadDynamicLibrariesForRenderPipelineDescriptor(v11);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(DynamicLibrariesForRenderPipelineDescriptor);
  SaveMTLRenderPipelineReflection((uint64_t)v27, v7, v8, v19);

  uint64_t v20 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0LL;
  }
  uint64_t v22 = -[CaptureMTLRenderPipelineState traceStream](v10, "traceStream");
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  char v24 = SaveMTLRenderPipelineDescriptor((uint64_t)v27, v11);
  *(void *)uint64_t v15 = v21;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = 0LL;
  v15[24] = v24;
  *(_DWORD *)(v15 + 25) = 0;
  *((_DWORD *)v15 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

void __67__CaptureMTLDevice_newLibraryWithSource_options_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    id v7 = -[CaptureMTLLibrary initWithBaseObject:captureDevice:]( objc_alloc(&OBJC_CLASS___CaptureMTLLibrary),  "initWithBaseObject:captureDevice:",  v5,  *(void *)(a1 + 32));
  }
  else {
    id v7 = 0LL;
  }
  -[CaptureMTLLibrary setOptions:](v7, "setOptions:", *(void *)(a1 + 40));
  id v8 = [*(id *)(a1 + 32) traceContext];
  -[CaptureMTLLibrary traceStream](v7, "traceStream");
  GTTraceContext_pushEncoderWithStream((uint64_t)v8, (uint64_t)v27);
  uint64_t v9 = v28;
  *(_DWORD *)(v28 + 8) = -16304;
  unsigned __int8 v10 = v31;
  if (v31 > 0x20uLL)
  {
    uint64_t v12 = *(void *)(v27[1] + 24LL);
    uint64_t v13 = v32++;
    id v11 = GTTraceMemPool_allocateBytes(v12, v29, v13 | 0x2000000000LL) + 16;
    unsigned __int8 v10 = v13;
  }

  else
  {
    id v11 = (char *)(v9 + v31);
    v31 += 32;
  }

  *(_BYTE *)(v9 + 13) = v10;
  SaveMTLLibraryInfoWithPath((uint64_t)v27, v5, 0LL);
  unsigned __int8 v14 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v14) {
    uint64_t v15 = *v14;
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v16 = -[CaptureMTLLibrary traceStream](v7, "traceStream");
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0LL;
  }
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___MTLDebugLibrary, v17);
  if ((objc_opt_isKindOfClass(v5, v19) & 1) != 0)
  {
    RetainDebugObject(v5);
    char v20 = 0;
  }

  else
  {
    id v21 = [*(id *)(a1 + 48) UTF8String];
    uint64_t v22 = *(void **)(a1 + 48);
    if (v22) {
      uint64_t v23 = strlen((const char *)[v22 UTF8String]) + 1;
    }
    else {
      uint64_t v23 = 0LL;
    }
    char v20 = GTTraceEncoder_storeBlob((uint64_t)v27, v21, v23);
  }

  char v24 = SaveMTLCompileOptions((uint64_t)v27, *(void **)(a1 + 40));
  *(void *)id v11 = v15;
  *((void *)v11 + 1) = var0;
  *((void *)v11 + 2) = 0LL;
  v11[24] = v20;
  v11[25] = v24;
  *(_DWORD *)(v11 + 26) = 0;
  *((_WORD *)v11 + 15) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v25 = v26;
  *(_BYTE *)(v25 + 8) = v30;
  *(_BYTE *)(v28 + 15) |= 8u;
}

void __CaptureMTLDevice_initIndirectCommandBufferCopy_block_invoke(uint64_t a1)
{
  id v2 = DEVICEOBJECT(*(id *)(a1 + 32));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
  -[MTLCompileOptions setLanguageVersion:](v4, "setLanguageVersion:", 131073LL);
  id v42 = 0LL;
  id v5 = objc_msgSend( v3,  "newLibraryWithSource:options:error:",  @"#include <metal_stdlib>\nusing namespace metal;\nstruct CopyIndirectCommandBufferArgument {\ncommand_buffer destination;\ncommand_buffer source;\n};\n\nvertex void renderCopyIndirectCommandBuffer (device CopyIndirectCommandBufferArgument& in [[ buffer(0) ]], uint i [[ vertex_id ]])\n{\nrender_command src(in.source, i);\nrender_command dest(in.destination, i);\ndest.copy_command(src);\n}\n\nvertex void renderCopyBuffer (device char* dest [[ buffer(0) ]], constant char* src [[ buffer(1) ]], uint i [[ vertex_id ]])\n{\ndest[i] = src[i];\n}\n",
         v4,
         &v42);
  id v6 = v42;
  id v7 = [v5 newFunctionWithName:@"renderCopyIndirectCommandBuffer"];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v7;

  unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___MTLRenderPipelineDescriptor);
  -[MTLRenderPipelineDescriptor setVertexFunction:](v10, "setVertexFunction:", *(void *)(*(void *)(a1 + 32) + 56LL));
  -[MTLRenderPipelineDescriptor setRasterizationEnabled:](v10, "setRasterizationEnabled:", 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v10, "colorAttachments"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
  [v12 setPixelFormat:71];

  id v41 = v6;
  id v13 = [v3 newRenderPipelineStateWithDescriptor:v10 error:&v41];
  id v14 = v41;

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = v13;

  id v17 = [v5 newFunctionWithName:@"renderCopyBuffer"];
  -[MTLRenderPipelineDescriptor setVertexFunction:](v10, "setVertexFunction:", v17);

  id v40 = v14;
  id v18 = [v3 newRenderPipelineStateWithDescriptor:v10 error:&v40];
  id v19 = v40;

  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(v20 + 80);
  *(void *)(v20 + 80) = v18;

  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___MTLCompileOptions);
  if ((unint64_t)-[MTLCompileOptions languageVersion](v22, "languageVersion") > MTLLanguageVersion2_1)
  {
    id v39 = 0LL;
    id v23 = objc_msgSend( v3,  "newLibraryWithSource:options:error:",  @"#include <metal_stdlib>\nusing namespace metal;\nstruct CopyIndirectCommandBufferArgument {\ncommand_buffer destination;\ncommand_buffer source;\n};\n\nkernel void computeCopyIndirectCommandBuffer (device CopyIndirectCommandBufferArgument& in [[ buffer(0) ]], uint i [[ thread_position_in_grid ]])\n{\ncompute_command src(in.source, i);\ncompute_command dest(in.destination, i);\ndest.copy_command(src);\n}\n\nkernel void computeCopyBuffer (device char* dest [[ buffer(0) ]], constant char* src [[ buffer(1) ]], uint i [[ thread_position_in_grid ]])\n{\ndest[i] = src[i];\n}\n",
            v22,
            &v39);
    id v24 = v39;
    if (v23)
    {
      id v25 = [v23 newFunctionWithName:@"computeCopyIndirectCommandBuffer"];
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void **)(v26 + 64);
      *(void *)(v26 + 64) = v25;

      uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 64LL);
      id v38 = v24;
      id v29 = [v3 newComputePipelineStateWithFunction:v28 error:&v38];
      id v30 = v38;

      uint64_t v31 = *(void *)(a1 + 32);
      unsigned __int8 v32 = *(void **)(v31 + 88);
      *(void *)(v31 + 88) = v29;

      id v33 = [v23 newFunctionWithName:@"computeCopyBuffer"];
      id v37 = v30;
      id v34 = [v3 newComputePipelineStateWithFunction:v33 error:&v37];
      id v24 = v37;

      uint64_t v35 = *(void *)(a1 + 32);
      uint64_t v36 = *(void **)(v35 + 96);
      *(void *)(v35 + 96) = v34;
    }
  }
}

void __30__CaptureMTLDevice_downloader__block_invoke(uint64_t a1)
{
  id v2 = -[GTResourceDownloader initWithDevice:]( objc_alloc(&OBJC_CLASS___GTResourceDownloader),  "initWithDevice:",  *(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;
}

id __40__CaptureMTLDevice_dummyArgumentEncoder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initDummyEncoder];
}

@end