@interface GTShaderProfilerHelper
- (BOOL)_prepareCounterNames:(id)a3 derivedCounterNames:(id)a4 withContext:(id)a5;
- (BOOL)_shouldUseProgramAddressMappings:(id)a3;
- (BOOL)analyzeShaderInfoResult:(id)a3 forDataSource:(const GTMTLReplayDataSource *)a4 forReplayController:(const GTMTLReplayController *)a5;
- (DebugInfo)_getDebugInfoForBinary:(SEL)a3 withTextSegment:(id)a4 forTargetIndex:(id)a5;
- (GTShaderProfilerHelper)initWithOptions:(GTProfilerOptions *)a3;
- (NSString)metalPluginName;
- (char)_calculateEffectiveGPUEncoderCostforData:(float *)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:;
- (char)_calculateEffectiveGPUEncoderCostforData:(uint64_t)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:;
- (char)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(unint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (double)_calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:;
- (double)_latencyAdjustmentFactorWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4;
- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4 forLimiterType:(id)a5;
- (double)_latencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (double)_waitLatencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4;
- (double)_waitLatencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (id).cxx_construct;
- (id)_analyzeBinary:(id)a3 uscSamples:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10;
- (id)_build;
- (id)_calculatePerDrawCallCostWithSampleData:(id)a3 targetIndex:(int)a4;
- (id)_calculatePerDrawCallWithGRCSampleData:(id)a3 targetIndex:(int)a4;
- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7;
- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10;
- (id)_codeGenCounterProcessing:(id)a3 derivedCounterNames:(id)a4;
- (id)_createPerCounterCommandData:(id)a3 withPerCommandData:(id)a4;
- (id)_createPerFileCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_createPerFileLineCostDictionaryForCIWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_createPerLineCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4;
- (id)_extractShaderBinaryTextSegment:(id)a3;
- (id)_gatherStaticInformation:(const GTMTLReplayDataSource *)a3 forReplayController:(const GTMTLReplayController *)a4;
- (id)_prepareAndEvaluateCounterValues:(unsigned int *)a3 numElementsPerSample:(unint64_t)a4 numSamples:(unint64_t)a5 withContext:(id)a6 withGPUCyclesCounterIndex:(unint64_t)a7;
- (id)_processGPURawCounterData:(id)a3 andFillDeivedCounterNames:(id)a4;
- (id)_processHarvestedBinaryData:(id)a3 forStreamedData:(id)a4;
- (id)_processPerLineCostDataForLineTable:(void *)a3 withFileCost:(void *)a4 withDebugInfo:(void *)a5 andAllDrawCost:(double)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 withDrawCost:(void *)a9;
- (id)_productType;
- (id)_setupLimiterInfoPerDrawCall:(id)a3 forPayload:(id)a4 withShaderInfo:(id)a5;
- (id)_targetType;
- (id)_version;
- (id)analyzedBinary:(id)a3 processedUscSamples:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7;
- (id)convertBinaryInfoToJSONDictionary:(id)a3;
- (pair<std::vector<unsigned)_getAddressAndLineTableForDebugInfo:(pair<std:(std:(SEL)a3 :(void *)a4 vector<std::vector<DebugInfo::LineEntry *>>> *)self :vector<unsigned)int>;
- (uint64_t)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(uint64_t *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(void *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (unsigned)_getLegacyProgramType:(id)a3;
- (unsigned)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_PrintLimiterData:(PerfCounterCompressedSample *)a3 withRawLimiterList:(id)a4 withDerivedCounters:(id)a5 andDerivedCounterNames:(id)a6;
- (void)_ProcessLineList:(void *)a3 forFileCostMap:(void *)a4 forDebugInfo:(void *)a5 andCost:(double)a6 forAddr:(unsigned int)a7 andDrawIndex:(unsigned int)a8 andTargetIndex:(int)a9;
- (void)_addBlitTimesToEffectiveKickTimes:(id)a3;
- (void)_addDerivedCounterDataToTimelineInfo:(id)a3 usingShaderProfilerResult:(id)a4;
- (void)_analyzeShaderBinarySamplesForResult:(id)a3 forShaderKeyToSourcePath:(id)a4;
- (void)_calculateEffectiveGPUEncoderCostforData:(id)a3 andPerLimiterBatchCost:(void *)a4 forShaderProfilerResult:(id)a5;
- (void)_calculateFrameTime:(id)a3 result:(id)a4;
- (void)_calculatePerDrawCosts:(id)a3;
- (void)_calculatePerSampleActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5;
- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:(unint64_t)a2 forWorkloadInfo:(unint64_t)a3;
- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:;
- (void)_calculatePerSampleAggregatedActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5;
- (void)_calculateRealTimeInfoWithGPUTime:(double)a3 forShaderInfoResult:(id)a4;
- (void)_dumpGPUTimelineDataResult:(id)a3;
- (void)_dumpShaderBinaryInfo:(id)a3 usingKey:(id)a4 withBaseFileName:(id)a5 targetIndex:(int)a6;
- (void)_dumpTraceProfileDataForResult:(id)a3;
- (void)_generateSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 andBatchIndexMax:(unsigned int)a6 andMinIndex:(unsigned int)a7 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a8 withUSCSampleList:(DYMTLShaderProfilerUSCSample *)a9 withUSCSampleNum:(unsigned int)a10 withBatchIDToEncoderIndex:(void *)a11 andEncoderIndexToBatchIdMap:(void *)a12;
- (void)_handlePerDrawCounterData;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressData:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9;
- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressMappings:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9;
- (void)_preProcessUSCSampleData:(id)a3 result:(id)a4 targetIndex:(int)a5;
- (void)_processBatchIdCounterData:(id)a3;
- (void)_processDerivedEncoderCounterData:(id)a3 forDerivedEncoderData:(id)a4 withEffectivePerDrawKickTimes:(id)a5 withShaderInfo:(id)a6;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:(uint64_t)a4 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:;
- (void)_saveAddressList:(DYMTLShaderProfilerProgramAddress *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveAddressMappings:(id)a3 filename:(const char *)a4;
- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 targetIndex:(int)a5;
- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 withTextSegment:(id)a5 targetIndex:(int)a6;
- (void)_saveSampleDataFromGPURawCounters:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleDataFromGPURawCountersBytes:(char *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleList:(DYMTLShaderProfilerUSCSample *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveSampleListForTarget:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5;
- (void)_saveShaderBinariesWith:(id)a3 targetIndex:(int)a4;
- (void)_showDrawCallDataforResult:(id)a3;
- (void)_updateShaderTimelineInfo:(id)a3 withShaderTimelineDataEx:(id)a4 forGPUTimelineInfo:(id)a5 withEncoderGlobalTraceIdToStateMirrorIdMapping:(void *)a6;
- (void)_visitAllShaderInfosInResult:(id)a3 usingBlock:(id)a4;
- (void)processGPUTimelineDataSources:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)processStreamingGRCData:(id)a3;
- (void)profileBatchIdFilteredData:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)profileShadersForDataSource:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5;
- (void)setMetalPluginName:(id)a3;
- (void)waitForCompletion;
- (void)writeGPUTimelineSerializedData;
@end

@implementation GTShaderProfilerHelper

- (GTShaderProfilerHelper)initWithOptions:(GTProfilerOptions *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___GTShaderProfilerHelper;
  v4 = -[GTShaderProfilerHelper init](&v17, "init");
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    if ([a3->var0 length])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v6 createDirectoryAtPath:a3->var0 withIntermediateDirectories:1 attributes:0 error:0];
      v7 = (void *)objc_claimAutoreleasedReturnValue([a3->var0 stringByAppendingPathComponent:@"shaderBinaries"]);
      [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

      [v6 removeItemAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" error:0];
      [v6 createDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" withIntermediateDirectories:1 attributes:0 error:0];
      [v6 createDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/json" withIntermediateDirectories:1 attributes:0 error:0];
      if (-[GTShaderProfilerHelper initWithOptions:]::onceToken != -1) {
        dispatch_once(&-[GTShaderProfilerHelper initWithOptions:]::onceToken, &__block_literal_global_1638);
      }
      uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSOperation, v8);
      waitOperation = v5->waitOperation;
      v5->waitOperation = (NSOperation *)v9;
    }

    v11 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v11;

    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", @"gputools.AGXMTLReplayer.serialQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    uint64_t v14 = objc_opt_new(&OBJC_CLASS___DYWorkloadGPUTimelineInfo, v13);
    workloadTimelineInfo = v5->_workloadTimelineInfo;
    v5->_workloadTimelineInfo = (DYWorkloadGPUTimelineInfo *)v14;
  }

  return v5;
}

- (BOOL)_shouldUseProgramAddressMappings:(id)a3
{
  id v3 = a3;
  v4 = v3;
  BOOL v5 = 0;
  if (v3 && (dword_5B9DE4 & 0x200) != 0) {
    BOOL v5 = [v3 count] != 0;
  }

  return v5;
}

- (unsigned)_getLegacyProgramType:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([&off_5A0010 objectForKeyedSubscript:a3]);
  v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v5 = 255;
  }

  return v5;
}

- (void)_visitAllShaderInfosInResult:(id)a3 usingBlock:(id)a4
{
  unsigned int v5 = (id *)a3;
  v6 = (void (**)(id, void *, void, uint64_t))a4;
  v10[0] = v5[30];
  v10[1] = v5[31];
  v10[2] = v5[32];
  uint64_t v7 = 0LL;
  v10[3] = v5[33];
  do
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([&off_59F908 objectAtIndexedSubscript:v7]);
    v6[2](v6, v8, v10[v7], v7);

    ++v7;
  }

  while (v7 != 4);
  for (uint64_t i = 3LL; i != -1; --i)
}

- (BOOL)analyzeShaderInfoResult:(id)a3 forDataSource:(const GTMTLReplayDataSource *)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v88 = a3;
  v91 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"draw call info"]);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"MetalPluginName"]);
  metalPluginName = self->_metalPluginName;
  self->_metalPluginName = v7;

  uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:]( self,  "_gatherStaticInformation:forReplayController:",  a4,  a5));
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 drawCallInfoList]);
  v97 = v9;
  uint64_t v11 = 0LL;
  id v12 = [v10 countByEnumeratingWithState:&v113 objects:v120 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v114;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v114 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v113 + 1) + 8 * (void)i) pipelineStateId] == (id)-1) {
          ++v11;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v113 objects:v120 count:16];
    }

    while (v12);
  }

  v15 = (char *)[v91 count];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v97 drawCallInfoList]);
  v86 = &v15[v11];
  v87 = (char *)[v16 count];

  if (&v15[v11] == v87)
  {
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"frametime"]);
    -[GTShaderProfilerHelper _calculateFrameTime:result:](self, "_calculateFrameTime:result:", v17, v97);

    unsigned int v95 = MetalPluginTarget(self->_metalPluginName);
    unsigned int v18 = 0;
    memset(v111, 0, sizeof(v111));
    int v112 = 1065353216;
    while ((unint64_t)[v91 count] > v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v91 objectAtIndexedSubscript:v18]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v97 drawCallInfoList]);
      v22 = (id *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v18]);

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"vertex shader key"]);
      id v24 = v22[1];
      v22[1] = (id)v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"fragment shader key"]);
      id v26 = v22[2];
      v22[2] = (id)v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"compute kernel key"]);
      id v28 = v22[3];
      v22[3] = (id)v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"mutiple binary keys"]);
      v30 = v29;
      if (v29)
      {
        id v31 = [v29 copy];
        objc_storeStrong(v22 + 4, v31);
      }

      else
      {
        id v32 = &__NSArray0__struct;
        id v31 = v22[4];
        v22[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v111,  v18))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v97 programPipelineInfoList]);
        v34 = (id *)objc_claimAutoreleasedReturnValue( objc_msgSend( v33,  "objectAtIndexedSubscript:",  objc_msgSend(v22, "pipelineStateIndex")));

        objc_storeStrong(v34 + 1, v22[1]);
        objc_storeStrong(v34 + 2, v22[2]);
        objc_storeStrong(v34 + 3, v22[3]);
        objc_storeStrong(v34 + 4, v22[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v111,  v18,  v18);
      }

      ++v18;
    }

    uint64_t v35 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v19);
    v36 = (void *)*((void *)v97 + 30);
    *((void *)v97 + 30) = v35;

    uint64_t v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v37);
    v39 = (void *)*((void *)v97 + 31);
    *((void *)v97 + 31) = v38;

    uint64_t v41 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v40);
    v42 = (void *)*((void *)v97 + 32);
    *((void *)v97 + 32) = v41;

    uint64_t v44 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v43);
    v45 = (void *)*((void *)v97 + 33);
    *((void *)v97 + 33) = v44;

    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472LL;
    v110[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke;
    v110[3] = &unk_58E3F8;
    v110[4] = self;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:]( self,  "_visitAllShaderInfosInResult:usingBlock:",  v97,  v110);
    if ((*((_BYTE *)self->_options + 16) & 0x40) != 0) {
      -[GTShaderProfilerHelper _saveShaderBinariesWith:targetIndex:]( self,  "_saveShaderBinariesWith:targetIndex:",  v97,  v95);
    }
    memset(v109, 0, sizeof(v109));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"payload"]);
    v47 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _setupLimiterInfoPerDrawCall:forPayload:withShaderInfo:]( self,  "_setupLimiterInfoPerDrawCall:forPayload:withShaderInfo:",  v97,  v46,  v88));

    -[GTShaderProfilerHelper _preProcessUSCSampleData:result:targetIndex:]( self,  "_preProcessUSCSampleData:result:targetIndex:",  v88,  v97,  v95);
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472LL;
    v106[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3;
    v106[3] = &unk_58E468;
    v106[4] = self;
    unsigned int v108 = v95;
    id v85 = v47;
    id v107 = v85;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:]( self,  "_visitAllShaderInfosInResult:usingBlock:",  v97,  v106);
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int128 v102 = 0u;
    __int128 v103 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v97 drawCallInfoList]);
    id v93 = [obj countByEnumeratingWithState:&v102 objects:v119 count:16];
    if (v93)
    {
      uint64_t v92 = *(void *)v103;
      do
      {
        for (j = 0LL; j != v93; j = (char *)j + 1)
        {
          if (*(void *)v103 != v92) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)j);
          v49 = (void *)objc_claimAutoreleasedReturnValue([v97 programPipelineInfoList]);
          uint64_t v94 = objc_claimAutoreleasedReturnValue( objc_msgSend( v49,  "objectAtIndexedSubscript:",  objc_msgSend((id)v48, "pipelineStateIndex")));

          v50 = *(void **)(v48 + 8);
          if (v50 && [v50 length])
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v97 + 30) objectForKeyedSubscript:*(void *)(v48 + 8)]);
            v52 = (void *)objc_claimAutoreleasedReturnValue([v51 analyzerResult]);

            v53 = (void *)objc_claimAutoreleasedReturnValue([v52 drawCallCost]);
            v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)v48 drawCallIndex]));
            v55 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v54]);
            unsigned int v56 = [v55 unsignedIntValue];

            *(double *)(v48 + 40) = (double)v56;
            *(double *)(v48 + 48) = (double)v56;
            *(double *)(v48 + 56) = (double)v56;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v56;
          }

          v57 = *(void **)(v48 + 16);
          if (v57 && [v57 length])
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v97 + 31) objectForKeyedSubscript:*(void *)(v48 + 16)]);
            v59 = (void *)objc_claimAutoreleasedReturnValue([v58 analyzerResult]);

            v60 = (void *)objc_claimAutoreleasedReturnValue([v59 drawCallCost]);
            v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)v48 drawCallIndex]));
            v62 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v61]);
            unsigned int v63 = [v62 unsignedIntValue];

            *(double *)(v48 + 88) = (double)v63;
            *(double *)(v48 + 96) = (double)v63;
            *(double *)(v48 + 104) = (double)v63;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v63;
          }

          v64 = *(void **)(v48 + 24);
          if (v64 && [v64 length])
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v97 + 32) objectForKeyedSubscript:*(void *)(v48 + 24)]);
            v66 = (void *)objc_claimAutoreleasedReturnValue([v65 analyzerResult]);

            v67 = (void *)objc_claimAutoreleasedReturnValue([v66 drawCallCost]);
            v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)v48 drawCallIndex]));
            v69 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:v68]);
            unsigned int v70 = [v69 unsignedIntValue];

            *(double *)(v48 + 136) = (double)v70;
            *(double *)(v48 + 144) = (double)v70;
            *(double *)(v48 + 152) = (double)v70;
            *(float64x2_t *)(v48 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v48 + 184));
            *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v70;
          }

          __int128 v100 = 0u;
          __int128 v101 = 0u;
          __int128 v98 = 0u;
          __int128 v99 = 0u;
          id v71 = *(id *)(v48 + 32);
          id v72 = [v71 countByEnumeratingWithState:&v98 objects:v118 count:16];
          if (v72)
          {
            uint64_t v73 = *(void *)v99;
            do
            {
              for (k = 0LL; k != v72; k = (char *)k + 1)
              {
                if (*(void *)v99 != v73) {
                  objc_enumerationMutation(v71);
                }
                v75 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v97 + 33) objectForKeyedSubscript:*(void *)(*((void *)&v98 + 1) + 8 * (void)k)]);
                v76 = (void *)objc_claimAutoreleasedReturnValue([v75 analyzerResult]);

                v77 = (void *)objc_claimAutoreleasedReturnValue([v76 drawCallCost]);
                v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)v48 drawCallIndex]));
                v79 = (void *)objc_claimAutoreleasedReturnValue([v77 objectForKeyedSubscript:v78]);
                unsigned int v80 = [v79 unsignedIntValue];

                *(float64x2_t *)(v48 + 184) = vaddq_f64( (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v80), 0),  *(float64x2_t *)(v48 + 184));
                *(double *)(v48 + 200) = *(double *)(v48 + 200) + (double)v80;
              }

              id v72 = [v71 countByEnumeratingWithState:&v98 objects:v118 count:16];
            }

            while (v72);
          }

          *(float64x2_t *)(v94 + 40) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v94 + 40));
          *(double *)(v94 + 56) = *(double *)(v48 + 56) + *(double *)(v94 + 56);
          *(float64x2_t *)(v94 + 88) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v94 + 88));
          *(double *)(v94 + 104) = *(double *)(v48 + 104) + *(double *)(v94 + 104);
          *(float64x2_t *)(v94 + 136) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v94 + 136));
          *(double *)(v94 + 152) = *(double *)(v48 + 152) + *(double *)(v94 + 152);
          *(float64x2_t *)(v94 + 184) = vaddq_f64(*(float64x2_t *)(v48 + 184), *(float64x2_t *)(v94 + 184));
          *(double *)(v94 + 200) = *(double *)(v48 + 200) + *(double *)(v94 + 200);
          *(float64x2_t *)(v97 + 8) = vaddq_f64(*(float64x2_t *)(v48 + 40), *(float64x2_t *)(v97 + 8));
          *((double *)v97 + 3) = *(double *)(v48 + 56) + *((double *)v97 + 3);
          *(float64x2_t *)(v97 + 56) = vaddq_f64(*(float64x2_t *)(v48 + 88), *(float64x2_t *)(v97 + 56));
          *((double *)v97 + 9) = *(double *)(v48 + 104) + *((double *)v97 + 9);
          *(float64x2_t *)(v97 + 104) = vaddq_f64(*(float64x2_t *)(v48 + 136), *(float64x2_t *)(v97 + 104));
          *((double *)v97 + 15) = *(double *)(v48 + 152) + *((double *)v97 + 15);
        }

        id v93 = [obj countByEnumeratingWithState:&v102 objects:v119 count:16];
      }

      while (v93);
    }

    uint64_t v81 = *((void *)self->_options + 2);
    if ((v81 & 0x10) != 0)
    {
      -[GTShaderProfilerHelper _showDrawCallDataforResult:](self, "_showDrawCallDataforResult:", v97);
    }

    else
    {
      v82 = v97;
      if ((v81 & 8) != 0) {
        -[GTShaderProfilerHelper _dumpTraceProfileDataForResult:](self, "_dumpTraceProfileDataForResult:", v97);
      }
    }

    if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v82));
      [v83 moveItemAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults" toPath:self->_options->var0 error:0];
    }

    v117 = (void **)v109;
    std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100](&v117);

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v111);
  }

  return v86 == v87;
}

- (id)_analyzeBinary:(id)a3 uscSamples:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if ([v17 length])
  {
    LODWORD(v24) = a9;
    v22 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _calculatePerLineCostWithSampleData:binary:targetIndex:withTextSegment:withKey:withShaderSourcePath:forDataMaster:withPerDrawLimiterData:]( self,  "_calculatePerLineCostWithSampleData:binary:targetIndex:withTextSegment:withKey:withShaderSourcePat h:forDataMaster:withPerDrawLimiterData:",  v17,  v16,  v13,  v18,  v19,  v20,  v24,  v21));
    if (!v22) {
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _calculatePerDrawCallCostWithSampleData:targetIndex:]( self,  "_calculatePerDrawCallCostWithSampleData:targetIndex:",  v17,  v13));
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (id)_gatherStaticInformation:(const GTMTLReplayDataSource *)a3 forReplayController:(const GTMTLReplayController *)a4
{
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___DYMTLShaderProfilerResult, a2);
  v6 = (void *)v5;
  var2 = a3->var2;
  uint64_t v7 = a3->var9.var2;
  var3 = a3->var9.var3;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  float v134 = 1.0;
  v106 = v7;
  int nelts = v7->nelts;
  if (nelts >= 1)
  {
    int v102 = 0;
    int v9 = 0;
    uint64_t v111 = 0LL;
    unsigned int v118 = 0;
    uint64_t v108 = v5 + 200;
    unint64_t v10 = -1LL;
    v117 = (void *)v5;
    __int128 v98 = a3;
    do
    {
      elts = v106->elts;
      int v107 = v9;
      uint64_t v12 = v9;
      __int128 v114 = &elts[32 * v9];
      uint64_t v13 = &var3->elts[64 * *(void *)v114];
      int v14 = *((_DWORD *)v13 + 2);
      if (GetFuncEnumConstructorType(v14) == 25)
      {
        ++v102;
      }

      else if (GTMTLReplayHost_IsFuncEnumSampledEncoder(v14, 1, 0LL))
      {
        __int128 v101 = (unint64_t *)v13;
        objc_msgSend(v6, "setEncoderCount:", objc_msgSend(v6, "encoderCount") + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v6 encoderInfoList]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 count]));
        [v15 addObject:v17];

        bzero(v131, 0x2B90uLL);
        bzero(v130, 0x2B90uLL);
        uint64_t v18 = *(void *)v114;
        __int128 v100 = &elts[32 * v12];
        id v19 = v100 + 8;
        if (*(void *)v114 >= *((void *)v100 + 1))
        {
LABEL_112:
          v107 += *((_DWORD *)v100 + 5);
          int nelts = v106->nelts;
          goto LABEL_113;
        }

        unsigned int v110 = v102 - 1;
        while (2)
        {
          id v20 = (unsigned int *)&var3->elts[64 * v18];
          uint64_t v21 = IsFuncEnumParallelCommandEncoderCall(v20[2]);
          if ((_DWORD)v21) {
            v22 = v131;
          }
          else {
            v22 = v130;
          }
          GTMTLSMCommandEncoder_processTraceFunc((uint64_t)v22, (uint64_t *)v20, (uint64_t)a3->var2);
          unsigned int v23 = v20[2];
          if (v23 != -16279 && v23 != -16337)
          {
            int v115 = v21;
            if (IsFuncEnumGPUCommandCall(v23))
            {
              if (IsFuncEnumSampledBlitCall(v23) || IsFuncEnumSampledBlitCallAGX(v23)) {
                unint64_t v10 = -1LL;
              }
              id v31 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderProfilerDrawCallInfo, v30);
              id v32 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
              id v33 = [v32 count];

              [v31 setPipelineStateId:v10];
              [v31 setPipelineStateIndex:v118];
              [v31 setPipelineStateFunctionIndex:v111];
              [v31 setDrawCallIndex:v33];
              [v31 setCommandBufferIndex:v110];
              [v31 setFunctionIndex:*v20];
              objc_msgSend(v31, "setEncoderIndex:", objc_msgSend(v6, "encoderCount") - 1);
              v34 = v131;
              if (!v115) {
                v34 = v130;
              }
              objc_msgSend(v31, "setEncoderStateId:", *((void *)v34 + 1), v98);
              [v31 setEncoderFunctionIndex:*(void *)v114];
              if (v10 != -1LL)
              {
                uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 programPipelineInfoList]);
                v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndexedSubscript:v118]);

                uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 drawCallInfoList]);
                uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v33));
                [v37 addObject:v38];

                v6 = v117;
                id v19 = v100 + 8;
              }

              *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>( v108,  *(void *)v20,  v20)
              + 6) = (_DWORD)v33;
              v39 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
              [v39 addObject:v31];

              uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v33));
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v6 encoderInfoList]);
              objc_msgSend(v41, "setObject:atIndexedSubscript:", v40, objc_msgSend(v31, "encoderIndex"));
            }

            else if (v23 >> 2 == 1073737833)
            {
              p = *(apr_pool_t **)a4->var19;
              GTMTLSMContext_indirectCommandBufferResources((uint64_t)v127, a3->var5, *v101, p);
              GetExecuteCommandsInBufferArgs((uint64_t)&v121, (uint64_t)&var3->elts[64 * v18], (uint64_t)a3->var2);
              Object = GTMTLSMContext_getObject(*(void *)a3->var5, v121, *v101);
              GTMTLCreateIndirectCommandEncoder((uint64_t)v125, Object[13]);
              memcpy(__dst, v22, sizeof(__dst));
              if (*(_DWORD *)v22 == 28)
              {
                if ((GT_SUPPORT_0 & 0x10) != 0)
                {
                  uint64_t v80 = v123;
                  if (v123)
                  {
                    unsigned int v113 = 0;
                    uint64_t v81 = v124 + v126 * (v107 + (int)v122);
                    uint64_t v105 = v81;
                    do
                    {
                      uint64_t v128 = v81;
                      if (GTMTLSMComputeCommandEncoder_loadIndirectCommand( (uint64_t)&__dst[7],  v125,  v81,  v127))
                      {
                        v83 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderProfilerDrawCallInfo, v82);
                        v84 = (void *)objc_claimAutoreleasedReturnValue([v117 drawCallInfoList]);
                        id v85 = [v84 count];

                        [v83 setPipelineStateId:__dst[8]];
                        id v119 = [v83 pipelineStateId];
                        objc_msgSend( v83,  "setPipelineStateIndex:",  *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( (uint64_t)&v132,  (unint64_t)v119,  &v119)
                          + 6));
                        id v119 = [v83 pipelineStateId];
                        objc_msgSend( v83,  "setPipelineStateFunctionIndex:",  std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( (uint64_t)&v132,  (unint64_t)v119,  &v119)[4]);
                        [v83 setDrawCallIndex:v85];
                        [v83 setCommandBufferIndex:v110];
                        [v83 setFunctionIndex:*v20];
                        [v83 setSubCommandIndex:v113];
                        objc_msgSend(v83, "setEncoderIndex:", objc_msgSend(v117, "encoderCount") - 1);
                        v86 = v131;
                        if (!v115) {
                          v86 = v130;
                        }
                        objc_msgSend(v83, "setEncoderStateId:", *((void *)v86 + 1), v98);
                        [v83 setEncoderFunctionIndex:*(void *)v114];
                        if (v10 != -1LL)
                        {
                          v87 = (void *)objc_claimAutoreleasedReturnValue([v117 programPipelineInfoList]);
                          id v88 = (void *)objc_claimAutoreleasedReturnValue([v87 objectAtIndexedSubscript:v118]);

                          v89 = (void *)objc_claimAutoreleasedReturnValue([v88 drawCallInfoList]);
                          v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v85));
                          [v89 addObject:v90];
                        }

                        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>( v108,  *(void *)v20,  v20)
                        + 6) = (_DWORD)v85;
                        v91 = (void *)objc_claimAutoreleasedReturnValue([v117 drawCallInfoList]);
                        [v91 addObject:v83];

                        uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                        id v93 = [v92 count];
                        unsigned int v94 = [v83 encoderIndex];

                        if ((unint64_t)v93 <= v94)
                        {
                          unsigned int v95 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                          v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v85));
                          [v95 addObject:v96];
                        }

                        else
                        {
                          unsigned int v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v85));
                          v96 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                          objc_msgSend( v96,  "setObject:atIndexedSubscript:",  v95,  objc_msgSend(v83, "encoderIndex"));
                        }

                        ++v113;

                        uint64_t v81 = v105;
                      }

                      --v80;
                    }

                    while (v80);
                  }
                }
              }

              else if (*(_DWORD *)v22 == 70)
              {
                uint64_t v57 = v123;
                if (v123)
                {
                  unsigned int v112 = 0;
                  uint64_t v58 = v124;
                  uint64_t v59 = v126;
                  uint64_t v60 = v122 << 32;
                  uint64_t v103 = v126;
                  uint64_t v104 = v124;
                  do
                  {
                    uint64_t v128 = v58 + v59 * (v60 >> 32);
                    if (GTMTLSMRenderCommandEncoder_loadIndirectCommand( (uint64_t)&__dst[7],  v125,  v128,  v127))
                    {
                      v62 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderProfilerDrawCallInfo, v61);
                      unsigned int v63 = (void *)objc_claimAutoreleasedReturnValue([v117 drawCallInfoList]);
                      id v64 = [v63 count];

                      [v62 setPipelineStateId:__dst[1075]];
                      id v119 = [v62 pipelineStateId];
                      objc_msgSend( v62,  "setPipelineStateIndex:",  *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( (uint64_t)&v132,  (unint64_t)v119,  &v119)
                        + 6));
                      id v119 = [v62 pipelineStateId];
                      objc_msgSend( v62,  "setPipelineStateFunctionIndex:",  std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<unsigned int,unsigned long long>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( (uint64_t)&v132,  (unint64_t)v119,  &v119)[4]);
                      [v62 setDrawCallIndex:v64];
                      [v62 setCommandBufferIndex:v110];
                      [v62 setFunctionIndex:*v20];
                      [v62 setSubCommandIndex:v112];
                      objc_msgSend(v62, "setEncoderIndex:", objc_msgSend(v117, "encoderCount") - 1);
                      v65 = v131;
                      if (!v115) {
                        v65 = v130;
                      }
                      objc_msgSend(v62, "setEncoderStateId:", *((void *)v65 + 1), v98);
                      [v62 setEncoderFunctionIndex:*(void *)v114];
                      if (v10 != -1LL)
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue([v117 programPipelineInfoList]);
                        v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:v118]);

                        v68 = (void *)objc_claimAutoreleasedReturnValue([v67 drawCallInfoList]);
                        v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v64));
                        [v68 addObject:v69];
                      }

                      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>( v108,  *(void *)v20,  v20)
                      + 6) = (_DWORD)v64;
                      unsigned int v70 = (void *)objc_claimAutoreleasedReturnValue([v117 drawCallInfoList]);
                      [v70 addObject:v62];

                      id v71 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                      id v72 = [v71 count];
                      unsigned int v73 = [v62 encoderIndex];

                      if ((unint64_t)v72 <= v73)
                      {
                        v74 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                        v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v64));
                        [v74 addObject:v75];
                      }

                      else
                      {
                        v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v64));
                        v75 = (void *)objc_claimAutoreleasedReturnValue([v117 encoderInfoList]);
                        objc_msgSend( v75,  "setObject:atIndexedSubscript:",  v74,  objc_msgSend(v62, "encoderIndex"));
                      }

                      ++v112;

                      uint64_t v59 = v103;
                      uint64_t v58 = v104;
                    }

                    v60 += 0x100000000LL;
                    --v57;
                  }

                  while (v57);
                }
              }

              apr_pool_clear(p);
              v6 = v117;
              a3 = v98;
              id v19 = v100 + 8;
            }

            goto LABEL_96;
          }

          uint64_t v25 = GTTraceFunc_argumentBytesWithMap(v20, *((unsigned __int8 *)v20 + 13), (uint64_t)var2);
          unint64_t v10 = *((void *)v25 + 1);
          if (*((void *)&v132 + 1))
          {
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v132 + 8));
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              unint64_t v28 = *((void *)v25 + 1);
              if (v10 >= *((void *)&v132 + 1)) {
                unint64_t v28 = v10 % *((void *)&v132 + 1);
              }
            }

            else
            {
              unint64_t v28 = (*((void *)&v132 + 1) - 1LL) & v10;
            }

            v42 = *(uint64_t ***)(v132 + 8 * v28);
            if (v42)
            {
              for (uint64_t i = *v42; i; uint64_t i = (uint64_t *)*i)
              {
                unint64_t v44 = i[1];
                if (v44 == v10)
                {
                  if (i[2] == v10)
                  {
                    unsigned int v118 = *((_DWORD *)i + 6);
                    uint64_t v111 = i[4];
                    goto LABEL_96;
                  }
                }

                else
                {
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v44 >= *((void *)&v132 + 1)) {
                      v44 %= *((void *)&v132 + 1);
                    }
                  }

                  else
                  {
                    v44 &= *((void *)&v132 + 1) - 1LL;
                  }

                  if (v44 != v28) {
                    break;
                  }
                }
              }
            }
          }

          unsigned int v118 = DWORD2(v133);
          v45 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderProfilerProgramInfo, v26);
          [v45 setProgramId:v10];
          [v45 setProgramIndex:v118];
          [v45 setPipelineStateFunctionIndex:v18];
          unint64_t v46 = *((void *)&v132 + 1);
          if (*((void *)&v132 + 1))
          {
            uint8x8_t v47 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v132 + 8));
            v47.i16[0] = vaddlv_u8(v47);
            if (v47.u32[0] > 1uLL)
            {
              uint64_t v21 = v10;
              if (v10 >= *((void *)&v132 + 1)) {
                uint64_t v21 = v10 % *((void *)&v132 + 1);
              }
            }

            else
            {
              uint64_t v21 = (*((void *)&v132 + 1) - 1LL) & v10;
            }

            uint64_t v48 = *(void ***)(v132 + 8 * v21);
            if (v48)
            {
              v49 = *v48;
              if (*v48)
              {
                do
                {
                  unint64_t v50 = v49[1];
                  if (v50 == v10)
                  {
                    if (v49[2] == v10) {
                      goto LABEL_95;
                    }
                  }

                  else
                  {
                    if (v47.u32[0] > 1uLL)
                    {
                      if (v50 >= *((void *)&v132 + 1)) {
                        v50 %= *((void *)&v132 + 1);
                      }
                    }

                    else
                    {
                      v50 &= *((void *)&v132 + 1) - 1LL;
                    }

                    if (v50 != v21) {
                      break;
                    }
                  }

                  v49 = (void *)*v49;
                }

                while (v49);
              }
            }
          }

          v49 = operator new(0x28uLL);
          void *v49 = 0LL;
          v49[1] = v10;
          v49[2] = v10;
          *((_DWORD *)v49 + 6) = 0;
          v49[4] = 0LL;
          float v51 = (float)(unint64_t)(*((void *)&v133 + 1) + 1LL);
          if (!v46 || (float)(v134 * (float)v46) < v51)
          {
            BOOL v52 = (v46 & (v46 - 1)) != 0;
            if (v46 < 3) {
              BOOL v52 = 1LL;
            }
            unint64_t v53 = v52 | (2 * v46);
            unint64_t v54 = vcvtps_u32_f32(v51 / v134);
            if (v53 <= v54) {
              size_t v55 = v54;
            }
            else {
              size_t v55 = v53;
            }
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v132,  v55);
            unint64_t v46 = *((void *)&v132 + 1);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v10 >= *((void *)&v132 + 1)) {
                uint64_t v21 = v10 % *((void *)&v132 + 1);
              }
              else {
                uint64_t v21 = v10;
              }
            }

            else
            {
              uint64_t v21 = (*((void *)&v132 + 1) - 1LL) & v10;
            }
          }

          uint64_t v76 = v132;
          v77 = *(void **)(v132 + 8 * v21);
          if (v77)
          {
            void *v49 = *v77;
            goto LABEL_93;
          }

          void *v49 = v133;
          *(void *)&__int128 v133 = v49;
          *(void *)(v76 + 8 * v21) = &v133;
          if (*v49)
          {
            unint64_t v78 = *(void *)(*v49 + 8LL);
            if ((v46 & (v46 - 1)) != 0)
            {
              if (v78 >= v46) {
                v78 %= v46;
              }
            }

            else
            {
              v78 &= v46 - 1;
            }

            v77 = (void *)(v132 + 8 * v78);
LABEL_93:
            void *v77 = v49;
          }

          ++*((void *)&v133 + 1);
LABEL_95:
          *((_DWORD *)v49 + 6) = v118;
          v49[4] = v18;
          objc_msgSend(v45, "setValid:", 1, v98);
          v79 = (void *)objc_claimAutoreleasedReturnValue([v6 programPipelineInfoList]);
          [v79 addObject:v45];

          uint64_t v111 = v18;
LABEL_96:
          continue;
        }
      }

- (void)_saveSampleDataFromGPURawCounters:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  uint64_t v7 = fopen(a5, "wt");
  if (v7)
  {
    uint64_t v8 = v7;
    if (a4)
    {
      unsigned int v9 = 0;
      do
      {
        unint64_t v10 = a3[v9];
        unsigned int v11 = v9 + 4 * (BYTE4(v10) & 0x7F) + 1;
        fprintf(v8, "%6u : encoderId:%u limiterIdx:%u nTracePackets:%u)\n", v11, v10, v10 >> 39, BYTE4(v10) & 0x7F);
        if ((a3[v9] & 0x7F00000000LL) != 0)
        {
          unint64_t v12 = 0LL;
          uint64_t v13 = &a3[v9 + 1];
          do
          {
            for (uint64_t i = 0LL; i != 4; ++i)
              fprintf(v8, "%6u : 0x%0.8llx 0x%0.8llx\n", i, HIDWORD(v13[i]), v13[i]);
            ++v12;
            v13 += 4;
          }

          while (v12 < (HIDWORD(a3[v9]) & 0x7Fu));
        }

        unsigned int v9 = v11;
      }

      while (v11 < a4);
    }

    fclose(v8);
  }

- (void)_calculatePerSampleAggregatedActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  id v7 = a3;
  id v139 = a4;
  id v150 = a5;
  v141 = v7;
  v147 = (void *)objc_claimAutoreleasedReturnValue([v150 aggregatedGPUTimelineInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"aggregated derived counters"]);
  [v147 setDerivedCounters:v8];

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"sampled timestamps"]);
  [v147 setTimestamps:v9];

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v147 timestamps]);
  objc_msgSend(v147, "setNumPeriodicSamples:", objc_msgSend(v10, "length") >> 3);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v150 mGPUTimelineInfos]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 derivedCounterNames]);
  id v14 = [v13 copy];
  [v147 setDerivedCounterNames:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v150 mGPUTimelineInfos]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 encoderTimelineInfos]);
  [v147 setEncoderTimelineInfos:v17];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v147 timestamps]);
  BufferView<unsigned long long>::BufferView(v168, v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v147 encoderTimelineInfos]);
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(&v166, v19);

  if (v167)
  {
    uint64_t v20 = 0LL;
    LODWORD(j) = 0;
    for (unsigned int i = 0; i < v167; v20 = ++i)
    {
      uint64_t v23 = v166;
      uint64_t v24 = (void *)(v166 + 24 * v20 + 8);
      for (unint64_t j = j; j < [v147 numPeriodicSamples]; ++j)
      {
        if (*(void *)(v168[0] + 8 * j) >= *v24)
        {
          *(_DWORD *)(v23 + 24 * v20 + 16) = j;
          break;
        }
      }
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v141 objectForKeyedSubscript:@"ring buffer sampled counter data"]);
  [v150 setPerRingSampledDerivedCounters:v25];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v141 objectForKeyedSubscript:@"core counts"]);
  [v150 setCoreCounts:v26];

  uint64_t v27 = objc_claimAutoreleasedReturnValue([v141 objectForKeyedSubscript:@"Restore Timestamps"]);
  v140 = (void *)v27;
  if (v27) {
    [v150 setRestoreTimestamps:v27];
  }
  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v141 objectForKeyedSubscript:@"ring buffer blend factors"]);
  v163 = 0LL;
  v164 = 0LL;
  unint64_t v165 = 0LL;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&v163, (unint64_t)[v28 count]);
  __int128 v161 = 0u;
  __int128 v162 = 0u;
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  id obj = v28;
  id v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v169, 16, v28);
  if (v29)
  {
    uint64_t v30 = *(void *)v160;
    do
    {
      for (k = 0LL; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v160 != v30) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(void **)(*((void *)&v159 + 1) + 8LL * (void)k);
        if ((unint64_t)v164 >= v165)
        {
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((v164 - (_BYTE *)v163) >> 3);
          unint64_t v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36)
          {
            uint64_t v37 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v36);
            uint64_t v39 = v38;
          }

          else
          {
            uint64_t v37 = 0LL;
            uint64_t v39 = 0LL;
          }

          uint64_t v40 = (char *)BufferView<double>::BufferView(&v37[3 * v34], v32);
          v42 = v163;
          uint64_t v41 = v164;
          uint64_t v43 = v40;
          if (v164 != v163)
          {
            do
            {
              __int128 v44 = *(_OWORD *)(v41 - 3);
              *((void *)v43 - 1) = *(v41 - 1);
              *(_OWORD *)(v43 - 24) = v44;
              v43 -= 24;
              v41 -= 3;
            }

            while (v41 != v42);
            uint64_t v41 = v163;
          }

          v45 = (char *)&v37[3 * v39];
          id v33 = v40 + 24;
          v163 = v43;
          unint64_t v165 = (unint64_t)v45;
          if (v41) {
            operator delete(v41);
          }
        }

        else
        {
          id v33 = (char *)(BufferView<double>::BufferView(v164, *(void **)(*((void *)&v159 + 1) + 8LL * (void)k)) + 3);
        }

        v164 = v33;
      }

      id v29 = [obj countByEnumeratingWithState:&v159 objects:v169 count:16];
    }

    while (v29);
  }

  unsigned int v46 = [v147 numPeriodicSamples];
  v156 = 0LL;
  v157 = 0LL;
  v158 = 0LL;
  if (v46)
  {
    unsigned int v47 = v46;
    size_t v48 = 24LL * v46;
    v156 = (char *)operator new(v48);
    v158 = &v156[24 * v47];
    size_t v49 = 24 * ((v48 - 24) / 0x18) + 24;
    bzero(v156, v49);
    v157 = &v156[v49];
  }

  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector( &v154,  [v147 numPeriodicSamples]);
  unsigned int v50 = [v147 numPeriodicSamples];
  if (v50)
  {
    size_t v51 = 8LL * v50;
    BOOL v52 = (char *)operator new(v51);
    bzero(v52, v51);
    v138 = &v52[v51];
  }

  else
  {
    v138 = 0LL;
    BOOL v52 = 0LL;
  }

  unint64_t v53 = 0LL;
  unsigned int v145 = 0;
  __int128 v151 = 0u;
  *(_OWORD *)__p = 0u;
  v143 = v164;
  v149 = (char *)v163;
  int v153 = 1050253722;
  else {
    int64_t v54 = (v164 - (_BYTE *)v163) / 24;
  }
  int64_t v148 = v54;
  while (v53 < [v147 numPeriodicSamples])
  {
    if (v143 != v149)
    {
      uint64_t v55 = 0LL;
      do
      {
        double v56 = *(double *)(*(void *)&v149[24 * v55] + 8 * v53);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v150 mGPUTimelineInfos]);
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectAtIndexedSubscript:v55]);
        id v59 = objc_claimAutoreleasedReturnValue([v58 activeShadersPerPeriodicSample]);
        uint64_t v60 = (char *)[v59 bytes];
        [v59 length];

        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v150 mGPUTimelineInfos]);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectAtIndexedSubscript:v55]);
        id v63 = objc_claimAutoreleasedReturnValue([v62 numActiveShadersPerPeriodicSample]);
        id v64 = [v63 bytes];
        [v63 length];

        uint64_t v65 = (v56 + 2.22044605e-16);
        v66 = &v64[2 * v65];
        if (*v66)
        {
          unsigned int v67 = 0;
          do
          {
            v68 = (unint64_t *)&v60[8 * v67 + 8 * v64[2 * v65 + 1]];
            v69 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>( (uint64_t)&v151,  *v68,  v68);
            v69[3] |= 1 << v55;
            ++v67;
          }

          while (v67 < *v66);
        }

        uint64_t v70 = (ceil(v56 + -2.22044605e-16) + 2.22044605e-16);
        if ((_DWORD)v70 != (_DWORD)v65)
        {
          id v71 = &v64[2 * v70];
          if (*v71)
          {
            unsigned int v72 = 0;
            unsigned int v73 = &v64[2 * v70 + 1];
            do
            {
              v74 = (unint64_t *)&v60[8 * v72 + 8 * *v73];
              v75 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>( (uint64_t)&v151,  *v74,  v74);
              v75[3] |= 1 << v55;
              ++v72;
            }

            while (v72 < *v71);
          }
        }

        ++v55;
      }

      while (v55 != v148);
    }

    unint64_t v76 = (unint64_t)__p[1];
    v77 = &v52[8 * v53];
    unsigned int v78 = v145;
    *(_DWORD *)v77 = __p[1];
    *((_DWORD *)v77 + 1) = v145;
    v79 = (void *)(v154 + 24 * v53);
    uint64_t v81 = (char **)(v79 + 1);
    uint64_t v80 = (char *)v79[1];
    uint64_t v82 = (char *)*v79;
    unint64_t v83 = (uint64_t)&v80[-*v79] >> 3;
    int v144 = v76;
    if (v76 <= v83)
    {
      if (v76 >= v83) {
        goto LABEL_71;
      }
      __int128 v100 = &v82[8 * v76];
      goto LABEL_70;
    }

    unint64_t v84 = v76 - v83;
    uint64_t v85 = v154 + 24 * v53;
    uint64_t v88 = *(void *)(v85 + 16);
    v87 = (void *)(v85 + 16);
    uint64_t v86 = v88;
    if (v76 - v83 <= (v88 - (uint64_t)v80) >> 3)
    {
      bzero(v80, 8 * v84);
      __int128 v100 = &v80[8 * v84];
LABEL_70:
      *uint64_t v81 = v100;
      goto LABEL_71;
    }

    if (v76 >> 61) {
      goto LABEL_113;
    }
    uint64_t v89 = v86 - (void)v82;
    uint64_t v90 = v89 >> 2;
    if (v89 >> 2 <= v76) {
      uint64_t v90 = v76;
    }
    else {
      unint64_t v91 = v90;
    }
    uint64_t v92 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v91);
    uint64_t v142 = v93;
    unsigned int v94 = v92;
    unsigned int v95 = &v92[8 * v83];
    bzero(v95, 8 * v84);
    v96 = *v81;
    v97 = (char *)*v79;
    __int128 v98 = v95;
    if (*v81 != (char *)*v79)
    {
      do
      {
        uint64_t v99 = *((void *)v96 - 1);
        v96 -= 8;
        *((void *)v98 - 1) = v99;
        v98 -= 8;
      }

      while (v96 != v97);
      v96 = (char *)*v79;
    }

    void *v79 = v98;
    *uint64_t v81 = &v95[8 * v84];
    void *v87 = &v94[8 * v142];
    unsigned int v78 = v145;
    if (v96) {
      operator delete(v96);
    }
LABEL_71:
    __int128 v101 = &v156[24 * v53];
    uint64_t v102 = (uint64_t)__p[1];
    uint64_t v104 = (char **)(v101 + 8);
    uint64_t v103 = (char *)*((void *)v101 + 1);
    uint64_t v105 = *(char **)v101;
    unint64_t v106 = (uint64_t)&v103[-*(void *)v101] >> 3;
    if (__p[1] <= (void *)v106)
    {
      v120 = &v105[8 * (uint64_t)__p[1]];
      goto LABEL_88;
    }

    int v107 = (char *)__p[1] - v106;
    uint64_t v108 = &v156[24 * v53];
    uint64_t v111 = *((void *)v108 + 2);
    unsigned int v110 = v108 + 16;
    uint64_t v109 = v111;
    if ((char *)__p[1] - v106 <= (void *)((v111 - (uint64_t)v103) >> 3))
    {
      bzero(v103, 8LL * (void)v107);
      v120 = &v103[8 * (void)v107];
LABEL_88:
      *uint64_t v104 = v120;
      goto LABEL_89;
    }

    if ((unint64_t)__p[1] >> 61) {
LABEL_113:
    }
      abort();
    uint64_t v112 = v109 - (void)v105;
    else {
      unint64_t v113 = v102;
    }
    if (v113 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    __int128 v114 = (char *)operator new(8 * v113);
    int v115 = &v114[8 * v106];
    bzero(v115, 8LL * (void)v107);
    __int128 v116 = *v104;
    v117 = *(char **)v101;
    unsigned int v118 = v115;
    if (*v104 != *(char **)v101)
    {
      do
      {
        uint64_t v119 = *((void *)v116 - 1);
        v116 -= 8;
        *((void *)v118 - 1) = v119;
        v118 -= 8;
      }

      while (v116 != v117);
      __int128 v116 = *(char **)v101;
    }

    *(void *)__int128 v101 = v118;
    *uint64_t v104 = &v115[8 * (void)v107];
    *unsigned int v110 = &v114[8 * v113];
    unsigned int v78 = v145;
    if (v116) {
      operator delete(v116);
    }
LABEL_89:
    uint64_t v121 = __p[0];
    if (__p[0])
    {
      unsigned int v122 = 0;
      do
      {
        *(void *)(*(void *)(v154 + 24 * v53) + 8LL * v122) = v121[2];
        *(void *)(*(void *)&v156[24 * v53] + 8LL * v122++) = v121[3];
        uint64_t v121 = (void *)*v121;
      }

      while (v121);
    }

    if (__p[1])
    {
      uint64_t v123 = __p[0];
      if (__p[0])
      {
        do
        {
          uint64_t v124 = (void *)*v123;
          operator delete(v123);
          uint64_t v123 = v124;
        }

        while (v124);
      }

      __p[0] = 0LL;
      uint64_t v125 = *((void *)&v151 + 1);
      if (*((void *)&v151 + 1))
      {
        uint64_t v126 = 0LL;
        do
          *(void *)(v151 + 8 * v126++) = 0LL;
        while (v125 != v126);
      }

      __p[1] = 0LL;
    }

    unsigned int v145 = v78 + v144;
    ++v53;
  }

  v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v52,  v138 - v52));
  [v147 setNumActiveShadersPerPeriodicSample:v127];

  uint64_t v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 8LL * v145));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](&OBJC_CLASS___NSMutableData, "dataWithCapacity:", 8LL * v145));
  uint64_t v130 = v154;
  if (v155 != v154)
  {
    uint64_t v131 = 0LL;
    unint64_t v132 = 0LL;
    do
    {
      __int128 v133 = (uint64_t *)(v130 + v131);
      uint64_t v134 = *v133;
      uint64_t v135 = v133[1];
      if (v134 != v135) {
        [v128 appendBytes:v134 length:v135 - v134];
      }
      uint64_t v136 = *(void *)&v156[v131];
      uint64_t v137 = *(void *)&v156[v131 + 8];
      if (v136 != v137) {
        [v129 appendBytes:v136 length:v137 - v136];
      }
      ++v132;
      uint64_t v130 = v154;
      v131 += 24LL;
    }

    while (v132 < 0xAAAAAAAAAAAAAAABLL * ((v155 - v154) >> 3));
  }

  [v147 setActiveShadersPerPeriodicSample:v128];
  [v147 setActiveCoreInfoMasksPerPeriodicSample:v129];

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v151);
  if (v52) {
    operator delete(v52);
  }
  *(void *)&__int128 v151 = &v154;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  *(void *)&__int128 v151 = &v156;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v151);
  if (v163) {
    operator delete(v163);
  }
}

- (void)_updateShaderTimelineInfo:(id)a3 withShaderTimelineDataEx:(id)a4 forGPUTimelineInfo:(id)a5 withEncoderGlobalTraceIdToStateMirrorIdMapping:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v50 = a5;
  id v51 = v9;
  BOOL v52 = (char *)objc_msgSend(v51, "bytes", v10);
  id v11 = v10;
  unint64_t v12 = [v11 bytes];
  unint64_t v13 = (unint64_t)[v51 length];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 24 * (v13 / 0x18)));
  [v50 setEncoderTimelineInfos:v14];
  size_t v49 = v11;

  int8x8_t prime = (int8x8_t)objc_claimAutoreleasedReturnValue([v50 encoderTimelineInfos]);
  BufferView<DYGPUTimelineEncoderTimelineInfo>::BufferView(v53, *(void **)&prime);

  if (v13 < 0x18) {
    goto LABEL_2;
  }
  uint64_t v16 = 0LL;
  if (v13 / 0x18 <= 1) {
    unint64_t v17 = 1LL;
  }
  else {
    unint64_t v17 = v13 / 0x18;
  }
  uint64_t v18 = (char *)a6 + 16;
  do
  {
    uint64_t v19 = v53[0] + 24 * v16;
    uint64_t v20 = &v52[24 * v16];
    *(void *)uint64_t v19 = v12[3 * v16];
    *(void *)(v19 + 8) = *(void *)(v20 + 12);
    *(_DWORD *)(v19 + 16) = *((_DWORD *)v20 + 1);
    unsigned int v21 = *(_DWORD *)(v19 + 20) & 0xFFFFFF00 | (*(_DWORD *)v20 >> 1) & 7;
    *(_DWORD *)(v19 + 20) = v21;
    *(_DWORD *)(v19 + 20) = ((*(_DWORD *)v20 & 1) << 16) | (unsigned __int16)v21;
    uint64_t v22 = v12[3 * v16];
    unint64_t v23 = *((unsigned int *)v20 + 5);
    unint64_t v24 = *((void *)a6 + 1);
    if (v24)
    {
      uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
      v25.i16[0] = vaddlv_u8(v25);
      if (v25.u32[0] > 1uLL)
      {
        int8x8_t prime = (int8x8_t)*((unsigned int *)v20 + 5);
        if (v24 <= v23) {
          int8x8_t prime = (int8x8_t)(v23 % v24);
        }
      }

      else
      {
        int8x8_t prime = (int8x8_t)(((_DWORD)v24 - 1) & v23);
      }

      uint64_t v26 = *(void ***)(*(void *)a6 + 8LL * *(void *)&prime);
      if (v26)
      {
        uint64_t v27 = *v26;
        if (*v26)
        {
          do
          {
            unint64_t v28 = v27[1];
            if (v28 == v23)
            {
              if (*((_DWORD *)v27 + 4) == (_DWORD)v23) {
                goto LABEL_79;
              }
            }

            else
            {
              if (v25.u32[0] > 1uLL)
              {
                if (v28 >= v24) {
                  v28 %= v24;
                }
              }

              else
              {
                v28 &= v24 - 1;
              }

              if (v28 != *(void *)&prime) {
                break;
              }
            }

            uint64_t v27 = (void *)*v27;
          }

          while (v27);
        }
      }
    }

    uint64_t v27 = operator new(0x20uLL);
    *uint64_t v27 = 0LL;
    v27[1] = v23;
    *((_DWORD *)v27 + 4) = v23;
    v27[3] = 0LL;
    float v29 = (float)(unint64_t)(*((void *)a6 + 3) + 1LL);
    float v30 = *((float *)a6 + 8);
    if (v24 && (float)(v30 * (float)v24) >= v29)
    {
      unint64_t v23 = (unint64_t)prime;
      goto LABEL_69;
    }

    BOOL v31 = (v24 & (v24 - 1)) != 0;
    if (v24 < 3) {
      BOOL v31 = 1LL;
    }
    unint64_t v32 = v31 | (2 * v24);
    unint64_t v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33) {
      int8x8_t prime = (int8x8_t)v33;
    }
    else {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v24 = *((void *)a6 + 1);
    }

    if (*(void *)&prime <= v24)
    {
      if (*(void *)&prime >= v24) {
        goto LABEL_65;
      }
      unint64_t v40 = vcvtps_u32_f32((float)*((unint64_t *)a6 + 3) / *((float *)a6 + 8));
      if (v24 < 3 || (uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)v24), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        unint64_t v40 = std::__next_prime(v40);
      }

      else
      {
        uint64_t v42 = 1LL << -(char)__clz(v40 - 1);
        if (v40 >= 2) {
          unint64_t v40 = v42;
        }
      }

      if (*(void *)&prime <= v40) {
        int8x8_t prime = (int8x8_t)v40;
      }
      if (*(void *)&prime >= v24)
      {
        unint64_t v24 = *((void *)a6 + 1);
        goto LABEL_65;
      }

      if (!*(void *)&prime)
      {
        size_t v48 = *(void **)a6;
        *(void *)a6 = 0LL;
        if (v48) {
          operator delete(v48);
        }
        unint64_t v24 = 0LL;
        *((void *)a6 + 1) = 0LL;
        goto LABEL_65;
      }
    }

    if (*(void *)&prime >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    unint64_t v34 = operator new(8LL * *(void *)&prime);
    unint64_t v35 = *(void **)a6;
    *(void *)a6 = v34;
    if (v35) {
      operator delete(v35);
    }
    uint64_t v36 = 0LL;
    *((int8x8_t *)a6 + 1) = prime;
    do
      *(void *)(*(void *)a6 + 8 * v36++) = 0LL;
    while (*(void *)&prime != v36);
    uint64_t v37 = (void *)*v18;
    if (*v18)
    {
      unint64_t v38 = v37[1];
      uint8x8_t v39 = (uint8x8_t)vcnt_s8(prime);
      v39.i16[0] = vaddlv_u8(v39);
      if (v39.u32[0] > 1uLL)
      {
        if (v38 >= *(void *)&prime) {
          v38 %= *(void *)&prime;
        }
      }

      else
      {
        v38 &= *(void *)&prime - 1LL;
      }

      *(void *)(*(void *)a6 + 8 * v38) = v18;
      uint64_t v43 = (void *)*v37;
      if (*v37)
      {
        do
        {
          unint64_t v44 = v43[1];
          if (v39.u32[0] > 1uLL)
          {
            if (v44 >= *(void *)&prime) {
              v44 %= *(void *)&prime;
            }
          }

          else
          {
            v44 &= *(void *)&prime - 1LL;
          }

          if (v44 != v38)
          {
            if (!*(void *)(*(void *)a6 + 8 * v44))
            {
              *(void *)(*(void *)a6 + 8 * v44) = v37;
              goto LABEL_61;
            }

            *uint64_t v37 = *v43;
            *uint64_t v43 = **(void **)(*(void *)a6 + 8 * v44);
            **(void **)(*(void *)a6 + 8 * v44) = v43;
            uint64_t v43 = v37;
          }

          unint64_t v44 = v38;
LABEL_61:
          uint64_t v37 = v43;
          uint64_t v43 = (void *)*v43;
          unint64_t v38 = v44;
        }

        while (v43);
      }
    }

    unint64_t v24 = (unint64_t)prime;
LABEL_65:
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v24 <= v23) {
        v23 %= v24;
      }
    }

    else
    {
      unint64_t v23 = ((_DWORD)v24 - 1) & v23;
    }

- (void)_calculatePerSampleActiveShaders:(id)a3 withShaderProfilerResult:(id)a4 forWorkloadInfo:(id)a5
{
  id v8 = a3;
  id v199 = a4;
  id v190 = a5;
  v195 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ring buffer"]);
  LODWORD(a4) = [v9 unsignedIntValue];

  v196 = (void *)objc_claimAutoreleasedReturnValue([v190 mGPUTimelineInfoAtIndex:a4]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"limiter data"]);
  [v196 setDerivedCounters:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"limiter time stamps"]);
  [v196 setTimestamps:v11];

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v196 timestamps]);
  objc_msgSend(v196, "setNumPeriodicSamples:", objc_msgSend(v12, "length") >> 3);

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"limiter counter list"]);
  [v196 setDerivedCounterNames:v13];

  v191 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"shader timeline data"]);
  memset(v219, 0, sizeof(v219));
  int v220 = 1050253722;
  v189 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"shader timeline data ex"]);
  -[GTShaderProfilerHelper _updateShaderTimelineInfo:withShaderTimelineDataEx:forGPUTimelineInfo:withEncoderGlobalTraceIdToStateMirrorIdMapping:]( self,  "_updateShaderTimelineInfo:withShaderTimelineDataEx:forGPUTimelineInfo:withEncoderGlobalTraceIdToStateMirrorIdMapping:",  v191,  v189,  v196,  v219);
  std::vector<std::vector<DYGPUTimelinePipelineStateInfo>>::vector( &v217,  [v196 numPeriodicSamples]);
  id v14 = 0LL;
  unint64_t v15 = 0LL;
  *(_OWORD *)__p = 0u;
  __int128 v215 = 0u;
  float v216 = 1.0;
  uint64_t v16 = -1LL;
  while (1)
  {
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v199 drawCallInfoList]);
    BOOL v18 = v15 < (unint64_t)[v17 count];

    if (!v18) {
      break;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v199 drawCallInfoList]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:v15]);

    if ((id)v16 != [v20 encoderFunctionIndex])
    {
      uint64_t v16 = (uint64_t)[v20 encoderFunctionIndex];
      id v14 = 0LL;
    }

    id v21 = [v20 encoderFunctionIndex];
    uint64_t v22 = std::unordered_map<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>::find[abi:nn180100]( (uint64_t)__p[0],  (unint64_t)__p[1],  (unint64_t)v21);
    if (v22) {
      goto LABEL_79;
    }
    unint64_t v23 = (unint64_t)[v20 encoderFunctionIndex];
    unint64_t v24 = v23;
    uint64_t v212 = 0LL;
    __int128 v210 = 0u;
    __int128 v211 = 0u;
    *(_OWORD *)v209 = 0u;
    int v213 = 1050253722;
    unint64_t v25 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v26.i16[0] = vaddlv_u8(v26);
      if (v26.u32[0] > 1uLL)
      {
        unint64_t v5 = v23;
      }

      else
      {
        unint64_t v5 = ((unint64_t)__p[1] - 1) & v23;
      }

      uint64_t v27 = (void *)*((void *)__p[0] + v5);
      if (v27)
      {
        uint64_t v22 = (void *)*v27;
        if (*v27)
        {
          do
          {
            unint64_t v28 = v22[1];
            if (v28 == v23)
            {
              if (v22[2] == v23) {
                goto LABEL_77;
              }
            }

            else
            {
              if (v26.u32[0] > 1uLL)
              {
              }

              else
              {
                v28 &= (unint64_t)__p[1] - 1;
              }

              if (v28 != v5) {
                break;
              }
            }

            uint64_t v22 = (void *)*v22;
          }

          while (v22);
        }
      }
    }

    float v29 = operator new(0x58uLL);
    *(void *)&__int128 v202 = v29;
    *((void *)&v202 + 1) = &v215;
    void *v29 = 0LL;
    v29[1] = v24;
    v29[2] = v24;
    v29[3] = 0LL;
    v29[4] = 0LL;
    v29[5] = 0LL;
    *(_OWORD *)v209 = 0u;
    __int128 v210 = 0u;
    v29[6] = 0LL;
    v29[7] = 0LL;
    v29[8] = 0LL;
    v29[9] = 0LL;
    *((_DWORD *)v29 + 20) = 1050253722;
    LOBYTE(v203) = 1;
    float v30 = (float)(unint64_t)(*((void *)&v215 + 1) + 1LL);
    if (!v25 || (float)(v216 * (float)v25) < v30)
    {
      BOOL v31 = (v25 & (v25 - 1)) == 0;
      if (v25 < 3) {
        BOOL v31 = 0;
      }
      unint64_t v32 = (2 * v25) | !v31;
      unint64_t v33 = vcvtps_u32_f32(v30 / v216);
      if (v32 <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      else {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime == 1LL)
      {
        int8x8_t prime = (int8x8_t)2LL;
      }

      else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v25 = (unint64_t)__p[1];
      }

      if (*(void *)&prime <= v25)
      {
        if (*(void *)&prime < v25)
        {
          unint64_t v41 = vcvtps_u32_f32((float)*((unint64_t *)&v215 + 1) / v216);
          if (v25 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
          {
            unint64_t v41 = std::__next_prime(v41);
          }

          else
          {
            uint64_t v43 = 1LL << -(char)__clz(v41 - 1);
            if (v41 >= 2) {
              unint64_t v41 = v43;
            }
          }

          if (*(void *)&prime <= v41) {
            int8x8_t prime = (int8x8_t)v41;
          }
          if (*(void *)&prime >= v25)
          {
            unint64_t v25 = (unint64_t)__p[1];
          }

          else
          {
            if (prime) {
              goto LABEL_34;
            }
            size_t v49 = __p[0];
            __p[0] = 0LL;
            if (v49) {
              operator delete(v49);
            }
            unint64_t v25 = 0LL;
            __p[1] = 0LL;
          }
        }
      }

      else
      {
LABEL_34:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unint64_t v35 = operator new(8LL * *(void *)&prime);
        uint64_t v36 = __p[0];
        __p[0] = v35;
        if (v36) {
          operator delete(v36);
        }
        uint64_t v37 = 0LL;
        __p[1] = (void *)prime;
        do
          *((void *)__p[0] + v37++) = 0LL;
        while (*(void *)&prime != v37);
        unint64_t v38 = (void **)v215;
        if ((void)v215)
        {
          unint64_t v39 = *(void *)(v215 + 8);
          uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            if (v39 >= *(void *)&prime) {
              v39 %= *(void *)&prime;
            }
          }

          else
          {
            v39 &= *(void *)&prime - 1LL;
          }

          *((void *)__p[0] + v39) = &v215;
          for (unsigned int i = *v38; i; v39 = v45)
          {
            unint64_t v45 = i[1];
            if (v40.u32[0] > 1uLL)
            {
              if (v45 >= *(void *)&prime) {
                v45 %= *(void *)&prime;
              }
            }

            else
            {
              v45 &= *(void *)&prime - 1LL;
            }

            if (v45 != v39)
            {
              if (!*((void *)__p[0] + v45))
              {
                *((void *)__p[0] + v45) = v38;
                goto LABEL_59;
              }

              *unint64_t v38 = (void *)*i;
              *unsigned int i = **((void **)__p[0] + v45);
              **((void **)__p[0] + v45) = i;
              unsigned int i = v38;
            }

            unint64_t v45 = v39;
LABEL_59:
            unint64_t v38 = (void **)i;
            unsigned int i = (void *)*i;
          }
        }

        unint64_t v25 = (unint64_t)prime;
      }

      if ((v25 & (v25 - 1)) != 0)
      {
        if (v24 >= v25) {
          unint64_t v5 = v24 % v25;
        }
        else {
          unint64_t v5 = v24;
        }
      }

      else
      {
        unint64_t v5 = (v25 - 1) & v24;
      }
    }

    unsigned int v46 = (void *)*((void *)__p[0] + v5);
    if (v46)
    {
      *(void *)__int128 v202 = *v46;
      void *v46 = v202;
    }

    else
    {
      *(void *)__int128 v202 = v215;
      *(void *)&__int128 v215 = v202;
      *((void *)__p[0] + v5) = &v215;
      if (*(void *)v202)
      {
        unint64_t v47 = *(void *)(*(void *)v202 + 8LL);
        if ((v25 & (v25 - 1)) != 0)
        {
          if (v47 >= v25) {
            v47 %= v25;
          }
        }

        else
        {
          v47 &= v25 - 1;
        }

        *((void *)__p[0] + v47) = v202;
      }
    }

    uint64_t v22 = (void *)v202;
    *(void *)&__int128 v202 = 0LL;
    ++*((void *)&v215 + 1);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>>::~unique_ptr[abi:nn180100]((uint64_t)&v202);
LABEL_77:
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v210 + 8);
    if (v209[0])
    {
      v209[1] = v209[0];
      operator delete(v209[0]);
    }

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  int v7 = MetalPluginTarget(self->_metalPluginName);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"usc sampling address data"]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"usc sampling sample data"]);
  id v10 = (void *)v9;
  if (v8)
  {
    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
      id v12 = [v11 count];

      if (v12)
      {
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"frame index"]);
        id v14 = [v13 unsignedIntValue];

        unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"ring buffer"]);
        id v16 = [v15 unsignedIntValue];

        LODWORD(v15) = [v10 length];
        id v29 = v16;
        id v30 = v14;
        id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/uscSamplingSampleRaw.txt",  v14,  v16));
        unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v31 stringByDeletingLastPathComponent]);
        [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:0];

        id v19 = v10;
        id v20 = [v19 bytes];
        id v21 = v31;
        -[GTShaderProfilerHelper _saveSampleDataFromGPURawCounters:size:filename:]( self,  "_saveSampleDataFromGPURawCounters:size:filename:",  v20,  v15 >> 3,  [v21 UTF8String]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"usc sampling address mappings"]);
        if (g_runningInCI)
        {
          int v28 = v7;
          unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"In _preProcessStreamingUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu",  [v19 length],  objc_msgSend(v8, "length"),  objc_msgSend(v22, "count")));
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

          unint64_t v25 = __stdoutp;
          id v26 = v24;
          fprintf(v25, "#CI-INFO# %s\n", (const char *)[v26 UTF8String]);

          int v7 = v28;
        }

        LODWORD(v27) = v7;
        if (-[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:", v22)) {
          -[GTShaderProfilerHelper _preProcessStreamingUSCSampleData:result:withAddressMappings:sampleData:frameIndex:ringBufferIdx:targetIndex:]( self,  "_preProcessStreamingUSCSampleData:result:withAddressMappings:sampleData:frameIndex:ringBufferIdx:targetIndex:",  v32,  v6,  v22,  v19,  v30,  v29,  v27);
        }
        else {
          -[GTShaderProfilerHelper _preProcessStreamingUSCSampleData:result:withAddressData:sampleData:frameIndex:ringBufferIdx:targetIndex:]( self,  "_preProcessStreamingUSCSampleData:result:withAddressData:sampleData:frameIndex:ringBufferIdx:targetIndex:",  v32,  v6,  v8,  v19,  v30,  v29,  v27);
        }
      }
    }
  }
}

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressData:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v93 = v15;
  unsigned int v95 = v16;
  unint64_t v17 = (char *)[v93 bytes];
  LODWORD(a6) = [v93 length];
  unsigned int v18 = [v16 length];
  id v19 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressRaw.txt", v9));
  unint64_t v20 = a6 / 0x18uLL;
  -[GTShaderProfilerHelper _saveAddressList:size:filename:]( self,  "_saveAddressList:size:filename:",  v17,  v20,  [v19 UTF8String]);
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  int v108 = 1065353216;
  if (a6 >= 0x18)
  {
    unsigned int v21 = 0;
    uint64_t v91 = v18 >> 3;
    uint64_t v22 = v20 <= 1 ? 1LL : v20;
    unint64_t v23 = v17 + 4;
    uint64_t v24 = 0xFFFFFFFFLL;
    uint64_t v96 = v22;
    do
    {
      if (*v23 == -1)
      {
        unsigned int v25 = *(v23 - 1);
        unsigned int v26 = v25 >> 8;
        if (v25 >> 8 != 0xFFFFFF)
        {
          LODWORD(v100) = v25 >> 8;
          uint64_t v27 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)&v106,  v25 >> 8,  &v100);
          if ((_DWORD)v24 == -1) {
            uint64_t v24 = v26;
          }
          else {
            uint64_t v24 = v24;
          }
          *((_DWORD *)v27 + 5) = v26;
          unsigned int v21 = v26;
        }
      }

      v23 += 6;
      --v22;
    }

    while (v22);
    if (v21 >= v24)
    {
      unsigned int v87 = v21;
      unint64_t v103 = 0LL;
      uint64_t v104 = 0LL;
      unint64_t v105 = 0LL;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      float v102 = 0.3;
      id v89 = v14;
      id v90 = v13;
      id v88 = v19;
      int v28 = (void *)objc_claimAutoreleasedReturnValue([v14 drawCallInfoList]);
      id v29 = [v28 count];
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v100,  vcvtps_u32_f32((float)(unint64_t)(4LL * (void)v29) / v102));

      std::vector<DYMTLShaderProfilerProgramAddress>::reserve((void **)&v103, v20);
      uint64_t v30 = 0LL;
      unsigned int v31 = v24 - 1;
      __int128 v97 = 0u;
      __int128 v98 = 0u;
      float v99 = 1.0;
      uint64_t v32 = v96;
      while (1)
      {
        unint64_t v33 = &v17[24 * v30];
        if ((*(void *)v33 & *((void *)v33 + 1) & *((void *)v33 + 2)) != -1LL)
        {
          unint64_t v35 = (unsigned int *)(v33 + 4);
          uint64_t v34 = *((unsigned int *)v33 + 1);
          unint64_t v36 = *(unsigned int *)v33;
          if ((_DWORD)v34 != -1)
          {
            if ((v36 & 0xFC) == 0) {
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>( (uint64_t)&v100,  (v36 >> 8) | (v34 << 32),  (v36 >> 8) | (v34 << 32));
            }
            if (*((void *)&v101 + 1)) {
              unint64_t v37 = (DWORD2(v101) - 1);
            }
            else {
              unint64_t v37 = 0LL;
            }
            unint64_t v38 = v104;
            if ((unint64_t)v104 >= v105)
            {
              unint64_t v41 = v103;
              unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((v104 - v103) >> 3) + 1;
              if (v42 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              else {
                unint64_t v43 = v42;
              }
              if (v43) {
                unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v43);
              }
              else {
                uint64_t v44 = 0LL;
              }
              __int128 v45 = *(_OWORD *)v33;
              unsigned int v46 = (char *)(v43 + 8 * ((v38 - v41) >> 3));
              *((void *)v46 + 2) = *((void *)v33 + 2);
              *(_OWORD *)unsigned int v46 = v45;
              unint64_t v47 = v46;
              if (v38 == v41)
              {
                uint64_t v32 = v96;
              }

              else
              {
                uint64_t v32 = v96;
                do
                {
                  __int128 v48 = *(_OWORD *)(v38 - 24);
                  *((void *)v47 - 1) = *((void *)v38 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v38 -= 24;
                }

                while (v38 != v41);
                unint64_t v38 = v103;
              }

              uint8x8_t v40 = v46 + 24;
              unint64_t v103 = v47;
              unint64_t v105 = v43 + 24 * v44;
              if (v38) {
                operator delete(v38);
              }
            }

            else
            {
              __int128 v39 = *(_OWORD *)v33;
              *((void *)v104 + 2) = *((void *)v33 + 2);
              *(_OWORD *)unint64_t v38 = v39;
              uint8x8_t v40 = v38 + 24;
            }

            uint64_t v104 = v40;
            *((_DWORD *)v40 - 6) = *(v40 - 24) | (v31 << 8);
            *((_DWORD *)v40 - 5) = v37;
            *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)&v106,  *v35,  v35)
            + 5) = v31;
            size_t v49 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( &v106,  v31);
            if (v49)
            {
              unint64_t v50 = *((void *)&v106 + 1);
              unint64_t v51 = v49[1];
              uint8x8_t v52 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v106 + 8));
              v52.i16[0] = vaddlv_u8(v52);
              if (v52.u32[0] > 1uLL)
              {
                if (v51 >= *((void *)&v106 + 1)) {
                  v51 %= *((void *)&v106 + 1);
                }
              }

              else
              {
                v51 &= *((void *)&v106 + 1) - 1LL;
              }

              unint64_t v53 = *(uint64_t **)(v106 + 8 * v51);
              do
              {
                id v54 = v53;
                unint64_t v53 = (uint64_t *)*v53;
              }

              while (v53 != v49);
              unint64_t v55 = v54[1];
              if (v52.u32[0] > 1uLL)
              {
                if (v55 >= *((void *)&v106 + 1)) {
                  v55 %= *((void *)&v106 + 1);
                }
              }

              else
              {
                v55 &= *((void *)&v106 + 1) - 1LL;
              }

              if (v55 != v51)
              {
LABEL_61:
                if (!*v49) {
                  goto LABEL_62;
                }
                unint64_t v56 = *(void *)(*v49 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v56 >= *((void *)&v106 + 1)) {
                    v56 %= *((void *)&v106 + 1);
                  }
                }

                else
                {
                  v56 &= *((void *)&v106 + 1) - 1LL;
                }

                if (v56 != v51) {
LABEL_62:
                }
                  *(void *)(v106 + 8 * v51) = 0LL;
              }

              uint64_t v57 = *v49;
              if (*v49)
              {
                unint64_t v58 = *(void *)(v57 + 8);
                if (v52.u32[0] > 1uLL)
                {
                  if (v58 >= v50) {
                    v58 %= v50;
                  }
                }

                else
                {
                  v58 &= v50 - 1;
                }

                if (v58 != v51)
                {
                  *(void *)(v106 + 8 * v58) = v54;
                  uint64_t v57 = *v49;
                }
              }

              uint64_t *v54 = v57;
              --*((void *)&v107 + 1);
              operator delete(v49);
            }

            unint64_t v59 = *((void *)&v97 + 1);
            if (*((void *)&v97 + 1))
            {
              uint8x8_t v60 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v97 + 8));
              v60.i16[0] = vaddlv_u8(v60);
              if (v60.u32[0] > 1uLL)
              {
                unint64_t v37 = v31;
              }

              else
              {
                unint64_t v37 = (DWORD2(v97) - 1) & v31;
              }

              uint64_t v61 = *(void ***)(v97 + 8 * v37);
              if (v61)
              {
                unsigned int v62 = *v61;
                if (*v61)
                {
                  do
                  {
                    unint64_t v63 = v62[1];
                    if (v63 == v31)
                    {
                      if (*((_DWORD *)v62 + 4) == v31) {
                        goto LABEL_109;
                      }
                    }

                    else
                    {
                      if (v60.u32[0] > 1uLL)
                      {
                        if (v63 >= *((void *)&v97 + 1)) {
                          v63 %= *((void *)&v97 + 1);
                        }
                      }

                      else
                      {
                        v63 &= *((void *)&v97 + 1) - 1LL;
                      }

                      if (v63 != v37) {
                        break;
                      }
                    }

                    unsigned int v62 = (void *)*v62;
                  }

                  while (v62);
                }
              }
            }

            unsigned int v62 = operator new(0x30uLL);
            void *v62 = 0LL;
            v62[1] = v31;
            *((_DWORD *)v62 + 4) = v31;
            v62[4] = 0LL;
            v62[5] = 0LL;
            v62[3] = 0LL;
            float v64 = (float)(unint64_t)(*((void *)&v98 + 1) + 1LL);
            if (!v59 || (float)(v99 * (float)v59) < v64)
            {
              BOOL v65 = (v59 & (v59 - 1)) != 0;
              if (v59 < 3) {
                BOOL v65 = 1LL;
              }
              unint64_t v66 = v65 | (2 * v59);
              unint64_t v67 = vcvtps_u32_f32(v64 / v99);
              if (v66 <= v67) {
                size_t v68 = v67;
              }
              else {
                size_t v68 = v66;
              }
              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v97,  v68);
              unint64_t v59 = *((void *)&v97 + 1);
              if ((*((void *)&v97 + 1) & (*((void *)&v97 + 1) - 1LL)) != 0)
              {
                else {
                  unint64_t v37 = v31;
                }
              }

              else
              {
                unint64_t v37 = (DWORD2(v97) - 1) & v31;
              }
            }

            uint64_t v69 = v97;
            unsigned int v70 = *(void **)(v97 + 8 * v37);
            if (v70)
            {
              void *v62 = *v70;
              goto LABEL_107;
            }

            void *v62 = v98;
            *(void *)&__int128 v98 = v62;
            *(void *)(v69 + 8 * v37) = &v98;
            if (*v62)
            {
              unint64_t v71 = *(void *)(*v62 + 8LL);
              if ((v59 & (v59 - 1)) != 0)
              {
                if (v71 >= v59) {
                  v71 %= v59;
                }
              }

              else
              {
                v71 &= v59 - 1;
              }

              unsigned int v70 = (void *)(v97 + 8 * v71);
LABEL_107:
              *unsigned int v70 = v62;
            }

            ++*((void *)&v98 + 1);
LABEL_109:
            unsigned int v72 = v104 - 24;
            unsigned int v74 = (char **)v62[4];
            unint64_t v73 = v62[5];
            if ((unint64_t)v74 >= v73)
            {
              uint64_t v76 = v62[3];
              uint64_t v77 = ((uint64_t)v74 - v76) >> 3;
              uint64_t v78 = v73 - v76;
              uint64_t v79 = v78 >> 2;
              else {
                unint64_t v80 = v79;
              }
              if (v80) {
                unint64_t v80 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v80);
              }
              else {
                uint64_t v81 = 0LL;
              }
              uint64_t v82 = (char **)(v80 + 8 * v77);
              void *v82 = v72;
              v75 = v82 + 1;
              unsigned int v84 = (char *)v62[3];
              unint64_t v83 = (char *)v62[4];
              if (v83 != v84)
              {
                do
                {
                  unint64_t v85 = (char *)*((void *)v83 - 1);
                  v83 -= 8;
                  *--uint64_t v82 = v85;
                }

                while (v83 != v84);
                unint64_t v83 = (char *)v62[3];
              }

              v62[3] = v82;
              v62[4] = v75;
              v62[5] = v80 + 8 * v81;
              if (v83) {
                operator delete(v83);
              }
            }

            else
            {
              unint64_t *v74 = v72;
              v75 = v74 + 1;
            }

            v62[4] = v75;
            goto LABEL_126;
          }
        }

- (void)_preProcessStreamingUSCSampleData:(id)a3 result:(id)a4 withAddressMappings:(id)a5 sampleData:(id)a6 frameIndex:(unsigned int)a7 ringBufferIdx:(unsigned int)a8 targetIndex:(int)a9
{
  uint64_t v9 = *(void *)&a7;
  id v80 = a3;
  id v77 = a4;
  id v81 = a5;
  id v78 = a6;
  unsigned int v75 = [v78 length];
  id v79 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/uscSamplingAddressMappings.txt", v9));
  -[GTShaderProfilerHelper _saveAddressMappings:filename:]( self,  "_saveAddressMappings:filename:",  v81,  [v79 UTF8String]);
  memset(v103, 0, sizeof(v103));
  int v104 = 1065353216;
  __p = 0LL;
  __int128 v101 = 0LL;
  unint64_t v102 = 0LL;
  std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (void)[v81 count]);
  memset(v98, 0, sizeof(v98));
  int v99 = 1065353216;
  memset(v96, 0, sizeof(v96));
  int v97 = 1065353216;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  id obj = v81;
  id v13 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v13)
  {
    uint64_t v83 = *(void *)v93;
    unsigned int v87 = -1;
    unsigned int v88 = 0;
    do
    {
      id v85 = v13;
      for (unsigned int i = 0LL; i != v85; unsigned int i = (char *)i + 1)
      {
        if (*(void *)v93 != v83) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v92 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"encID"]);
        unsigned int v17 = [v16 unsignedIntValue];

        unsigned int v91 = v17;
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"drawCallIndex"]);
        unsigned int v89 = [v18 unsignedIntValue];

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"mappedAddress"]);
        unint64_t v20 = (char *)[v19 unsignedLongLongValue];

        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"mappedSize"]);
        id v22 = [v21 unsignedLongLongValue];

        id v23 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"binaryUniqueId"]);
        unint64_t v24 = strtoull((const char *)[v23 UTF8String], 0, 16);

        unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"encIndex"]);
        unsigned int v26 = [v25 unsignedIntValue];

        unsigned int v90 = v26;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"type"]);
        unsigned __int8 v28 = -[GTShaderProfilerHelper _getLegacyProgramType:](self, "_getLegacyProgramType:", v27);

        unint64_t v86 = v24;
        int v29 = (v17 << 8) | 0x62;
        uint64_t v30 = &v20[(void)v22];
        unsigned int v31 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          unint64_t v33 = (char *)__p;
          unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)__p) >> 3);
          unint64_t v35 = v34 + 1;
          if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
            goto LABEL_70;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36) {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v36);
          }
          else {
            uint64_t v37 = 0LL;
          }
          unint64_t v38 = (int *)(v36 + 24 * v34);
          *unint64_t v38 = v29;
          v38[1] = v89;
          *((void *)v38 + 1) = v20;
          *((void *)v38 + 2) = v30;
          __int128 v39 = (char *)v38;
          if (v31 != v33)
          {
            do
            {
              __int128 v40 = *(_OWORD *)(v31 - 24);
              *((void *)v39 - 1) = *((void *)v31 - 1);
              *(_OWORD *)(v39 - 24) = v40;
              v39 -= 24;
              v31 -= 24;
            }

            while (v31 != v33);
            unsigned int v31 = (char *)__p;
          }

          uint64_t v32 = v38 + 6;
          __p = v39;
          __int128 v101 = v38 + 6;
          unint64_t v102 = v36 + 24 * v37;
          if (v31) {
            operator delete(v31);
          }
        }

        else
        {
          *__int128 v101 = v29;
          *((_DWORD *)v31 + 1) = v89;
          uint64_t v32 = (int *)(v31 + 24);
          *((void *)v31 + 1) = v20;
          *((void *)v31 + 2) = v30;
        }

        __int128 v101 = v32;
        unint64_t v41 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)v96,  v26,  &v90);
        unint64_t v42 = v41;
        unint64_t v43 = v32 - 6;
        __int128 v45 = (int **)v41[4];
        unint64_t v44 = v41[5];
        if ((unint64_t)v45 >= v44)
        {
          uint64_t v47 = v41[3];
          uint64_t v48 = ((uint64_t)v45 - v47) >> 3;
          uint64_t v49 = v44 - v47;
          uint64_t v50 = v49 >> 2;
          else {
            unint64_t v51 = v50;
          }
          if (v51) {
            unint64_t v51 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v51);
          }
          else {
            uint64_t v52 = 0LL;
          }
          unint64_t v53 = (int **)(v51 + 8 * v48);
          uint64_t *v53 = v43;
          unsigned int v46 = v53 + 1;
          unint64_t v55 = (char *)v42[3];
          id v54 = (char *)v42[4];
          if (v54 != v55)
          {
            do
            {
              unint64_t v56 = (int *)*((void *)v54 - 1);
              v54 -= 8;
              *--unint64_t v53 = v56;
            }

            while (v54 != v55);
            id v54 = (char *)v42[3];
          }

          v42[3] = v53;
          v42[4] = v46;
          v42[5] = v51 + 8 * v52;
          if (v54) {
            operator delete(v54);
          }
        }

        else
        {
          void *v45 = v43;
          unsigned int v46 = v45 + 1;
        }

        int v57 = (v17 << 8) | 0x63;
        int v58 = v28;
        v42[4] = v46;
        unint64_t v59 = (char *)v101;
        if ((unint64_t)v101 >= v102)
        {
          uint64_t v61 = (char *)__p;
          unint64_t v62 = 0xAAAAAAAAAAAAAAABLL * (((char *)v101 - (_BYTE *)__p) >> 3);
          unint64_t v63 = v62 + 1;
          if (v62 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_70:
          }
            abort();
          else {
            unint64_t v64 = v63;
          }
          if (v64) {
            unint64_t v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v64);
          }
          else {
            uint64_t v65 = 0LL;
          }
          unint64_t v66 = (int *)(v64 + 24 * v62);
          int *v66 = v57;
          v66[1] = v89;
          *((void *)v66 + 1) = v86;
          v66[4] = v58;
          unint64_t v67 = (char *)v66;
          if (v59 != v61)
          {
            do
            {
              __int128 v68 = *(_OWORD *)(v59 - 24);
              *((void *)v67 - 1) = *((void *)v59 - 1);
              *(_OWORD *)(v67 - 24) = v68;
              v67 -= 24;
              v59 -= 24;
            }

            while (v59 != v61);
            unint64_t v59 = (char *)__p;
          }

          uint8x8_t v60 = v66 + 6;
          __p = v67;
          unint64_t v102 = v64 + 24 * v65;
          if (v59) {
            operator delete(v59);
          }
        }

        else
        {
          *__int128 v101 = v57;
          *((_DWORD *)v59 + 1) = v89;
          *((void *)v59 + 1) = v86;
          uint8x8_t v60 = (int *)(v59 + 24);
          *((_DWORD *)v59 + 4) = v28;
        }

        __int128 v101 = v60;
        if (v26 >= v87) {
          unsigned int v69 = v87;
        }
        else {
          unsigned int v69 = v26;
        }
        unsigned int v70 = v88;
        if (v26 > v88) {
          unsigned int v70 = v26;
        }
        unsigned int v87 = v69;
        unsigned int v88 = v70;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)v103,  v17,  &v91)
        + 5) = v26;
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v98,  v26,  v26);
      }

      id v13 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
    }

    while (v13);

    unsigned int v71 = v87;
    unsigned int v91 = v87;
    do
    {
      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v98,  v71)) {
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)v103,  v71,  &v91)
      }
        + 5) = v71;
      unsigned int v91 = ++v71;
    }

    while (v71 <= v88);
  }

  else
  {

    unsigned int v87 = -1;
    unsigned int v88 = 0;
  }

  shaderProfilerHelper = self->_shaderProfilerHelper;
  id v73 = v78;
  LODWORD(v74) = v88;
  -[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]( shaderProfilerHelper,  "evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:w ithMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:",  [v73 bytes],  v75 >> 3,  v96,  a9,  a8,  v87,  v74,  v103,  v80);
  std::__hash_table<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<GTCoalescedEncoderIndexInfo>>>>::~__hash_table((uint64_t)v96);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v98);
  if (__p) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v103);
}

- (id)_processHarvestedBinaryData:(id)a3 forStreamedData:(id)a4
{
  id v6 = a3;
  id v48 = a4;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"draw call info"]);
  uint64_t v49 = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_payload,  "objectForKeyedSubscript:",  @"perCommandBufferEncoderCount"));
  objc_msgSend(v6, "setCommandBufferCount:", objc_msgSend(v8, "count"));

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v49->_payload,  "objectForKeyedSubscript:",  @"perCommandBufferEncoderCount"));
  [v6 setPerCommandBufferEncoderCount:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v49->_payload,  "objectForKeyedSubscript:",  @"encoderIndexToLabel"));
  [v6 setEncoderIndexToLabelMap:v10];

  objc_storeStrong((id *)&v49->_shaderInfoResult, a4);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
  uint64_t v12 = 0LL;
  id v13 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v52;
    do
    {
      for (unsigned int i = 0LL; i != v13; unsigned int i = (char *)i + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v51 + 1) + 8 * (void)i) pipelineStateId] == (id)-1) {
          ++v12;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }

    while (v13);
  }

  id v16 = (char *)[v7 count];
  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
  LOBYTE(v16) = &v16[v12] == [v17 count];

  if ((v16 & 1) != 0)
  {
    unsigned int v18 = 0;
    memset(v55, 0, sizeof(v55));
    int v56 = 1065353216;
    while ((unint64_t)[v7 count] > v18)
    {
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v18]);
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
      id v22 = (id *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v18]);

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"vertex shader key"]);
      id v24 = v22[1];
      v22[1] = (id)v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"fragment shader key"]);
      id v26 = v22[2];
      v22[2] = (id)v25;

      uint64_t v27 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"compute kernel key"]);
      id v28 = v22[3];
      v22[3] = (id)v27;

      int v29 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"mutiple binary keys"]);
      uint64_t v30 = v29;
      if (v29)
      {
        id v31 = [v29 copy];
        objc_storeStrong(v22 + 4, v31);
      }

      else
      {
        id v32 = &__NSArray0__struct;
        id v31 = v22[4];
        v22[4] = &__NSArray0__struct;
      }

      if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v55,  v18))
      {
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v6 programPipelineInfoList]);
        unint64_t v34 = (id *)objc_claimAutoreleasedReturnValue( objc_msgSend( v33,  "objectAtIndexedSubscript:",  objc_msgSend(v22, "pipelineStateIndex")));

        objc_storeStrong(v34 + 1, v22[1]);
        objc_storeStrong(v34 + 2, v22[2]);
        objc_storeStrong(v34 + 3, v22[3]);
        objc_storeStrong(v34 + 4, v22[4]);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v55,  v18,  v18);
      }

      ++v18;
    }

    uint64_t v35 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v19);
    unint64_t v36 = (void *)v6[30];
    v6[30] = v35;

    uint64_t v38 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v37);
    __int128 v39 = (void *)v6[31];
    v6[31] = v38;

    uint64_t v41 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v40);
    unint64_t v42 = (void *)v6[32];
    v6[32] = v41;

    uint64_t v44 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v43);
    __int128 v45 = (void *)v6[33];
    v6[33] = v44;

    uint64_t v46 = MetalPluginTarget(v49->_metalPluginName);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke;
    v50[3] = &unk_58E3F8;
    v50[4] = v49;
    -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:]( v49,  "_visitAllShaderInfosInResult:usingBlock:",  v6,  v50);
    if ((*((_BYTE *)v49->_options + 16) & 0x40) != 0) {
      -[GTShaderProfilerHelper _saveShaderBinariesWith:targetIndex:]( v49,  "_saveShaderBinariesWith:targetIndex:",  v6,  v46);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v55);
  }

  return 0LL;
}

- (void)_addBlitTimesToEffectiveKickTimes:(id)a3
{
  id v24 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v24 blitEncoderTimeInfo]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Blit Encoder Kick Times Nsec"]);

  if (v4)
  {
    unint64_t v5 = (char *)[v4 count];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v24 blitEncoderTimeInfo]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Blit Encoder Indices"]);

    uint64_t v25 = v7;
    if (v5 == [v7 count])
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue([v24 effectiveKickTimes]);
      id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v31;
        double v11 = 0.0;
        do
        {
          for (unsigned int i = 0LL; i != v9; unsigned int i = (char *)i + 1)
          {
            if (*(void *)v31 != v10) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            id v14 = v13;
            id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v27;
              do
              {
                for (unint64_t j = 0LL; j != v15; unint64_t j = (char *)j + 1)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) doubleValue];
                  double v11 = v11 + v18;
                }

                id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }

              while (v15);
            }
          }

          id v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }

        while (v9);
      }

      else
      {
        double v11 = 0.0;
      }

      [v24 setShaderProfilingTime:v11];
      if (v5)
      {
        for (k = 0LL; k != v5; ++k)
        {
          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:k]);
          unsigned int v21 = [v20 unsignedIntValue];

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v21]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:k]);
          [v22 setArray:v23];
        }
      }
    }
  }
}

- (id)_createPerCounterCommandData:(id)a3 withPerCommandData:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  id v6 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  id v7 = [v19 count];
  for (unint64_t i = 0; i < (unint64_t)[v5 count]; ++i)
  {
    id v9 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v7);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v10 = v19;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        id v13 = 0LL;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) objectAtIndexedSubscript:i]);
          -[NSMutableArray addObject:](v9, "addObject:", v14);

          id v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v11);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:i]);
    id v16 = -[NSMutableArray copy](v9, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v16, v15);
  }

  id v17 = -[NSMutableDictionary copy](v6, "copy");

  return v17;
}

- (id)_targetType
{
  *(void *)id v10 = 0x1A00000006LL;
  int v2 = sysctl(v10, 2u, 0LL, &v9, 0LL, 0LL);
  id v3 = 0LL;
  if (v2 != -1 && v9 != 0)
  {
    id v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    int v6 = sysctl(v10, 2u, v5, &v9, 0LL, 0LL);
    id v3 = 0LL;
    if (!v6) {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    }
  }

  return v3;
}

- (id)_productType
{
  *(void *)id v10 = 0x1B00000006LL;
  int v2 = sysctl(v10, 2u, 0LL, &v9, 0LL, 0LL);
  id v3 = 0LL;
  if (v2 != -1 && v9 != 0)
  {
    id v5 = (char *)&v8 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    int v6 = sysctl(v10, 2u, v5, &v9, 0LL, 0LL);
    id v3 = 0LL;
    if (!v6) {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
    }
  }

  return v3;
}

- (id)_version
{
  int v2 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v2, "objectForKey:", @"ProductVersion"));

  return v3;
}

- (id)_build
{
  int v2 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v2, "objectForKey:", @"ProductBuildVersion"));

  return v3;
}

- (void)_processDerivedEncoderCounterData:(id)a3 forDerivedEncoderData:(id)a4 withEffectivePerDrawKickTimes:(id)a5 withShaderInfo:(id)a6
{
  id v10 = a4;
  id v45 = a5;
  id v46 = a6;
  uint64_t v47 = v10;
  [a3 setDerivedCountersData:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"]);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"counters"]);

  payload = self->_payload;
  id v48 = self;
  if (payload) {
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( payload,  "objectForKeyedSubscript:",  @"MetalPluginName"));
  }
  else {
    uint64_t v44 = 0LL;
  }
  uint64_t v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v44,  @"MetalPluginName");
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"AverageSamples"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _createPerCounterCommandData:withPerCommandData:]( self,  "_createPerCounterCommandData:withPerCommandData:",  v43,  v14));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v15,  @"PerCounterEncoderCallData");

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DerivedCounterConfigurationVariables"]);
  id v17 = [v16 mutableCopy];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v17,  @"ConfigurationVariables");

  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _version](self, "_version"));
  if (v41)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v49,  "objectForKeyedSubscript:",  @"ConfigurationVariables"));
    [v18 setObject:v41 forKeyedSubscript:@"Version"];
  }

  unint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _build](self, "_build"));
  if (v42)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v49,  "objectForKeyedSubscript:",  @"ConfigurationVariables"));
    [v19 setObject:v42 forKeyedSubscript:@"Build"];
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _targetType](self, "_targetType"));
  __int128 v39 = (void *)v20;
  if (v20) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v20, @"Target");
  }
  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[GTShaderProfilerHelper _productType](self, "_productType"));
  uint64_t v40 = (void *)v21;
  if (v21) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v21, @"Product");
  }
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"DerivedCounterInfo"]);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"DerivedCounterDictionary"]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"DerivedCounters"]);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v24 count]));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue([v24 allKeys]);
  id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (unint64_t i = 0LL; i != v27; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v30]);
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:@"counters"]);
        [v25 setObject:v32 forKeyedSubscript:v30];
      }

      id v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }

    while (v27);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v25,  @"DerivedCounterDependentCounters");
  if (v45) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v49,  "setObject:forKeyedSubscript:",  v45,  @"effectivePerDrawKickTimes");
  }
  if (v46) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v46, @"shaderInfo");
  }
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v49,  1LL,  0LL));
  if ([v48->_options->var0 length])
  {
    unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v48->_options->var0));
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v48->_options->var1 lastPathComponent]);
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stringByDeletingPathExtension]);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 stringByAppendingPathExtension:@"json"]);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v37,  0LL,  v34));
    [v33 writeToURL:v38 atomically:0];
  }

  else
  {
    unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCounters.json"));
    [v33 writeToURL:v34 atomically:0];
  }
}

- (void)_processBatchIdCounterData:(id)a3
{
  id v79 = a3;
  if (g_runningInCI)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Got %lu partial results",  [v79 count]));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    int v6 = __stdoutp;
    id v7 = v5;
    fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);
  }

  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_payload,  "objectForKeyedSubscript:",  @"activePerEncoderDrawCallCount"));
  unint64_t v8 = (unint64_t)[v83 count];
  unint64_t v9 = v8;
  id v78 = self;
  if (v8)
  {
    if (v8 >> 61) {
      abort();
    }
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v8);
    bzero(__p, 8 * v9);
    unint64_t v10 = 0LL;
    id v11 = 0LL;
    do
    {
      *((void *)__p + (void)v11) = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v83 objectAtIndexedSubscript:v11]);
      v10 += [v12 unsignedIntValue];

      ++v11;
    }

    while ((char *)v9 != v11);
  }

  else
  {
    __p = 0LL;
    unint64_t v10 = 0LL;
  }

  if (g_runningInCI)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Got %lu draw calls in %lu encoders",  v10,  v9));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    id v15 = __stdoutp;
    id v16 = v14;
    fprintf(v15, "#CI-INFO# %s\n", (const char *)[v16 UTF8String]);
  }

  id v81 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v9);
  id v80 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v9);
  __int128 v93 = 0LL;
  __int128 v94 = 0LL;
  __int128 v95 = 0LL;
  if (v10)
  {
    if (v10 >> 61) {
      abort();
    }
    __int128 v93 = (char *)operator new(8 * v10);
    __int128 v95 = &v93[8 * v10];
    bzero(v93, 8 * v10);
    __int128 v94 = (id *)v95;
    unsigned int v90 = (void **)operator new(8 * v10);
    __int128 v92 = &v90[v10];
    bzero(v90, 8 * v10);
    unsigned int v91 = v92;
  }

  else
  {
    unsigned int v90 = 0LL;
    unsigned int v91 = 0LL;
    __int128 v92 = 0LL;
  }

  id v82 = v79;
  unint64_t v17 = 0LL;
  unint64_t v86 = 0LL;
  while (v17 < (unint64_t)[v82 count])
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndexedSubscript:v17]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"]);
    unsigned int v84 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"counters"]);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"derivedCounterDataForBottleneckAnalysis"]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"AverageSamples"]);

    -[NSMutableArray setObject:atIndexedSubscript:](v81, "setObject:atIndexedSubscript:", v21, v17);
    unsigned int v87 = v21;
    if (v17)
    {
      if (([v84 isEqualToArray:v86] & 1) == 0)
      {
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Batch counter list has changed between batches from %@ to %@",  v86,  v84));
        __int128 v23 = __stdoutp;
        int v24 = g_runningInCI;
        id v88 = v22;
        uint64_t v25 = (const char *)[v88 UTF8String];
        id v26 = "#CI_ERROR# ";
        if (!v24) {
          id v26 = "";
        }
        fprintf(v23, "%s%s %u: %s\n", v26, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2185, v25);
        id v89 = v88;
        GTMTLReplay_handleError( 101,  (uint64_t)[v89 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm",  (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]",  2185,  1);
        goto LABEL_38;
      }
    }

    else
    {
      id v27 = v84;

      unint64_t v86 = v27;
    }

    id v89 = (id)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"BatchInfos"]);
    -[NSMutableArray setObject:atIndexedSubscript:](v80, "setObject:atIndexedSubscript:");
    if ([v21 count] == (id)v9 && objc_msgSend(v89, "count") == (id)v9)
    {
      if (v9)
      {
        for (unint64_t i = 0LL; i != (char *)v9; ++i)
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v89 objectAtIndexedSubscript:i]);
          unsigned int v30 = [v29 unsignedIntValue];

          if (v30 != -1)
          {
            uint64_t v31 = v30;
            unint64_t v32 = *((void *)__p + (void)i) + v30;
            if (v32 >= v10)
            {
              __int128 v33 = v18;
              unint64_t v34 = v9;
              uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v83 objectAtIndexedSubscript:i]);
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"drawId %lu > numDraws %lu, drawIndexWithinEncoder %lu (max %d)",  v32,  v10,  v31,  [v35 unsignedIntValue]));

              uint64_t v37 = __stdoutp;
              int v38 = g_runningInCI;
              id v39 = v36;
              uint64_t v40 = (const char *)[v39 UTF8String];
              uint64_t v41 = "#CI_ERROR# ";
              if (!v38) {
                uint64_t v41 = "";
              }
              fprintf(v37, "%s%s %u: %s\n", v41, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2208, v40);
              id v42 = v39;
              GTMTLReplay_handleError( 101,  (uint64_t)[v42 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm",  (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]",  2208,  1);

              unint64_t v32 = v10 - 1;
              unint64_t v9 = v34;
              double v18 = v33;
            }

            uint64_t v21 = v87;
            uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17));
            uint64_t v44 = *(void **)&v93[8 * v32];
            *(void *)&v93[8 * v32] = v43;

            id v45 = (void *)objc_claimAutoreleasedReturnValue([v87 objectAtIndexedSubscript:i]);
            id v46 = v90[v32];
            v90[v32] = v45;
          }
        }
      }

      char v47 = 1;
      goto LABEL_39;
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Batch has invalid encoder count, encoderCount %lu, averageSamplesByEncoder.count %lu, batchInfos.count %lu",  v9,  [v21 count],  objc_msgSend(v89, "count")));
    uint64_t v49 = __stdoutp;
    int v50 = g_runningInCI;
    id v51 = v48;
    __int128 v52 = (const char *)[v51 UTF8String];
    __int128 v53 = "#CI_ERROR# ";
    if (!v50) {
      __int128 v53 = "";
    }
    fprintf(v49, "%s%s %u: %s\n", v53, "-[GTShaderProfilerHelper _processBatchIdCounterData:]", 2194, v52);
    id v54 = v51;
    GTMTLReplay_handleError( 101,  (uint64_t)[v54 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm",  (uint64_t)"-[GTShaderProfilerHelper _processBatchIdCounterData:]",  2194,  1);

LABEL_38:
    char v47 = 0;
    uint64_t v21 = v87;
LABEL_39:

    ++v17;
    if ((v47 & 1) == 0) {
      goto LABEL_59;
    }
  }

  unint64_t v55 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v10);
  int v56 = (id *)v93;
  if (v93 != (char *)v94)
  {
    do
    {
      int v57 = (_UNKNOWN **)*v56;
      if (v57) {
        int v58 = v57;
      }
      else {
        int v58 = &off_5A07A8;
      }
      -[NSMutableArray addObject:](v55, "addObject:", v58);

      ++v56;
    }

    while (v56 != v94);
  }

  unint64_t v59 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v86 count]);
  for (unint64_t j = 0; j < (unint64_t)[v86 count]; ++j)
  {
    uint64_t v61 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v10);
    if (v10)
    {
      for (uint64_t k = 0LL; k != v10; ++k)
      {
        unint64_t v63 = v90[k];
        unint64_t v64 = v63;
        if (v63)
        {
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v63 objectAtIndexedSubscript:j]);
          -[NSMutableArray addObject:](v61, "addObject:", v65);
        }

        else
        {
          -[NSMutableArray addObject:](v61, "addObject:", &off_5A07C0);
        }
      }
    }

    unint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v86 objectAtIndexedSubscript:j]);
    id v67 = -[NSMutableArray copy](v61, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v67, v66);
  }

  __int128 v68 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v78->_payload,  "objectForKeyedSubscript:",  @"MetalPluginName"));
  v100[0] = v68;
  v99[0] = @"MetalPluginName";
  v99[1] = @"PerCounterDrawCallData";
  id v69 = -[NSMutableDictionary copy](v59, "copy");
  v100[1] = v69;
  v99[2] = @"intermediate";
  v97[0] = @"activePerEncoderDrawCount";
  v97[1] = @"drawToBatchId";
  v98[0] = v83;
  v98[1] = v55;
  v97[2] = @"batchInfoList";
  v97[3] = @"rawBatchResults";
  v98[2] = v80;
  v98[3] = v81;
  v97[4] = @"counters";
  void v98[4] = v86;
  unsigned int v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  5LL));
  v100[2] = v70;
  unsigned int v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v100,  v99,  3LL));

  unsigned int v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v71,  1LL,  0LL));
  if ([v78->_options->var0 length])
  {
    id v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v78->_options->var0));
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v78->_options->var1 lastPathComponent]);
    unsigned int v75 = (void *)objc_claimAutoreleasedReturnValue([v74 stringByDeletingPathExtension]);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v75 stringByAppendingPathExtension:@"json"]);
    id v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v76,  0LL,  v73));
    [v72 writeToURL:v77 atomically:0];
  }

  else
  {
    id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/derivedCountersByDraw.json"));
    [v72 writeToURL:v73 atomically:0];
  }

LABEL_59:
  uint64_t v96 = &v90;
  std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v96);
  unsigned int v90 = (void **)&v93;
  std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>::__destroy_vector::operator()[abi:nn180100](&v90);

  if (__p) {
    operator delete(__p);
  }
}

- (DebugInfo)_getDebugInfoForBinary:(SEL)a3 withTextSegment:(id)a4 forTargetIndex:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v195 = v9;
  if (![v9 length]
    || (id v11 = v9,
        MachOInfo::MachOInfo((MachOInfo *)&v210, (unsigned __int8 *)[v11 bytes]),
        !v211))
  {
    retstr->var6 = 0;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var2.var0 = 0u;
    goto LABEL_215;
  }

  v189 = self;
  id v12 = v11;
  id v13 = v10;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var6 = 0;
  id v192 = v12;
  if (!v12) {
    goto LABEL_214;
  }
  p_var1 = &retstr->var1;
  id v194 = retstr;
  if (![v12 length]) {
    goto LABEL_214;
  }
  id v182 = v10;
  id v183 = v13;
  id v185 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v12));
  id v14 = (char *)[v185 bytes];
  bzero(&v14[v210], v211);
  id v188 = v185;
  id v15 = (char *)[v188 bytes];
  bzero(&v15[v212], v213);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unint64_t v17 = NSTemporaryDirectory();
  double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([&stru_591D98 stringByAppendingString:@"XXXXXX"]);
  uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v19]);

  CFStringGetFileSystemRepresentation(v20, buffer, 1024LL);
  int v21 = mkstemp(buffer);
  if (v21 == -1)
  {
    v184 = 0LL;
  }

  else
  {
    close(v21);
    id v22 = [v16 stringWithFileSystemRepresentation:buffer length:strlen(buffer)];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ([v16 removeItemAtPath:v23 error:0]) {
      v184 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v23,  0LL));
    }
    else {
      v184 = 0LL;
    }
  }

  int v24 = v184;
  id v25 = v184;
  v233[0] = off_58E6A8;
  v233[1] = v25;
  v234 = (lldb::SBDebugger *)v233;
  v235[0] = off_58E6A8;
  v235[3] = v235;
  id v26 = v25;
  v235[1] = v26;
  id v27 = v234;
  if (v234 == (lldb::SBDebugger *)v233)
  {
    uint64_t v28 = 4LL;
    id v27 = (lldb::SBDebugger *)v233;
    goto LABEL_17;
  }

  if (v234)
  {
    uint64_t v28 = 5LL;
LABEL_17:
    id v27 = (lldb::SBDebugger *)(*(uint64_t (**)(void))(*(void *)v27 + 8 * v28))();
  }

  lldb::SBDebugger::Create(v27);
  if ((lldb::SBDebugger::IsValid((lldb::SBDebugger *)v230) & 1) == 0) {
    goto LABEL_212;
  }
  id v29 = objc_claimAutoreleasedReturnValue([v26 path]);
  lldb::SBDebugger::CreateTargetWithFileAndArch( v229,  (lldb::SBDebugger *)v230,  (const char *)[v29 UTF8String],  "16777235-0");

  if ((lldb::SBTarget::IsValid((lldb::SBTarget *)v229) & 1) == 0) {
    goto LABEL_211;
  }
  id v30 = objc_claimAutoreleasedReturnValue([v26 path]);
  lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v228, (const char *)[v30 UTF8String], 1);

  lldb::SBTarget::FindModule(v227, (lldb::SBTarget *)v229, (const lldb::SBFileSpec *)v228);
  lldb::SBModule::SBModule((lldb::SBModule *)v225, (const lldb::SBModule *)v227);
  uint64_t v31 = (uint64_t)v194;
  unsigned int NumCompileUnits = lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v225);
  if (NumCompileUnits >= 2)
  {
    unsigned int v33 = 0;
    char v34 = 0;
    unsigned int v208 = 0;
    unint64_t v35 = -1LL;
    while (1)
    {
      lldb::SBModule::GetCompileUnitAtIndex(buffer, (lldb::SBModule *)v225, v33);
      int NumLineEntries = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)buffer);
      if (NumLineEntries) {
        break;
      }
LABEL_44:
      lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)buffer);
      if (++v33 == NumCompileUnits) {
        goto LABEL_47;
      }
    }

    unsigned int v37 = 0;
    BOOL v38 = 0;
    unint64_t v39 = -1LL;
    do
    {
      lldb::SBCompileUnit::GetLineEntryAtIndex(v223, (lldb::SBCompileUnit *)buffer, v37);
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)v223);
      lldb::SBAddress::GetSymbol((lldb::SBAddress *)v231);
      Name = (const char *)lldb::SBSymbol::GetName((lldb::SBSymbol *)&__s1);
      lldb::SBSymbol::~SBSymbol((lldb::SBSymbol *)&__s1);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v231);
      if (!v38 && Name != 0LL) {
        BOOL v38 = strlen(Name) == 8 && *(void *)Name == 0x6E69616D2E6DLL;
      }
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)v223);
      unint64_t FileAddress = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)&__s1);
      if (FileAddress < v39) {
        unint64_t v39 = FileAddress;
      }
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
      lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)v223);
      ++v37;
    }

    while (NumLineEntries != v37);
    if (v38)
    {
      unsigned int v42 = v208;
      unsigned int v208 = v42;
    }

    else if ((v34 & 1) == 0)
    {
      char v34 = 0;
      unsigned int v43 = v208;
      if (v39 < v35) {
        unsigned int v43 = v33;
      }
      unsigned int v208 = v43;
      if (v39 < v35) {
        unint64_t v35 = v39;
      }
      goto LABEL_43;
    }

    char v34 = 1;
LABEL_43:
    uint64_t v31 = (uint64_t)v194;
    goto LABEL_44;
  }

  unsigned int v208 = 0;
LABEL_47:
  lldb::SBModule::GetCompileUnitAtIndex(&v226, (lldb::SBModule *)v227, v208);
  lldb::SBModule::~SBModule((lldb::SBModule *)v225);
  unsigned int v44 = lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v226);
  std::vector<DebugInfo::LineEntry>::resize(v31, v44);
  *(void *)(v31 + 48) = 0xFFFFFFFFLL;
  int v45 = v211;
  *(_DWORD *)(v31 + 60) = 0;
  *(_DWORD *)(v31 + 64) = v45;
  std::string::basic_string[abi:nn180100]<0>(v223, "::air.vertexFetchFunction()");
  unint64_t v46 = 0LL;
  uint64_t v186 = 72LL;
  int v187 = -1;
  while (v46 < lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v226))
  {
    lldb::SBCompileUnit::GetLineEntryAtIndex(&v222, (lldb::SBCompileUnit *)&v226, v46);
    lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v222);
    lldb::SBAddress::GetBlock((lldb::SBAddress *)&__s1);
    char IsInlined = lldb::SBBlock::IsInlined((lldb::SBBlock *)buffer);
    lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
    lldb::SBAddress::~SBAddress((lldb::SBAddress *)&__s1);
    unint64_t v193 = v46;
    if ((IsInlined & 1) != 0)
    {
      lldb::SBBlock::SBBlock((lldb::SBBlock *)v218);
      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v222);
      lldb::SBAddress::GetBlock((lldb::SBAddress *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)buffer);
      lldb::SBLineEntry::GetFileSpec((lldb::SBLineEntry *)&v222);
      int Line = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)&v222);
      while (lldb::SBBlock::IsInlined((lldb::SBBlock *)v217))
      {
        lldb::SBBlock::operator=(v218, v217);
        lldb::SBBlock::GetParent((lldb::SBBlock *)v217);
        lldb::SBBlock::operator=(v217, buffer);
        lldb::SBBlock::~SBBlock((lldb::SBBlock *)buffer);
        uint64_t v49 = *(LineEntry **)v31;
        uint64_t v50 = *(void *)v31 + 80 * v46;
        uint64_t v240 = 0LL;
        __int128 __p = 0u;
        memset(v238, 0, sizeof(v238));
        __int128 v237 = 0u;
        memset(buffer, 0, sizeof(buffer));
        unint64_t v51 = *(void *)(v50 + 64);
        unint64_t v52 = *(void *)(v50 + 72);
        __int128 v53 = (unint64_t *)(v50 + 64);
        if (v51 >= v52)
        {
          unint64_t v58 = std::vector<DebugInfo::BlockInfo>::__push_back_slow_path<DebugInfo::BlockInfo>( (unint64_t *)v49 + 10 * v46 + 7,  (uint64_t)buffer);
          int v59 = SHIBYTE(v240);
          unint64_t *v53 = v58;
          if (v59 < 0) {
            operator delete((void *)__p);
          }
        }

        else
        {
          *(void *)unint64_t v51 = 0LL;
          __int128 v54 = *(_OWORD *)&buffer[8];
          *(void *)(v51 + 24) = *(void *)&buffer[24];
          *(_OWORD *)(v51 + 8) = v54;
          memset(&buffer[8], 0, 24);
          uint64_t v55 = v238[0];
          *(_OWORD *)(v51 + 32) = v237;
          *(void *)(v51 + 48) = v55;
          v238[0] = 0LL;
          __int128 v237 = 0uLL;
          __int128 v56 = *(_OWORD *)&v238[1];
          *(void *)(v51 + 72) = v238[3];
          *(_OWORD *)(v51 + 56) = v56;
          memset(&v238[1], 0, 24);
          __int128 v57 = __p;
          *(void *)(v51 + 96) = v240;
          *(_OWORD *)(v51 + 80) = v57;
          __int128 __p = 0uLL;
          uint64_t v240 = 0LL;
          unint64_t *v53 = v51 + 104;
        }

        if (SHIBYTE(v238[3]) < 0) {
          operator delete((void *)v238[1]);
        }
        if (SHIBYTE(v238[0]) < 0) {
          operator delete((void *)v237);
        }
        if (buffer[31] < 0) {
          operator delete(*(void **)&buffer[8]);
        }
        unint64_t v60 = *v53;
        if (lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v218))
        {
          InlinedName = (const std::string::value_type *)lldb::SBBlock::GetInlinedName((lldb::SBBlock *)v218);
          std::string::assign((std::string *)(v60 - 72), InlinedName);
        }

        if (lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v216)
          && lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v216))
        {
          Directory = (const std::string::value_type *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v216);
          std::string::assign((std::string *)(v60 - 96), Directory);
          Filename = (const std::string::value_type *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v216);
          std::string::assign((std::string *)(v60 - 48), Filename);
          constructFullPath((uint64_t)buffer, v60 - 96, v60 - 48);
          unint64_t v64 = (void **)(v60 - 24);
          *(_OWORD *)unint64_t v64 = *(_OWORD *)buffer;
          *(void *)(v60 - 8) = *(void *)&buffer[16];
        }

        *(_DWORD *)(v60 - 104) = Line;
        int Line = lldb::SBBlock::GetInlinedCallSiteLine((lldb::SBBlock *)v218);
        lldb::SBBlock::GetInlinedCallSiteFile((lldb::SBBlock *)v218);
        lldb::SBFileSpec::operator=(v216, buffer);
        lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)buffer);
      }

      lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v222);
      lldb::SBAddress::GetFunction((lldb::SBAddress *)v231);
      uint64_t v74 = lldb::SBFunction::GetName((lldb::SBFunction *)buffer);
      if (v74)
      {
        lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v222);
        lldb::SBAddress::GetFunction((lldb::SBAddress *)v214);
        unsigned int v75 = (char *)lldb::SBFunction::GetName((lldb::SBFunction *)v215);
      }

      else
      {
        unsigned int v75 = "";
      }

      std::string::basic_string[abi:nn180100]<0>(&__s1, v75);
      if (v74)
      {
        lldb::SBFunction::~SBFunction((lldb::SBFunction *)v215);
        lldb::SBAddress::~SBAddress((lldb::SBAddress *)v214);
      }

      lldb::SBFunction::~SBFunction((lldb::SBFunction *)buffer);
      lldb::SBAddress::~SBAddress((lldb::SBAddress *)v231);
      id v85 = *(LineEntry **)v31;
      uint64_t v86 = *(void *)v31 + 80 * v46;
      unint64_t v89 = *(void *)(v86 + 56);
      id v88 = (unint64_t *)(v86 + 56);
      unint64_t v87 = v89;
      unsigned int v91 = v88 + 1;
      unint64_t v90 = v88[1];
      if (v89 != v90)
      {
        uint64_t size = __s1.__r_.__value_.__s.__size_;
        if ((__s1.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type v93 = __s1.__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type v93 = __s1.__r_.__value_.__l.__size_;
        }
        unint64_t v94 = v224;
        if ((v224 & 0x80u) != 0) {
          unint64_t v94 = (unint64_t)v223[1];
        }
        if (v93 != v94) {
          goto LABEL_117;
        }
        if ((v224 & 0x80u) == 0) {
          __int128 v95 = v223;
        }
        else {
          __int128 v95 = (void **)v223[0];
        }
        if ((__s1.__r_.__value_.__s.__size_ & 0x80) != 0)
        {
          if (memcmp(__s1.__r_.__value_.__l.__data_, v95, __s1.__r_.__value_.__l.__size_)) {
            goto LABEL_117;
          }
        }

        else if (__s1.__r_.__value_.__s.__size_)
        {
          p_s1 = &__s1;
          while (p_s1->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v95)
          {
            p_s1 = (std::string *)((char *)p_s1 + 1);
            __int128 v95 = (void **)((char *)v95 + 1);
            if (!--size) {
              goto LABEL_133;
            }
          }

- (pair<std::vector<unsigned)_getAddressAndLineTableForDebugInfo:(pair<std:(std:(SEL)a3 :(void *)a4 vector<std::vector<DebugInfo::LineEntry *>>> *)self :vector<unsigned)int>
{
  uint64_t v5 = *(void *)a4;
  uint64_t v4 = *((void *)a4 + 1);
  if (*(void *)a4 == v4)
  {
    *(_OWORD *)&retstr->var0.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.__begin_ = 0u;
  }

  else
  {
    uint64_t v7 = *((unsigned int *)a4 + 16);
    if ((_DWORD)v7)
    {
      unint64_t v8 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(*((unsigned int *)a4 + 16));
      unint64_t v89 = &v8[v9];
      memset(v8, 255, 4 * v7);
      unsigned int v91 = &v8[v7];
      uint64_t v5 = *(void *)a4;
      uint64_t v4 = *((void *)a4 + 1);
    }

    else
    {
      unint64_t v8 = 0LL;
      unsigned int v91 = 0LL;
      unint64_t v89 = 0LL;
    }

    int64x2_t v97 = 0uLL;
    uint64_t v98 = 0LL;
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4);
    if (v10 >= 2)
    {
      if (v10 >= 0x1555555555555556LL) {
        abort();
      }
      __int128 v95 = (void **)&v98;
      id v11 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v10 >> 1);
      __int128 __p = v11;
      v93.i64[0] = (uint64_t)v11;
      id v13 = &v11[24 * v12];
      v93.i64[1] = (uint64_t)v11;
      unint64_t v94 = v13;
      id v14 = (void *)v97.i64[1];
      id v15 = (void *)v97.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        int64x2_t v18 = vdupq_n_s64(v97.u64[1]);
        id v16 = v11;
      }

      else
      {
        id v16 = v11;
        do
        {
          *((void *)v16 - 3) = 0LL;
          *((void *)v16 - 2) = 0LL;
          v16 -= 24;
          *((void *)v16 + 2) = 0LL;
          __int128 v17 = *(_OWORD *)(v14 - 3);
          v14 -= 3;
          *(_OWORD *)id v16 = v17;
          *((void *)v16 + 2) = v14[2];
          *id v14 = 0LL;
          v14[1] = 0LL;
          v14[2] = 0LL;
        }

        while (v14 != v15);
        int64x2_t v18 = v97;
        id v11 = (char *)v93.i64[1];
        id v13 = v94;
      }

      v97.i64[0] = (uint64_t)v16;
      v97.i64[1] = (uint64_t)v11;
      int64x2_t v93 = v18;
      id v19 = v98;
      uint64_t v98 = v13;
      unint64_t v94 = v19;
      __int128 __p = (void *)v18.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
      uint64_t v5 = *(void *)a4;
      uint64_t v4 = *((void *)a4 + 1);
    }

    if (v4 != v5)
    {
      uint64_t v20 = 0LL;
      unsigned int v21 = 0;
      do
      {
        uint64_t v22 = v5 + 80 * v20;
        unint64_t v23 = *(unsigned int *)(v22 + 24);
        if (v91 - v8 > v23)
        {
          unsigned int v24 = v8[v23];
          uint64_t v25 = v97.i64[0];
          if (v24 == -1)
          {
            id v26 = (char *)v97.i64[1];
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
            do
            {
              v8[v23] = v27;
              LODWORD(v23) = v23 + 1;
            }

            while (v23 < *(_DWORD *)(v5 + 80 * v20 + 28));
            if (v26 >= v98)
            {
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
                abort();
              }
              unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v98[-v25] >> 3);
              uint64_t v30 = 2 * v29;
              if (2 * v29 <= v27 + 1) {
                uint64_t v30 = v27 + 1;
              }
              if (v29 >= 0x555555555555555LL) {
                unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v31 = v30;
              }
              __int128 v95 = (void **)&v98;
              unint64_t v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v31);
              unsigned int v33 = &v32[24 * v27];
              __int128 __p = v32;
              v93.i64[0] = (uint64_t)v33;
              unint64_t v94 = &v32[24 * v34];
              uint64_t v28 = v33 + 24;
              *(void *)unsigned int v33 = 0LL;
              *((void *)v33 + 1) = 0LL;
              *((void *)v33 + 2) = 0LL;
              v93.i64[1] = (uint64_t)(v33 + 24);
              unint64_t v35 = (void *)v97.i64[1];
              unint64_t v36 = (void *)v97.i64[0];
              uint64_t v37 = v93.i64[0];
              if (v97.i64[1] == v97.i64[0])
              {
                int64x2_t v39 = vdupq_n_s64(v97.u64[1]);
              }

              else
              {
                do
                {
                  *(void *)(v37 - 24) = 0LL;
                  *(void *)(v37 - 16) = 0LL;
                  v37 -= 24LL;
                  *(void *)(v37 + 16) = 0LL;
                  __int128 v38 = *(_OWORD *)(v35 - 3);
                  v35 -= 3;
                  *(_OWORD *)uint64_t v37 = v38;
                  *(void *)(v37 + 16) = v35[2];
                  *unint64_t v35 = 0LL;
                  v35[1] = 0LL;
                  v35[2] = 0LL;
                }

                while (v35 != v36);
                int64x2_t v39 = v97;
                uint64_t v28 = (void *)v93.i64[1];
              }

              v97.i64[0] = v37;
              v97.i64[1] = (uint64_t)v28;
              int64x2_t v93 = v39;
              uint64_t v40 = v98;
              uint64_t v98 = v94;
              unint64_t v94 = v40;
              __int128 __p = (void *)v39.i64[0];
              std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
            }

            else
            {
              uint64_t v28 = v26 + 24;
              *(void *)id v26 = 0LL;
              *((void *)v26 + 1) = 0LL;
              *((void *)v26 + 2) = 0LL;
            }

            v97.i64[1] = (uint64_t)v28;
            unsigned int v24 = v8[*(unsigned int *)(v22 + 24)];
            uint64_t v25 = v97.i64[0];
          }

          uint64_t v41 = (void **)(v25 + 24LL * v24);
          unsigned int v43 = v41 + 1;
          unsigned int v42 = v41[1];
          unint64_t v44 = (unint64_t)v41[2];
          if ((unint64_t)v42 >= v44)
          {
            uint64_t v46 = ((char *)v42 - (_BYTE *)*v41) >> 3;
            uint64_t v47 = v44 - (void)*v41;
            uint64_t v48 = v47 >> 2;
            else {
              unint64_t v49 = v48;
            }
            if (v49) {
              unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v49);
            }
            else {
              uint64_t v50 = 0LL;
            }
            unint64_t v51 = (void *)(v49 + 8 * v46);
            void *v51 = v22;
            int v45 = v51 + 1;
            unint64_t v52 = (char *)*v43;
            __int128 v53 = (char *)*v41;
            if (*v43 != *v41)
            {
              do
              {
                uint64_t v54 = *((void *)v52 - 1);
                v52 -= 8;
                *--unint64_t v51 = v54;
              }

              while (v52 != v53);
              unint64_t v52 = (char *)*v41;
            }

            *uint64_t v41 = v51;
            *unsigned int v43 = v45;
            v41[2] = (void *)(v49 + 8 * v50);
            if (v52) {
              operator delete(v52);
            }
          }

          else
          {
            void *v42 = v22;
            int v45 = v42 + 1;
          }

          *unsigned int v43 = v45;
          uint64_t v5 = *(void *)a4;
          uint64_t v4 = *((void *)a4 + 1);
        }

        uint64_t v20 = ++v21;
      }

      while (0xCCCCCCCCCCCCCCCDLL * ((v4 - v5) >> 4) > v21);
    }

    uint64_t v55 = v97.i64[1];
    if (v97.i64[1] >= (unint64_t)v98)
    {
      unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((v97.i64[1] - v97.i64[0]) >> 3);
      unint64_t v58 = v57 + 1;
      if (v57 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      else {
        unint64_t v59 = v58;
      }
      __int128 v95 = (void **)&v98;
      unint64_t v60 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v59);
      uint64_t v61 = &v60[24 * v57];
      v93.i64[0] = (uint64_t)v61;
      unint64_t v94 = &v60[24 * v62];
      __int128 v56 = v61 + 24;
      *(void *)uint64_t v61 = 0LL;
      *((void *)v61 + 1) = 0LL;
      *((void *)v61 + 2) = 0LL;
      v93.i64[1] = (uint64_t)(v61 + 24);
      unint64_t v63 = (void *)v97.i64[1];
      unint64_t v64 = (void *)v97.i64[0];
      uint64_t v65 = v93.i64[0];
      if (v97.i64[1] == v97.i64[0])
      {
        int64x2_t v67 = vdupq_n_s64(v97.u64[1]);
      }

      else
      {
        do
        {
          *(void *)(v65 - 24) = 0LL;
          *(void *)(v65 - 16) = 0LL;
          v65 -= 24LL;
          *(void *)(v65 + 16) = 0LL;
          __int128 v66 = *(_OWORD *)(v63 - 3);
          v63 -= 3;
          *(_OWORD *)uint64_t v65 = v66;
          *(void *)(v65 + 16) = v63[2];
          *unint64_t v63 = 0LL;
          v63[1] = 0LL;
          v63[2] = 0LL;
        }

        while (v63 != v64);
        int64x2_t v67 = v97;
        __int128 v56 = (void *)v93.i64[1];
      }

      v97.i64[0] = v65;
      v97.i64[1] = (uint64_t)v56;
      int64x2_t v93 = v67;
      unint64_t v68 = v98;
      uint64_t v98 = v94;
      unint64_t v94 = v68;
      __int128 __p = (void *)v67.i64[0];
      std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)&__p);
    }

    else
    {
      __int128 v56 = (void *)(v97.i64[1] + 24);
      *(void *)v97.i64[1] = 0LL;
      *(void *)(v55 + 8) = 0LL;
      *(void *)(v55 + 16) = 0LL;
    }

    v97.i64[1] = (uint64_t)v56;
    uint64_t v69 = *(void *)a4;
    uint64_t v70 = *((void *)a4 + 1);
    if (v69 != v70)
    {
      do
      {
        uint64_t v71 = v97.i64[1];
        __int128 v73 = *(void **)(v97.i64[1] - 16);
        unint64_t v72 = *(void *)(v97.i64[1] - 8);
        if ((unint64_t)v73 >= v72)
        {
          uint64_t v75 = *(void *)(v97.i64[1] - 24);
          uint64_t v76 = ((uint64_t)v73 - v75) >> 3;
          uint64_t v77 = v72 - v75;
          uint64_t v78 = v77 >> 2;
          else {
            unint64_t v79 = v78;
          }
          if (v79) {
            unint64_t v79 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v79);
          }
          else {
            uint64_t v80 = 0LL;
          }
          id v81 = (void *)(v79 + 8 * v76);
          *id v81 = v69;
          uint64_t v74 = v81 + 1;
          uint64_t v83 = *(char **)(v71 - 24);
          id v82 = *(char **)(v71 - 16);
          if (v82 != v83)
          {
            do
            {
              uint64_t v84 = *((void *)v82 - 1);
              v82 -= 8;
              *--id v81 = v84;
            }

            while (v82 != v83);
            id v82 = *(char **)(v71 - 24);
          }

          *(void *)(v71 - 24) = v81;
          *(void *)(v71 - 16) = v74;
          *(void *)(v71 - 8) = v79 + 8 * v80;
          if (v82) {
            operator delete(v82);
          }
        }

        else
        {
          *__int128 v73 = v69;
          uint64_t v74 = v73 + 1;
        }

        *(void *)(v71 - 16) = v74;
        v69 += 80LL;
      }

      while (v69 != v70);
      __int128 v56 = (void *)v97.i64[1];
    }

    id v85 = (void *)v97.i64[0];
    if (v8 != v91)
    {
      unsigned int v86 = -1431655765 * (((unint64_t)v56 - v97.i64[0]) >> 3) - 1;
      unint64_t v87 = v8;
      do
      {
        if (*v87 == -1) {
          unsigned int *v87 = v86;
        }
        ++v87;
      }

      while (v87 != v91);
      id v85 = (void *)v97.i64[0];
    }

    id v88 = v98;
    uint64_t v98 = 0LL;
    uint64_t v96 = 0LL;
    int64x2_t v97 = 0uLL;
    retstr->var0.__begin_ = v8;
    retstr->var0.__end_ = v91;
    __int128 __p = 0LL;
    int64x2_t v93 = 0uLL;
    unint64_t v94 = 0LL;
    retstr->var0.__end_cap_.__value_ = v89;
    retstr->var1.var0 = v85;
    retstr->var1.var1 = v56;
    retstr->var1.var2.var0 = v88;
    __int128 v95 = 0LL;
    __int128 v99 = &v94;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v99);
    if (__p)
    {
      v93.i64[0] = (uint64_t)__p;
      operator delete(__p);
    }

    __int128 __p = &v97;
    std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  }

  return self;
}

- (void)_ProcessLineList:(void *)a3 forFileCostMap:(void *)a4 forDebugInfo:(void *)a5 andCost:(double)a6 forAddr:(unsigned int)a7 andDrawIndex:(unsigned int)a8 andTargetIndex:(int)a9
{
  unint64_t v10 = *(size_t **)a3;
  uint64_t v9 = (size_t *)*((void *)a3 + 1);
  if (*(size_t **)a3 != v9)
  {
    uint64_t v12 = (uint64_t)a5;
    char v90 = 0;
    __int128 v95 = (char *)a4 + 16;
    unsigned int v91 = (size_t *)*((void *)a3 + 1);
    while (1)
    {
      size_t v15 = *v10;
      if (*(_DWORD *)(*v10 + 24) < *(_DWORD *)(v12 + 64)) {
        break;
      }
LABEL_173:
      if (++v10 == v9) {
        return;
      }
    }

    unint64_t v16 = *(unsigned __int8 *)(v15 + 23);
    if (*(char *)(v15 + 23) < 0)
    {
      if (*(void *)(v15 + 8)) {
        goto LABEL_7;
      }
    }

    else if (*(_BYTE *)(v15 + 23))
    {
LABEL_7:
      if ((v16 & 0x80u) == 0LL) {
        __int128 v17 = (uint64_t *)v15;
      }
      else {
        __int128 v17 = *(uint64_t **)v15;
      }
      if ((v16 & 0x80u) == 0LL) {
        unint64_t v18 = v16;
      }
      else {
        unint64_t v18 = *(void *)(v15 + 8);
      }
      unint64_t v19 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v17, v18);
      unint64_t v20 = v19;
      unint64_t v21 = *((void *)a4 + 1);
      if (v21)
      {
        uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
        v22.i16[0] = vaddlv_u8(v22);
        unint64_t v23 = v22.u32[0];
        if (v22.u32[0] > 1uLL)
        {
          uint64_t v12 = v19;
          if (v19 >= v21) {
            uint64_t v12 = v19 % v21;
          }
        }

        else
        {
          uint64_t v12 = (v21 - 1) & v19;
        }

        unsigned int v24 = *(uint64_t ***)(*(void *)a4 + 8 * v12);
        if (v24)
        {
          for (unint64_t i = *v24; i; unint64_t i = (uint64_t *)*i)
          {
            unint64_t v26 = i[1];
            if (v26 == v20)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100]( (unsigned __int8 *)i + 16,  (unsigned __int8 *)v15))
              {
                goto LABEL_90;
              }
            }

            else
            {
              if (v23 > 1)
              {
                if (v26 >= v21) {
                  v26 %= v21;
                }
              }

              else
              {
                v26 &= v21 - 1;
              }

              if (v26 != v12) {
                break;
              }
            }
          }
        }
      }

      unint64_t v27 = (char *)operator new(0x70uLL);
      v97[0] = v27;
      v97[1] = v95;
      char v98 = 0;
      *(void *)unint64_t v27 = 0LL;
      *((void *)v27 + 1) = v20;
      uint64_t v28 = (std::string *)(v27 + 16);
      if (*(char *)(v15 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)v15, *(void *)(v15 + 8));
      }

      else
      {
        __int128 v29 = *(_OWORD *)v15;
        *((void *)v27 + 4) = *(void *)(v15 + 16);
        *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
      }

      *((void *)v27 + 13) = 0LL;
      *(_OWORD *)(v27 + 88) = 0u;
      *(_OWORD *)(v27 + 72) = 0u;
      *(_OWORD *)(v27 + 56) = 0u;
      *(_OWORD *)(v27 + 40) = 0u;
      *((_DWORD *)v27 + 26) = 1065353216;
      char v98 = 1;
      float v30 = (float)(unint64_t)(*((void *)a4 + 3) + 1LL);
      float v31 = *((float *)a4 + 8);
      if (v21 && (float)(v31 * (float)v21) >= v30)
      {
LABEL_80:
        uint64_t v46 = *(void **)(*(void *)a4 + 8 * v12);
        unint64_t i = (uint64_t *)v97[0];
        if (v46)
        {
          *(void *)v97[0] = *v46;
        }

        else
        {
          *(void *)v97[0] = *((void *)a4 + 2);
          *((void *)a4 + 2) = i;
          *(void *)(*(void *)a4 + 8 * v12) = v95;
          if (!*i)
          {
LABEL_89:
            v97[0] = 0LL;
            ++*((void *)a4 + 3);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerFileCost>,void *>>>>::reset[abi:nn180100]((uint64_t)v97);
LABEL_90:
            unint64_t v48 = i[10];
            if (v48)
            {
              uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
              v49.i16[0] = vaddlv_u8(v49);
              if (v49.u32[0] > 1uLL)
              {
                size_t v15 = a8;
                if (v48 <= a8) {
                  size_t v15 = a8 % v48;
                }
              }

              else
              {
                size_t v15 = ((_DWORD)v48 - 1) & a8;
              }

              uint64_t v50 = *(void ***)(i[9] + 8 * v15);
              if (v50)
              {
                unint64_t v51 = (char *)*v50;
                if (*v50)
                {
                  do
                  {
                    unint64_t v52 = *((void *)v51 + 1);
                    if (v52 == a8)
                    {
                      if (*((_DWORD *)v51 + 4) == a8) {
                        goto LABEL_162;
                      }
                    }

                    else
                    {
                      if (v49.u32[0] > 1uLL)
                      {
                        if (v52 >= v48) {
                          v52 %= v48;
                        }
                      }

                      else
                      {
                        v52 &= v48 - 1;
                      }

                      if (v52 != v15) {
                        break;
                      }
                    }

                    unint64_t v51 = *(char **)v51;
                  }

                  while (v51);
                }
              }
            }

            __int128 v53 = i + 11;
            unint64_t v51 = (char *)operator new(0x38uLL);
            *(void *)unint64_t v51 = 0LL;
            *((void *)v51 + 1) = a8;
            *((_DWORD *)v51 + 4) = a8;
            *(_OWORD *)(v51 + 24) = 0u;
            *(_OWORD *)(v51 + 40) = 0u;
            float v54 = (float)(unint64_t)(i[12] + 1);
            float v55 = *((float *)i + 26);
            if (v48 && (float)(v55 * (float)v48) >= v54)
            {
LABEL_152:
              uint64_t v72 = i[9];
              __int128 v73 = *(void **)(v72 + 8 * v15);
              if (v73)
              {
                *(void *)unint64_t v51 = *v73;
              }

              else
              {
                *(void *)unint64_t v51 = *v53;
                void *v53 = v51;
                *(void *)(v72 + 8 * v15) = v53;
                if (!*(void *)v51) {
                  goto LABEL_161;
                }
                unint64_t v74 = *(void *)(*(void *)v51 + 8LL);
                if ((v48 & (v48 - 1)) != 0)
                {
                  if (v74 >= v48) {
                    v74 %= v48;
                  }
                }

                else
                {
                  v74 &= v48 - 1;
                }

                __int128 v73 = (void *)(i[9] + 8 * v74);
              }

              *__int128 v73 = v51;
LABEL_161:
              ++i[12];
LABEL_162:
              uint64_t v12 = (uint64_t)a5;
              if (i[5] == i[6])
              {
                unint64_t v75 = *((unsigned int *)a5 + 14);
                v97[0] = 0LL;
                std::vector<double>::resize((char **)i + 5, v75, v97);
                i[8] = 0LL;
              }

              uint64_t v76 = *((void *)v51 + 3);
              if (v76 == *((void *)v51 + 4))
              {
                unint64_t v77 = *((unsigned int *)a5 + 14);
                v97[0] = 0LL;
                std::vector<double>::resize((char **)v51 + 3, v77, v97);
                *((void *)v51 + 6) = 0LL;
                uint64_t v76 = *((void *)v51 + 3);
              }

              size_t v78 = *v10;
              unsigned int v79 = **(_DWORD **)(*v10 + 56) - *((_DWORD *)a5 + 12);
              double v80 = a6 / (double)(unint64_t)((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
              *(double *)(i[5] + 8LL * v79) = *(double *)(i[5] + 8LL * v79) + v80;
              *((double *)i + 8) = *((double *)i + 8) + v80;
              *(double *)(v76 + 8LL * v79) = v80 + *(double *)(v76 + 8LL * v79);
              *((double *)v51 + 6) = v80 + *((double *)v51 + 6);
              unint64_t v81 = a7 - *(_DWORD *)(v78 + 24);
              uint64_t v82 = *(void *)(v78 + 32);
              if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v78 + 40) - v82) >> 3) <= v81)
              {
                uint64_t v9 = v91;
              }

              else
              {
                uint64_t v83 = v82 + 40LL * v81;
                *(double *)(v83 + 16) = v80 + *(double *)(v83 + 16);
                uint64_t v9 = v91;
                if (!*(void *)v83)
                {
                  *(void *)uint64_t v83 = &stru_591D98;
                  uint64_t v84 = *((void *)a5 + 3);
                  uint64_t v85 = 40LL * a7;
                  unsigned int v86 = *(void **)(v84 + v85);
                  *(void *)(v84 + v85) = &stru_591D98;
                }

                if ((v90 & 1) == 0) {
                  ++*(_DWORD *)(v82 + 40LL * v81 + 24);
                }
                char v90 = 1;
              }

              goto LABEL_173;
            }

            BOOL v56 = (v48 & (v48 - 1)) != 0;
            if (v48 < 3) {
              BOOL v56 = 1LL;
            }
            unint64_t v57 = v56 | (2 * v48);
            unint64_t v58 = vcvtps_u32_f32(v54 / v55);
            if (v57 <= v58) {
              int8x8_t prime = (int8x8_t)v58;
            }
            else {
              int8x8_t prime = (int8x8_t)v57;
            }
            if (*(void *)&prime == 1LL)
            {
              int8x8_t prime = (int8x8_t)2LL;
            }

            else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
            {
              int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            }

            unint64_t v48 = i[10];
            if (*(void *)&prime > v48) {
              goto LABEL_118;
            }
            if (*(void *)&prime < v48)
            {
              unint64_t v66 = vcvtps_u32_f32((float)(unint64_t)i[12] / *((float *)i + 26));
              if (v48 < 3 || (uint8x8_t v67 = (uint8x8_t)vcnt_s8((int8x8_t)v48), v67.i16[0] = vaddlv_u8(v67), v67.u32[0] > 1uLL))
              {
                unint64_t v66 = std::__next_prime(v66);
              }

              else
              {
                uint64_t v68 = 1LL << -(char)__clz(v66 - 1);
                if (v66 >= 2) {
                  unint64_t v66 = v68;
                }
              }

              if (*(void *)&prime <= v66) {
                int8x8_t prime = (int8x8_t)v66;
              }
              if (*(void *)&prime >= v48)
              {
                unint64_t v48 = i[10];
              }

              else
              {
                if (prime)
                {
LABEL_118:
                  if (*(void *)&prime >> 61) {
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  }
                  unint64_t v60 = operator new(8LL * *(void *)&prime);
                  uint64_t v61 = (void *)i[9];
                  i[9] = (uint64_t)v60;
                  if (v61) {
                    operator delete(v61);
                  }
                  uint64_t v62 = 0LL;
                  i[10] = (uint64_t)prime;
                  do
                    *(void *)(i[9] + 8 * v62++) = 0LL;
                  while (*(void *)&prime != v62);
                  unint64_t v63 = (void *)*v53;
                  if (*v53)
                  {
                    unint64_t v64 = v63[1];
                    uint8x8_t v65 = (uint8x8_t)vcnt_s8(prime);
                    v65.i16[0] = vaddlv_u8(v65);
                    if (v65.u32[0] > 1uLL)
                    {
                      if (v64 >= *(void *)&prime) {
                        v64 %= *(void *)&prime;
                      }
                    }

                    else
                    {
                      v64 &= *(void *)&prime - 1LL;
                    }

                    *(void *)(i[9] + 8 * v64) = v53;
                    uint64_t v69 = (void *)*v63;
                    if (*v63)
                    {
                      do
                      {
                        unint64_t v70 = v69[1];
                        if (v65.u32[0] > 1uLL)
                        {
                          if (v70 >= *(void *)&prime) {
                            v70 %= *(void *)&prime;
                          }
                        }

                        else
                        {
                          v70 &= *(void *)&prime - 1LL;
                        }

                        if (v70 != v64)
                        {
                          uint64_t v71 = i[9];
                          if (!*(void *)(v71 + 8 * v70))
                          {
                            *(void *)(v71 + 8 * v70) = v63;
                            goto LABEL_143;
                          }

                          *unint64_t v63 = *v69;
                          void *v69 = **(void **)(i[9] + 8 * v70);
                          **(void **)(i[9] + 8 * v70) = v69;
                          uint64_t v69 = v63;
                        }

                        unint64_t v70 = v64;
LABEL_143:
                        unint64_t v63 = v69;
                        uint64_t v69 = (void *)*v69;
                        unint64_t v64 = v70;
                      }

                      while (v69);
                    }
                  }

                  unint64_t v48 = (unint64_t)prime;
                  goto LABEL_147;
                }

                id v88 = (void *)i[9];
                i[9] = 0LL;
                if (v88) {
                  operator delete(v88);
                }
                unint64_t v48 = 0LL;
                i[10] = 0LL;
              }
            }

- (id)_processPerLineCostDataForLineTable:(void *)a3 withFileCost:(void *)a4 withDebugInfo:(void *)a5 andAllDrawCost:(double)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 withDrawCost:(void *)a9
{
  id v258 = a7;
  id v262 = a8;
  v264 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderAnalyzerResult, v12);
  v301 = 0LL;
  uint64_t v302 = 0LL;
  v300 = &v301;
  unsigned int v299 = 0;
  uint64_t v15 = *(void *)a3;
  uint64_t v14 = *((void *)a3 + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v14 - *(void *)a3) >> 3) >= 2)
  {
    unsigned int v16 = 0;
    LODWORD(v17) = 1;
    v271 = (uint64_t *)a3;
    while (1)
    {
      unint64_t v18 = (uint64_t **)(v15 + 24LL * v16);
      unsigned int v16 = v17;
      unint64_t v19 = *v18;
      v280 = v18[1];
      if (*v18 != v280) {
        break;
      }
LABEL_88:
      unint64_t v17 = v16 + 1;
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3) <= v17) {
        goto LABEL_89;
      }
    }

    unsigned int v274 = v17;
    while (1)
    {
      unint64_t v20 = *(unsigned int **)(*v19 + 56);
      unint64_t v21 = v301;
      unsigned int v22 = *v20;
      if (!v301) {
        goto LABEL_14;
      }
      unint64_t v23 = &v301;
      unsigned int v24 = v301;
      do
      {
        uint64_t v25 = v24;
        unint64_t v26 = v23;
        unsigned int v27 = *((_DWORD *)v24 + 8);
        uint64_t v28 = (uint64_t **)(v24 + 1);
        if (v27 >= v22)
        {
          uint64_t v28 = (uint64_t **)v25;
          unint64_t v23 = (uint64_t **)v25;
        }

        unsigned int v24 = *v28;
      }

      while (v24);
      if (v23 == &v301) {
        goto LABEL_14;
      }
      if (v27 < v22) {
        uint64_t v25 = (uint64_t *)v26;
      }
      if (v22 >= *((_DWORD *)v25 + 8))
      {
        unsigned int v40 = v299;
        if (v299 <= v22) {
          unsigned int v40 = *v20;
        }
        unsigned int v299 = v40;
      }

      else
      {
LABEL_14:
        if (v299 > v22) {
          unsigned int v22 = v299;
        }
        unsigned int v299 = v22;
        __int128 v296 = 0uLL;
        *(void *)&__int128 v297 = 0LL;
        unsigned int v29 = *v20;
        LODWORD(v303[0].__r_.__value_.__l.__data_) = *v20;
        memset(&v303[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
        *(void *)&__int128 v297 = 0LL;
        __int128 v296 = 0uLL;
        float v30 = &v301;
        float v31 = &v301;
        if (v301)
        {
          while (1)
          {
            while (1)
            {
              float v31 = (uint64_t **)v21;
              unsigned int v32 = *((_DWORD *)v21 + 8);
              if (v29 >= v32) {
                break;
              }
              unint64_t v21 = *v31;
              float v30 = v31;
              if (!*v31) {
                goto LABEL_23;
              }
            }

            if (v32 >= v29) {
              break;
            }
            unint64_t v21 = v31[1];
            if (!v21)
            {
              float v30 = v31 + 1;
              goto LABEL_23;
            }
          }
        }

        else
        {
LABEL_23:
          unint64_t v33 = operator new(0x40uLL);
          v33[8] = v29;
          *((void *)v33 + 6) = 0LL;
          *((void *)v33 + 7) = 0LL;
          *((void *)v33 + 5) = 0LL;
          memset(&v303[0].__r_.__value_.__r.__words[1], 0, sizeof(std::string));
          *(void *)unint64_t v33 = 0LL;
          *((void *)v33 + 1) = 0LL;
          *((void *)v33 + 2) = v31;
          void *v30 = (uint64_t *)v33;
          if (*v300)
          {
            v300 = (uint64_t **)*v300;
            unint64_t v33 = *v30;
          }

          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v301, (uint64_t *)v33);
          ++v302;
        }

        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v303[0].__r_.__value_.__l.__size_);
        std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineInfo>::~vector[abi:nn180100]((uint64_t *)&v296);
        unint64_t v34 = v301;
        unint64_t v23 = &v301;
        if (v301)
        {
          unsigned int v35 = **(_DWORD **)(*v19 + 56);
          unint64_t v36 = &v301;
          do
          {
            uint64_t v37 = v34;
            __int128 v38 = v36;
            unsigned int v39 = *((_DWORD *)v34 + 8);
            if (v39 >= v35) {
              unint64_t v36 = (uint64_t **)v34;
            }
            else {
              ++v34;
            }
            unint64_t v34 = (uint64_t *)*v34;
          }

          while (v34);
          unint64_t v23 = &v301;
          if (v36 != &v301)
          {
            if (v39 < v35) {
              uint64_t v37 = (uint64_t *)v38;
            }
            unint64_t v23 = v36;
            if (v35 < *((_DWORD *)v37 + 8)) {
              unint64_t v23 = &v301;
            }
          }
        }
      }

      memset(v303, 0, 48);
      unint64_t v41 = (std::string *)v23[6];
      uint8x8_t v42 = v23[7];
      if (v41 >= (std::string *)v42)
      {
        unint64_t v44 = v23[5];
        unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v41 - (char *)v44) >> 4);
        unint64_t v46 = v45 + 1;
        if (v45 + 1 > 0x555555555555555LL) {
          abort();
        }
        unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42 - (char *)v44) >> 4);
        if (2 * v47 > v46) {
          unint64_t v46 = 2 * v47;
        }
        if (v47 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v48 = 0x555555555555555LL;
        }
        else {
          unint64_t v48 = v46;
        }
        uint8x8_t v49 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<DynamicBuffer>>(v48);
        unint64_t v51 = (std::string *)&v49[48 * v45];
        v51->__r_.__value_.__r.__words[0] = 0LL;
        v51->__r_.__value_.__l.__size_ = 0LL;
        v51->__r_.__value_.__l.__cap_ = 0LL;
        std::string *v51 = v303[0];
        memset(v303, 0, 24);
        v51[1].__r_.__value_.__r.__words[0] = 0LL;
        v51[1].__r_.__value_.__l.__size_ = 0LL;
        v51[1].__r_.__value_.__l.__cap_ = 0LL;
        v51[1] = v303[1];
        memset(&v303[1], 0, sizeof(std::string));
        unint64_t v52 = v23[5];
        __int128 v53 = v23[6];
        if (v53 == v52)
        {
          uint64_t v43 = (uint64_t *)&v51[2];
          v23[5] = (uint64_t *)v51;
          v23[6] = (uint64_t *)&v51[2];
          v23[7] = (uint64_t *)&v49[48 * v50];
          if (!v53) {
            goto LABEL_55;
          }
        }

        else
        {
          unint64_t v54 = 0LL;
          do
          {
            float v55 = (std::string::__raw *)&v51[v54 / 0x18];
            BOOL v56 = &v53[v54 / 8];
            v55[-2].__words[0] = 0LL;
            v55[-2].__words[1] = 0LL;
            v55[-2].__words[2] = 0LL;
            *(_OWORD *)v55[-2].__words = *(_OWORD *)&v53[v54 / 8 - 6];
            v55[-2].__words[2] = v53[v54 / 8 - 4];
            *(v56 - 6) = 0LL;
            *(v56 - 5) = 0LL;
            *(v56 - 4) = 0LL;
            v55[-1].__words[0] = 0LL;
            v55[-1].__words[1] = 0LL;
            v55[-1].__words[2] = 0LL;
            *(_OWORD *)v55[-1].__words = *(_OWORD *)&v53[v54 / 8 - 3];
            v55[-1].__words[2] = v53[v54 / 8 - 1];
            *(v56 - 3) = 0LL;
            *(v56 - 2) = 0LL;
            *(v56 - 1) = 0LL;
            v54 -= 48LL;
          }

          while (&v53[v54 / 8] != v52);
          __int128 v53 = v23[5];
          unint64_t v57 = v23[6];
          uint64_t v43 = (uint64_t *)&v51[2];
          v23[5] = (uint64_t *)&v51[v54 / 0x18];
          v23[6] = (uint64_t *)&v51[2];
          v23[7] = (uint64_t *)&v49[48 * v50];
          if (v57 != v53)
          {
            do
            {
              unint64_t v58 = v57 - 6;
              *(void *)&__int128 v296 = v57 - 3;
              std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)&v296);
              std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v58);
              unint64_t v57 = v58;
            }

            while (v58 != v53);
          }

          if (!v53) {
            goto LABEL_55;
          }
        }

        operator delete(v53);
      }

      else
      {
        v41->__r_.__value_.__l.__cap_ = 0LL;
        v41[1].__r_.__value_.__r.__words[0] = 0LL;
        v41->__r_.__value_.__r.__words[0] = 0LL;
        v41->__r_.__value_.__l.__size_ = 0LL;
        *unint64_t v41 = v303[0];
        memset(v303, 0, 24);
        v41[1].__r_.__value_.__l.__size_ = 0LL;
        v41[1].__r_.__value_.__l.__cap_ = 0LL;
        v41[1] = v303[1];
        memset(&v303[1], 0, sizeof(std::string));
        uint64_t v43 = (uint64_t *)&v41[2];
      }

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withTextSegment:(id)a6 withKey:(id)a7 withShaderSourcePath:(id)a8 forDataMaster:(unsigned int)a9 withPerDrawLimiterData:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v56 = a7;
  id v55 = a8;
  id v58 = a10;
  unint64_t v54 = v17;
  -[GTShaderProfilerHelper _getDebugInfoForBinary:withTextSegment:forTargetIndex:]( self,  "_getDebugInfoForBinary:withTextSegment:forTargetIndex:",  v17,  v18,  v13);
  __int128 v65 = 0uLL;
  uint64_t v66 = 0LL;
  -[GTShaderProfilerHelper _getAddressAndLineTableForDebugInfo:](self, "_getAddressAndLineTableForDebugInfo:", v67);
  unint64_t v20 = __p[0];
  unint64_t v19 = __p[1];
  __p[1] = 0LL;
  *(void *)unint64_t v63 = 0LL;
  __p[0] = 0LL;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v65);
  __int128 v65 = *(_OWORD *)&v63[8];
  uint64_t v66 = v64;
  *(void *)&v63[16] = 0LL;
  uint64_t v64 = 0LL;
  *(void *)&v63[8] = 0LL;
  *(void *)&v60[0] = &v63[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v60);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  unint64_t v21 = 0LL;
  if ((void)v65 != *((void *)&v65 + 1) && v20 != v19)
  {
    *(_OWORD *)std::string __p = 0u;
    *(_OWORD *)unint64_t v63 = 0u;
    *(_DWORD *)&v63[16] = 1065353216;
    memset(v60, 0, sizeof(v60));
    int v61 = 1065353216;
    id v22 = v16;
    unint64_t v57 = v20;
    id v52 = v18;
    id v53 = v16;
    unint64_t v23 = (char *)[v22 bytes];
    unint64_t v24 = (unint64_t)[v22 length];
    uint64_t v26 = (v24 / 0x14);
    if ((v24 / 0x14))
    {
      unint64_t v27 = (v19 - v20) >> 2;
      uint64_t v28 = (unsigned int *)(v23 + 8);
      double v29 = 0.0;
      while (1)
      {
        unsigned int v30 = *(v28 - 1);
        unint64_t v31 = *v28;
        unint64_t v32 = *(v28 - 2);
        int v59 = *(v28 - 2);
        if ((v13 & 0x80000000) == 0 || v30 == 3)
        {
          if ((v13 & 0x80000000) != 0)
          {
            double v34 = 1.0;
LABEL_43:
            if (v27 <= v31) {
              unsigned int v49 = -1 - 1431655765 * ((*((void *)&v65 + 1) - (void)v65) >> 3);
            }
            else {
              unsigned int v49 = *(_DWORD *)&v20[4 * v31];
            }
            -[GTShaderProfilerHelper _ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:]( self,  "_ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:",  (void)v65 + 24LL * v49,  __p,  v67,  v31,  v32,  v13,  v34);
            uint64_t v50 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (float *)v60,  v32,  &v59);
            double v29 = v29 + v34;
            v50[3] = v34 + v50[3];
            goto LABEL_47;
          }

          uint64_t v33 = v68[0];
          if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v68[1] - v68[0]) >> 3) > v31)
          {
            LODWORD(v25) = v28[2];
            double v34 = (double)v30 / (double)v25;
            if (v58 && (unint64_t)[v58 count] > v32)
            {
              int v35 = *(_DWORD *)(v33 + 40LL * v31 + 36);
              double v36 = 1.0;
              switch(v35)
              {
                case 12:
                  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v32]);
                  -[GTShaderProfilerHelper _latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:]( self,  "_latencyAdjustmentFactorWithLimiterDataForDraw:forDataMaster:",  v37,  a9);
                  goto LABEL_15;
                case 13:
                  goto LABEL_36;
                case 14:
                  if (*(_DWORD *)(v33 + 40LL * v31 + 32) == 2)
                  {
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v32]);
                    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([&off_59F920 objectAtIndexedSubscript:2]);
                  }

                  else
                  {
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v32]);
                    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([&off_59F920 objectAtIndexedSubscript:6]);
                  }

                  goto LABEL_26;
                case 15:
                  if (*(_DWORD *)(v33 + 40LL * v31 + 32) == 2)
                  {
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v32]);
                    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([&off_59F920 objectAtIndexedSubscript:3]);
                  }

                  else
                  {
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v58 objectAtIndexedSubscript:v32]);
                    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([&off_59F920 objectAtIndexedSubscript:7]);
                  }

- (id)_calculatePerLineCostWithSampleData:(id)a3 binary:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v38 = v12;
  if (g_runningInCI)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"In _calculatePerLineCostWithSampleData"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    id v18 = __stdoutp;
    id v19 = v17;
    fprintf(v18, "#CI-INFO# %s\n", (const char *)[v19 UTF8String]);

    id v12 = v38;
  }

  -[GTShaderProfilerHelper _getDebugInfoForBinary:withTextSegment:forTargetIndex:]( self,  "_getDebugInfoForBinary:withTextSegment:forTargetIndex:",  v13,  0LL,  v9);
  __int128 v45 = 0uLL;
  uint64_t v46 = 0LL;
  -[GTShaderProfilerHelper _getAddressAndLineTableForDebugInfo:](self, "_getAddressAndLineTableForDebugInfo:", v47);
  unint64_t v21 = __p[0];
  unint64_t v20 = __p[1];
  __p[1] = 0LL;
  *(void *)uint64_t v43 = 0LL;
  __p[0] = 0LL;
  std::vector<std::vector<DebugInfo::LineEntry *>>::__vdeallocate((uint64_t *)&v45);
  __int128 v45 = *(_OWORD *)&v43[8];
  uint64_t v46 = v44;
  *(void *)&v43[16] = 0LL;
  uint64_t v44 = 0LL;
  *(void *)&v43[8] = 0LL;
  *(void *)&v40[0] = &v43[8];
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v40);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  id v22 = v12;
  unint64_t v23 = (char *)[v22 bytes];
  unint64_t v24 = (unint64_t)[v22 length];
  *(_OWORD *)std::string __p = 0u;
  *(_OWORD *)uint64_t v43 = 0u;
  *(_DWORD *)&v43[16] = 1065353216;
  memset(v40, 0, sizeof(v40));
  int v41 = 1065353216;
  if ((void)v45 == *((void *)&v45 + 1))
  {
    double v34 = 0LL;
  }

  else
  {
    id v36 = v22;
    id v37 = v15;
    if ((v24 & 0xFFFFFFFF0LL) != 0)
    {
      uint64_t v25 = (v24 >> 4);
      uint64_t v26 = (double *)(v23 + 8);
      double v27 = 0.0;
      do
      {
        unint64_t v28 = *((unsigned int *)v26 - 2);
        unsigned int v29 = *((_DWORD *)v26 - 1) & 0xFFFFFFF;
        unsigned int v39 = v29;
        double v30 = *v26;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v48[1] - v48[0]) >> 3) > v28)
        {
          uint64_t v31 = v48[0] + 40LL * v28;
          *(double *)(v31 + 16) = v30 + *(double *)(v31 + 16);
          ++*(_DWORD *)(v31 + 24);
        }

        if ((v20 - (_BYTE *)v21) >> 2 <= v28) {
          unsigned int v32 = -1 - 1431655765 * ((*((void *)&v45 + 1) - (void)v45) >> 3);
        }
        else {
          unsigned int v32 = v21[v28];
        }
        -[GTShaderProfilerHelper _ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:]( self,  "_ProcessLineList:forFileCostMap:forDebugInfo:andCost:forAddr:andDrawIndex:andTargetIndex:",  (void)v45 + 24LL * v32,  __p,  v47,  v30);
        uint64_t v33 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (float *)v40,  v29,  &v39);
        double v27 = v27 + v30;
        v33[3] = v30 + v33[3];
        v26 += 2;
        --v25;
      }

      while (v25);
    }

    else
    {
      double v27 = 0.0;
    }

    id v15 = v37;
    id v22 = v36;
    double v34 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]( self,  "_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSo urcePath:withDrawCost:",  &v45,  __p,  v47,  v14,  v37,  v40,  v27));
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v40);
  std::__hash_table<std::__hash_value_type<std::string,PerFileCost>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerFileCost>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerFileCost>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerFileCost>>>::~__hash_table((uint64_t)__p);
  __p[0] = &v45;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  if (v21) {
    operator delete(v21);
  }
  __p[0] = v48;
  std::vector<DebugInfo::LineDisassemblyInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  __p[0] = v47;
  std::vector<DebugInfo::LineEntry>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);

  return v34;
}

- (id)_calculatePerDrawCallWithGRCSampleData:(id)a3 targetIndex:(int)a4
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  int v22 = 1065353216;
  id v4 = a3;
  uint64_t v5 = (char *)[v4 bytes];
  unint64_t v6 = (unint64_t)[v4 length];
  if ((v6 & 0xFFFFFFFF0LL) != 0)
  {
    uint64_t v8 = (v6 >> 4);
    uint64_t v9 = (double *)(v5 + 8);
    double v10 = 0.0;
    do
    {
      unsigned int v19 = *((_DWORD *)v9 - 1) & 0xFFFFFFF;
      double v11 = *v9;
      id v12 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (float *)&v20,  v19,  &v19);
      double v10 = v10 + v11;
      v12[3] = v11 + v12[3];
      v9 += 2;
      --v8;
    }

    while (v8);
  }

  else
  {
    double v10 = 0.0;
  }

  id v13 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderAnalyzerResult, v7);
  [v13 setTotalCost:v10];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  *((void *)&v21 + 1)));
  [v13 setDrawCallCost:v14];
  for (unint64_t i = (double *)v21; i; unint64_t i = *(double **)i)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", i[3]));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)i + 4)));
    [v14 setObject:v16 forKeyedSubscript:v17];
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v20);
  return v13;
}

- (id)analyzedBinary:(id)a3 processedUscSamples:(id)a4 targetIndex:(int)a5 withKey:(id)a6 withShaderSourcePath:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 length])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _calculatePerLineCostWithSampleData:binary:targetIndex:withKey:withShaderSourcePath:]( self,  "_calculatePerLineCostWithSampleData:binary:targetIndex:withKey:withShaderSourcePath:",  v13,  v12,  v9,  v14,  v15));
    if (!v16) {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _calculatePerDrawCallWithGRCSampleData:targetIndex:]( self,  "_calculatePerDrawCallWithGRCSampleData:targetIndex:",  v13,  v9));
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (void)_analyzeShaderBinarySamplesForResult:(id)a3 forShaderKeyToSourcePath:(id)a4
{
  id v5 = a3;
  int v6 = MetalPluginTarget(self->_metalPluginName);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke;
  v7[3] = &unk_58E4B8;
  v7[4] = self;
  int v8 = v6;
  -[GTShaderProfilerHelper _visitAllShaderInfosInResult:usingBlock:]( self,  "_visitAllShaderInfosInResult:usingBlock:",  v5,  v7);
}

- (void)_calculatePerDrawCosts:(id)a3
{
  char v196 = self;
  v209 = (char *)a3;
  unsigned int v3 = [v209 encoderCount];
  id v4 = operator new(0x20uLL);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v229 = 0LL;
  v230 = 0LL;
  v228 = 0LL;
  if (v3)
  {
    id v5 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v3);
    v228 = v5;
    v229 = v5;
    v230 = &v5[3 * v6];
    uint64_t v7 = &v5[3 * v3];
    do
    {
      void *v5 = 0LL;
      v5[1] = 0LL;
      v5[2] = 0LL;
      std::vector<unsigned long>::__vallocate[abi:nn180100](v5, 4uLL);
      int v8 = (_OWORD *)v5[1];
      __int128 v9 = v4[1];
      *int v8 = *v4;
      v8[1] = v9;
      v5[1] = v8 + 2;
      v5 += 3;
    }

    while (v5 != v7);
    v229 = v7;
  }

  operator delete(v4);
  uint64_t v199 = (void *)objc_claimAutoreleasedReturnValue([v209 loadActionTimes]);
  char v198 = (void *)objc_claimAutoreleasedReturnValue([v209 storeActionTimes]);
  id v10 = [v199 count];
  if (v10 == (id)[v209 encoderCount])
  {
    id v11 = [v198 count];
    if (v11 == (id)[v209 encoderCount])
    {
      uint64_t v12 = 0LL;
      for (unint64_t i = 0; i < objc_msgSend(v209, "encoderCount", v196); ++i)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v199 objectAtIndexedSubscript:i]);
        id v15 = v14;
        if (v14)
        {
          [v14 timing];
          double v16 = v226.f64[0];
        }

        else
        {
          memset(v227, 0, sizeof(v227));
          double v16 = 0.0;
          float64x2_t v226 = 0u;
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v198 objectAtIndexedSubscript:i]);
        id v18 = v17;
        if (v17)
        {
          [v17 timing];
          double v19 = v226.f64[0];
        }

        else
        {
          memset(v227, 0, sizeof(v227));
          double v19 = 0.0;
          float64x2_t v226 = 0u;
        }

        uint64_t v20 = v228[v12];
        *(double *)(v20 + 8) = v16 + v19 + *(double *)(v20 + 8);
        *(double *)(v20 + 24) = v16 + v19 + *(double *)(v20 + 24);
        v12 += 3LL;
      }
    }
  }

  objc_msgSend(v209, "shaderProfilingTime", v196);
  double v22 = v21;
  __int128 v224 = 0u;
  __int128 v225 = 0u;
  __int128 v222 = 0u;
  __int128 v223 = 0u;
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v209 drawCallInfoList]);
  id obj = v23;
  id v24 = [v23 countByEnumeratingWithState:&v222 objects:v234 count:16];
  if (v24)
  {
    int v25 = 0;
    uint64_t v26 = *(void *)v223;
    do
    {
      for (unint64_t j = 0LL; j != v24; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v223 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v222 + 1) + 8LL * (void)j);
        unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([(id)v28 programInfo]);
        if (v29
          && (double v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v28 programInfo]),
              BOOL v31 = [v30 programId] == (id)-1,
              v30,
              v29,
              v31))
        {
          ++v25;
        }

        else
        {
          unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [(id)v28 drawCallIndex] - v25));
          uint64_t v33 = *(void **)(v28 + 8);
          if (v33 && [v33 length])
          {
            double v34 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v209 + 30) objectForKeyedSubscript:*(void *)(v28 + 8)]);
            int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 analyzerResult]);

            id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 drawCallCost]);
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v32]);
            [v37 doubleValue];
            double v39 = v38;

            *(double *)(v28 + 40) = v39;
            *(double *)(v28 + 48) = v39;
            *(double *)(v28 + 56) = v39;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v39 + *(double *)(v28 + 200);
            unsigned int v40 = [(id)v28 encoderIndex];
            *(double *)v228[3 * v40] = v39 + *(double *)v228[3 * v40];
            unsigned int v41 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v41] + 24LL) = v39 + *(double *)(v228[3 * v41] + 24LL);
          }

          uint8x8_t v42 = *(void **)(v28 + 16);
          if (v42 && [v42 length])
          {
            uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v209 + 31) objectForKeyedSubscript:*(void *)(v28 + 16)]);
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 analyzerResult]);

            __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 drawCallCost]);
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKeyedSubscript:v32]);
            [v46 doubleValue];
            double v48 = v47;

            *(double *)(v28 + 88) = v48;
            *(double *)(v28 + 96) = v48;
            *(double *)(v28 + 104) = v48;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v48 + *(double *)(v28 + 200);
            unsigned int v49 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v49] + 8LL) = v48 + *(double *)(v228[3 * v49] + 8LL);
            unsigned int v50 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v50] + 24LL) = v48 + *(double *)(v228[3 * v50] + 24LL);
          }

          unint64_t v51 = *(void **)(v28 + 24);
          if (v51 && [v51 length])
          {
            id v52 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v209 + 32) objectForKeyedSubscript:*(void *)(v28 + 24)]);
            id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 analyzerResult]);

            unint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v53 drawCallCost]);
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v32]);
            [v55 doubleValue];
            double v57 = v56;

            *(double *)(v28 + 136) = v57;
            *(double *)(v28 + 144) = v57;
            *(double *)(v28 + 152) = v57;
            *(float64x2_t *)(v28 + 184) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v28 + 184));
            *(double *)(v28 + 200) = v57 + *(double *)(v28 + 200);
            unsigned int v58 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v58] + 16LL) = v57 + *(double *)(v228[3 * v58] + 16LL);
            unsigned int v59 = [(id)v28 encoderIndex];
            *(double *)(v228[3 * v59] + 24LL) = v57 + *(double *)(v228[3 * v59] + 24LL);
          }

          *(float64x2_t *)(v209 + 8) = vaddq_f64(*(float64x2_t *)(v28 + 40), *(float64x2_t *)(v209 + 8));
          *((double *)v209 + 3) = *(double *)(v28 + 56) + *((double *)v209 + 3);
          *(float64x2_t *)(v209 + 56) = vaddq_f64(*(float64x2_t *)(v28 + 88), *(float64x2_t *)(v209 + 56));
          *((double *)v209 + 9) = *(double *)(v28 + 104) + *((double *)v209 + 9);
          *(float64x2_t *)(v209 + 104) = vaddq_f64(*(float64x2_t *)(v28 + 136), *(float64x2_t *)(v209 + 104));
          *((double *)v209 + 15) = *(double *)(v28 + 152) + *((double *)v209 + 15);
          *(float64x2_t *)(v209 + 152) = vaddq_f64(*(float64x2_t *)(v28 + 184), *(float64x2_t *)(v209 + 152));
          *((double *)v209 + 21) = *(double *)(v28 + 200) + *((double *)v209 + 21);
        }
      }

      unint64_t v23 = obj;
      id v24 = [obj countByEnumeratingWithState:&v222 objects:v234 count:16];
    }

    while (v24);
  }

  uint64_t v60 = 0LL;
  for (unint64_t k = 0; k < [v209 encoderCount]; ++k)
  {
    int v62 = (void *)objc_claimAutoreleasedReturnValue([v199 objectAtIndexedSubscript:k]);
    unint64_t v63 = v62;
    if (v62)
    {
      [v62 timing];
    }

    else
    {
      memset(v227, 0, sizeof(v227));
      float64x2_t v226 = 0u;
    }

    double v64 = *(double *)(v228[v60] + 8LL);
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectAtIndexedSubscript:k]);
    uint8x8_t v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectAtIndexedSubscript:1]);
    [v67 doubleValue];
    if (v64 != 0.0)
    {
      double v69 = v68 / 1000000000.0;
      if (v69 != 0.0)
      {
        double v70 = v69 / v64;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v70);
        *((double *)&v227[1] + 1) = v70 * *(double *)v227;
      }
    }

    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v198 objectAtIndexedSubscript:k]);
    __int128 v72 = v71;
    if (v71)
    {
      [v71 timing];
    }

    else
    {
      memset(v227, 0, sizeof(v227));
      float64x2_t v226 = 0u;
    }

    double v73 = *(double *)(v228[v60] + 8LL);
    id v74 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
    unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndexedSubscript:k]);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v75 objectAtIndexedSubscript:1]);
    [v76 doubleValue];
    if (v73 != 0.0)
    {
      double v78 = v77 / 1000000000.0;
      if (v78 != 0.0)
      {
        double v79 = v78 / v73;
        *(float64x2_t *)((char *)v227 + 8) = vmulq_n_f64(v226, v79);
        *((double *)&v227[1] + 1) = v79 * *(double *)v227;
      }
    }

    v60 += 3LL;
  }

  __int128 v220 = 0u;
  __int128 v221 = 0u;
  __int128 v218 = 0u;
  __int128 v219 = 0u;
  id v200 = (id)objc_claimAutoreleasedReturnValue([v209 drawCallInfoList]);
  id v80 = [v200 countByEnumeratingWithState:&v218 objects:v233 count:16];
  if (v80)
  {
    uint64_t v201 = *(void *)v219;
    do
    {
      id v203 = v80;
      for (m = 0LL; m != v203; m = (char *)m + 1)
      {
        if (*(void *)v219 != v201) {
          objc_enumerationMutation(v200);
        }
        uint64_t v82 = *(void *)(*((void *)&v218 + 1) + 8LL * (void)m);
        uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue([(id)v82 programInfo]);
        if (v83)
        {
          uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue([(id)v82 programInfo]);
          BOOL v85 = [v84 programId] == (id)-1;

          if (v85) {
            continue;
          }
        }

        int v86 = *(void **)(v82 + 8);
        if (v86 && [v86 length])
        {
          unsigned int v87 = [(id)v82 encoderIndex];
          double v88 = *(double *)v228[3 * v87];
          __int128 v89 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
          id v90 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v89,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
          id v91 = (void *)objc_claimAutoreleasedReturnValue([v90 objectAtIndexedSubscript:0]);
          [v91 doubleValue];
          if (v88 != 0.0)
          {
            double v93 = v92 / 1000000000.0;
            if (v93 != 0.0)
            {
              double v94 = v93 / v88;
              double v95 = v94 * *(double *)(v82 + 56);
              *(float64x2_t *)(v82 + 64) = vmulq_n_f64(*(float64x2_t *)(v82 + 40), v94);
              *(double *)(v82 + 80) = v95;
            }
          }
        }

        __int128 v96 = *(void **)(v82 + 16);
        if (v96 && [v96 length])
        {
          unsigned int v97 = [(id)v82 encoderIndex];
          double v98 = *(double *)(v228[3 * v97] + 8LL);
          __int128 v99 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
          __int128 v100 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v99,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
          unsigned int v101 = (void *)objc_claimAutoreleasedReturnValue([v100 objectAtIndexedSubscript:1]);
          [v101 doubleValue];
          if (v98 != 0.0)
          {
            double v103 = v102 / 1000000000.0;
            if (v103 != 0.0)
            {
              double v104 = v103 / v98;
              double v105 = v104 * *(double *)(v82 + 104);
              *(float64x2_t *)(v82 + 112) = vmulq_n_f64(*(float64x2_t *)(v82 + 88), v104);
              *(double *)(v82 + 128) = v105;
            }
          }
        }

        __int128 v106 = *(void **)(v82 + 24);
        if (v106 && [v106 length])
        {
          unsigned int v107 = [(id)v82 encoderIndex];
          double v108 = *(double *)(v228[3 * v107] + 16LL);
          int8x8_t v109 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
          uint8x8_t v110 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v109,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
          unint64_t v111 = (void *)objc_claimAutoreleasedReturnValue([v110 objectAtIndexedSubscript:2]);
          [v111 doubleValue];
          if (v108 != 0.0)
          {
            double v113 = v112 / 1000000000.0;
            if (v113 != 0.0)
            {
              double v114 = v113 / v108;
              double v115 = v114 * *(double *)(v82 + 152);
              *(float64x2_t *)(v82 + 160) = vmulq_n_f64(*(float64x2_t *)(v82 + 136), v114);
              *(double *)(v82 + 176) = v115;
            }
          }
        }

        unsigned int v116 = [(id)v82 encoderIndex];
        double v117 = *(double *)(v228[3 * v116] + 24LL);
        id obja = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
        unint64_t v118 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( obja,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
        uint64_t v119 = (void *)objc_claimAutoreleasedReturnValue([v118 objectAtIndexedSubscript:0]);
        [v119 doubleValue];
        double v121 = v120;
        __int128 v122 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
        unint64_t v123 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v122,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
        uint64_t v124 = (void *)objc_claimAutoreleasedReturnValue([v123 objectAtIndexedSubscript:1]);
        [v124 doubleValue];
        double v126 = v125;
        uint64_t v127 = (void *)objc_claimAutoreleasedReturnValue([v209 effectiveKickTimes]);
        unint64_t v128 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v127,  "objectAtIndexedSubscript:",  objc_msgSend((id)v82, "encoderIndex")));
        uint64_t v129 = (void *)objc_claimAutoreleasedReturnValue([v128 objectAtIndexedSubscript:2]);
        [v129 doubleValue];
        if (v117 != 0.0)
        {
          double v131 = (v121 + v126 + v130) / 1000000000.0;
          if (v131 != 0.0)
          {
            double v132 = v131 / v117;
            double v133 = v132 * *(double *)(v82 + 200);
            *(float64x2_t *)(v82 + 208) = vmulq_n_f64(*(float64x2_t *)(v82 + 184), v132);
            *(double *)(v82 + 224) = v133;
          }
        }
      }

      id v80 = [v200 countByEnumeratingWithState:&v218 objects:v233 count:16];
    }

    while (v80);
  }

  double v134 = *((double *)v209 + 19);
  if (v134 == 0.0 || v22 / 1000000000.0 == 0.0)
  {
    objb[0] = *((id *)v209 + 19);
    unint64_t v136 = v209;
    v138.f64[0] = *((float64_t *)v209 + 22);
  }

  else
  {
    double v135 = v22 / 1000000000.0 / v134;
    unint64_t v136 = v209;
    double v137 = v135 * *((double *)v209 + 21);
    *(_OWORD *)objb = *(_OWORD *)(v209 + 152);
    float64x2_t v138 = vmulq_n_f64(*(float64x2_t *)objb, v135);
    *((float64x2_t *)v209 + 11) = v138;
    *((double *)v209 + 24) = v137;
  }

  double v139 = v138.f64[0] * 1000000000.0;
  if (v139 >= 1.0) {
    double v140 = v139;
  }
  else {
    double v140 = 1.0;
  }
  v141 = (void *)objc_claimAutoreleasedReturnValue([v136 blitTimeData]);
  BOOL v142 = v141 == 0LL;

  double v143 = *(double *)objb / v140;
  if (v142)
  {
    double v148 = 0.0;
  }

  else
  {
    __int128 v216 = 0u;
    __int128 v217 = 0u;
    __int128 v214 = 0u;
    __int128 v215 = 0u;
    uint64_t v144 = (void *)objc_claimAutoreleasedReturnValue([v209 drawCallInfoList]);
    id v145 = [v144 countByEnumeratingWithState:&v214 objects:v232 count:16];
    if (v145)
    {
      unsigned int v146 = 0;
      uint64_t v147 = *(void *)v215;
      double v148 = 0.0;
      do
      {
        for (n = 0LL; n != v145; n = (char *)n + 1)
        {
          if (*(void *)v215 != v147) {
            objc_enumerationMutation(v144);
          }
          uint64_t v150 = *(void *)(*((void *)&v214 + 1) + 8LL * (void)n);
          uint64_t v151 = (void *)objc_claimAutoreleasedReturnValue([(id)v150 programInfo]);
          if (v151)
          {
            unsigned int v154 = (void *)objc_claimAutoreleasedReturnValue([(id)v150 programInfo]);
            BOOL v155 = [v154 programId] == (id)-1;

            if (v155)
            {
              unsigned int v156 = (void *)objc_claimAutoreleasedReturnValue([v209 blitTimeData]);
              BOOL v157 = (unint64_t)[v156 count] > v146;

              if (v157)
              {
                int v158 = (void *)objc_claimAutoreleasedReturnValue([v209 blitTimeData]);
                unint64_t v159 = (void *)objc_claimAutoreleasedReturnValue([v158 objectAtIndexedSubscript:v146]);
                [v159 doubleValue];
                double v161 = v160;

                ++v146;
                double v152 = v143 * v161;
                *(double *)(v150 + 184) = v143 * v161;
                *(double *)(v150 + 192) = v143 * v161;
                *(double *)(v150 + 200) = v143 * v161;
                double v148 = v148 + v161;
                if (v143 * v161 != 0.0)
                {
                  v153.f64[0] = v161 / 1000000000.0;
                  if (v161 / 1000000000.0 != 0.0)
                  {
                    double v162 = v153.f64[0] / v152;
                    double v152 = v162 * v152;
                    float64x2_t v153 = vmulq_n_f64(*(float64x2_t *)(v150 + 184), v162);
                    *(float64x2_t *)(v150 + 208) = v153;
                    *(double *)(v150 + 224) = v152;
                  }
                }
              }
            }
          }
        }

        id v145 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v214, v232, 16, v152, v153.f64[0]);
      }

      while (v145);
    }

    else
    {
      double v148 = 0.0;
    }
  }

  double v163 = v143 * v148 + *((double *)v209 + 19);
  *((double *)v209 + 19) = v163;
  *((double *)v209 + 20) = v163;
  *((double *)v209 + 21) = v163;
  [v209 gpuTime];
  if (v163 != 0.0 && v164 != 0.0)
  {
    double v165 = v164 / v163;
    double v166 = v165 * *((double *)v209 + 21);
    *((float64x2_t *)v209 + 11) = vmulq_n_f64(*(float64x2_t *)(v209 + 152), v165);
    *((double *)v209 + 24) = v166;
  }

  objc = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v209 encoderCount]));
  char v202 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v197 + 48) objectForKeyedSubscript:@"activePerEncoderDrawCallCount"]);
  for (iunint64_t i = 0; ii < (unint64_t)[v202 count]; ++ii)
  {
    double v168 = (void *)objc_claimAutoreleasedReturnValue([v202 objectAtIndexedSubscript:ii]);
    unsigned int v169 = [v168 unsignedIntValue];

    int v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v169));
    id v171 = [&off_59F938 mutableCopy];
    [v170 addObject:v171];

    if (v169 >= 2)
    {
      uint64_t v172 = v169 - 1LL;
      do
      {
        id v173 = [&off_59F950 mutableCopy];
        [v170 addObject:v173];

        --v172;
      }

      while (v172);
    }

    [objc addObject:v170];
  }

  __int128 v212 = 0u;
  __int128 v213 = 0u;
  __int128 v210 = 0u;
  __int128 v211 = 0u;
  uint64_t v174 = (void *)objc_claimAutoreleasedReturnValue([v209 drawCallInfoList]);
  id v204 = v174;
  id v175 = [v174 countByEnumeratingWithState:&v210 objects:v231 count:16];
  if (v175)
  {
    unsigned int v176 = 0;
    uint64_t v177 = *(void *)v211;
    unsigned int v178 = -1;
    do
    {
      for (junint64_t j = 0LL; jj != v175; junint64_t j = (char *)jj + 1)
      {
        if (*(void *)v211 != v177) {
          objc_enumerationMutation(v204);
        }
        uint64_t v180 = *(void *)(*((void *)&v210 + 1) + 8LL * (void)jj);
        uint64_t v181 = (void *)objc_claimAutoreleasedReturnValue([(id)v180 programInfo]);
        if (v181)
        {
          id v182 = (void *)objc_claimAutoreleasedReturnValue([(id)v180 programInfo]);
          BOOL v183 = [v182 programId] == (id)-1;

          if (v183) {
            continue;
          }
        }

        if ([(id)v180 encoderIndex] == v178)
        {
          ++v176;
        }

        else
        {
          unsigned int v178 = [(id)v180 encoderIndex];
          unsigned int v176 = 0;
        }

        if ((unint64_t)[objc count] > v178)
        {
          uint64_t v184 = *(void **)(v180 + 8);
          if (v184 && [v184 length])
          {
            uint64_t v185 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(v180 + 64) * 1000000000.0));
            uint64_t v186 = (void *)objc_claimAutoreleasedReturnValue([objc objectAtIndexedSubscript:v178]);
            int v187 = (void *)objc_claimAutoreleasedReturnValue([v186 objectAtIndexedSubscript:v176]);
            [v187 setObject:v185 atIndexedSubscript:0];
          }

          id v188 = *(void **)(v180 + 16);
          if (v188 && [v188 length])
          {
            v189 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(v180 + 112) * 1000000000.0));
            id v190 = (void *)objc_claimAutoreleasedReturnValue([objc objectAtIndexedSubscript:v178]);
            v191 = (void *)objc_claimAutoreleasedReturnValue([v190 objectAtIndexedSubscript:v176]);
            [v191 setObject:v189 atIndexedSubscript:1];
          }

          id v192 = *(void **)(v180 + 24);
          if (v192 && [v192 length])
          {
            unint64_t v193 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(v180 + 160) * 1000000000.0));
            id v194 = (void *)objc_claimAutoreleasedReturnValue([objc objectAtIndexedSubscript:v178]);
            v195 = (void *)objc_claimAutoreleasedReturnValue([v194 objectAtIndexedSubscript:v176]);
            [v195 setObject:v193 atIndexedSubscript:2];
          }
        }
      }

      uint64_t v174 = v204;
      id v175 = [v204 countByEnumeratingWithState:&v210 objects:v231 count:16];
    }

    while (v175);
  }

  [v209 setEffectivePerEncoderDrawKickTimes:objc];
  *(void *)&v226.f64[0] = &v228;
  std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v226);
}

- (void)_handlePerDrawCounterData
{
  if ((*((_BYTE *)self->_options + 16) & 1) == 0)
  {
    -[GTShaderProfilerHelper _analyzeShaderBinarySamplesForResult:forShaderKeyToSourcePath:]( self,  "_analyzeShaderBinarySamplesForResult:forShaderKeyToSourcePath:",  self->_streamingMTLResult,  0LL);
    -[GTShaderProfilerHelper _calculatePerDrawCosts:](self, "_calculatePerDrawCosts:", self->_streamingMTLResult);
    if ((*((_BYTE *)self->_options + 17) & 0x10) != 0)
    {
      uint64_t v44 = self;
      if (g_runningInCI)
      {
        unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"includePerDrawTimings now processing"));
        id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

        id v5 = __stdoutp;
        id v6 = v4;
        fprintf(v5, "#CI-INFO# %s\n", (const char *)[v6 UTF8String]);
      }

      uint64_t v7 = v44->_streamingMTLResult;
      uint64_t v43 = v7;
      if (g_runningInCI)
      {
        int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"includePerDrawTimings: strongSelf is %p, result is %p",  v44,  v7));
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

        id v10 = __stdoutp;
        id v11 = v9;
        fprintf(v10, "#CI-INFO# %s\n", (const char *)[v11 UTF8String]);

        uint64_t v7 = v43;
      }

      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[DYShaderProfilerResult effectivePerEncoderDrawKickTimes](v7, "effectivePerEncoderDrawKickTimes"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v44->_payload,  "objectForKeyedSubscript:",  @"totalDrawCount"));
      unsigned int v13 = [v12 unsignedIntValue];

      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v44->_payload,  "objectForKeyedSubscript:",  @"activePerEncoderDrawCallCount"));
      uint8x8_t v42 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v44->_payload,  "objectForKeyedSubscript:",  @"perEncoderKickCount"));
      double v47 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v13);
      id v14 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v13);
      id v15 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v13);
      double v16 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v13);
      id v17 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v13);
      for (unint64_t i = 0; i < (unint64_t)[v46 count]; ++i)
      {
        double v19 = (void *)objc_claimAutoreleasedReturnValue([v46 objectAtIndexedSubscript:i]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v45 objectAtIndexedSubscript:i]);
        unsigned int v21 = [v20 unsignedIntValue];

        if (v21)
        {
          for (unint64_t j = 0; j < (unint64_t)[v19 count]; ++j)
          {
            unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:j]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
            -[NSMutableArray addObject:](v47, "addObject:", v24);

            int v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
            -[NSMutableArray addObject:](v14, "addObject:", v25);

            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:2]);
            -[NSMutableArray addObject:](v15, "addObject:", v26);

            double v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  i));
            -[NSMutableArray addObject:](v16, "addObject:", v27);

            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  j));
            -[NSMutableArray addObject:](v17, "addObject:", v28);
          }
        }

        else if ([v19 count] != (char *)&dword_0 + 1)
        {
          unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Encoder %lu should be empty, expecting dummy draw call but found %lu",  i,  [v19 count]));
          double v30 = __stdoutp;
          int v31 = g_runningInCI;
          id v32 = v29;
          uint64_t v33 = (const char *)[v32 UTF8String];
          double v34 = "#CI_ERROR# ";
          if (!v31) {
            double v34 = "";
          }
          fprintf(v30, "%s%s %u: %s\n", v34, "-[GTShaderProfilerHelper _handlePerDrawCounterData]", 3296, v33);
          id v35 = v32;
          GTMTLReplay_handleError( 101,  (uint64_t)[v35 UTF8String],  "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/profile/GTShaderProfilerHelper.mm",  (uint64_t)"-[GTShaderProfilerHelper _handlePerDrawCounterData]",  3296,  1);
        }
      }

      v50[0] = @"vertex";
      id v36 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:]( v44,  "convertBinaryInfoToJSONDictionary:",  v43->super._vertexShaderBinaryInfo));
      v51[0] = v36;
      v50[1] = @"fragment";
      id v37 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:]( v44,  "convertBinaryInfoToJSONDictionary:",  v43->super._fragmentShaderBinaryInfo));
      v51[1] = v37;
      v50[2] = @"compute";
      double v38 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper convertBinaryInfoToJSONDictionary:]( v44,  "convertBinaryInfoToJSONDictionary:",  v43->super._computeKernelBinaryInfo));
      v51[2] = v38;
      double v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  3LL));

      v48[0] = @"GPUTime_vtx";
      v48[1] = @"GPUTime_frg";
      v49[0] = v47;
      v49[1] = v14;
      v48[2] = @"GPUTime_cmp";
      v48[3] = @"encoder";
      v49[2] = v15;
      v49[3] = v16;
      v48[4] = @"drawIndexInEncoder";
      v48[5] = @"activePerEncoderDrawCallCount";
      v49[4] = v17;
      v49[5] = v45;
      v48[6] = @"perEncoderKickCount";
      v49[6] = v42;
      unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  7LL));
      unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(-[DYShaderProfilerResult derivedCountersData](v43, "derivedCountersData"));
      -[GTShaderProfilerHelper _processDerivedEncoderCounterData:forDerivedEncoderData:withEffectivePerDrawKickTimes:withShaderInfo:]( v44,  "_processDerivedEncoderCounterData:forDerivedEncoderData:withEffectivePerDrawKickTimes:withShaderInfo:",  v43,  v41,  v40,  v39);
    }
  }

- (id)convertBinaryInfoToJSONDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (unint64_t i = 0LL; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v14));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 analyzerResult]);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 perFileLineCostDictForCI]);

          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v9);
        }

        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }
  }

  else
  {
    id v4 = (NSMutableDictionary *)&__NSDictionary0__struct;
  }

  return v4;
}

- (void)processStreamingGRCData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke;
  v7[3] = &unk_58EBA8;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v7));
  -[NSOperation addDependency:](self->waitOperation, "addDependency:", v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v6);
  [v6 waitUntilFinished];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)waitForCompletion
{
  if ((*((_BYTE *)self->_options + 16) & 0x40) != 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue( [v3 contentsOfDirectoryAtPath:@"/tmp/com.apple.gputools.profiling/shaderProfilerResults/" error:0]);
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (unint64_t i = 0LL; i != v5; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          id v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/",  "stringByAppendingPathComponent:",  v8,  (void)v11));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([self->_options->var0 stringByAppendingPathComponent:v8]);
          [v3 moveItemAtPath:v9 toPath:v10 error:0];
        }

        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v5);
    }
  }

  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, 0LL);
}

- (void)_addDerivedCounterDataToTimelineInfo:(id)a3 usingShaderProfilerResult:(id)a4
{
  id v5 = a3;
  id v39 = a4;
  uint64_t v43 = (void *)objc_opt_new(&OBJC_CLASS___DYGPUDerivedEncoderCounterInfo, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"derivedCounterData"]);
  id v49 = v5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"counters"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  unsigned int v40 = v9;
  id v10 = [v9 copy];
  [v43 setDerivedCounterNames:v10];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"derivedCounterData"]);
  uint8x8_t v42 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"AverageSamples"]);

  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithCapacity:]( NSMutableData,  "dataWithCapacity:",  8 * (void)[v9 count] * (void)objc_msgSend(v42, "count")));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v42;
  id v12 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v12)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v13 = 0LL;
      id v47 = v12;
      do
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(obj);
        }
        __int128 v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
        unint64_t v15 = (unint64_t)[v14 count];
        if (v15)
        {
          if (v15 >> 61) {
            abort();
          }
          __int128 v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v15);
          id v18 = &v16[8 * v17];
          double v19 = v16;
        }

        else
        {
          double v19 = 0LL;
          id v18 = 0LL;
        }

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id v20 = v14;
        id v21 = [v20 countByEnumeratingWithState:&v50 objects:v58 count:16];
        uint64_t v48 = v13;
        if (v21)
        {
          uint64_t v22 = *(void *)v51;
          unint64_t v23 = v19;
          do
          {
            for (unint64_t i = 0LL; i != v21; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v51 != v22) {
                objc_enumerationMutation(v20);
              }
              [*(id *)(*((void *)&v50 + 1) + 8 * (void)i) doubleValue];
              uint64_t v26 = v25;
              if (v23 >= v18)
              {
                uint64_t v27 = (v23 - v19) >> 3;
                unint64_t v28 = v27 + 1;
                if ((v18 - v19) >> 2 > v28) {
                  unint64_t v28 = (v18 - v19) >> 2;
                }
                else {
                  unint64_t v29 = v28;
                }
                if (v29) {
                  unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v29);
                }
                else {
                  uint64_t v30 = 0LL;
                }
                int v31 = (char *)(v29 + 8 * v27);
                *(void *)int v31 = v26;
                id v32 = v31 + 8;
                while (v23 != v19)
                {
                  uint64_t v33 = *((void *)v23 - 1);
                  v23 -= 8;
                  *((void *)v31 - 1) = v33;
                  v31 -= 8;
                }

                id v18 = (char *)(v29 + 8 * v30);
                if (v19) {
                  operator delete(v19);
                }
                double v19 = v31;
                unint64_t v23 = v32;
                id v5 = v49;
              }

              else
              {
                *(void *)unint64_t v23 = v25;
                v23 += 8;
              }
            }

            id v21 = [v20 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }

          while (v21);
        }

        else
        {
          unint64_t v23 = v19;
        }

        [v46 appendBytes:v19 length:v23 - v19];
        if (v19) {
          operator delete(v19);
        }
        uint64_t v13 = v48 + 1;
      }

      while ((id)(v48 + 1) != v47);
      id v12 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }

    while (v12);
  }

  [v43 setDerivedCounters:v46];
  double v34 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"GPU Encoder Info"]);
  [v43 setEncoderInfos:v34];

  id v35 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Timebase"]);
  id v36 = v35;
  if (v35 && [v35 count] == (char *)&dword_0 + 2)
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 firstObject]);
    -[DYWorkloadGPUTimelineInfo setTimeBaseNumerator:]( self->_workloadTimelineInfo,  "setTimeBaseNumerator:",  [v37 unsignedIntValue]);

    double v38 = (void *)objc_claimAutoreleasedReturnValue([v36 lastObject]);
    -[DYWorkloadGPUTimelineInfo setTimeBaseDenominator:]( self->_workloadTimelineInfo,  "setTimeBaseDenominator:",  [v38 unsignedIntValue]);
  }

  else
  {
    -[DYWorkloadGPUTimelineInfo setTimeBaseNumerator:](self->_workloadTimelineInfo, "setTimeBaseNumerator:", 125LL);
    -[DYWorkloadGPUTimelineInfo setTimeBaseDenominator:](self->_workloadTimelineInfo, "setTimeBaseDenominator:", 3LL);
  }

  -[DYWorkloadGPUTimelineInfo setDerivedEncoderCounterInfo:]( self->_workloadTimelineInfo,  "setDerivedEncoderCounterInfo:",  v43);
}

- (void)processGPUTimelineDataSources:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  __int128 v11 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  uint64_t v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:]( self,  "_gatherStaticInformation:forReplayController:",  a3,  a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke;
  v20[3] = &unk_58E4E0;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  unint64_t v15 = objc_retainBlock(v20);
  __int128 v16 = (uint64_t *)operator new(8uLL);
  MTLGRCStreamingSampleHelper::MTLGRCStreamingSampleHelper(v16, v15, 2);
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, v16);
  id v18 = (DYPMTLShaderProfilerHelper *)objc_opt_new(&OBJC_CLASS___DYPMTLShaderProfilerHelper, v17);
  shaderProfilerHelper = self->_shaderProfilerHelper;
  self->_shaderProfilerHelper = v18;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_dumpGPUTimelineDataResult:(id)a3
{
  id v4 = a3;
  id v50 = (id)objc_claimAutoreleasedReturnValue([self->_options->var0 stringByAppendingPathComponent:@"aggregatedGPUTimeline.txt"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatedGPUTimelineInfo]);
  id v6 = objc_claimAutoreleasedReturnValue([v5 timestamps]);
  id v7 = [v6 bytes];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatedGPUTimelineInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 derivedCounterNames]);
  LODWORD(v6) = [v9 count];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatedGPUTimelineInfo]);
  id v11 = objc_claimAutoreleasedReturnValue([v10 derivedCounters]);
  id v12 = [v11 bytes];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v50 stringByDeletingLastPathComponent]);
  [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];

  id v49 = v50;
  unint64_t v15 = fopen((const char *)[v49 UTF8String], "wt");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatedGPUTimelineInfo]);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  _OWORD v60[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke;
  v60[3] = &unk_58E508;
  int v62 = v15;
  id v63 = v7;
  int v65 = (int)v6;
  id v17 = v4;
  id v61 = v17;
  id v64 = v12;
  [v16 enumerateActiveShadersForAllSamples:v60];

  fclose(v15);
  for (unint64_t i = 0LL; ; ++i)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v17 mGPUTimelineInfos]);
    id v20 = [v19 count];

    id var0 = self->_options->var0;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gpuTimeline_%lu.txt",  i));
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([var0 stringByAppendingPathComponent:v22]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v17 mGPUTimelineInfos]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:i]);
    id v26 = objc_claimAutoreleasedReturnValue([v25 timestamps]);
    id v27 = [v26 bytes];

    unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v17 mGPUTimelineInfos]);
    unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:i]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 derivedCounterNames]);
    LODWORD(v24) = [v30 count];

    int v31 = (void *)objc_claimAutoreleasedReturnValue([v17 mGPUTimelineInfos]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndexedSubscript:i]);
    id v33 = objc_claimAutoreleasedReturnValue([v32 derivedCounters]);
    id v34 = [v33 bytes];

    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByDeletingLastPathComponent]);
    [v35 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:0 error:0];

    id v37 = v23;
    double v38 = fopen((const char *)[v37 UTF8String], "wt");
    id v39 = (void *)objc_claimAutoreleasedReturnValue([v17 mGPUTimelineInfos]);
    unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndexedSubscript:i]);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2;
    v54[3] = &unk_58E508;
    __int128 v56 = v38;
    id v57 = v27;
    int v59 = (int)v24;
    id v55 = v17;
    id v58 = v34;
    [v40 enumerateActiveShadersForAllSamples:v54];

    fclose(v38);
  }

  unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue([v17 derivedEncoderCounterInfo]);
  uint8x8_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 derivedCounterNames]);

  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingPathComponent:@"gpuTimeline_derivedEncoderData.txt"]);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByDeletingLastPathComponent]);
  [v44 createDirectoryAtPath:v45 withIntermediateDirectories:1 attributes:0 error:0];

  id v46 = v43;
  id v47 = fopen((const char *)[v46 UTF8String], "wt");
  fprintf( v47,  "TimeBase = %u/%u\n",  [v17 timeBaseNumerator],  objc_msgSend(v17, "timeBaseDenominator"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3;
  void v51[3] = &unk_58E530;
  __int128 v53 = v47;
  id v48 = v42;
  id v52 = v48;
  [v17 enumerateEncoderDerivedData:v51];
  fclose(v47);
}

- (void)writeGPUTimelineSerializedData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([self->_options->var0 stringByAppendingPathComponent:@"WorkloadArchive.data"]);
  workloadTimelineInfo = self->_workloadTimelineInfo;
  id v7 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  workloadTimelineInfo,  1LL,  &v7));
  id v6 = v7;
  [v5 writeToFile:v3 atomically:0];
}

- (void)profileShadersForDataSource:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  id v11 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  int v26 = 0;
  uint64_t v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:]( self,  "_gatherStaticInformation:forReplayController:",  a3,  a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self->_streamingMTLResult);
  objc_initWeak(&from, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke;
  v20[3] = &unk_58E558;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  void v20[4] = v25;
  unint64_t v15 = objc_retainBlock(v20);
  __int128 v16 = (uint64_t *)operator new(8uLL);
  MTLGRCStreamingSampleHelper::MTLGRCStreamingSampleHelper(v16, v15, *((_DWORD *)self->_options + 4) & 1);
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, v16);
  id v18 = (DYPMTLShaderProfilerHelper *)objc_opt_new(&OBJC_CLASS___DYPMTLShaderProfilerHelper, v17);
  shaderProfilerHelper = self->_shaderProfilerHelper;
  self->_shaderProfilerHelper = v18;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v25, 8);
}

- (void)profileBatchIdFilteredData:(const GTMTLReplayDataSource *)a3 withPayload:(id)a4 forReplayController:(const GTMTLReplayController *)a5
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_payload, a4);
  id v11 = (NSMutableDictionary *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v10);
  shaderSourcePath = self->_shaderSourcePath;
  self->_shaderSourcePath = v11;

  uint64_t v13 = (DYMTLShaderProfilerResult *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _gatherStaticInformation:forReplayController:]( self,  "_gatherStaticInformation:forReplayController:",  a3,  a5));
  streamingMTLResult = self->_streamingMTLResult;
  self->_streamingMTLResult = v13;

  objc_initWeak(&location, self);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"activePerEncoderDrawCallCount"]);
  __int128 v16 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v15 count]);
  batchIdPartialResults = self->_batchIdPartialResults;
  self->_batchIdPartialResults = v16;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke;
  v23[3] = &unk_58E580;
  objc_copyWeak(&v24, &location);
  id v18 = objc_retainBlock(v23);
  double v19 = (uint64_t *)operator new(8uLL);
  MTLGRCStreamingSampleHelper::MTLGRCStreamingSampleHelper(v19, v18, 1);
  std::unique_ptr<MTLGRCStreamingSampleHelper>::reset[abi:nn180100]((uint64_t **)&self->_streamingHelper, v19);
  id v21 = (DYPMTLShaderProfilerHelper *)objc_opt_new(&OBJC_CLASS___DYPMTLShaderProfilerHelper, v20);
  shaderProfilerHelper = self->_shaderProfilerHelper;
  self->_shaderProfilerHelper = v21;

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_calculateFrameTime:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v5;
    unint64_t v8 = 0LL;
    id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v8 += (unint64_t)objc_msgSend( *(id *)(*((void *)&v12 + 1) + 8 * (void)v11),  "unsignedLongLongValue",  (void)v12);
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }

    objc_msgSend(v6, "setFrameTime:", v8 / (unint64_t)objc_msgSend(v7, "count"));
  }
}

- (void)_generateSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 andBatchIndexMax:(unsigned int)a6 andMinIndex:(unsigned int)a7 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a8 withUSCSampleList:(DYMTLShaderProfilerUSCSample *)a9 withUSCSampleNum:(unsigned int)a10 withBatchIDToEncoderIndex:(void *)a11 andEncoderIndexToBatchIdMap:(void *)a12
{
  __int128 v14 = (id *)a3;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 drawCallInfoList]);
  unint64_t v16 = (unint64_t)[v15 count];
  unint64_t v17 = v16;
  double v98 = 0LL;
  __int128 v99 = 0LL;
  __int128 v100 = 0LL;
  if (v16)
  {
    if (v16 >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    double v98 = (char *)operator new(24 * v16);
    __int128 v100 = &v98[24 * v17];
    size_t v18 = 24 * ((24 * v17 - 24) / 0x18) + 24;
    bzero(v98, v18);
    __int128 v99 = &v98[v18];
  }

  unsigned int v91 = a6;
  double v19 = a9;

  unsigned int v20 = 0;
  double v93 = v14;
  unsigned int v94 = a5;
  while (1)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 drawCallInfoList]);
    id v22 = [v21 count];
    unsigned int v23 = v20;

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v14 drawCallInfoList]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v20]);
    int v26 = &v98[24 * v20];

    id v27 = v26 + 8;
    unint64_t v28 = (void *)*((void *)v26 + 1);
    unint64_t v29 = *(void **)v26;
    uint64_t v30 = (uint64_t)v28 - *(void *)v26;
    if ((unint64_t)v30 > 0x2F)
    {
      if (v30 != 48)
      {
        id v46 = v29 + 6;
        while (v28 != v46)
        {
          id v47 = (void *)*--v28;
        }

        *id v27 = v46;
      }
    }

    else
    {
      uint64_t v31 = v30 >> 3;
      unint64_t v32 = 6 - (v30 >> 3);
      id v33 = &v98[24 * v20];
      uint64_t v36 = *((void *)v33 + 2);
      id v35 = v33 + 16;
      uint64_t v34 = v36;
      if (v32 <= (v36 - (uint64_t)v28) >> 3)
      {
        id v48 = &v28[v32];
        uint64_t v49 = 48 - 8 * v31;
        double v19 = a9;
        do
        {
          *v28++ = 0LL;
          v49 -= 8LL;
        }

        while (v49);
        *id v27 = v48;
        a5 = v94;
      }

      else
      {
        uint64_t v37 = v34 - (void)v29;
        uint64_t v38 = v37 >> 2;
        else {
          unint64_t v39 = v38;
        }
        if (v39 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unsigned int v40 = operator new(8 * v39);
        unsigned int v41 = (char *)&v40[v31];
        do
          v40[v31++] = 0LL;
        while (v31 != 6);
        uint8x8_t v42 = (void *)*v27;
        uint64_t v43 = *(void **)v26;
        if (*v27 == *(void *)v26)
        {
          int64x2_t v45 = vdupq_n_s64((unint64_t)v42);
          a5 = v94;
        }

        else
        {
          a5 = v94;
          do
          {
            uint64_t v44 = *--v42;
            void *v42 = 0LL;
            *((void *)v41 - 1) = v44;
            v41 -= 8;
          }

          while (v42 != v43);
          int64x2_t v45 = *(int64x2_t *)v26;
        }

        *(void *)int v26 = v41;
        *id v27 = v40 + 6;
        *id v35 = &v40[v39];
        id v50 = (char *)v45.i64[1];
        __int128 v51 = (char *)v45.i64[0];
        while (v50 != v51)
        {
          id v52 = (void *)*((void *)v50 - 1);
          v50 -= 8;
        }

        __int128 v14 = v93;
        double v19 = a9;
        if (v51) {
          operator delete(v51);
        }
      }
    }

    uint64_t v53 = objc_claimAutoreleasedReturnValue([v14[30] objectForKeyedSubscript:v25[1]]);
    __int128 v54 = *(void **)(*(void *)v26 + 8LL);
    *(void *)(*(void *)v26 + 8LL) = v53;

    uint64_t v55 = objc_claimAutoreleasedReturnValue([v14[31] objectForKeyedSubscript:v25[2]]);
    __int128 v56 = *(void **)(*(void *)v26 + 16LL);
    *(void *)(*(void *)v26 + 16LL) = v55;

    uint64_t v57 = objc_claimAutoreleasedReturnValue([v14[32] objectForKeyedSubscript:v25[3]]);
    id v58 = *(void **)(*(void *)v26 + 24LL);
    *(void *)(*(void *)v26 + 24LL) = v57;

    unsigned int v20 = v23 + 1;
  }

  int v59 = (void *)objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingPathComponent:@"/uscSamplingProcessedSample.txt"]);
  uint64_t v60 = v59;
  unsigned int v61 = v91;
  if ((*((_BYTE *)self->_options + 16) & 0x40) != 0) {
    int v62 = fopen((const char *)[v59 UTF8String], "wt");
  }
  else {
    int v62 = 0LL;
  }
  if (a10)
  {
    uint64_t v63 = 0LL;
    unsigned int v87 = v60;
    do
    {
      id v64 = &v19[v63];
      unsigned int var0 = v64->var0;
      if (v64->var0 != -1)
      {
        uint64_t v66 = &v19[v63];
        unsigned int v68 = v66->var1.var0.var0.var0;
        p_unint64_t var1 = &v66->var1;
        if (v68)
        {
          if (var0 < a5 || var0 > v61)
          {
            if (v62) {
              fprintf(v62, "%5u | %5u | batch index is out of range\n", v63, var0);
            }
          }

          else
          {
            unsigned int v70 = *(_DWORD *)(*(void *)a11 + 4LL * (var0 - a5));
            unsigned int v97 = v70;
            if (v70 != -1)
            {
              unsigned int v71 = *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)a12,  v70,  &v97)
                    + 5);
              unint64_t v72 = v71 - a5;
              if (v71 >= a5 && 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3) > v72)
              {
                uint64_t v73 = *(void *)a4 + 24LL * v72;
                unint64_t v75 = *(unsigned __int8 ***)v73;
                id v74 = *(unsigned __int8 ***)(v73 + 8);
                if (v75 == v74)
                {
LABEL_57:
                  uint64_t v60 = v87;
                  if (v62) {
                    fprintf( v62,  "%5u | %5u | PC (0x%0.8x) is not within any program\n",  v63,  v64->var0,  p_var1->var0.var1);
                  }
                }

                else
                {
                  unint64_t var1 = p_var1->var0.var1;
                  while (1)
                  {
                    double v77 = *v75;
                    if (*((void *)*v75 + 1) <= var1 && *((void *)v77 + 2) > var1) {
                      break;
                    }
                    if (++v75 == v74) {
                      goto LABEL_57;
                    }
                  }

                  unint64_t v78 = *((unsigned int *)v77 + 1);
                  __int128 v89 = (void *)objc_claimAutoreleasedReturnValue([v93 drawCallInfoList]);
                  unint64_t v79 = v78 % (unint64_t)[v89 count];

                  id v80 = *(id *)(*(void *)&v98[24 * v79] + 8LL * **v75);
                  int v81 = p_var1->var0.var1 - *((_DWORD *)*v75 + 2);
                  HIDWORD(v95) = p_var1->var0.var0.var0;
                  int v96 = v81;
                  int v86 = v79;
                  LODWORD(v95) = v79;
                  id v90 = v80;
                  unsigned int v61 = v91;
                  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue([v80 uscSamples]);

                  if (!v82)
                  {
                    uint64_t v84 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, v83);
                    [v90 setUscSamples:v84];
                  }

                  BOOL v85 = (void *)objc_claimAutoreleasedReturnValue([v90 uscSamples]);
                  [v85 appendBytes:&v95 length:20];

                  if (v62) {
                    fprintf( v62,  "%5u | %5u(%5u) | %5u (%u) | %2u 0x%0.8x\n",  v63,  v64->var0,  v71,  v86,  **v75,  HIDWORD(v95),  v96);
                  }

                  uint64_t v60 = v87;
                }
              }
            }

            __int128 v14 = v93;
          }
        }
      }

      ++v63;
    }

    while (v63 != a10);
  }

  if (v62) {
    fclose(v62);
  }

  double v95 = &v98;
  std::vector<std::vector<ShaderBinaryInfo * {__strong}>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);
}

- (void)_saveAddressList:(DYMTLShaderProfilerProgramAddress *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  id v7 = fopen(a5, "wt");
  if (v7)
  {
    unint64_t v8 = v7;
    fwrite("Index : ProgramType BatchIdx FunctionIdx [Start - End]\n", 0x37uLL, 1uLL, v7);
    if (a4)
    {
      uint64_t v9 = 0LL;
      p_unint64_t var1 = &a3->var1;
      do
      {
        unsigned int v11 = *((_DWORD *)&p_var1[-1].var1 + 2);
        if (v11 <= 0xFFFFFEFF) {
          int var3 = p_var1[-1].var1.var3;
        }
        else {
          int var3 = 999999;
        }
        unint64_t var0 = p_var1->var0.var0;
        unint64_t var1 = p_var1->var0.var1;
        p_unint64_t var1 = ($4543A9B08FB62F9BECABBF46C2E06126 *)((char *)p_var1 + 24);
        fprintf( v8,  "%6u : %2u %6u %6u [0x%0.8llx - 0x%0.8llx]\n",  v9++,  v11,  var3,  v11 >> 8,  var0,  var1);
      }

      while (a4 != v9);
    }

    fclose(v8);
  }

- (void)_saveAddressMappings:(id)a3 filename:(const char *)a4
{
  id v23 = a3;
  id v5 = fopen(a4, "wt");
  if (v5)
  {
    fwrite("Encoder  Index [  Start -  End   ]  BinaryUniqueID  EncIdx Index Type\n", 0x46uLL, 1uLL, v5);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = v23;
    id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v27 = v5;
    if (v6)
    {
      uint64_t v25 = *(void *)v31;
      do
      {
        id v28 = v6;
        for (unint64_t i = 0LL; i != v28; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          unint64_t v8 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"encID"]);
          unsigned int v29 = [v9 unsignedIntValue];

          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"index"]);
          unsigned int v11 = [v10 unsignedIntValue];

          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"drawCallIndex"]);
          unsigned int v13 = [v12 unsignedIntValue];

          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"mappedAddress"]);
          __int128 v15 = (char *)[v14 unsignedLongLongValue];

          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"mappedSize"]);
          id v17 = [v16 unsignedLongLongValue];

          id v18 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"binaryUniqueId"]);
          unint64_t v19 = strtoull((const char *)[v18 UTF8String], 0, 16);

          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"encIndex"]);
          LODWORD(v18) = [v20 unsignedIntValue];

          id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"type"]);
          LODWORD(v20) = -[GTShaderProfilerHelper _getLegacyProgramType:](self, "_getLegacyProgramType:", v21);

          id v22 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"type"]);
          fprintf( v27,  "%08x %5d [%08llx-%08llx] %016llx %6d %5d %3d %s\n",  v29,  v13,  v15,  &v15[(void)v17],  v19,  (_DWORD)v18,  v11,  (_DWORD)v20,  (const char *)[v22 UTF8String]);
        }

        id v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v6);
    }

    fclose(v27);
  }
}

- (void)_saveSampleList:(DYMTLShaderProfilerUSCSample *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  id v7 = fopen(a5, "wt");
  if (v7)
  {
    unint64_t v8 = v7;
    if (a4)
    {
      uint64_t v9 = 0LL;
      p_unint64_t var1 = &a3->var1.var0.var1;
      do
      {
        if (*(p_var1 - 2) == -1) {
          fprintf(v8, "%6u : %u --------\n");
        }
        else {
          fprintf(v8, "%6u : %6u 0x%0.8x 0x%0.8x\n");
        }
        ++v9;
        p_var1 += 3;
      }

      while (a4 != v9);
    }

    fclose(v8);
  }

- (void)_saveSampleListForTarget:(unint64_t *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  id v7 = fopen(a5, "wt");
  if (v7)
  {
    unint64_t v8 = v7;
    if (a4)
    {
      uint64_t v9 = 0LL;
      unsigned int v10 = 0;
      do
      {
        unint64_t v11 = a3[v10];
        if (HIWORD(v11) == 65261)
        {
          for (uint64_t i = 0LL; i != 3; ++i)
            v20[i] = a3[(v10 + i) % a4];
          unsigned int v13 = v20[0];
          uint64_t v14 = v20[0] & 0xF;
          if ((v20[0] & 0xC) != 0) {
            uint64_t v14 = 4LL;
          }
          uint64_t v15 = v9 + 1;
          uint64_t v16 = (LODWORD(v20[0]) >> 7) & 0x7F;
          fprintf( v8,  "%6llu : %6u 0x%0.16llx (type:%s trace_id:0x%0.8x dm:%u render_id:0x%0.8x timestamp:0x%0.16llx gpu_cycles :0x%0.8x counter_num:%u)\n",  v9,  v10,  v11,  (&-[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:]::type_string)[v14],  v20[0] >> 16,  LOWORD(v20[0]) >> 14,  v22,  v20[1],  v21,  (LODWORD(v20[0]) >> 7) & 0x7F);
          int v19 = (v13 >> 4) & 7;
          if ((_DWORD)v16)
          {
            uint64_t v17 = 0LL;
            int v18 = v10 + 2 * ((v13 >> 4) & 7) - 1 + v16;
            do
            {
              if (v18 + (int)v17 < a4) {
                fprintf( v8,  "%6llu : %6u 0x%0.8x 0x%0.8x\n",  v15++,  v17,  a3[(v18 + v17)],  HIDWORD(a3[(v18 + v17)]));
              }
              ++v17;
            }

            while (v16 != v17);
          }

          unsigned int v10 = v10 + v19 + v16 - 1;
          uint64_t v9 = v15;
        }

        else
        {
          fprintf(v8, "%6llu : %6u : 0x%0.8llx\n", v9, v10, v11);
        }

        ++v10;
      }

      while (v10 < a4);
    }

    fclose(v8);
  }

- (void)_saveSampleDataFromGPURawCountersBytes:(char *)a3 size:(unsigned int)a4 filename:(const char *)a5
{
  id v7 = fopen(a5, "wt");
  if (v7)
  {
    unint64_t v8 = v7;
    if (a4)
    {
      int v9 = 0;
      do
      {
        fprintf( v8,  "%6u : trace_id:0x%0.8x limiterIdx:%u nTracePackets:%u)\n",  v9,  *(void *)a3,  *(void *)a3 >> 39,  HIDWORD(*(void *)a3) & 0x7F);
        if ((a3[4] & 0x7F) != 0)
        {
          unint64_t v10 = 0LL;
          unint64_t v11 = a3 + 8;
          do
          {
            for (uint64_t i = 0LL; i != 4; ++i)
              fprintf( v8,  "%6u : 0x%0.8llx 0x%0.8llx\n",  i,  HIDWORD(*(void *)&v11[8 * i]),  *(void *)&v11[8 * i]);
            ++v10;
            unint64_t v13 = *((_DWORD *)a3 + 1) & 0x7F;
            v11 += 32;
          }

          while (v10 < v13);
        }

        else
        {
          unint64_t v13 = 0LL;
        }

        a3 += 32 * v13 + 8;
        ++v9;
      }

      while (v9 != a4);
    }

    fclose(v8);
  }

- (void)_preProcessUSCSampleData:(id)a3 result:(id)a4 targetIndex:(int)a5
{
  id v166 = a3;
  id v167 = a4;
  id v171 = (id)objc_claimAutoreleasedReturnValue([v166 objectForKeyedSubscript:@"usc sampling address data"]);
  id v170 = (id)objc_claimAutoreleasedReturnValue([v166 objectForKeyedSubscript:@"usc sampling sample data"]);
  double v168 = (void *)objc_claimAutoreleasedReturnValue([v166 objectForKeyedSubscript:@"usc sampling address mappings"]);
  unsigned __int8 v165 = -[GTShaderProfilerHelper _shouldUseProgramAddressMappings:](self, "_shouldUseProgramAddressMappings:");
  if (g_runningInCI)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"In _preProcessUSCSampleData, sample data %lu bytes, address data %lu bytes, address mappings %lu",  [v170 length],  objc_msgSend(v171, "length"),  objc_msgSend(v168, "count")));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    int v9 = __stdoutp;
    id v10 = v8;
    fprintf(v9, "#CI-INFO# %s\n", (const char *)[v10 UTF8String]);
  }

  unsigned int v176 = self;
  if (v171)
  {
    if (v170)
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v167 drawCallInfoList]);
      id v12 = [v11 count];

      if (v12)
      {
        id v13 = v171;
        unsigned int v169 = (char *)[v13 bytes];
        unsigned int v14 = [v13 length];
        id v15 = v170;
        double v160 = [v15 bytes];
        id v16 = v15;
        uint64_t v17 = (unsigned __int16 *)[v16 bytes];
        unsigned int v18 = [v16 length];
        uint64_t v19 = [v16 length] >> 3;
        if (a5 < 0)
        {
          BOOL v24 = 0;
          unsigned __int8 v165 = 0;
        }

        else
        {
          else {
            uint64_t v20 = v19;
          }
          if ((_DWORD)v20)
          {
            uint64_t v21 = v20 - 1;
            int v22 = v17;
            do
            {
              unint64_t v23 = (unint64_t)v22[3] << 48;
              BOOL v24 = v23 == 0xFEED000000000000LL;
              BOOL v25 = v23 == 0xFEED000000000000LL || v21-- == 0;
              v22 += 4;
            }

            while (!v25);
          }

          else
          {
            BOOL v24 = 0;
          }
        }

        options = self->_options;
        if ((*((_BYTE *)options + 16) & 0x40) != 0)
        {
          id v27 = objc_claimAutoreleasedReturnValue( [options->var0 stringByAppendingPathComponent:@"/uscSamplingAddressRaw.txt"]);
          -[GTShaderProfilerHelper _saveAddressList:size:filename:]( self,  "_saveAddressList:size:filename:",  v169,  v14 / 0x18uLL,  [v27 UTF8String]);
          id v28 = objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingPathComponent:@"/uscSamplingAddressMapping.txt"]);
          -[GTShaderProfilerHelper _saveAddressMappings:filename:]( self,  "_saveAddressMappings:filename:",  v168,  [v28 UTF8String]);
        }

        unint64_t v163 = v14 / 0x18uLL;
        uint64_t v158 = v19;
        unint64_t v159 = v17;
        BOOL v162 = v24;
        unsigned int v161 = v18;
        if ((v165 & 1) != 0)
        {
          __int128 v200 = 0u;
          __int128 v201 = 0u;
          __int128 v198 = 0u;
          __int128 v199 = 0u;
          id v29 = v168;
          unsigned int v30 = 0;
          id v31 = [v29 countByEnumeratingWithState:&v198 objects:v204 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v199;
            LODWORD(v33) = -1;
            do
            {
              for (uint64_t i = 0LL; i != v31; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v199 != v32) {
                  objc_enumerationMutation(v29);
                }
                id v35 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v198 + 1) + 8 * (void)i) objectForKeyedSubscript:@"encIndex"]);
                unsigned int v36 = [v35 unsignedIntValue];

                else {
                  uint64_t v33 = v36;
                }
                if (v30 <= v36) {
                  unsigned int v30 = v36;
                }
              }

              id v31 = [v29 countByEnumeratingWithState:&v198 objects:v204 count:16];
            }

            while (v31);
          }

          else
          {
            uint64_t v33 = 0xFFFFFFFFLL;
          }
        }

        else
        {
          if (v14 < 0x18) {
            goto LABEL_201;
          }
          unsigned int v30 = 0;
          else {
            uint64_t v37 = v163;
          }
          uint64_t v38 = v169 + 4;
          uint64_t v33 = 0xFFFFFFFFLL;
          do
          {
            if (*v38 != -1)
            {
              unsigned int v39 = *(v38 - 1);
              uint64_t v33 = v39 >> 8 >= v33 ? v33 : v39 >> 8;
              if (v30 <= v39 >> 8) {
                unsigned int v30 = v39 >> 8;
              }
            }

            v38 += 6;
            --v37;
          }

          while (v37);
        }

        int v40 = v30 - v33;
        if (v30 >= v33)
        {
          unsigned int v157 = v30;
          std::string __p = 0LL;
          char v196 = 0LL;
          unint64_t v197 = 0LL;
          id v192 = 0LL;
          unint64_t v193 = 0LL;
          id v194 = 0LL;
          uint64_t v41 = (v40 + 1);
          if (v40 == -1)
          {
            uint8x8_t v42 = 0LL;
            __int128 v189 = 0u;
            __int128 v190 = 0u;
            int v191 = 1065353216;
            uint64_t v186 = 0LL;
            int v187 = 0LL;
            id v188 = 0LL;
          }

          else
          {
            uint8x8_t v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((v40 + 1));
            id v192 = v42;
            id v194 = &v42[4 * v43];
            memset(v42, 255, 4 * v41);
            unint64_t v193 = &v42[4 * v41];
            __int128 v189 = 0u;
            __int128 v190 = 0u;
            int v191 = 1065353216;
            uint64_t v186 = (char *)operator new(24 * v41);
            id v188 = &v186[24 * v41];
            size_t v44 = 24 * ((24 * v41 - 24) / 0x18uLL) + 24;
            bzero(v186, v44);
            int v187 = &v186[v44];
          }

          if ((v165 & 1) != 0)
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, 2 * (void)[v168 count]);
            LODWORD(v202) = 0;
            __int128 v181 = 0u;
            __int128 v182 = 0u;
            __int128 v183 = 0u;
            __int128 v184 = 0u;
            id obj = v168;
            id v45 = [obj countByEnumeratingWithState:&v181 objects:v203 count:16];
            if (v45)
            {
              unsigned int v46 = 0;
              int v173 = 0;
              int v179 = 0;
              uint64_t v174 = *(void *)v182;
              unsigned int v47 = -1;
              do
              {
                id v48 = 0LL;
                id v175 = v45;
                do
                {
                  unsigned int v49 = v47;
                  if (*(void *)v182 != v174) {
                    objc_enumerationMutation(obj);
                  }
                  id v50 = *(void **)(*((void *)&v181 + 1) + 8LL * (void)v48);
                  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"encID"]);
                  unsigned int v47 = [v51 unsignedIntValue];

                  id v52 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"drawCallIndex"]);
                  unsigned int v53 = [v52 unsignedIntValue];

                  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"mappedAddress"]);
                  uint64_t v55 = (char *)[v54 unsignedLongLongValue];

                  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"mappedSize"]);
                  id v57 = [v56 unsignedLongLongValue];

                  id v58 = objc_claimAutoreleasedReturnValue( [v50 objectForKeyedSubscript:@"binaryUniqueId"]);
                  unint64_t v177 = strtoull((const char *)[v58 UTF8String], 0, 16);

                  int v59 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:@"type"]);
                  unsigned __int8 v60 = -[GTShaderProfilerHelper _getLegacyProgramType:]( v176,  "_getLegacyProgramType:",  v59);

                  if (v49 == -1 || v49 == v47)
                  {
                    int v61 = v53 + v173;
                  }

                  else
                  {
                    LODWORD(v202) = v47;
                    int v61 = v179 + 1;
                    unsigned int v46 = v47;
                    int v173 = v179 + 1;
                  }

                  int v179 = v61;
                  *((_DWORD *)v192 + v47 - v33) = v46;
                  unsigned int v178 = v46;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)&v189,  v46,  &v202)
                  + 5) = v47;
                  int v62 = (v47 << 8) | 0x62;
                  uint64_t v63 = &v55[(void)v57];
                  id v64 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    uint8x8_t v67 = (char *)__p;
                    unint64_t v68 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    unint64_t v69 = v68 + 1;
                    if (v68 + 1 > 0xAAAAAAAAAAAAAAALL) {
                      goto LABEL_202;
                    }
                    else {
                      unint64_t v70 = v69;
                    }
                    if (v70) {
                      unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v70);
                    }
                    else {
                      uint64_t v71 = 0LL;
                    }
                    unint64_t v72 = (char *)(v70 + 24 * v68);
                    *(_DWORD *)unint64_t v72 = v62;
                    *((_DWORD *)v72 + 1) = v179;
                    *((void *)v72 + 1) = v55;
                    *((void *)v72 + 2) = v63;
                    uint64_t v73 = v72;
                    if (v64 == v67)
                    {
                      unsigned int v66 = v178;
                    }

                    else
                    {
                      unsigned int v66 = v178;
                      do
                      {
                        __int128 v74 = *(_OWORD *)(v64 - 24);
                        *((void *)v73 - 1) = *((void *)v64 - 1);
                        *(_OWORD *)(v73 - 24) = v74;
                        v73 -= 24;
                        v64 -= 24;
                      }

                      while (v64 != v67);
                      id v64 = (char *)__p;
                    }

                    int v65 = v72 + 24;
                    std::string __p = v73;
                    unint64_t v197 = v70 + 24 * v71;
                    if (v64) {
                      operator delete(v64);
                    }
                  }

                  else
                  {
                    *(_DWORD *)char v196 = v62;
                    *((_DWORD *)v64 + 1) = v179;
                    int v65 = v64 + 24;
                    *((void *)v64 + 1) = v55;
                    *((void *)v64 + 2) = v63;
                    unsigned int v66 = v178;
                  }

                  char v196 = v65;
                  unint64_t v75 = &v186[24 * (v66 - v33)];
                  uint64_t v76 = v65 - 24;
                  double v77 = (void **)(v75 + 8);
                  unint64_t v78 = (char **)*((void *)v75 + 1);
                  unint64_t v79 = *((void *)v75 + 2);
                  if ((unint64_t)v78 >= v79)
                  {
                    uint64_t v81 = ((uint64_t)v78 - *(void *)v75) >> 3;
                    uint64_t v82 = v79 - *(void *)v75;
                    uint64_t v83 = v82 >> 2;
                    else {
                      unint64_t v84 = v83;
                    }
                    if (v84) {
                      unint64_t v84 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v84);
                    }
                    else {
                      uint64_t v85 = 0LL;
                    }
                    int v86 = (char **)(v84 + 8 * v81);
                    void *v86 = v76;
                    id v80 = v86 + 1;
                    unsigned int v87 = (char *)*v77;
                    double v88 = *(char **)v75;
                    if (*v77 == *(void **)v75)
                    {
                      unsigned int v46 = v178;
                    }

                    else
                    {
                      unsigned int v46 = v178;
                      do
                      {
                        __int128 v89 = (char *)*((void *)v87 - 1);
                        v87 -= 8;
                        *--int v86 = v89;
                      }

                      while (v87 != v88);
                      unsigned int v87 = *(char **)v75;
                    }

                    *(void *)unint64_t v75 = v86;
                    unsigned __int8 *v77 = v80;
                    *((void *)v75 + 2) = v84 + 8 * v85;
                    if (v87) {
                      operator delete(v87);
                    }
                  }

                  else
                  {
                    GTShaderProfilerHelper *v78 = v76;
                    id v80 = v78 + 1;
                    unsigned int v46 = v178;
                  }

                  int v90 = (v47 << 8) | 0x63;
                  int v91 = v60;
                  unsigned __int8 *v77 = v80;
                  double v92 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    double v95 = (char *)__p;
                    unint64_t v96 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    unint64_t v97 = v96 + 1;
                    if (v96 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_202:
                    }
                      abort();
                    else {
                      unint64_t v98 = v97;
                    }
                    if (v98) {
                      unint64_t v98 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v98);
                    }
                    else {
                      uint64_t v99 = 0LL;
                    }
                    __int128 v100 = (char *)(v98 + 24 * v96);
                    *(_DWORD *)__int128 v100 = v90;
                    *((_DWORD *)v100 + 1) = v179;
                    *((void *)v100 + 1) = v177;
                    *((_DWORD *)v100 + 4) = v91;
                    unsigned int v101 = v100;
                    if (v92 == v95)
                    {
                      id v94 = v175;
                      unsigned int v46 = v178;
                    }

                    else
                    {
                      id v94 = v175;
                      unsigned int v46 = v178;
                      do
                      {
                        __int128 v102 = *(_OWORD *)(v92 - 24);
                        *((void *)v101 - 1) = *((void *)v92 - 1);
                        *(_OWORD *)(v101 - 24) = v102;
                        v101 -= 24;
                        v92 -= 24;
                      }

                      while (v92 != v95);
                      double v92 = (char *)__p;
                    }

                    double v93 = v100 + 24;
                    std::string __p = v101;
                    unint64_t v197 = v98 + 24 * v99;
                    if (v92) {
                      operator delete(v92);
                    }
                  }

                  else
                  {
                    *(_DWORD *)char v196 = v90;
                    *((_DWORD *)v92 + 1) = v179;
                    *((void *)v92 + 1) = v177;
                    double v93 = v92 + 24;
                    *((_DWORD *)v92 + 4) = v91;
                    id v94 = v175;
                  }

                  char v196 = v93;
                  id v48 = (char *)v48 + 1;
                }

                while (v48 != v94);
                id v45 = [obj countByEnumeratingWithState:&v181 objects:v203 count:16];
              }

              while (v45);
            }

            unint64_t v104 = v163;
          }

          else
          {
            std::vector<DYMTLShaderProfilerProgramAddress>::reserve(&__p, v163);
            LODWORD(v202) = 0;
            if (v14 >= 0x18)
            {
              uint64_t v105 = 0LL;
              int v106 = 0;
              int v180 = 0;
              else {
                uint64_t v107 = v163;
              }
              uint64_t v108 = 0xFFFFFFFFLL;
              do
              {
                int8x8_t v109 = &v169[24 * v105];
                if ((*(void *)v109 & *((void *)v109 + 1) & *((void *)v109 + 2)) == -1LL
                  || (int v110 = *((_DWORD *)v109 + 1), v110 == -1))
                {
                  uint64_t v111 = v108;
                }

                else
                {
                  uint64_t v111 = *(_DWORD *)v109 >> 8;
                  if ((_DWORD)v108 == -1 || (_DWORD)v108 == (_DWORD)v111)
                  {
                    int v106 = v110 + v180;
                  }

                  else
                  {
                    LODWORD(v202) = *(_DWORD *)v109 >> 8;
                    int v180 = ++v106;
                  }

                  double v112 = v196;
                  if ((unint64_t)v196 >= v197)
                  {
                    double v115 = __p;
                    unint64_t v116 = 0xAAAAAAAAAAAAAAABLL * ((v196 - (_BYTE *)__p) >> 3);
                    unint64_t v117 = v116 + 1;
                    if (v116 + 1 > 0xAAAAAAAAAAAAAAALL) {
                      abort();
                    }
                    else {
                      unint64_t v118 = v117;
                    }
                    if (v118) {
                      unint64_t v118 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v118);
                    }
                    else {
                      uint64_t v119 = 0LL;
                    }
                    __int128 v120 = *(_OWORD *)v109;
                    double v121 = (char *)(v118 + 24 * v116);
                    *((void *)v121 + 2) = *((void *)v109 + 2);
                    *(_OWORD *)double v121 = v120;
                    __int128 v122 = v121;
                    if (v112 != v115)
                    {
                      do
                      {
                        __int128 v123 = *(_OWORD *)((char *)v112 - 24);
                        *((void *)v122 - 1) = *((void *)v112 - 1);
                        *(_OWORD *)(v122 - 24) = v123;
                        v122 -= 24;
                        double v112 = (_OWORD *)((char *)v112 - 24);
                      }

                      while (v112 != v115);
                      double v112 = __p;
                    }

                    double v114 = v121 + 24;
                    std::string __p = v122;
                    unint64_t v197 = v118 + 24 * v119;
                    if (v112) {
                      operator delete(v112);
                    }
                  }

                  else
                  {
                    __int128 v113 = *(_OWORD *)v109;
                    *((void *)v196 + 2) = *((void *)v109 + 2);
                    *double v112 = v113;
                    double v114 = (char *)v112 + 24;
                  }

                  char v196 = v114;
                  *((_DWORD *)v114 - 5) = v106;
                  unsigned int v124 = v202;
                  uint8x8_t v42 = (char *)v192;
                  *((_DWORD *)v192 + (v111 - v33)) = (_DWORD)v202;
                  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)&v189,  v124,  &v202)
                  + 5) = v111;
                }

                ++v105;
                uint64_t v108 = v111;
              }

              while (v105 != v107);
            }

            unsigned int v169 = (char *)__p;
            uint64_t v125 = (v196 - (_BYTE *)__p) >> 3;
            unint64_t v104 = 0xAAAAAAAAAAAAAAABLL * v125;
            if (-1431655765 * (_DWORD)v125)
            {
              uint64_t v126 = (-1431655765 * v125);
              uint64_t v127 = __p;
              do
              {
                unsigned int v185 = *(_DWORD *)&v42[4 * ((*v127 >> 8) - v33)];
                _DWORD *v127 = *(unsigned __int8 *)v127 | (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)&v189,  v185,  &v185)
                                                    + 5) << 8);
                v127 += 6;
                --v126;
              }

              while (v126);
            }
          }

          unint64_t v128 = v161 / 0xCuLL;
          uint64_t v129 = v176->_options;
          if ((*((_BYTE *)v129 + 16) & 0x40) != 0)
          {
            if ((v165 & 1) == 0)
            {
              id v130 = objc_claimAutoreleasedReturnValue( [v129->var0 stringByAppendingPathComponent:@"/uscSamplingAddressProcessed.txt"]);
              -[GTShaderProfilerHelper _saveAddressList:size:filename:]( v176,  "_saveAddressList:size:filename:",  v169,  v104,  [v130 UTF8String]);

              uint64_t v129 = v176->_options;
            }

            id v131 = objc_claimAutoreleasedReturnValue( [v129->var0 stringByAppendingPathComponent:@"/uscSamplingSampleRaw.txt"]);
            double v132 = v131;
            if (v162) {
              -[GTShaderProfilerHelper _saveSampleListForTarget:size:filename:]( v176,  "_saveSampleListForTarget:size:filename:",  v159,  v158,  [v131 UTF8String]);
            }
            else {
              -[GTShaderProfilerHelper _saveSampleList:size:filename:]( v176,  "_saveSampleList:size:filename:",  v160,  v128,  [v131 UTF8String]);
            }
          }

          char v133 = v165;
          if (!(_DWORD)v104) {
            char v133 = 1;
          }
          if ((v133 & 1) == 0)
          {
            uint64_t v134 = 0LL;
            do
            {
              double v135 = &v169[24 * v134];
              unint64_t v136 = &v186[24 * ((*(_DWORD *)v135 >> 8) - v33)];
              float64x2_t v138 = (void **)(v136 + 8);
              double v137 = (char **)*((void *)v136 + 1);
              unint64_t v139 = *((void *)v136 + 2);
              if ((unint64_t)v137 >= v139)
              {
                uint64_t v141 = ((uint64_t)v137 - *(void *)v136) >> 3;
                uint64_t v142 = v139 - *(void *)v136;
                uint64_t v143 = v142 >> 2;
                else {
                  unint64_t v144 = v143;
                }
                if (v144) {
                  unint64_t v144 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v144);
                }
                else {
                  uint64_t v103 = 0LL;
                }
                id v145 = (char **)(v144 + 8 * v141);
                *id v145 = v135;
                double v140 = v145 + 1;
                unsigned int v146 = (char *)*v138;
                uint64_t v147 = *(char **)v136;
                if (*v138 != *(void **)v136)
                {
                  do
                  {
                    double v148 = (char *)*((void *)v146 - 1);
                    v146 -= 8;
                    *--id v145 = v148;
                  }

                  while (v146 != v147);
                  unsigned int v146 = *(char **)v136;
                }

                *(void *)unint64_t v136 = v145;
                char *v138 = v140;
                *((void *)v136 + 2) = v144 + 8 * v103;
                if (v146) {
                  operator delete(v146);
                }
              }

              else
              {
                *double v137 = v135;
                double v140 = v137 + 1;
              }

              char *v138 = v140;
              ++v134;
            }

            while (v134 != v104);
          }

          if (v162)
          {
            uint64_t v149 = 0LL;
            uint64_t v150 = v157;
          }

          else
          {
            uint64_t v150 = v157;
            if ((_DWORD)v128 == 1)
            {
              uint64_t v149 = 0LL;
            }

            else
            {
              uint64_t v151 = 0LL;
              uint64_t v149 = 0LL;
              unsigned int v152 = -1;
              float64x2_t v153 = v160;
              do
              {
                if (*v153 == -1)
                {
                  if (v153[3] >= v152)
                  {
                    uint64_t v149 = v149;
                  }

                  else
                  {
                    unsigned int v152 = v153[3];
                    uint64_t v149 = v151;
                  }
                }

                ++v151;
                v153 += 3;
              }

              while ((_DWORD)v128 - 1 != v151);
            }
          }

          if (a5 < 0)
          {
            LODWORD(v155) = v161 / 0xC;
            -[GTShaderProfilerHelper _generateSamplesForResult:withProgramAddressLUT:withBatchIndexMin:andBatchIndexMax:andMinIndex:withProgramAddressList:withUSCSampleList:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:]( v176,  "_generateSamplesForResult:withProgramAddressLUT:withBatchIndexMin:andBatchIndexMax:andMinIndex:withProgram AddressList:withUSCSampleList:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:",  v167,  &v186,  v33,  v150,  v149,  v169,  v160,  v155,  &v192,  &v189);
          }

          else
          {
            unsigned int v154 = (void *)objc_opt_new(&OBJC_CLASS___DYPMTLShaderProfilerHelper, v103);
            LODWORD(v156) = a5;
            [v154 generateTargetSamplesForResult:v167 withProgramAddressLUT:&v186 withBatchIndexMin:v33 withProgramAddressList:v169 withUSCSampl eBuffer:v159 withUSCSampleNum:v158 withBatchIDToEncoderIndex:&v192 andEncoderIndexToBatchIdMap:&v189 targetIndex:v156];
          }

          char v202 = &v186;
          std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v202);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v189);
          if (v192)
          {
            unint64_t v193 = (char *)v192;
            operator delete(v192);
          }

          if (__p) {
            operator delete(__p);
          }
        }
      }
    }
  }

- (void)_dumpTraceProfileDataForResult:(id)a3
{
  id v3 = a3;
  id v94 = v3;
  if (v3)
  {
    id v4 = v3;
    [v3 vertexTiming];
    [v4 fragmentTiming];
    [v4 computeTiming];
    double v5 = *(double *)&v134 + *(double *)&v131 + *(double *)&v128;
  }

  else
  {
    double v5 = 0.0;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v94 programPipelineInfoList]);
  int v90 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&__block_literal_global_477]);

  id v95 = objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingFormat:@"/PipelineState.txt"]);
  id v7 = fopen((const char *)[v95 UTF8String], "w");
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  id obj = v90;
  id v8 = [obj countByEnumeratingWithState:&v124 objects:v140 count:16];
  if (v8)
  {
    unint64_t v98 = *(FILE **)v125;
    double v9 = 0.0;
    do
    {
      uint64_t v10 = 0LL;
      id v101 = v8;
      do
      {
        if (*(FILE **)v125 != v98) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v124 + 1) + 8 * v10);
        if (v11)
        {
          [*(id *)(*((void *)&v124 + 1) + 8 * v10) timing];
          double v12 = *(double *)&v134;
        }

        else
        {
          double v12 = 0.0;
        }

        uint64_t v13 = v11[1];
        unsigned int v14 = [v11 programIndex];
        id v15 = [v11 programId];
        if (v13)
        {
          [v11 vertexTiming];
          double v16 = *(double *)&v134;
          [v11 fragmentTiming];
          fprintf( v7,  "[%u] PipelineState 0x%llX\tVertex[%.4f%%]\tFragment[%.4f%%]\n",  v14,  v15,  v16 * 100.0 / v5,  *(double *)&v131 * 100.0 / v5);
          uint64_t v17 = "\tVert\t\tFragment";
        }

        else
        {
          [v11 computeTiming];
          fprintf(v7, "[%u] PipelineState 0x%llX\tCompute[%.4f%%]\n", v14, v15, *(double *)&v134 * 100.0 / v5);
          uint64_t v17 = "\tCompute";
        }

        uint64_t v104 = v10;
        fprintf(v7, "\tindex\tfunctionIndex\t%s\n", v17);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 drawCallInfoList]);
        v122[0] = _NSConcreteStackBlock;
        v122[1] = 3221225472LL;
        v122[2] = __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2;
        v122[3] = &unk_58F8A0;
        id v19 = v94;
        id v123 = v19;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingComparator:v122]);

        __int128 v120 = 0u;
        __int128 v121 = 0u;
        __int128 v118 = 0u;
        __int128 v119 = 0u;
        id v21 = v20;
        id v22 = [v21 countByEnumeratingWithState:&v118 objects:v139 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v119;
          do
          {
            for (uint64_t i = 0LL; i != v22; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v119 != v23) {
                objc_enumerationMutation(v21);
              }
              BOOL v25 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)i);
              int v26 = (void *)objc_claimAutoreleasedReturnValue([v19 drawCallInfoList]);
              id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v25, "unsignedIntegerValue")));

              if (v13)
              {
                [v27 drawCallIndex];
                [v27 functionIndex];
                if (v27)
                {
                  [v27 vertexTiming];
                  [v27 fragmentTiming];
                }

                else
                {
                  __int128 v135 = 0u;
                  __int128 v136 = 0u;
                  __int128 v133 = 0u;
                  __int128 v134 = 0u;
                  __int128 v131 = 0u;
                  __int128 v132 = 0u;
                }

                fprintf(v7, "\t%6u\t\t%6u\t\t%.2f%%\t\t%.4f%%\n");
              }

              else
              {
                [v27 drawCallIndex];
                [v27 functionIndex];
                if (v27)
                {
                  [v27 computeTiming];
                }

                else
                {
                  __int128 v135 = 0u;
                  __int128 v136 = 0u;
                  __int128 v134 = 0u;
                }

                fprintf(v7, "\t%6u\t\t%6u\t\t%.4f%%\n");
              }
            }

            id v22 = [v21 countByEnumeratingWithState:&v118 objects:v139 count:16];
          }

          while (v22);
        }

        double v9 = v9 + v12;
        uint64_t v10 = v104 + 1;
      }

      while ((id)(v104 + 1) != v101);
      id v8 = [obj countByEnumeratingWithState:&v124 objects:v140 count:16];
    }

    while (v8);
  }

  else
  {
    double v9 = 0.0;
  }

  fclose(v7);
  __int128 v102 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v28);
  id v88 = objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingFormat:@"/DrawCallCosts_Unsorted.txt"]);
  id v29 = fopen((const char *)[v88 UTF8String], "wb");
  fwrite( "\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\tNumSamples\n",  0x58uLL,  1uLL,  v29);
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  id v96 = (id)objc_claimAutoreleasedReturnValue([v94 drawCallInfoList]);
  id v30 = [v96 countByEnumeratingWithState:&v114 objects:v138 count:16];
  uint64_t v99 = v29;
  if (v30)
  {
    uint64_t v105 = *(void *)v115;
    do
    {
      for (unint64_t j = 0LL; j != v30; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v115 != v105) {
          objc_enumerationMutation(v96);
        }
        uint64_t v32 = *(void **)(*((void *)&v114 + 1) + 8LL * (void)j);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v32 programInfo]);
        if (v34)
        {
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 programInfo]);
          BOOL v36 = [v35 programId] == (id)-1;

          if (v36) {
            continue;
          }
        }

        uint64_t v37 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v33);
        [v102 addObject:v37];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v32 drawCallIndex]));
        [v37 setObject:v38 forKeyedSubscript:@"Index"];

        unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v32 functionIndex]));
        [v37 setObject:v39 forKeyedSubscript:@"FunctionIndex"];

        if (v32)
        {
          [v32 vertexTiming];
          double v40 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v40 = 0.0;
          __int128 v134 = 0u;
        }

        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v40 * 100.0 / v5));
        [v37 setObject:v41 forKeyedSubscript:@"VS_Percent"];

        if (v32)
        {
          [v32 fragmentTiming];
          double v42 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v42 = 0.0;
          __int128 v134 = 0u;
        }

        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v42 * 100.0 / v5));
        [v37 setObject:v43 forKeyedSubscript:@"FS_Percent"];

        if (v32)
        {
          [v32 computeTiming];
          double v44 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v44 = 0.0;
          __int128 v134 = 0u;
        }

        id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v44 * 100.0 / v5));
        [v37 setObject:v45 forKeyedSubscript:@"CS_Percent"];

        unsigned int v46 = [v32 drawCallIndex];
        unsigned int v47 = [v32 functionIndex];
        if (v32)
        {
          [v32 vertexTiming];
          double v48 = *(double *)&v134;
          [v32 fragmentTiming];
          double v49 = *(double *)&v131;
          [v32 computeTiming];
          double v50 = *(double *)&v128;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          __int128 v133 = 0u;
          __int128 v134 = 0u;
          __int128 v131 = 0u;
          __int128 v132 = 0u;
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          double v50 = 0.0;
          double v49 = 0.0;
          double v48 = 0.0;
          __int128 v128 = 0u;
        }

        __int128 v51 = (void *)v32[1];
        if (v51) {
          id v52 = (const char *)[v51 UTF8String];
        }
        else {
          id v52 = "\t\t";
        }
        unsigned int v53 = (void *)v32[2];
        if (v53) {
          __int128 v54 = (const char *)[v53 UTF8String];
        }
        else {
          __int128 v54 = "\t\t";
        }
        uint64_t v55 = (void *)v32[3];
        if (v55) {
          __int128 v56 = (const char *)[v55 UTF8String];
        }
        else {
          __int128 v56 = "\t\t";
        }
        [v32 vertexTiming];
        [v32 computeTiming];
        [v32 fragmentTiming];
        fprintf( v99,  "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\t%g\n",  v46,  v47,  v48 * 100.0 / v5,  v49 * 100.0 / v5,  v50 * 100.0 / v5,  v52,  v54,  v56,  v113 + v112 + v111);
      }

      id v30 = [v96 countByEnumeratingWithState:&v114 objects:v138 count:16];
    }

    while (v30);
  }

  if (v99) {
    fclose(v99);
  }

  id v57 = (void *)objc_claimAutoreleasedReturnValue([v94 drawCallInfoList]);
  __int128 v89 = (void *)objc_claimAutoreleasedReturnValue([v57 sortedArrayUsingComparator:&__block_literal_global_504]);

  uint64_t v103 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v58);
  id v92 = objc_claimAutoreleasedReturnValue( [self->_options->var0 stringByAppendingFormat:@"/DrawCallCosts_Sorted.txt"]);
  int v59 = fopen((const char *)[v92 UTF8String], "wb");
  fwrite( "\tindex\tfunctionIndex\t\tVert\t\t    Fragment\t\tCompute\t\tVS_Hash\t\tFS_Hash\t\tCS_HASH\n",  0x4DuLL,  1uLL,  v59);
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v97 = v89;
  id v60 = [v97 countByEnumeratingWithState:&v107 objects:v137 count:16];
  __int128 v100 = v59;
  if (v60)
  {
    uint64_t v106 = *(void *)v108;
    do
    {
      for (unint64_t k = 0LL; k != v60; unint64_t k = (char *)k + 1)
      {
        if (*(void *)v108 != v106) {
          objc_enumerationMutation(v97);
        }
        int v62 = *(void **)(*((void *)&v107 + 1) + 8LL * (void)k);
        id v64 = (void *)objc_claimAutoreleasedReturnValue([v62 programInfo]);
        if (v64)
        {
          int v65 = (void *)objc_claimAutoreleasedReturnValue([v62 programInfo]);
          BOOL v66 = [v65 programId] == (id)-1;

          if (v66) {
            continue;
          }
        }

        uint8x8_t v67 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v63);
        [v103 addObject:v67];
        unint64_t v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v62 drawCallIndex]));
        [v67 setObject:v68 forKeyedSubscript:@"Index"];

        unint64_t v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v62 functionIndex]));
        [v67 setObject:v69 forKeyedSubscript:@"FunctionIndex"];

        if (v62)
        {
          [v62 vertexTiming];
          double v70 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v70 = 0.0;
          __int128 v134 = 0u;
        }

        uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v70 * 100.0 / v5));
        [v67 setObject:v71 forKeyedSubscript:@"VS_Percent"];

        if (v62)
        {
          [v62 fragmentTiming];
          double v72 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v72 = 0.0;
          __int128 v134 = 0u;
        }

        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v72 * 100.0 / v5));
        [v67 setObject:v73 forKeyedSubscript:@"FS_Percent"];

        if (v62)
        {
          [v62 computeTiming];
          double v74 = *(double *)&v134;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          double v74 = 0.0;
          __int128 v134 = 0u;
        }

        unint64_t v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v74 * 100.0 / v5));
        [v67 setObject:v75 forKeyedSubscript:@"CS_Percent"];

        unsigned int v76 = [v62 drawCallIndex];
        unsigned int v77 = [v62 functionIndex];
        if (v62)
        {
          [v62 vertexTiming];
          double v78 = *(double *)&v134;
          [v62 fragmentTiming];
          double v79 = *(double *)&v131;
          [v62 computeTiming];
          double v80 = *(double *)&v128;
        }

        else
        {
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          __int128 v133 = 0u;
          __int128 v134 = 0u;
          __int128 v131 = 0u;
          __int128 v132 = 0u;
          __int128 v129 = 0u;
          __int128 v130 = 0u;
          double v80 = 0.0;
          double v79 = 0.0;
          double v78 = 0.0;
          __int128 v128 = 0u;
        }

        uint64_t v81 = (void *)v62[1];
        if (v81) {
          uint64_t v82 = (const char *)[v81 UTF8String];
        }
        else {
          uint64_t v82 = "\t\t";
        }
        uint64_t v83 = (void *)v62[2];
        if (v83) {
          unint64_t v84 = (const char *)[v83 UTF8String];
        }
        else {
          unint64_t v84 = "\t\t";
        }
        uint64_t v85 = (void *)v62[3];
        if (v85) {
          int v86 = (const char *)[v85 UTF8String];
        }
        else {
          int v86 = "\t\t";
        }
        fprintf( v100,  "\t%6u\t\t%6u\t\t%10.4f%%\t\t%10.4f%%\t\t%10.4f%%\t\t%s\t%s\t%s\n",  v76,  v77,  v78 * 100.0 / v5,  v79 * 100.0 / v5,  v80 * 100.0 / v5,  v82,  v84,  v86);
      }

      id v60 = [v97 countByEnumeratingWithState:&v107 objects:v137 count:16];
    }

    while (v60);
  }

  if (v100) {
    fclose(v100);
  }

  if (v5 > 1.0)
  {
    if (vabdd_f64(v5, v9) <= 0.1 && v5 >= 1.0) {
      goto LABEL_104;
    }
LABEL_106:
    unsigned int v87 = "Failed";
    goto LABEL_107;
  }

  if (v5 < 1.0) {
    goto LABEL_106;
  }
LABEL_104:
  unsigned int v87 = "Passed";
LABEL_107:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v87);
}

- (void)_showDrawCallDataforResult:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    [v3 vertexTiming];
    [v4 fragmentTiming];
    double v5 = *(double *)&v33 + *(double *)&v30;
  }

  else
  {
    double v5 = 0.0;
  }

  fwrite( "index\tfunctionIndex\tvertTiming\tvertCyclePercent\fragTiming\tfragmentCyclePercent",  0x4EuLL,  1uLL,  __stdoutp);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 drawCallInfoList]);
  unint64_t v7 = (unint64_t)[v6 count];
  if (v7 >= 0x10)
  {
    unint64_t v10 = v7 >> 4;
    id v8 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v7 >> 4);
    bzero(v8, 8 * v10);
    double v9 = &v8[v10];
  }

  else
  {
    id v8 = 0LL;
    double v9 = 0LL;
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 drawCallInfoList]);
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if (v15)
        {
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) vertexTiming];
          double v16 = *(double *)&v33;
          [v15 fragmentTiming];
          double v17 = *(double *)&v30;
        }

        else
        {
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          double v17 = 0.0;
          double v16 = 0.0;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
        }

        unsigned int v18 = [v15 drawCallIndex];
        v8[v18 >> 4] = v16 * 100.0 / v5 + v17 * 100.0 / v5 + v8[v18 >> 4];
      }

      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }

    while (v12);
  }

  fwrite("Encoder Index\t Percentage Frame\n", 0x20uLL, 1uLL, __stdoutp);
  if (v9 != v8)
  {
    uint64_t v19 = 0LL;
    unsigned int v20 = 1;
    do
    {
      fprintf(__stdoutp, "%u\t %g\n", v20 - 1, v8[v19]);
      uint64_t v19 = v20;
    }

    while (v9 - v8 > (unint64_t)v20++);
  }

  double v22 = *v8;
  uint64_t v23 = 1LL;
  BOOL v24 = "Failed";
  do
  {
    double v25 = v8[v23];
    if (fabs(v22 / v25 + -4.0) <= 1.6)
    {
      double v22 = v8[v23];
    }

    else
    {
      fprintf(__stdoutp, "Failed ratio %g / %g = %g\n", v22, v8[v23], v22 / v25);
      if (v8[v23] >= 1.0) {
        goto LABEL_27;
      }
    }

    ++v23;
  }

  while (v23 != 4);
  BOOL v24 = "Passed";
LABEL_27:
  fprintf(__stdoutp, "%s Shader Profling Test\n", v24);
  operator delete(v8);
}

- (void)_calculateRealTimeInfoWithGPUTime:(double)a3 forShaderInfoResult:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    [v5 vertexTiming];
    [v6 fragmentTiming];
    [v6 computeTiming];
    double v7 = *(double *)&v26 + v25 + v24;
  }

  else
  {
    double v7 = 0.0;
  }

  if (v7 >= 0.01) {
    double v8 = v7;
  }
  else {
    double v8 = 0.01;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 drawCallInfoList]);
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    BOOL v12 = a3 == 0.0 || v8 == 0.0;
    double v19 = a3 / v8;
    do
    {
      for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        if (!v12)
        {
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          double v15 = v19 * *(double *)(v14 + 56);
          *(float64x2_t *)(v14 + 64) = vmulq_n_f64(*(float64x2_t *)(v14 + 40), v19);
          *(double *)(v14 + 80) = v15;
          double v16 = v19 * *(double *)(v14 + 104);
          *(float64x2_t *)(v14 + 112) = vmulq_n_f64(*(float64x2_t *)(v14 + 88), v19);
          *(double *)(v14 + 128) = v16;
          double v17 = v19 * *(double *)(v14 + 152);
          *(float64x2_t *)(v14 + 160) = vmulq_n_f64(*(float64x2_t *)(v14 + 136), v19);
          *(double *)(v14 + 176) = v17;
          double v18 = v19 * *(double *)(v14 + 200);
          *(float64x2_t *)(v14 + 208) = vmulq_n_f64(*(float64x2_t *)(v14 + 184), v19);
          *(double *)(v14 + 224) = v18;
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }

    while (v10);
  }

  if (v6)
  {
    [v6 vertexTiming];
    [v6 fragmentTiming];
    [v6 computeTiming];
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v26 = 0u;
  }
}

- (id)_extractShaderBinaryTextSegment:(id)a3
{
  id v3 = a3;
  id v4 = objc_claimAutoreleasedReturnValue([v3 binary]);
  id v5 = [v4 bytes];

  if (v5)
  {
    id v6 = v5 + 8;
    for (int i = v5[4]; i; --i)
    {
      if (*v6 == 25) {
        break;
      }
      id v6 = (_DWORD *)((char *)v6 + v6[1]);
    }

    int v8 = v6[16];
    if (v8)
    {
      double v9 = v6 + 18;
      while (v9[4] != 1163157343 || *(_DWORD *)((char *)v9 + 19) != 5527621)
      {
        v9 += 20;
        if (!--v8) {
          goto LABEL_12;
        }
      }

      id v5 = (_DWORD *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)v5 + v9[12],  v9[10]));
    }

    else
    {
LABEL_12:
      id v5 = 0LL;
    }
  }

  return v5;
}

- (id)_calculatePerDrawCallCostWithSampleData:(id)a3 targetIndex:(int)a4
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  int v24 = 1065353216;
  id v5 = a3;
  id v6 = (unsigned int *)[v5 bytes];
  unint64_t v7 = (unint64_t)[v5 length];
  double v10 = 0.0;
  uint64_t v11 = (v7 / 0x14);
  if ((v7 / 0x14))
  {
    do
    {
      uint64_t v8 = *v6;
      unsigned int v12 = v6[1];
      int v21 = *v6;
      if ((a4 & 0x80000000) == 0 || v12 == 3)
      {
        if (a4 < 0)
        {
          double v13 = 1.0;
        }

        else
        {
          LODWORD(v9) = v6[4];
          double v13 = (double)v12 / (double)v9;
        }

        uint64_t v14 = (double *)std::__hash_table<std::__hash_value_type<unsigned int,double>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,double>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,double>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (float *)&v22,  v8,  &v21);
        double v10 = v10 + v13;
        v14[3] = v13 + v14[3];
      }

      v6 += 5;
      --v11;
    }

    while (v11);
  }

  double v15 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderAnalyzerResult, v8);
  [v15 setTotalCost:v10];
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  *((void *)&v23 + 1)));
  [v15 setDrawCallCost:v16];
  for (int i = (double *)v23; i; int i = *(double **)i)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", i[3]));
    double v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)i + 4)));
    [v16 setObject:v18 forKeyedSubscript:v19];
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v22);
  return v15;
}

- (id)_createPerLineCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *((double *)a3 + 3)));
    [v6 setObject:v7 forKeyedSubscript:@"totalCost"];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    [v6 setObject:v8 forKeyedSubscript:@"perLineCost"];

    uint64_t v10 = *(void *)a3;
    uint64_t v9 = *((void *)a3 + 1);
    if (v9 != *(void *)a3)
    {
      unint64_t v11 = 0LL;
      unsigned int v12 = 1;
      do
      {
        if (*(double *)(v10 + 8 * v11) > 2.22044605e-16)
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"perLineCost"]);
          double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  a4 + v12 - 1));
          [v14 setObject:v13 forKeyedSubscript:v15];

          uint64_t v10 = *(void *)a3;
          uint64_t v9 = *((void *)a3 + 1);
        }

        unint64_t v11 = v12++;
      }

      while (v11 < (v9 - v10) >> 3);
    }
  }

  return v6;
}

- (id)_createPerFileCostDictionaryWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _createPerLineCostDictionaryWith:lineOffset:]( self,  "_createPerLineCostDictionaryWith:lineOffset:",  a3,  v4));
  [v7 setObject:v8 forKeyedSubscript:@"allDrawCall"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  *((void *)a3 + 7)));
  [v7 setObject:v9 forKeyedSubscript:@"perDrawCall"];

  for (int i = (uint64_t **)*((void *)a3 + 6); i; int i = (uint64_t **)*i)
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _createPerLineCostDictionaryWith:lineOffset:]( self,  "_createPerLineCostDictionaryWith:lineOffset:",  i + 3,  v4));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"perDrawCall"]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)i + 4)));
    [v12 setObject:v11 forKeyedSubscript:v13];
  }

  return v7;
}

- (id)_createPerFileLineCostDictionaryForCIWith:(const void *)a3 lineOffset:(unsigned int)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  *((void *)a3 + 7)));
  for (int i = (double *)*((void *)a3 + 6); i; int i = *(double **)i)
  {
    uint64_t v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  a4 + ((uint64_t)(*((void *)i + 4) - *((void *)i + 3)) >> 3));
    for (unsigned int j = a4; j; --j)
      -[NSMutableArray addObject:](v8, "addObject:", &off_5A07C0);
    uint64_t v10 = *((void *)i + 3);
    if (*((void *)i + 4) != v10)
    {
      unint64_t v11 = 0LL;
      double v12 = 100.0 / (i[6] + 2.22507386e-308);
      unsigned int v13 = 1;
      do
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v12 * *(double *)(v10 + 8 * v11)));
        -[NSMutableArray addObject:](v8, "addObject:", v14);

        unint64_t v11 = v13;
        uint64_t v10 = *((void *)i + 3);
        ++v13;
      }

      while (v11 < (*((void *)i + 4) - v10) >> 3);
    }

    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%u",  *((unsigned int *)i + 4)));
    [v6 setObject:v8 forKeyedSubscript:v15];
  }

  return v6;
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 targetIndex:(int)a5
{
}

- (void)_saveDebugInfoFrom:(id)a3 to:(id)a4 withTextSegment:(id)a5 targetIndex:(int)a6
{
  id v34 = a3;
  id v33 = a4;
  __int128 v32 = (lldb::SBDebugger *)a5;
  lldb::SBDebugger::Create(v32);
  if ((lldb::SBDebugger::IsValid((lldb::SBDebugger *)v44) & 1) != 0)
  {
    id v9 = v34;
    lldb::SBDebugger::CreateTargetWithFileAndArch( v43,  (lldb::SBDebugger *)v44,  (const char *)[v9 UTF8String],  "16777235-0");
    if ((lldb::SBTarget::IsValid((lldb::SBTarget *)v43) & 1) != 0)
    {
      id v10 = v9;
      lldb::SBFileSpec::SBFileSpec((lldb::SBFileSpec *)v42, (const char *)[v10 UTF8String], 1);
      lldb::SBTarget::FindModule(v41, (lldb::SBTarget *)v43, (const lldb::SBFileSpec *)v42);
      if (lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v41))
      {
        unint64_t v11 = fopen((const char *)[v33 UTF8String], "wt");
        if (v11)
        {
          double v12 = (GPUToolsPlatformLLVMShaderProfilerHelper *)operator new(8uLL);
          GPUToolsPlatformLLVMShaderProfilerHelper::GPUToolsPlatformLLVMShaderProfilerHelper(v12);
          GPUToolsPlatformLLVMShaderProfilerHelper::SetFileForAnalysis( v12, (const char *)[v10 UTF8String], a6, v11);
          for (unsigned int i = 0; i < lldb::SBModule::GetNumCompileUnits((lldb::SBModule *)v41); ++i)
          {
            lldb::SBModule::GetCompileUnitAtIndex(&v40, (lldb::SBModule *)v41, i);
            lldb::SBCompileUnit::GetFileSpec((lldb::SBCompileUnit *)&v40);
            if (lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v40))
            {
              fprintf(v11, "[%3u] Compile Unit\n", i);
              Directory = (const char *)lldb::SBFileSpec::GetDirectory((lldb::SBFileSpec *)v39);
              fprintf(v11, "      Directory: %s\n", Directory);
              Filename = (const char *)lldb::SBFileSpec::GetFilename((lldb::SBFileSpec *)v39);
              fprintf(v11, "      Filename : %s\n", Filename);
              fwrite("      Line Info:\n", 0x11uLL, 1uLL, v11);
              for (unsigned int j = 0; j < lldb::SBCompileUnit::GetNumLineEntries((lldb::SBCompileUnit *)&v40); ++j)
              {
                lldb::SBCompileUnit::GetLineEntryAtIndex(&v38, (lldb::SBCompileUnit *)&v40, j);
                int Line = lldb::SBLineEntry::GetLine((lldb::SBLineEntry *)&v38);
                int Column = lldb::SBLineEntry::GetColumn((lldb::SBLineEntry *)&v38);
                lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v38);
                uint64_t FileAddress = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)&v46);
                lldb::SBLineEntry::GetEndAddress((lldb::SBLineEntry *)&v38);
                uint64_t v19 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)v55);
                fprintf(v11, "      %4u [%4u:%4u] %0.8llx - %0.8llx\n", j, Line, Column, FileAddress, v19);
                lldb::SBAddress::~SBAddress((lldb::SBAddress *)v55);
                lldb::SBAddress::~SBAddress((lldb::SBAddress *)&v46);
                if ((a6 & 0x80000000) == 0 && *(void *)v12 && *(_BYTE *)(*(void *)v12 + 152LL))
                {
                  lldb::SBLineEntry::GetStartAddress((lldb::SBLineEntry *)&v38);
                  uint64_t v20 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)v37);
                  lldb::SBLineEntry::GetEndAddress((lldb::SBLineEntry *)&v38);
                  uint64_t v21 = lldb::SBAddress::GetFileAddress((lldb::SBAddress *)v36);
                  __int128 v22 = *(void **)v12;
                  v55[0] = 0LL;
                  v55[1] = 0LL;
                  uint64_t v56 = 0LL;
                  int v47 = 0;
                  char v51 = 0;
                  uint64_t v52 = 0LL;
                  int v53 = 1;
                  uint64_t v49 = 0LL;
                  uint64_t v50 = 0LL;
                  uint64_t v48 = 0LL;
                  __int128 v54 = v55;
                  llvm::raw_ostream::SetUnbuffered((llvm::raw_ostream *)&v46);
                  GPUToolsPlatformLLVMShaderProfilerHelperImpl::_DumpInstructionsToOStream( v22,  (llvm::raw_ostream *)&v46,  v20,  v21,  v23);
                  int v24 = (std::string *)v54;
                  if (*((char *)v54 + 23) < 0)
                  {
                    __int128 v26 = *v54;
                    double v25 = (unsigned __int8 *)v54[1];
                  }

                  else
                  {
                    double v25 = (unsigned __int8 *)*((unsigned __int8 *)v54 + 23);
                    __int128 v26 = v54;
                  }

                  unsigned __int8 v45 = 9;
                  __int128 v27 = std::remove[abi:nn180100]<std::__wrap_iter<char *>,char>(v26, &v25[(void)v26], &v45);
                  if ((char)v24->__r_.__value_.__s.__size_ < 0)
                  {
                    std::string::size_type v29 = v24->__r_.__value_.__r.__words[0];
                    __int128 v28 = (char *)(v24->__r_.__value_.__r.__words[0] + v24->__r_.__value_.__l.__size_);
                  }

                  else
                  {
                    __int128 v28 = (char *)v24 + v24->__r_.__value_.__s.__size_;
                    std::string::size_type v29 = (std::string::size_type)v24;
                  }

                  std::string::erase(v24, (std::string::size_type)&v27[-v29], v28 - (char *)v27);
                  __int128 v30 = (FILE *)v22[18];
                  if (v30)
                  {
                    __int128 v31 = (const char *)v54;
                    fputs(v31, v30);
                  }

                  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v46);
                  if (SHIBYTE(v56) < 0) {
                    operator delete(v55[0]);
                  }
                  lldb::SBAddress::~SBAddress((lldb::SBAddress *)v36);
                  lldb::SBAddress::~SBAddress((lldb::SBAddress *)v37);
                }

                lldb::SBLineEntry::~SBLineEntry((lldb::SBLineEntry *)&v38);
              }

              fputc(10, v11);
            }

            lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v39);
            lldb::SBCompileUnit::~SBCompileUnit((lldb::SBCompileUnit *)&v40);
          }

          fclose(v11);
          std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelperImpl>::reset[abi:nn180100]((uint64_t *)v12, 0LL);
          operator delete(v12);
        }
      }

      lldb::SBModule::~SBModule((lldb::SBModule *)v41);
      lldb::SBFileSpec::~SBFileSpec((lldb::SBFileSpec *)v42);
    }

    lldb::SBTarget::~SBTarget((lldb::SBTarget *)v43);
  }

  lldb::SBDebugger::~SBDebugger((lldb::SBDebugger *)v44);
}

- (void)_dumpShaderBinaryInfo:(id)a3 usingKey:(id)a4 withBaseFileName:(id)a5 targetIndex:(int)a6
{
  uint64_t v7 = *(void *)&a6;
  id v96 = a3;
  id v10 = a5;
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v96 binary]);

  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingString:@".bin"]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v96 binary]);
    [v13 writeToFile:v12 atomically:0];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _extractShaderBinaryTextSegment:]( self,  "_extractShaderBinaryTextSegment:",  v96));
    double v15 = (GPUToolsPlatformLLVMShaderProfilerHelper *)operator new(8uLL);
    GPUToolsPlatformLLVMShaderProfilerHelper::GPUToolsPlatformLLVMShaderProfilerHelper(v15);
    id v16 = v12;
    if (GPUToolsPlatformLLVMShaderProfilerHelper::SetFileForAnalysis( v15,  (const char *)[v16 UTF8String],  v7,  0))
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByDeletingPathExtension]);
      double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@"_text.txt"]);

      id v89 = v18;
      __s = (char *)[v89 UTF8String];
      uint64_t v19 = *(GPUToolsPlatformLLVMShaderProfilerHelperImpl **)v15;
      __p[0] = 0LL;
      __p[1] = 0LL;
      uint64_t v111 = 0LL;
      int v102 = 0;
      char v106 = 0;
      uint64_t v107 = 0LL;
      int v108 = 1;
      uint64_t v104 = 0LL;
      uint64_t v105 = 0LL;
      uint64_t v103 = 0LL;
      __int128 v109 = __p;
      llvm::raw_ostream::SetUnbuffered((llvm::raw_ostream *)&v101);
      uint64_t v20 = *((void *)v19 + 15);
      uint64_t v21 = *(void *)(v20 + 16);
      uint64_t v22 = *((void *)v19 + 11);
      v115[0] = v20;
      v115[1] = 0LL;
      v115[2] = v20;
      v115[3] = v21;
      memset(v116, 0, sizeof(v116));
      id v97 = v19;
      (*(void (**)(uint64_t *__return_ptr, uint64_t, void *, void, void *))(*(void *)v22 + 48LL))( &v119,  v22,  v115,  *((void *)v19 + 7),  v116);
      if ((v121 & 1) == 0)
      {
        size_t v23 = 8LL * *(void *)(v20 + 16);
        __int128 v98 = 0u;
        __int128 v99 = 0u;
        float v100 = 1.0;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v98,  v23);
        float v24 = 0.0;
        float v25 = 0.0;
        if (*((void *)&v98 + 1)) {
          float v25 = (float)*((unint64_t *)&v99 + 1) / (float)*((unint64_t *)&v98 + 1);
        }
        id v82 = v16;
        uint64_t v83 = v15;
        unint64_t v84 = self;
        unsigned int v85 = v7;
        int v86 = v14;
        id v87 = v10;
        float v100 = fmaxf(v25, 0.25);
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        float v114 = 1.0;
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v112,  (v120 - v119) >> 5);
        if (*((void *)&v112 + 1)) {
          float v24 = (float)*((unint64_t *)&v113 + 1) / (float)*((unint64_t *)&v112 + 1);
        }
        float v114 = fmaxf(v24, 0.25);
        uint64_t v91 = v119;
        uint64_t v88 = v120;
        if (v119 != v120)
        {
          unsigned int v26 = 0;
          do
          {
            unint64_t v27 = *(void *)(v91 + 8);
            unint64_t v28 = *(void *)(v91 + 24);
            unint64_t v92 = v28;
            while (v27 < v28
                 && !std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( &v112,  v27))
            {
              if ((unint64_t)(v104 - v105) > 7)
              {
                *(void *)uint64_t v105 = 0x23206D6165727453LL;
                v105 += 8;
                std::string::size_type v29 = &v101;
              }

              else
              {
                std::string::size_type v29 = (char **)llvm::raw_ostream::write((llvm::raw_ostream *)&v101, "Stream #", 8uLL);
              }

              __int128 v30 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v29, *((void *)&v113 + 1));
              __int128 v31 = (void *)*((void *)v30 + 4);
              if (*((void *)v30 + 3) - (void)v31 > 0xCuLL)
              {
                qmemcpy(v31, " Starting at ", 13);
                *((void *)v30 + 4) += 13LL;
              }

              else
              {
                __int128 v30 = (llvm::raw_ostream *)llvm::raw_ostream::write(v30, " Starting at ", 0xDuLL);
              }

              __int128 v32 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v30, v27);
              id v33 = (_BYTE *)*((void *)v32 + 4);
              if (*((_BYTE **)v32 + 3) == v33)
              {
                llvm::raw_ostream::write(v32, "\n", 1uLL);
              }

              else
              {
                _BYTE *v33 = 10;
                ++*((void *)v32 + 4);
              }

              std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long>( (uint64_t)&v112,  v27,  v27);
              (*(void (**)(llvm::agxclauseanalyzer::InstrStream **__return_ptr, void, void, unint64_t, void, void))(**((void **)v97 + 11) + 40LL))( &v117,  *((void *)v97 + 11),  *((void *)v97 + 15),  v27,  *((void *)v97 + 15),  *(void *)(*((void *)v97 + 15) + 16LL));
              char v34 = v118;
              if ((v118 & 1) == 0)
              {
                char v94 = v118;
                unint64_t v95 = v27;
                __int128 v35 = v117;
                __int128 v117 = 0LL;
                uint64_t v37 = (llvm::agxclauseanalyzer::InstrClause **)*((void *)v35 + 1);
                BOOL v36 = (llvm::agxclauseanalyzer::InstrClause **)*((void *)v35 + 2);
                if (v37 == v36)
                {
                  v27 += llvm::agxclauseanalyzer::InstrStream::getSizeInBytes(v35);
                  unint64_t v28 = v92;
                  char v34 = v94;
                  goto LABEL_88;
                }

                double v93 = v35;
                while (2)
                {
                  uint64_t v38 = *v37;
                  unint64_t Offset = llvm::agxclauseanalyzer::InstrClause::getOffset(*v37);
                  unint64_t SizeInBytes = llvm::agxclauseanalyzer::InstrClause::getSizeInBytes(v38);
                  uint64_t v41 = *((void *)v38 + 1);
                  uint64_t v42 = *((void *)v38 + 2);
                  uint64_t v43 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( &v98,  Offset);
                  if (v43)
                  {
                    if (v43[3] < SizeInBytes)
                    {
                      v43[3] = SizeInBytes;
                      goto LABEL_66;
                    }

                    goto LABEL_84;
                  }

                  unint64_t v44 = *((void *)&v98 + 1);
                  if (*((void *)&v98 + 1))
                  {
                    uint8x8_t v45 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v98 + 8));
                    v45.i16[0] = vaddlv_u8(v45);
                    if (v45.u32[0] > 1uLL)
                    {
                      unint64_t v6 = Offset;
                      if (Offset >= *((void *)&v98 + 1)) {
                        unint64_t v6 = Offset % *((void *)&v98 + 1);
                      }
                    }

                    else
                    {
                      unint64_t v6 = (*((void *)&v98 + 1) - 1LL) & Offset;
                    }

                    unsigned int v46 = *(void **)(v98 + 8 * v6);
                    if (v46)
                    {
                      for (unsigned int i = (void *)*v46; i; unsigned int i = (void *)*i)
                      {
                        unint64_t v48 = i[1];
                        if (v48 == Offset)
                        {
                          if (i[2] == Offset) {
                            goto LABEL_66;
                          }
                        }

                        else
                        {
                          if (v45.u32[0] > 1uLL)
                          {
                            if (v48 >= *((void *)&v98 + 1)) {
                              v48 %= *((void *)&v98 + 1);
                            }
                          }

                          else
                          {
                            v48 &= *((void *)&v98 + 1) - 1LL;
                          }

                          if (v48 != v6) {
                            break;
                          }
                        }
                      }
                    }
                  }

                  uint64_t v49 = operator new(0x20uLL);
                  void *v49 = 0LL;
                  v49[1] = Offset;
                  v49[2] = Offset;
                  v49[3] = SizeInBytes;
                  float v50 = (float)(unint64_t)(*((void *)&v99 + 1) + 1LL);
                  if (!v44 || (float)(v100 * (float)v44) < v50)
                  {
                    BOOL v51 = (v44 & (v44 - 1)) != 0;
                    if (v44 < 3) {
                      BOOL v51 = 1LL;
                    }
                    unint64_t v52 = v51 | (2 * v44);
                    unint64_t v53 = vcvtps_u32_f32(v50 / v100);
                    if (v52 <= v53) {
                      size_t v54 = v53;
                    }
                    else {
                      size_t v54 = v52;
                    }
                    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v98,  v54);
                    unint64_t v44 = *((void *)&v98 + 1);
                    if ((*((void *)&v98 + 1) & (*((void *)&v98 + 1) - 1LL)) != 0)
                    {
                      if (Offset >= *((void *)&v98 + 1)) {
                        unint64_t v6 = Offset % *((void *)&v98 + 1);
                      }
                      else {
                        unint64_t v6 = Offset;
                      }
                    }

                    else
                    {
                      unint64_t v6 = (*((void *)&v98 + 1) - 1LL) & Offset;
                    }
                  }

                  uint64_t v55 = v98;
                  uint64_t v56 = *(void **)(v98 + 8 * v6);
                  if (v56)
                  {
                    void *v49 = *v56;
                    goto LABEL_64;
                  }

                  void *v49 = v99;
                  *(void *)&__int128 v99 = v49;
                  *(void *)(v55 + 8 * v6) = &v99;
                  if (*v49)
                  {
                    unint64_t v57 = *(void *)(*v49 + 8LL);
                    if ((v44 & (v44 - 1)) != 0)
                    {
                      if (v57 >= v44) {
                        v57 %= v44;
                      }
                    }

                    else
                    {
                      v57 &= v44 - 1;
                    }

                    uint64_t v56 = (void *)(v98 + 8 * v57);
LABEL_64:
                    *uint64_t v56 = v49;
                  }

                  ++*((void *)&v99 + 1);
LABEL_66:
                  if ((unint64_t)(v104 - v105) > 7)
                  {
                    *(void *)uint64_t v105 = 0x2320657375616C43LL;
                    v105 += 8;
                    uint64_t v58 = &v101;
                  }

                  else
                  {
                    uint64_t v58 = (char **)llvm::raw_ostream::write((llvm::raw_ostream *)&v101, "Clause #", 8uLL);
                  }

                  int v59 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v58, v26);
                  uint64_t v60 = *((void *)v59 + 4);
                  if ((unint64_t)(*((void *)v59 + 3) - v60) > 8)
                  {
                    *(_BYTE *)(v60 + 8) = 32;
                    *(void *)uint64_t v60 = *(void *)", Offset ";
                    *((void *)v59 + 4) += 9LL;
                  }

                  else
                  {
                    int v59 = (llvm::raw_ostream *)llvm::raw_ostream::write(v59, ", Offset ", 9uLL);
                  }

                  int v61 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v59, Offset);
                  int v62 = (_OWORD *)*((void *)v61 + 4);
                  if (*((void *)v61 + 3) - (void)v62 > 0xFuLL)
                  {
                    _OWORD *v62 = *(_OWORD *)", size in bytes ";
                    *((void *)v61 + 4) += 16LL;
                  }

                  else
                  {
                    int v61 = (llvm::raw_ostream *)llvm::raw_ostream::write(v61, ", size in bytes ", 0x10uLL);
                  }

                  uint64_t v63 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v61, SizeInBytes);
                  uint64_t v64 = *((void *)v63 + 4);
                  if ((unint64_t)(*((void *)v63 + 3) - v64) > 0x13)
                  {
                    *(_DWORD *)(v64 + 16) = 544501365;
                    *(_OWORD *)uint64_t v64 = *(_OWORD *)", Instruction Count ";
                    *((void *)v63 + 4) += 20LL;
                  }

                  else
                  {
                    uint64_t v63 = (llvm::raw_ostream *)llvm::raw_ostream::write(v63, ", Instruction Count ", 0x14uLL);
                  }

                  int v65 = (llvm::raw_ostream *)llvm::raw_ostream::operator<<(v63, (v42 - v41) >> 3);
                  uint8x8_t v67 = (_BYTE *)*((void *)v65 + 4);
                  if (*((_BYTE **)v65 + 3) == v67)
                  {
                    llvm::raw_ostream::write(v65, "\n", 1uLL);
                  }

                  else
                  {
                    _BYTE *v67 = 10;
                    ++*((void *)v65 + 4);
                  }

                  ++v26;
                  GPUToolsPlatformLLVMShaderProfilerHelperImpl::_DumpInstructionsToOStream( v97,  (llvm::raw_ostream *)&v101,  Offset,  Offset + SizeInBytes,  v66);
                  if (v104 == v105) {
                    llvm::raw_ostream::write((llvm::raw_ostream *)&v101, "\n", 1uLL);
                  }
                  else {
                    *v105++ = 10;
                  }
LABEL_84:
                  if (++v37 == v36)
                  {
                    __int128 v35 = v93;
                    unint64_t v27 = llvm::agxclauseanalyzer::InstrStream::getSizeInBytes(v93) + v95;
                    unint64_t v28 = v92;
                    char v34 = v94;
                    if (!v93) {
                      break;
                    }
LABEL_88:
                    (*(void (**)(llvm::agxclauseanalyzer::InstrStream *))(*(void *)v35 + 8LL))(v35);
                    break;
                  }

                  continue;
                }
              }

              unint64_t v68 = v117;
              __int128 v117 = 0LL;
              if (v68) {
                (*(void (**)(llvm::agxclauseanalyzer::InstrStream *))(*(void *)v68 + 8LL))(v68);
              }
              if ((v34 & 1) != 0) {
                goto LABEL_94;
              }
            }

            v91 += 32LL;
          }

          while (v91 != v88);
        }

- (void)_saveShaderBinariesWith:(id)a3 targetIndex:(int)a4
{
  uint64_t v49 = (id *)a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([self->_options->var0 stringByAppendingPathComponent:@"/shaderBinaries"]);
  id v7 = objc_claimAutoreleasedReturnValue( [v6 stringByAppendingPathComponent:@"/legacy-drawCallToBinariesMap.txt"]);
  uint64_t v8 = fopen((const char *)[v7 UTF8String], "wt");

  if (v8)
  {
    fwrite( "Index | DisplayIdx |          VS_Hash     |          FS_Hash     |         CS_Hash        \n",  0x5BuLL,  1uLL,  v8);
    for (unsigned int i = 0; ; ++i)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v49 drawCallInfoList]);
      id v11 = [v10 count];

      double v12 = (void *)objc_claimAutoreleasedReturnValue([v49 drawCallInfoList]);
      unsigned int v13 = self;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:i]);

      unsigned int v15 = [v14 functionIndex];
      id v16 = (void *)v14[1];
      if (v16) {
        double v17 = (const char *)[v16 UTF8String];
      }
      else {
        double v17 = "";
      }
      double v18 = (void *)v14[2];
      if (v18) {
        uint64_t v19 = (const char *)[v18 UTF8String];
      }
      else {
        uint64_t v19 = "";
      }
      uint64_t v20 = (void *)v14[3];
      if (v20) {
        uint64_t v21 = (const char *)[v20 UTF8String];
      }
      else {
        uint64_t v21 = "";
      }
      fprintf(v8, "%5u | %10u | %19s | %19s | %19s\n", i, v15, v17, v19, v21);

      self = v13;
    }

    fclose(v8);
    id v22 = objc_claimAutoreleasedReturnValue( [v6 stringByAppendingPathComponent:@"/drawCallToBinariesMap.txt"]);
    size_t v23 = fopen((const char *)[v22 UTF8String], "wt");

    if (v23)
    {
      int v24 = a4;
      fwrite("Index | DisplayIdx | All Binary keys\n", 0x25uLL, 1uLL, v23);
      unsigned int v25 = 0;
      unsigned int v26 = v6;
      for (j = a4; ; int v24 = j)
      {
        unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v49 drawCallInfoList]);
        id v28 = [v27 count];

        std::string::size_type v29 = (void *)objc_claimAutoreleasedReturnValue([v49 drawCallInfoList]);
        unsigned int v48 = v25;
        __int128 v30 = (id *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v25]);

        fprintf(v23, "%5u | %10u |", v25, [v30 functionIndex]);
        unsigned int v31 = 0;
        while (1)
        {
          unsigned int v32 = v31;
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v30[4] objectAtIndexedSubscript:v31]);
          char v34 = (void *)objc_claimAutoreleasedReturnValue([v49[33] objectForKeyedSubscript:v33]);
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 type]);

          if (v32) {
            BOOL v36 = ", ";
          }
          else {
            BOOL v36 = " ";
          }
          id v37 = v33;
          uint64_t v38 = (const char *)[v37 UTF8String];
          if (v35) {
            unsigned int v39 = (const char *)[v35 UTF8String];
          }
          else {
            unsigned int v39 = "";
          }
          fprintf(v23, "%s%s(%s)", v36, v38, v39);

          unsigned int v31 = v32 + 1;
          unint64_t v6 = v26;
        }

        fputc(10, v23);

        unsigned int v25 = v48 + 1;
      }

      fclose(v23);
      id v40 = v49[30];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke;
      v59[3] = &unk_58E630;
      v59[4] = self;
      id v41 = v6;
      id v60 = v41;
      int v61 = v24;
      [v40 enumerateKeysAndObjectsUsingBlock:v59];
      id v42 = v49[31];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2;
      v56[3] = &unk_58E630;
      v56[4] = self;
      id v43 = v41;
      id v57 = v43;
      int v58 = v24;
      [v42 enumerateKeysAndObjectsUsingBlock:v56];
      id v44 = v49[32];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3;
      uint64_t v53[3] = &unk_58E630;
      v53[4] = self;
      id v45 = v43;
      id v54 = v45;
      int v55 = v24;
      [v44 enumerateKeysAndObjectsUsingBlock:v53];
      id v46 = v49[33];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472LL;
      v50[2] = __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4;
      void v50[3] = &unk_58E630;
      v50[4] = self;
      id v51 = v45;
      int v52 = v24;
      [v46 enumerateKeysAndObjectsUsingBlock:v50];
    }
  }
}

- (id)_setupLimiterInfoPerDrawCall:(id)a3 forPayload:(id)a4 withShaderInfo:(id)a5
{
  id v46 = a3;
  id v43 = a4;
  id v44 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"LimiterCounterData"]);
  id v45 = v7;
  if (v7)
  {
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"derivedCounterData"]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"counters"]);
    id v9 = v8;
    if (!v8)
    {
      id v49 = 0LL;
LABEL_50:

      goto LABEL_51;
    }

    id obj = (id)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    unint64_t v10 = (unint64_t)[&off_59F968 count];
    unint64_t v11 = v10;
    if (v10)
    {
      if (v10 >> 62) {
        abort();
      }
      double v12 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v10);
      bzero(v12, 4 * v11);
    }

    else
    {
      double v12 = 0LL;
    }

    std::string __p = v12;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id obja = obj;
    id v13 = [obja countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v13)
    {
      unsigned int v14 = 0;
      uint64_t v55 = *(void *)v64;
      id v57 = 0LL;
      do
      {
        for (unsigned int i = 0LL; i != v13; unsigned int i = (char *)i + 1)
        {
          if (*(void *)v64 != v55) {
            objc_enumerationMutation(obja);
          }
          unsigned int v16 = 0;
          double v17 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          while (1)
          {
            uint64_t v18 = v16;
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([&off_59F968 objectAtIndexedSubscript:v16]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([&off_5A0038 objectForKeyedSubscript:v19]);

            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([&off_59F968 objectAtIndexedSubscript:v18]);
            if ([v17 isEqualToString:v21])
            {

LABEL_23:
              v12[v18] = v14;

              ++v57;
              break;
            }

            if (v20)
            {
              unsigned __int8 v22 = [v17 isEqualToString:v20];

              if ((v22 & 1) != 0) {
                goto LABEL_23;
              }
            }

            else
            {
            }

            unsigned int v16 = v18 + 1;
          }

          ++v14;
        }

        id v13 = [obja countByEnumeratingWithState:&v63 objects:v68 count:16];
      }

      while (v13);
    }

    else
    {
      id v57 = 0LL;
    }

    BOOL v23 = v57 == [&off_59F968 count];
    int v24 = v12;
    if (v23)
    {
      unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKeyedSubscript:@"AverageSamples"]);
      id v49 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v25);
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v47 = (id)objc_claimAutoreleasedReturnValue([v46 drawCallInfoList]);
      id v26 = [v47 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v26)
      {
        uint64_t v50 = *(void *)v60;
        do
        {
          uint64_t v27 = 0LL;
          id v51 = v26;
          do
          {
            if (*(void *)v60 != v50) {
              objc_enumerationMutation(v47);
            }
            id v28 = *(void **)(*((void *)&v59 + 1) + 8 * v27);
            std::string::size_type v29 = (void *)objc_claimAutoreleasedReturnValue([v28 programInfo]);
            uint64_t v56 = v27;
            if (!v29
              || (__int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v28 programInfo]),
                  BOOL v31 = [v30 programId] == (id)-1,
                  v30,
                  v29,
                  !v31))
            {
              unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v48,  "objectAtIndexedSubscript:",  objc_msgSend(v28, "encoderIndex")));
              int v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  3LL));
              id v34 = [&off_59F980 count];
              uint64_t v35 = 0LL;
              BOOL v36 = __p;
              do
              {
                id v37 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v33);
                if (v34)
                {
                  for (int j = 0LL; j != v34; ++j)
                  {
                    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndexedSubscript:v36[(void)j]]);
                    id v40 = (void *)objc_claimAutoreleasedReturnValue([&off_59F980 objectAtIndexedSubscript:j]);
                    [v37 setObject:v39 forKeyedSubscript:v40];
                  }
                }

                [v58 addObject:v37];

                ++v35;
                v36 += (uint64_t)v34;
              }

              while (v35 != 3);
              [v49 addObject:v58];
            }

            uint64_t v27 = v56 + 1;
          }

          while ((id)(v56 + 1) != v51);
          id v26 = [v47 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }

        while (v26);
      }

      int v24 = __p;
      if (!__p) {
        goto LABEL_49;
      }
    }

    else
    {
      id v49 = 0LL;
      if (!v12)
      {
LABEL_49:

        goto LABEL_50;
      }
    }

    operator delete(v24);
    goto LABEL_49;
  }

  id v49 = 0LL;
LABEL_51:

  return v49;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4) + a4]);
  [v8 doubleValue];
  double v10 = v9;

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:**(unsigned int **)a5 + a4]);
  [v11 doubleValue];
  double v13 = v12;

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 8) + a4]);
  [v14 doubleValue];
  double v15 = v13 * 0.01;
  double v16 = v10 * 0.01;
  double v18 = v17 * 0.01;

  if (v15 >= v18) {
    double v19 = v15;
  }
  else {
    double v19 = v18;
  }
  double v20 = v16 / (v19 + 0.00001);
  double v21 = 1.0 - v20;
  BOOL v22 = v20 < 1.0;
  double v23 = 0.0;
  if (v22) {
    double v23 = v21;
  }
  double v24 = (1.0 - (v16 + (1.0 - v16) * 0.5)) * (1.0 - v16 / (v16 + v19 + 0.00001)) + (v16 + (1.0 - v16) * 0.5) * v23;

  return v24;
}

- (double)_latencyAdjustmentWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v8 = 0LL;
  double v9 = 0.0;
  do
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + v8) + a4]);
    [v10 doubleValue];
    double v12 = v11;

    if (v9 < v12) {
      double v9 = v12;
    }
    v8 += 4LL;
  }

  while (v8 != 36);
  double result = 0.0;
  if (v9 * 0.01 < 1.0) {
    return 1.0 - v9 * 0.01;
  }
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(id)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  id v9 = a3;
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4) + a4]);
  [v10 doubleValue];
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:*(unsigned int *)(*(void *)a5 + 4 * a6) + a4]);
  [v13 doubleValue];
  double v15 = v14 * 0.01;

  return 1.0 - v12 * 0.01 / (v12 * 0.01 + v15 + 0.00001);
}

- (double)_waitLatencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:a4]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ALU"]);
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TPU"]);
  [v8 doubleValue];
  double v10 = v9;

  double v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"GlobalLoad"]);
  [v11 doubleValue];
  double v12 = v10 * 0.01;
  double v13 = v7 * 0.01;
  double v15 = v14 * 0.01;

  if (v12 >= v15) {
    double v16 = v12;
  }
  else {
    double v16 = v15;
  }
  double v17 = v13 / (v16 + 0.00001);
  double v18 = 1.0 - v17;
  BOOL v19 = v17 < 1.0;
  double v20 = 0.0;
  if (v19) {
    double v20 = v18;
  }
  double v21 = (1.0 - (v13 + (1.0 - v13) * 0.5)) * (1.0 - v13 / (v13 + v16 + 0.00001)) + (v13 + (1.0 - v13) * 0.5) * v20;

  return v21;
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:a4]);
  uint64_t v9 = 0LL;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke;
  v8[3] = &unk_58E658;
  v8[4] = &v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  double v5 = v10[3] * 0.01;
  if (v5 >= 1.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0 - v5;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (double)_latencyAdjustmentFactorWithLimiterDataForDraw:(id)a3 forDataMaster:(unsigned int)a4 forLimiterType:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 objectAtIndexedSubscript:a4]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ALU"]);
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  [v12 doubleValue];
  double v14 = v13 * 0.01;

  return 1.0 - v11 * 0.01 / (v11 * 0.01 + v14 + 0.00001);
}

- (id)_codeGenCounterProcessing:(id)a3 derivedCounterNames:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( v6,  "appendFormat:",  @"var %@_norm = 0;\n",
          *(void *)(*((void *)&v32 + 1) + 8LL * (void)v10));
        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }

    while (v8);
  }

  [v6 appendString:@"var _DerivedCounterResult = [];\n\n"];
  objc_msgSend( v6,  "appendFormat:",  @"function _SetAndEvaluateRawCounterValues(numSamples, gpuCyclesCounterIndex) {\n");
  [v6 appendString:@"\t_DerivedCounterResult = [];\n"];
  [v6 appendString:@"\tfor (var sampleIndex = 0; sampleIndex < numSamples; ++sampleIndex) {\n"];
  objc_msgSend(v6, "appendFormat:", @"\t\tvar sampleStartIndex = sampleIndex * %lu;\n", objc_msgSend(v7, "count"));
  [v6 appendFormat:@"\t\tvar gpuCycles = _RawCounterValues[gpuCyclesCounterIndex + sampleStartIndex] / num_cores;\n"];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v29;
    do
    {
      double v15 = 0LL;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v28 + 1) + 8LL * (void)v15);
        objc_msgSend( v6,  "appendFormat:",  @"\t\t%@_norm = 100.0 * (_RawCounterValues[%lu + sampleStartIndex] / gpuCycles);\n",
          v16,
          (char *)v15 + v13);

        double v15 = (char *)v15 + 1;
      }

      while (v12 != v15);
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      v13 += (uint64_t)v15;
    }

    while (v12);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v17 = v23;
  id v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      double v20 = 0LL;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(id *)(*((void *)&v24 + 1) + 8LL * (void)v20);
        objc_msgSend( v6,  "appendFormat:",  @"\t\ttry { value = %@(); if (!isFinite(value)) { value = 0; } _DerivedCounterResult.push(value); } catch(err) { ErrorLog(err); _DerivedCounterResult.push(0); }\n",
          v21);

        double v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }

    while (v18);
  }

  [v6 appendFormat:@"\t}\n"];
  [v6 appendFormat:@"}\n"];

  return v6;
}

- (BOOL)_prepareCounterNames:(id)a3 derivedCounterNames:(id)a4 withContext:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _codeGenCounterProcessing:derivedCounterNames:]( self,  "_codeGenCounterProcessing:derivedCounterNames:",  a3,  a4));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 context]);
  [v10 setObject:&__block_literal_global_651 forKeyedSubscript:@"ErrorLog"];

  LOBYTE(v10) = [v8 evaluteScript:v9 scriptURL:0];
  return (char)v10;
}

- (id)_prepareAndEvaluateCounterValues:(unsigned int *)a3 numElementsPerSample:(unint64_t)a4 numSamples:(unint64_t)a5 withContext:(id)a6 withGPUCyclesCounterIndex:(unint64_t)a7
{
  id v11 = a6;
  [v11 setRawArrayValues:@"_RawCounterValues" withUint32Values:a3 andNumCounters:a5 * a4];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a5));
  v18[0] = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a7));
  v18[1] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
  [v11 callFunction:@"_SetAndEvaluateRawCounterValues" withArguments:v14];

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v11 getValue:@"_DerivedCounterResult"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 toArray]);

  return v16;
}

- (void)_PrintLimiterData:(PerfCounterCompressedSample *)a3 withRawLimiterList:(id)a4 withDerivedCounters:(id)a5 andDerivedCounterNames:(id)a6
{
  id v24 = a4;
  id v9 = a5;
  id v10 = a6;
  if ((*(_DWORD *)a3 & 0x3FFFFFF) != 0)
  {
    unsigned int v23 = 0;
    do
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      unsigned int v12 = 0;
      unsigned int v13 = v23 * (*(unsigned int *)a3 >> 26);
      while (1)
      {
        unsigned int v14 = v12;
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:v12]);
        [v11 appendFormat:@"%@ = %u, ", v15, a3->var2[v13 + v14]];

        unsigned int v12 = v14 + 1;
      }

      NSLog(@"%@", v11);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      unsigned int v17 = 0;
      unsigned int v18 = v23 * [v10 count];
      while (1)
      {
        unsigned int v19 = v17;
        double v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v17]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v18 + v17]);
        [v21 doubleValue];
        [v16 appendFormat:@"%@ = %f, ", v20, v22];

        unsigned int v17 = v19 + 1;
      }

      NSLog(@"%@", v16);

      ++v23;
    }

    while (v23 < (*(_DWORD *)a3 & 0x3FFFFFFu));
  }
}

- (id)_processGPURawCounterData:(id)a3 andFillDeivedCounterNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"limiter sample data"]);
  id v9 = v8;
  if (v8)
  {
    id v10 = (char *)[v8 bytes];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"limiter sample counters"]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"LimiterCounters"]);
    if (v13)
    {
      unsigned int v14 = (void *)objc_opt_new(&OBJC_CLASS___DYJSScriptingContext, v12);
      double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"DerivedCounterScript"]);
      unsigned __int8 v16 = [v14 evaluteScript:v15 scriptURL:0];

      if ((v16 & 1) != 0)
      {
        unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"DerivedCounterDictionary"]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"DerivedCounters"]);

        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
        if (-[GTShaderProfilerHelper _prepareCounterNames:derivedCounterNames:withContext:]( self,  "_prepareCounterNames:derivedCounterNames:withContext:",  v11,  v19,  v14))
        {
          double v20 = (void *)objc_claimAutoreleasedReturnValue( -[GTShaderProfilerHelper _prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:]( self,  "_prepareAndEvaluateCounterValues:numElementsPerSample:numSamples:withContext:withGPUCyclesCounterIndex:",  v10 + 4));
          [v7 addObjectsFromArray:v19];
        }

        else
        {
          double v20 = 0LL;
        }
      }

      else
      {
        double v20 = 0LL;
      }
    }

    else
    {
      double v20 = 0LL;
    }
  }

  else
  {
    double v20 = 0LL;
  }

  return v20;
}

- (void)_calculateEffectiveGPUEncoderCostforData:(id)a3 andPerLimiterBatchCost:(void *)a4 forShaderProfilerResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  id v11 = (unsigned int *)[v10 bytes];
  unint64_t v12 = (unint64_t)[v10 length];
  if (v12 >= 0x18)
  {
    double v70 = self;
    uint64_t v71 = v9;
    id v72 = v10;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    int v81 = 1065353216;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    int v78 = 1065353216;
    *(void *)&v75[0] = &v76;
    *(void *)&v75[1] = &v79;
    *(void *)&v75[2] = a4;
    unint64_t v13 = v12 / 0x18 - 1;
    if (v12 / 0x18 != 1)
    {
      uint64_t v14 = 0LL;
      while (1)
      {
        double v15 = &v11[6 * v14];
        uint64_t v16 = *(void *)(v15 + 3);
        unint64_t v17 = 125 * (*(void *)(v15 + 9) - v16) / 3uLL;
        unsigned int v18 = *v15;
        unsigned int v19 = v15[2];
        if ((*v15 & 1) != 0) {
          break;
        }
        double v20 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[]( (float *)&v76,  v19);
        *(_DWORD *)double v20 = (v18 >> 1) & 7;
        *((void *)v20 + 1) = v16;
        *((void *)v20 + 2) = 0LL;
        -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()( v75,  &v11[6 * v14],  v17);
LABEL_37:
        if (++v14 == v13) {
          goto LABEL_38;
        }
      }

      id v21 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( &v76,  v19);
      if (!v21)
      {
LABEL_35:
        if (*((void *)&v77 + 1)) {
          -[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::$_4::operator()( v75,  &v11[6 * v14],  v17);
        }
        goto LABEL_37;
      }

      uint64_t v22 = v21;
      uint64_t v23 = v21[4];
      id v24 = std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::TimeStats>::operator[]( (uint64_t)&v79,  *((_DWORD *)v21 + 4));
      *(double *)&v24[8 * *((unsigned int *)v22 + 6)] = *(double *)&v24[8 * *((unsigned int *)v22 + 6)]
                                                      + (double)(125 * (v16 - v23) / 3uLL);
      unint64_t v25 = *((void *)&v76 + 1);
      unint64_t v26 = v22[1];
      uint8x8_t v27 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v76 + 8));
      v27.i16[0] = vaddlv_u8(v27);
      if (v27.u32[0] > 1uLL)
      {
        if (v26 >= *((void *)&v76 + 1)) {
          v26 %= *((void *)&v76 + 1);
        }
      }

      else
      {
        v26 &= *((void *)&v76 + 1) - 1LL;
      }

      uint64_t v28 = *v22;
      __int128 v29 = *(uint64_t **)(v76 + 8 * v26);
      do
      {
        __int128 v30 = v29;
        __int128 v29 = (uint64_t *)*v29;
      }

      while (v29 != v22);
      unint64_t v31 = v30[1];
      if (v27.u32[0] > 1uLL)
      {
        if (v31 >= *((void *)&v76 + 1)) {
          v31 %= *((void *)&v76 + 1);
        }
      }

      else
      {
        v31 &= *((void *)&v76 + 1) - 1LL;
      }

      if (v31 != v26)
      {
LABEL_24:
        if (v28)
        {
          unint64_t v32 = *(void *)(v28 + 8);
          if (v27.u32[0] > 1uLL)
          {
            unint64_t v33 = *(void *)(v28 + 8);
            if (v32 >= *((void *)&v76 + 1)) {
              unint64_t v33 = v32 % *((void *)&v76 + 1);
            }
          }

          else
          {
            unint64_t v33 = v32 & (*((void *)&v76 + 1) - 1LL);
          }

          if (v33 == v26) {
            goto LABEL_28;
          }
        }

        *(void *)(v76 + 8 * v26) = 0LL;
        uint64_t v28 = *v22;
      }

      if (!v28)
      {
LABEL_34:
        uint64_t *v30 = v28;
        --*((void *)&v77 + 1);
        operator delete(v22);
        goto LABEL_35;
      }

      unint64_t v32 = *(void *)(v28 + 8);
LABEL_28:
      if (v27.u32[0] > 1uLL)
      {
        if (v32 >= v25) {
          v32 %= v25;
        }
      }

      else
      {
        v32 &= v25 - 1;
      }

      if (v32 != v26)
      {
        *(void *)(v76 + 8 * v32) = v30;
        uint64_t v28 = *v22;
      }

      goto LABEL_34;
    }

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void)setMetalPluginName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  return self;
}

- (char)_calculateEffectiveGPUEncoderCostforData:(float *)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v5 = a2;
  unint64_t v6 = *((void *)a1 + 1);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }

    else
    {
      unint64_t v2 = ((_DWORD)v6 - 1) & a2;
    }

    id v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      id v9 = *v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = v9[1];
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return (char *)(v9 + 3);
            }
          }

          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }

            else
            {
              v10 &= v6 - 1;
            }

            if (v10 != v2) {
              break;
            }
          }

          id v9 = (void *)*v9;
        }

        while (v9);
      }
    }
  }

  id v9 = operator new(0x30uLL);
  *id v9 = 0LL;
  v9[1] = v5;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 6) = 0;
  v9[4] = 0LL;
  v9[5] = 0LL;
  float v11 = (float)(unint64_t)(*((void *)a1 + 3) + 1LL);
  float v12 = a1[8];
  if (v6 && (float)(v12 * (float)v6) >= v11)
  {
    unint64_t v5 = v2;
    goto LABEL_64;
  }

  BOOL v13 = (v6 & (v6 - 1)) == 0;
  if (v6 < 3) {
    BOOL v13 = 0;
  }
  unint64_t v14 = (2 * v6) | !v13;
  unint64_t v15 = vcvtps_u32_f32(v11 / v12);
  if (v14 <= v15) {
    int8x8_t prime = (int8x8_t)v15;
  }
  else {
    int8x8_t prime = (int8x8_t)v14;
  }
  if (*(void *)&prime == 1LL)
  {
    int8x8_t prime = (int8x8_t)2LL;
  }

  else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v6 = *((void *)a1 + 1);
  }

  if (*(void *)&prime <= v6)
  {
    if (*(void *)&prime >= v6) {
      goto LABEL_60;
    }
    unint64_t v23 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v6 < 3 || (uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
    {
      unint64_t v23 = std::__next_prime(v23);
    }

    else
    {
      uint64_t v25 = 1LL << -(char)__clz(v23 - 1);
      if (v23 >= 2) {
        unint64_t v23 = v25;
      }
    }

    if (*(void *)&prime <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *((void *)a1 + 1);
      goto LABEL_60;
    }

    if (!*(void *)&prime)
    {
      unint64_t v32 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v32) {
        operator delete(v32);
      }
      unint64_t v6 = 0LL;
      *((void *)a1 + 1) = 0LL;
      goto LABEL_60;
    }
  }

  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  unint64_t v17 = operator new(8LL * *(void *)&prime);
  unsigned int v18 = *(void **)a1;
  *(void *)a1 = v17;
  if (v18) {
    operator delete(v18);
  }
  uint64_t v19 = 0LL;
  *((int8x8_t *)a1 + 1) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v19++) = 0LL;
  while (*(void *)&prime != v19);
  double v20 = (void *)*((void *)a1 + 2);
  if (v20)
  {
    unint64_t v21 = v20[1];
    uint8x8_t v22 = (uint8x8_t)vcnt_s8(prime);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      if (v21 >= *(void *)&prime) {
        v21 %= *(void *)&prime;
      }
    }

    else
    {
      v21 &= *(void *)&prime - 1LL;
    }

    *(void *)(*(void *)a1 + 8 * v21) = a1 + 4;
    unint64_t v26 = (void *)*v20;
    if (*v20)
    {
      do
      {
        unint64_t v27 = v26[1];
        if (v22.u32[0] > 1uLL)
        {
          if (v27 >= *(void *)&prime) {
            v27 %= *(void *)&prime;
          }
        }

        else
        {
          v27 &= *(void *)&prime - 1LL;
        }

        if (v27 != v21)
        {
          if (!*(void *)(*(void *)a1 + 8 * v27))
          {
            *(void *)(*(void *)a1 + 8 * v27) = v20;
            goto LABEL_56;
          }

          void *v20 = *v26;
          *unint64_t v26 = **(void **)(*(void *)a1 + 8 * v27);
          **(void **)(*(void *)a1 + 8 * v27) = v26;
          unint64_t v26 = v20;
        }

        unint64_t v27 = v21;
LABEL_56:
        double v20 = v26;
        unint64_t v26 = (void *)*v26;
        unint64_t v21 = v27;
      }

      while (v26);
    }
  }

  unint64_t v6 = (unint64_t)prime;
LABEL_60:
  if ((v6 & (v6 - 1)) != 0)
  {
    if (v6 <= v5) {
      v5 %= v6;
    }
  }

  else
  {
    unint64_t v5 = ((_DWORD)v6 - 1) & v5;
  }

- (double)_calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:
{
  uint64_t v4 = result;
  unsigned int v6 = *a2;
  unsigned int v5 = a2[1];
  if (v5 >= v5 + (*a2 >> 4))
  {
    unint64_t v15 = *(float **)result;
    goto LABEL_17;
  }

  double v8 = 0.0;
  unint64_t v9 = a2[1];
  do
  {
    unint64_t v10 = *(uint64_t **)(**((void **)v4 + 2) + 40 * v9 + 16);
    if (!v10) {
      goto LABEL_11;
    }
    do
    {
      float v11 = *(float **)v4;
      unsigned int v12 = *((_DWORD *)v10 + 4);
      double result = (double *)std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( *(void **)v4,  v12);
      if (result)
      {
        BOOL v13 = (double *)(v10 + 3);
        double v14 = *((double *)v10 + 3);
        double result = (double *)std::unordered_map<unsigned int,-[GTShaderProfilerHelper _calculateEffectiveGPUEncoderCostforData:andPerLimiterBatchCost:forShaderProfilerResult:]::BatchInfo>::operator[]( v11,  v12);
        result[2] = v14 + result[2];
LABEL_6:
        double v8 = v8 + *v13;
        goto LABEL_8;
      }

      if (v12 == -1)
      {
        BOOL v13 = (double *)(v10 + 3);
        goto LABEL_6;
      }

- (char)_calculateEffectiveGPUEncoderCostforData:(uint64_t)a1 andPerLimiterBatchCost:(unsigned int)a2 forShaderProfilerResult:
{
  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }

    else
    {
      unint64_t v2 = ((_DWORD)v6 - 1) & a2;
    }

    double v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      unint64_t v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = *((void *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return v9 + 24;
            }
          }

          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }

            else
            {
              v10 &= v6 - 1;
            }

            if (v10 != v2) {
              break;
            }
          }

          unint64_t v9 = *(char **)v9;
        }

        while (v9);
      }
    }
  }

  unint64_t v9 = (char *)operator new(0x48uLL);
  *(void *)unint64_t v9 = 0LL;
  *((void *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1LL;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v2 = v5 % v6;
      }
      else {
        unint64_t v2 = v5;
      }
    }

    else
    {
      unint64_t v2 = ((_DWORD)v6 - 1) & v5;
    }
  }

  uint64_t v17 = *(void *)a1;
  unsigned int v18 = *(void **)(*(void *)a1 + 8 * v2);
  if (v18)
  {
    *(void *)unint64_t v9 = *v18;
LABEL_38:
    *unsigned int v18 = v9;
    goto LABEL_39;
  }

  *(void *)unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  *(void *)(v17 + 8 * v2) = a1 + 16;
  if (*(void *)v9)
  {
    unint64_t v19 = *(void *)(*(void *)v9 + 8LL);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6) {
        v19 %= v6;
      }
    }

    else
    {
      v19 &= v6 - 1;
    }

    unsigned int v18 = (void *)(*(void *)a1 + 8 * v19);
    goto LABEL_38;
  }

{
  unint64_t v2;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  void **v8;
  char *v9;
  unint64_t v10;
  float v11;
  float v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  size_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v2 = a2;
      if (v6 <= a2) {
        unint64_t v2 = a2 % v6;
      }
    }

    else
    {
      unint64_t v2 = ((_DWORD)v6 - 1) & a2;
    }

    double v8 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v8)
    {
      unint64_t v9 = (char *)*v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = *((void *)v9 + 1);
          if (v10 == a2)
          {
            if (*((_DWORD *)v9 + 4) == a2) {
              return v9 + 24;
            }
          }

          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }

            else
            {
              v10 &= v6 - 1;
            }

            if (v10 != v2) {
              break;
            }
          }

          unint64_t v9 = *(char **)v9;
        }

        while (v9);
      }
    }
  }

  unint64_t v9 = (char *)operator new(0x48uLL);
  *(void *)unint64_t v9 = 0LL;
  *((void *)v9 + 1) = v5;
  *((_DWORD *)v9 + 4) = a2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1LL;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v2 = v5 % v6;
      }
      else {
        unint64_t v2 = v5;
      }
    }

    else
    {
      unint64_t v2 = ((_DWORD)v6 - 1) & v5;
    }
  }

  uint64_t v17 = *(void *)a1;
  unsigned int v18 = *(void **)(*(void *)a1 + 8 * v2);
  if (v18)
  {
    *(void *)unint64_t v9 = *v18;
LABEL_38:
    *unsigned int v18 = v9;
    goto LABEL_39;
  }

  *(void *)unint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  *(void *)(v17 + 8 * v2) = a1 + 16;
  if (*(void *)v9)
  {
    unint64_t v19 = *(void *)(*(void *)v9 + 8LL);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v19 >= v6) {
        v19 %= v6;
      }
    }

    else
    {
      v19 &= v6 - 1;
    }

    unsigned int v18 = (void *)(*(void *)a1 + 8 * v19);
    goto LABEL_38;
  }

void __79__GTShaderProfilerHelper__prepareCounterNames_derivedCounterNames_withContext___block_invoke( id a1,  NSString *a2)
{
}

void __87__GTShaderProfilerHelper__latencyAdjustmentFactorWithLimiterDataForDraw_forDataMaster___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v6 = a3;
  [v6 doubleValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  *(double *)(v5 + 24) = v4;
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/legacy-VS_%@",  *(void *)(a1 + 40),  v8));
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/legacy-FS_%@",  *(void *)(a1 + 40),  v8));
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/legacy-CS_%@",  *(void *)(a1 + 40),  v8));
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

void __62__GTShaderProfilerHelper__saveShaderBinariesWith_targetIndex___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  *(void *)(a1 + 40),  v8));
  [v6 _dumpShaderBinaryInfo:v5 usingKey:v8 withBaseFileName:v7 targetIndex:*(unsigned int *)(a1 + 48)];
}

uint64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) drawCallInfoList]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "unsignedIntegerValue")));

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) drawCallInfoList]);
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue")));

  if (v8)
  {
    [v8 timing];
    double v11 = v16;
    if (v10)
    {
LABEL_3:
      [v10 timing];
      double v12 = v15;
      goto LABEL_6;
    }
  }

  else
  {
    double v11 = 0.0;
    if (v10) {
      goto LABEL_3;
    }
  }

  double v12 = 0.0;
LABEL_6:
  if (v11 < v12) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = -1LL;
  }

  return v13;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke_3( id a1,  NSNumber *a2,  NSNumber *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = v4;
  uint8x8_t v7 = v5;
  id v8 = v7;
  if (v6)
  {
    -[NSNumber timing](v6, "timing");
    double v9 = v14;
    if (v8)
    {
LABEL_3:
      -[NSNumber timing](v8, "timing");
      double v10 = v13;
      goto LABEL_6;
    }
  }

  else
  {
    double v9 = 0.0;
    if (v7) {
      goto LABEL_3;
    }
  }

  double v10 = 0.0;
LABEL_6:
  if (v9 < v10) {
    int64_t v11 = 1LL;
  }
  else {
    int64_t v11 = -1LL;
  }

  return v11;
}

int64_t __57__GTShaderProfilerHelper__dumpTraceProfileDataForResult___block_invoke( id a1,  DYShaderProfilerProgramInfo *a2,  DYShaderProfilerProgramInfo *a3)
{
  double v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    -[DYShaderProfilerProgramInfo timing](v4, "timing");
    double v7 = v12;
    if (v6)
    {
LABEL_3:
      -[DYShaderProfilerProgramInfo timing](v6, "timing");
      double v8 = v11;
      goto LABEL_6;
    }
  }

  else
  {
    double v7 = 0.0;
    if (v5) {
      goto LABEL_3;
    }
  }

  double v8 = 0.0;
LABEL_6:
  if (v7 < v8) {
    int64_t v9 = 1LL;
  }
  else {
    int64_t v9 = -1LL;
  }

  return v9;
}

uint64_t __85__GTShaderProfilerHelper_profileBatchIdFilteredData_withPayload_forReplayController___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"End Batch ID Streaming Data"]);

  if (v5)
  {
    [WeakRetained _processBatchIdCounterData:WeakRetained[10]];
  }

  else
  {
    [WeakRetained[10] addObject:v3];
    if (g_runningInCI)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Received data for batch %lu",  [WeakRetained[10] count]));
      double v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

      double v8 = __stdoutp;
      id v9 = v7;
      fprintf(v8, "#CI-INFO# %s\n", (const char *)[v9 UTF8String]);
    }
  }

  return 0LL;
}

id __86__GTShaderProfilerHelper_profileShadersForDataSource_withPayload_forReplayController___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"usc sampling address data"]);

  if (v6)
  {
    [v5 _preProcessStreamingUSCSampleData:v3 result:WeakRetained];
LABEL_6:
    double v14 = 0LL;
    goto LABEL_7;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Havested Binaries"]);

  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"MetalPluginName"]);
    id v9 = v5[12];
    v5[12] = (id)v8;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = MetalPluginTarget(v5[12]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Havested Binaries"]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) >= 0));
    [v11 setObject:v12 forKeyedSubscript:@"BatchingFilteringAvailable"];

    id v13 = [v5 _processHarvestedBinaryData:WeakRetained forStreamedData:v11];
LABEL_5:

    goto LABEL_6;
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Finalize Shader Profiler Result"]);

  if (!v16)
  {
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Shader Profiling Frame Time"]);

    if (v20)
    {
      double v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfilingFrameTimes]);

      if (!v14) {
        goto LABEL_7;
      }
      double v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained shaderProfilingFrameTimes]);
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Shader Profiling Frame Time"]);
      [v11 addObject:v21];
    }

    else
    {
      uint8x8_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Frame Time Data"]);

      if (v22)
      {
        unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"GPU Time"]);
        [v23 doubleValue];
        [WeakRetained setGpuTime:v24 / 1000000000.0];

        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Num Ring Buffers"]);
        id v26 = [v25 unsignedIntValue];

        [v5[5] setupDataForEvaluatingStreamingSamples:WeakRetained forRingBufferCount:v26 forTargetIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
        goto LABEL_6;
      }

      unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Blit Command Nsec Times"]);

      if (!v27)
      {
        double v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"derivedCounterData"]);

        if (!v14) {
          goto LABEL_7;
        }
        if (g_runningInCI)
        {
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"derivedCounterData: strongSelf is %p, strongResult is %p",  v5,  WeakRetained));
          unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( [v29 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

          unint64_t v31 = __stdoutp;
          id v32 = v30;
          fprintf(v31, "#CI-INFO# %s\n", (const char *)[v32 UTF8String]);
        }

        if ((*((_BYTE *)v5[1] + 17) & 0x10) == 0)
        {
          [v5 _processDerivedEncoderCounterData:WeakRetained forDerivedEncoderData:v3 withEffectivePerDrawKickTimes:0 withShaderInfo:0];
          double v14 = 0LL;
          goto LABEL_7;
        }

        if (g_runningInCI)
        {
          unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"includePerDrawTimings deferring"));
          unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( [v33 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

          unsigned int v35 = __stdoutp;
          id v36 = v34;
          fprintf(v35, "#CI-INFO# %s\n", (const char *)[v36 UTF8String]);
        }

        [WeakRetained setDerivedCountersData:v3];
        goto LABEL_6;
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Blit Command Nsec Times"]);
      [WeakRetained setBlitTimeData:v28];

      double v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained blitEncoderTimeInfo]);
      [v11 setDictionary:v3];
    }

    goto LABEL_5;
  }

  [v5[5] adjustHWBiasAndFinalizeResult];
  [v5 _addBlitTimesToEffectiveKickTimes:WeakRetained];
  double v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained effectiveKickTimes]);

  if (v14)
  {
    v37[0] = @"Kick Time Data";
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained effectiveKickTimes]);
    v38[0] = v17;
    v37[1] = @"Encoder Load Action Times";
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained loadActionTimes]);
    v38[1] = v18;
    v37[2] = @"Encoder Store Action Times";
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained storeActionTimes]);
    v38[2] = v19;
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
  }

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke( uint64_t a1,  _DWORD *a2,  void *a3,  unsigned int a4,  int a5)
{
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = *(FILE **)(a1 + 40);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aggregatedGPUTimelineInfo]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 derivedCounterNames]);
      id v11 = objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v7]);
      fprintf( v8,  "\t\t\t%s : %f\n",  (const char *)[v11 UTF8String],  *(double *)(*(void *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }

    while (v7 < *(unsigned int *)(a1 + 64));
  }

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_2( uint64_t a1,  _DWORD *a2,  uint64_t a3,  unsigned int a4,  int a5)
{
  if (*(_DWORD *)(a1 + 64))
  {
    unint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = *(FILE **)(a1 + 40);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aggregatedGPUTimelineInfo]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 derivedCounterNames]);
      id v11 = objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:v7]);
      fprintf( v8,  "\t\t\t%s : %f\n",  (const char *)[v11 UTF8String],  *(double *)(*(void *)(a1 + 56) + 8 * (v7 + *(_DWORD *)(a1 + 64) * a4)));

      ++v7;
    }

    while (v7 < *(unsigned int *)(a1 + 64));
  }

void __53__GTShaderProfilerHelper__dumpGPUTimelineDataResult___block_invoke_3( uint64_t a1,  int a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  if (a5)
  {
    uint64_t v8 = 0LL;
    do
    {
      id v9 = *(FILE **)(a1 + 40);
      id v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:v8]);
      fprintf(v9, "\t%s = %.3f\n", (const char *)[v10 UTF8String], *(double *)(a4 + 8 * v8));

      ++v8;
    }

    while (a5 != v8);
  }

uint64_t __88__GTShaderProfilerHelper_processGPUTimelineDataSources_withPayload_forReplayController___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  double v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"usc sampling address data"]);

  if (v7)
  {
    id v8 = objc_loadWeakRetained(v4);
    [v6 _calculatePerSampleActiveShaders:v3 withShaderProfilerResult:v8 forWorkloadInfo:v6[11]];
LABEL_5:

    goto LABEL_6;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"aggregated derived counters"]);

  if (v9)
  {
    id v8 = objc_loadWeakRetained(v4);
    [v6 _calculatePerSampleAggregatedActiveShaders:v3 withShaderProfilerResult:v8 forWorkloadInfo:v6[11]];
    goto LABEL_5;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"derivedCounterData"]);

  if (v11) {
    [v6 _addDerivedCounterDataToTimelineInfo:v3 usingShaderProfilerResult:WeakRetained];
  }
LABEL_6:

  return 0LL;
}

void __50__GTShaderProfilerHelper_processStreamingGRCData___block_invoke(uint64_t a1)
{
  id WeakRetained = (MTLGRCStreamingSampleHelperImpl ***)objc_loadWeakRetained((id *)(a1 + 40));
  MTLGRCStreamingSampleHelperImpl::ProcessStreamedData(*WeakRetained[2], *(NSDictionary **)(a1 + 32), v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"End Streaming Data"]);

  if (v3)
  {
    double v4 = WeakRetained[2];
    id v5 = *v4;
    [*((id *)*v4 + 6) addOperation:*((void *)*v4 + 7)];
    [*((id *)v5 + 7) waitUntilFinished];
    [WeakRetained _handlePerDrawCounterData];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"End Batch ID Streaming Data"]);

    if (v6)
    {
      unint64_t v7 = WeakRetained[2];
      id v8 = *v7;
      [*((id *)*v7 + 6) addOperation:*((void *)*v7 + 7)];
      [*((id *)v8 + 7) waitUntilFinished];
    }
  }
}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v5]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2;
  v12[3] = &unk_58E490;
  id v8 = v6;
  id v13 = v8;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v9;
  id v14 = v9;
  uint64_t v15 = v10;
  int v16 = *(_DWORD *)(a1 + 40);
  [v7 enumerateKeysAndObjectsUsingBlock:v12];
}

void __88__GTShaderProfilerHelper__analyzeShaderBinarySamplesForResult_forShaderKeyToSourcePath___block_invoke_2( uint64_t a1,  void *a2)
{
  id v20 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));
  double v4 = v3;
  if (g_runningInCI)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 binary]);
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dylib]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uscSamples]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"_analyzeShaderBinarySamplesForResult [%@][%@] binary:%p dylib:%@ type:%@ samples:%lu",  v5,  v20,  v6,  v7,  v8,  [v9 length]));

    id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);
    double v12 = __stdoutp;
    id v13 = v11;
    fprintf(v12, "#CI-INFO# %s\n", (const char *)[v13 UTF8String]);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 binary]);

  if (v14)
  {
    uint64_t v15 = *(void **)(a1 + 48);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 binary]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uscSamples]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( [v15 analyzedBinary:v16 processedUscSamples:v17 targetIndex:*(unsigned int *)(a1 + 56) withKey:v20 withShaderSourcePath:0]);

    if (!v18) {
      unsigned int v18 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderAnalyzerResult, v19);
    }
    [v4 setAnalyzerResult:v18];
  }
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (*a1)
  {
    std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::__base_destruct_at_end[abi:nn180100]( (uint64_t)a1,  *a1);
    operator delete((void *)*a1);
  }

  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  return a1;
}

- (void)_processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v5 = (uint64_t)*a1;
  if (std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]( *a1,  (uint64_t)a2))
  {
    return;
  }

  __int128 v84 = 0uLL;
  unsigned int v85 = 0LL;
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v86, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    __int128 v7 = v84;
    id v6 = v85;
  }

  else
  {
    id v6 = 0LL;
    std::string v86 = *a2;
    __int128 v7 = 0uLL;
  }

  __int128 v78 = v7;
  __int128 v87 = v7;
  v88[0] = v6;
  unsigned int v85 = 0LL;
  __int128 v84 = 0uLL;
  if ((v86.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    id v8 = &v86;
  }
  else {
    id v8 = (std::string *)v86.__r_.__value_.__r.__words[0];
  }
  if ((v86.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t size = v86.__r_.__value_.__s.__size_;
  }
  else {
    unint64_t size = v86.__r_.__value_.__l.__size_;
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v8, size);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(v5 + 8);
  __int128 v77 = a1;
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v2 = v10;
      if (v10 >= v12) {
        unint64_t v2 = v10 % v12;
      }
    }

    else
    {
      unint64_t v2 = (v12 - 1) & v10;
    }

    uint64_t v15 = *(std::locale::__imp ***)(*(void *)v5 + 8 * v2);
    if (v15)
    {
      for (unsigned int i = *v15; i; unsigned int i = *(std::locale::__imp **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
        }

        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }

          else
          {
            v17 &= v12 - 1;
          }

          if (v17 != v2) {
            break;
          }
        }
      }
    }
  }

  unsigned int v18 = (char *)operator new(0x40uLL);
  uint64_t v19 = (void *)(v5 + 16);
  v79[0].__locale_ = (std::locale::__imp *)v18;
  v79[1].__locale_ = (std::locale::__imp *)(v5 + 16);
  *(void *)unsigned int v18 = 0LL;
  *((void *)v18 + 1) = v11;
  *(std::string *)(v18 + 16) = v86;
  memset(&v86, 0, sizeof(v86));
  *(_OWORD *)(v18 + 40) = v78;
  *((void *)v18 + 7) = v6;
  v88[0] = 0LL;
  __int128 v87 = 0uLL;
  LOBYTE(v79[2].__locale_) = 1;
  float v20 = (float)(unint64_t)(*(void *)(v5 + 24) + 1LL);
  float v21 = *(float *)(v5 + 32);
  BOOL v22 = (v12 & (v12 - 1)) == 0;
  if (v12 < 3) {
    BOOL v22 = 0;
  }
  unint64_t v23 = (2 * v12) | !v22;
  unint64_t v24 = vcvtps_u32_f32(v20 / v21);
  if (v23 <= v24) {
    int8x8_t prime = (int8x8_t)v24;
  }
  else {
    int8x8_t prime = (int8x8_t)v23;
  }
  if (*(void *)&prime == 1LL)
  {
    int8x8_t prime = (int8x8_t)2LL;
  }

  else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v12 = *(void *)(v5 + 8);
  }

  if (*(void *)&prime > v12) {
    goto LABEL_40;
  }
  if (*(void *)&prime < v12)
  {
    unint64_t v32 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 24) / *(float *)(v5 + 32));
    if (v12 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
    {
      unint64_t v32 = std::__next_prime(v32);
    }

    else
    {
      uint64_t v34 = 1LL << -(char)__clz(v32 - 1);
      if (v32 >= 2) {
        unint64_t v32 = v34;
      }
    }

    if (*(void *)&prime <= v32) {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime >= v12)
    {
      unint64_t v12 = *(void *)(v5 + 8);
    }

    else
    {
      if (prime)
      {
LABEL_40:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        id v26 = operator new(8LL * *(void *)&prime);
        unint64_t v27 = *(void **)v5;
        *(void *)uint64_t v5 = v26;
        if (v27) {
          operator delete(v27);
        }
        uint64_t v28 = 0LL;
        *(int8x8_t *)(v5 + 8) = prime;
        do
          *(void *)(*(void *)v5 + 8 * v28++) = 0LL;
        while (*(void *)&prime != v28);
        __int128 v29 = (void *)*v19;
        if (*v19)
        {
          unint64_t v30 = v29[1];
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
          v31.i16[0] = vaddlv_u8(v31);
          if (v31.u32[0] > 1uLL)
          {
            if (v30 >= *(void *)&prime) {
              v30 %= *(void *)&prime;
            }
          }

          else
          {
            v30 &= *(void *)&prime - 1LL;
          }

          *(void *)(*(void *)v5 + 8 * v30) = v19;
          unsigned int v35 = (void *)*v29;
          if (*v29)
          {
            do
            {
              unint64_t v36 = v35[1];
              if (v31.u32[0] > 1uLL)
              {
                if (v36 >= *(void *)&prime) {
                  v36 %= *(void *)&prime;
                }
              }

              else
              {
                v36 &= *(void *)&prime - 1LL;
              }

              if (v36 != v30)
              {
                if (!*(void *)(*(void *)v5 + 8 * v36))
                {
                  *(void *)(*(void *)v5 + 8 * v36) = v29;
                  goto LABEL_65;
                }

                void *v29 = *v35;
                *unsigned int v35 = **(void **)(*(void *)v5 + 8 * v36);
                **(void **)(*(void *)v5 + 8 * v36) = v35;
                unsigned int v35 = v29;
              }

              unint64_t v36 = v30;
LABEL_65:
              __int128 v29 = v35;
              unsigned int v35 = (void *)*v35;
              unint64_t v30 = v36;
            }

            while (v35);
          }
        }

        unint64_t v12 = (unint64_t)prime;
        goto LABEL_69;
      }

      __int128 v76 = *(void **)v5;
      *(void *)uint64_t v5 = 0LL;
      if (v76) {
        operator delete(v76);
      }
      unint64_t v12 = 0LL;
      *(void *)(v5 + 8) = 0LL;
    }
  }

- (unsigned)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = (uint64_t *)a2;
  }
  else {
    uint64_t v5 = *(uint64_t **)a2;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 8);
  }
  unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0LL;
  }
  unint64_t v9 = v7;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v12 = v7;
    if (v7 >= *(void *)&v8) {
      unint64_t v12 = v7 % *(void *)&v8;
    }
  }

  else
  {
    unint64_t v12 = (*(void *)&v8 - 1LL) & v7;
  }

  uint8x8_t v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13) {
    return 0LL;
  }
  for (unsigned int i = *v13; i; unsigned int i = *(unsigned __int8 **)i)
  {
    unint64_t v15 = *((void *)i + 1);
    if (v15 == v9)
    {
    }

    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }

      else
      {
        v15 &= *(void *)&v8 - 1LL;
      }

      if (v15 != v12) {
        return 0LL;
      }
    }
  }

  return i;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(uint64_t *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  id v3 = result;
  int v4 = (uint64_t *)result[1];
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 6;
      unint64_t v6 = (void **)(v4 - 3);
      std::vector<DebugInfo::BlockInfo>::__destroy_vector::operator()[abi:nn180100](&v6);
      double result = std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>::~vector[abi:nn180100](v5);
      int v4 = v5;
    }

    while (v5 != a2);
  }

  v3[1] = (uint64_t)a2;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  unint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    int v4 = *a1;
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 56LL;
        std::allocator_traits<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::destroy[abi:nn180100]<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo,void>(v3);
      }

      while ((void *)v3 != v2);
      int v4 = *a1;
    }

    a1[1] = v2;
    operator delete(v4);
  }

  return a1;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
}

- (char)_processPerLineCostDataForLineTable:(void *)a1 withFileCost:(unint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  if (a2 >= 0x492492492492493LL) {
    abort();
  }
  double result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::SourceDisassemblyInfo>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(void *)uint64_t v4 = *(id *)v6;
      double result = *(id *)(v6 + 8);
      *(void *)(v4 + 8) = result;
      uint64_t v7 = *(void *)(v6 + 48);
      __int128 v8 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)(v6 + 16);
      *(_OWORD *)(v4 + 32) = v8;
      *(void *)(v4 + 48) = v7;
      v4 += 56LL;
      v6 += 56LL;
    }

    while (v6 != a3);
  }

  v3[1] = v4;
  return result;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a1 withFileCost:(uint64_t)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 56LL)
  {

    uint64_t v5 = *(void **)(i - 56);
  }

  *(void *)(a1 + 8) = a2;
}

- (void)_processPerLineCostDataForLineTable:(uint64_t)a3 withFileCost:(uint64_t)a4 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  a1[3] = 0LL;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x492492492492493LL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v7 = (char *)operator new(56 * a2);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  __int128 v8 = &v7[56 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[56 * a2];
  return a1;
}

- (uint64_t)_processPerLineCostDataForLineTable:(uint64_t *)result withFileCost:(void *)a2 withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = v4 + v5;
      uint64_t v7 = v2 + v5;
      *(void *)(v6 - 56) = *(void *)(v2 + v5 - 56);
      __int128 v8 = *(_OWORD *)(v2 + v5 - 48);
      *(void *)(v6 - 32) = *(void *)(v2 + v5 - 32);
      *(_OWORD *)(v6 - 48) = v8;
      *(void *)(v7 - 40) = 0LL;
      *(void *)(v7 - 32) = 0LL;
      *(void *)(v7 - 48) = 0LL;
      *(void *)(v6 - 24) = 0LL;
      *(void *)(v6 - 16) = 0LL;
      *(void *)(v6 - 8) = 0LL;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(void *)(v7 - 24) = 0LL;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - 8) = 0LL;
      v5 -= 56LL;
    }

    while (v2 + v5 != v3);
    v4 += v5;
  }

  a2[1] = v4;
  uint64_t v9 = *result;
  char *result = v4;
  a2[1] = v9;
  uint64_t v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:a2]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2;
  v8[3] = &unk_58E3D0;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __70__GTShaderProfilerHelper__processHarvestedBinaryData_forStreamedData___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___ShaderBinaryInfo, v6);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"binary"]);
  [v7 setBinary:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"type"]);
  [v7 setType:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"dylib"]);
  [v7 setDylib:v10];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v11];
}

- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:(unint64_t)a2 forWorkloadInfo:(unint64_t)a3
{
  if (!a2) {
    return 0LL;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a3;
    if (a3 >= a2) {
      unint64_t v4 = a3 % a2;
    }
  }

  else
  {
    unint64_t v4 = (a2 - 1) & a3;
  }

  id v5 = *(void **)(a1 + 8 * v4);
  if (!v5) {
    return 0LL;
  }
  double result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a3)
      {
        if (result[2] == a3) {
          return result;
        }
      }

      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= a2) {
            v7 %= a2;
          }
        }

        else
        {
          v7 &= a2 - 1;
        }

        if (v7 != v4) {
          return 0LL;
        }
      }

      double result = (void *)*result;
    }

    while (result);
  }

  return result;
}

- (uint64_t)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint8x8_t v3 = (void *)*v2;
      std::allocator_traits<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void *>>>::destroy[abi:nn180100]<std::pair<unsigned long long const,-[GTShaderProfilerHelper _calculatePerSampleActiveShaders:withShaderProfilerResult:forWorkloadInfo:]::EncoderRangeInfo>,void,void>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

- (void)_calculatePerSampleActiveShaders:(uint64_t)a1 withShaderProfilerResult:forWorkloadInfo:
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:a2]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2;
  v8[3] = &unk_58E3D0;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_3( uint64_t a1,  void *a2,  void *a3,  unsigned int a4)
{
  id v12 = a2;
  id v7 = a3;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v12]);
  if (a4 > 2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5;
    v13[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
    unsigned int v14 = a4;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4;
    v15[3] = &unk_58E420;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v16 = v9;
    uint64_t v17 = v10;
    int v19 = *(_DWORD *)(a1 + 48);
    unsigned int v20 = a4;
    id v18 = v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v15];

    __int128 v8 = v16;
  }
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_4( uint64_t a1,  void *a2)
{
  id v12 = a2;
  uint8x8_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:"));
  unint64_t v4 = *(void **)(a1 + 40);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 binary]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uscSamples]);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _extractShaderBinaryTextSegment:v3]);
  LODWORD(v11) = *(_DWORD *)(a1 + 60);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 _analyzeBinary:v5 uscSamples:v6 targetIndex:v7 withTextSegment:v8 withKey:v12 withShaderSourcePath:0 forDataMaster:v11 with PerDrawLimiterData:*(void *)(a1 + 48)]);

  if (!v9) {
    id v9 = (void *)objc_opt_new(&OBJC_CLASS___DYShaderAnalyzerResult, v10);
  }
  [v3 setAnalyzerResult:v9];
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_5( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (g_runningInCI)
  {
    id v8 = v3;
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"analyzeShaderInfoResult ignoring data master %d on key %@",  *(unsigned int *)(a1 + 32),  v3));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    uint64_t v6 = __stdoutp;
    id v7 = v5;
    fprintf(v6, "#CI-INFO# %s\n", (const char *)[v7 UTF8String]);

    id v3 = v8;
  }
}

void __84__GTShaderProfilerHelper_analyzeShaderInfoResult_forDataSource_forReplayController___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___ShaderBinaryInfo, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"binary"]);
  [v7 setBinary:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"type"]);
  [v7 setType:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"dylib"]);
  [v7 setDylib:v10];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v11];
}

@end