@interface DYPMTLShaderProfilerHelper
- (BOOL)dumpInstructions;
- (DYPMTLShaderProfilerHelper)init;
- (double)_conservativeLatencyAdjustment:(double)a3 withLimiter:(double)a4;
- (double)_latencyAdjustmentEstimate:(double)a3 withLimiter:(double)a4;
- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterTypeLoad:(unsigned int)a6 forLimiterTypeStore:(unsigned int)a7;
- (double)_latencyAdjustmentFactorWithLimiterDataWithLerp:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6;
- (double)_latencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (double)_waitLatencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5;
- (id).cxx_construct;
- (id)_costHeaders;
- (id)_eventTypesForTarget:(int)a3;
- (id)_traceHeaders;
- (uint64_t)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:;
- (uint64_t)adjustHWBiasAndFinalizeResult;
- (uint64_t)setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:;
- (unsigned)_computeSampleNormFactorForSample:(const ShaderProfilerUSCSampleInfo *)a3 forProgramStartAddress:(unint64_t)a4 forProgramEndAddress:(unint64_t)a5;
- (void)_calculateAggregatedEffectiveGPUEncoderCost;
- (void)_calculateAndAppendPerBatchCosts:(void *)a3 forFrameIndex:(unsigned int)a4 atTimestamp:(unint64_t)a5 withLimiterIndices:(void *)a6 withTimestampBuffers:(void *)a7 withActiveBatches:(const void *)a8 withPerRingBufferLimiterEncoderCosts:(void *)a9;
- (void)_calculateAverageGPUCommandDuration;
- (void)_cleanup;
- (void)_dumpAggregatedGPUTimePerBatchForFrame:(unsigned int)a3;
- (void)_dumpLimiterBatchInfoCosts:(void *)a3 forRingBuffer:(unsigned int)a4 forFrame:(unsigned int)a5;
- (void)_dumpTraceBufferPacketsInFile:(__sFILE *)a3 usingTracePackets:(unsigned int *)a4 withExtractedSamples:(const void *)a5 withTraceBufferCount:(unsigned int)a6 forTargetIndex:(int)a7;
- (void)_processTracePackets:(unsigned int *)a3 forRenderIndex:(unsigned int)a4 andGenerateSampleList:(void *)a5 forTargetIndex:(int)a6 forLimiterIndex:(unsigned int)a7;
- (void)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:;
- (void)_setupShaderBinaryInfo:(id)a3 withBinaryKey:(const void *)a4 andNumDraws:(unsigned int)a5;
- (void)adjustHWBiasAndFinalizeResult;
- (void)evaluateStreamingSamples:(uint64_t)a3 withUSCSampleNum:(uint64_t)a4 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(unint64_t *)a3 withUSCSampleNum:(unsigned int)a4 withProgramAddressLUT:(void *)a5 targetIndex:(int)a6 forRingBufferIndex:(unsigned int)a7 withMinEncoderIndex:(unsigned int)a8 withMaxEncoderIndex:(unsigned int)a9 withEncoderIdToEncoderIndexMap:(void *)a10 withProfilingData:(id)a11;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(__int128 *)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(unint64_t)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:;
- (void)generateTargetSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a6 withUSCSampleBuffer:(unint64_t *)a7 withUSCSampleNum:(unsigned int)a8 withBatchIDToEncoderIndex:(void *)a9 andEncoderIndexToBatchIdMap:(void *)a10 targetIndex:(int)a11;
- (void)generateTargetSamplesForResult:(uint64_t)a3 withProgramAddressLUT:(char)a4 withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:;
- (void)setDumpInstructions:(BOOL)a3;
- (void)setupDataForEvaluatingStreamingSamples:(id)a3 forRingBufferCount:(unsigned int)a4 forTargetIndex:(int)a5;
@end

@implementation DYPMTLShaderProfilerHelper

- (DYPMTLShaderProfilerHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DYPMTLShaderProfilerHelper;
  id v2 = -[DYPMTLShaderProfilerHelper init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = [v3 BOOLForKey:@"GPUShaderProfilerIgnoreBlockSamplingBiasAdjustment"];

    if (v4) {
      *((_BYTE *)v2 + 8) = 1;
    }
    v5 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v6 = (void *)*((void *)v2 + 92);
    *((void *)v2 + 92) = v5;

    [*((id *)v2 + 92) setName:@"gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.ParallelQueue"];
    [*((id *)v2 + 92) setMaxConcurrentOperationCount:std::thread::hardware_concurrency()];
    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v8 = (void *)*((void *)v2 + 93);
    *((void *)v2 + 93) = v7;

    [*((id *)v2 + 93) setName:@"gputools.GPUToolsDebugger.GPUToolsPlatform.ShaderProfiler.SerialQueue"];
    [*((id *)v2 + 93) setMaxConcurrentOperationCount:1];
  }

  return (DYPMTLShaderProfilerHelper *)v2;
}

- (id)_eventTypesForTarget:(int)a3
{
  if (a3 >= 2) {
    return &off_59F9F8;
  }
  else {
    return &off_59F9E0;
  }
}

- (id)_traceHeaders
{
  return &off_59FA10;
}

- (id)_costHeaders
{
  return &off_59FA28;
}

- (void)_dumpTraceBufferPacketsInFile:(__sFILE *)a3 usingTracePackets:(unsigned int *)a4 withExtractedSamples:(const void *)a5 withTraceBufferCount:(unsigned int)a6 forTargetIndex:(int)a7
{
  if ((*a4 & 3) != 1) {
    return;
  }
  uint64_t v7 = *(void *)&a7;
  fprintf(a3, "[%u]Trace Buffer\n", a6);
  std::string::basic_string[abi:nn180100]<0>(&v44, "");
  std::string::basic_string[abi:nn180100]<0>(v45, "");
  std::string::basic_string[abi:nn180100]<0>(v46, "");
  std::string::basic_string[abi:nn180100]<0>(&v47, "");
  std::string::basic_string[abi:nn180100]<0>(v48, "");
  std::string::basic_string[abi:nn180100]<0>(v49, "");
  std::string::basic_string[abi:nn180100]<0>(v50, "");
  std::string::basic_string[abi:nn180100]<0>(v51, "");
  v43[0] = (std::string *)operator new(0xC0uLL);
  v43[2] = v43[0] + 8;
  uint64_t v12 = 0LL;
  v43[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>( &v44,  &v52,  v43[0]);
  do
  {
    if (SHIBYTE(v51[v12 + 2]) < 0) {
      operator delete((void *)v51[v12]);
    }
    v12 -= 3LL;
  }

  while (v12 != -24);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYPMTLShaderProfilerHelper _eventTypesForTarget:](self, "_eventTypesForTarget:", v7));
  if (v13)
  {
    uint64_t v14 = 0LL;
    for (unint64_t i = 0; i < (unint64_t)[v13 count]; ++i)
    {
      id v16 = objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:i]);
      std::string::assign(&v43[0][v14], (const std::string::value_type *)[v16 UTF8String]);

      ++v14;
    }
  }

  std::string::basic_string[abi:nn180100]<0>(&v44, "%1u %s %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v45, "%6u %4u %4u");
  std::string::basic_string[abi:nn180100]<0>(v46, "%d 0x%X %u,%u, %u,%u");
  v42[0] = (std::string *)operator new(0x48uLL);
  v42[2] = v42[0] + 3;
  uint64_t v17 = 0LL;
  v42[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>( &v44,  &v47,  v42[0]);
  do
  {
    if (SHIBYTE(v46[v17 + 2]) < 0) {
      operator delete((void *)v46[v17]);
    }
    v17 -= 3LL;
  }

  while (v17 != -9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYPMTLShaderProfilerHelper _traceHeaders](self, "_traceHeaders"));
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    id v20 = objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:0]);
    std::string::assign(v42[0], (const std::string::value_type *)[v20 UTF8String]);

    id v21 = objc_claimAutoreleasedReturnValue([(id) v19 objectAtIndexedSubscript:1]);
    std::string::assign(v42[0] + 1, (const std::string::value_type *)[v21 UTF8String]);

    id v22 = objc_claimAutoreleasedReturnValue([(id) v19 objectAtIndexedSubscript:2]);
    std::string::assign(v42[0] + 2, (const std::string::value_type *)[v22 UTF8String]);
  }

  v41 = (void *)v19;
  LODWORD(v19) = 0;
  do
  {
    unint64_t v23 = a4[(int)v19];
    if ((v23 & 1) == 0)
    {
      if ((a4[(int)v19] & 3) == 2)
      {
        v24 = &v43[0][(v23 >> 2) & 7];
        v25 = &v43[0][(v23 >> 17) & 7];
        fprintf( a3,  "A [%s %4u] : B [%s %4u]\n",  (const char *)v24,  (v23 >> 5) & 0xFFF,  (const char *)v25,  v23 >> 20);
      }

      else
      {
        fwrite("Invalid Packet Type\n", 0x14uLL, 1uLL, a3);
      }

      goto LABEL_39;
    }

    uint64_t v26 = (v23 >> 8) & 0x3FF;
    uint64_t v27 = (v23 >> 18) & 0x3FF;
    if ((int)v7 <= 0)
    {
      data = v42[0];
      uint64_t v30 = (v23 >> 4) & 1;
      unsigned int v31 = (v23 >> 5) & 3;
      v32 = "CDM";
      if (v31 == 1) {
        v32 = "PDM";
      }
      v33 = v31 ? (char *)v32 : "VDM";
      fprintf(a3, (const char *)data, v30, v33, v26, v27);
    }

    else
    {
      v28 = v42[0] + 1;
      fprintf( a3,  (const char *)v28,  (v23 >> 22) & 0x3C0 | (v23 >> 2) & 0x1F | (((v23 >> 4) & 1) << 13),  (v23 >> 8) & 0x3FF,  (v23 >> 18) & 0x3FF,  v40);
    }

    uint64_t v19 = (int)v19 + 1LL;
    fprintf(a3, "PC = 0x%X\n", a4[v19]);
LABEL_39:
    BOOL v34 = (int)v19 < 7;
    LODWORD(v19) = v19 + 1;
  }

  while (v34);
  v35 = *(unsigned int **)a5;
  v36 = (unsigned int *)*((void *)a5 + 1);
  if (*(unsigned int **)a5 != v36)
  {
    uint64_t v37 = 0LL;
    do
    {
      v38 = v42[0] + 2;
      uint64_t v39 = (v37 + 1);
      fprintf(a3, (const char *)v38, v37, v35[3], v35[8], *v35, v35[2], v35[6] & 0xFFF, v41);
      v35 += 10;
      uint64_t v37 = v39;
    }

    while (v35 != v36);
  }

  *(void *)&__int128 v44 = v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);

  *(void *)&__int128 v44 = v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);
}

- (void)_cleanup
{
  if (*((void *)self + 5))
  {
    std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((void **)self + 4));
    *((void *)self + 4) = 0LL;
    uint64_t v3 = *((void *)self + 3);
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*((void *)self + 2) + 8 * i) = 0LL;
    }

    *((void *)self + 5) = 0LL;
  }

  v5 = (void **)*((void *)self + 7);
  v6 = (void **)*((void *)self + 8);
  while (v6 != v5)
  {
    v6 -= 3;
    uint64_t v30 = v6;
    std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }

  *((void *)self + 8) = v5;
  uint64_t v8 = *((void *)self + 10);
  for (uint64_t j = *((void *)self + 11);
        j != v8;
    ;
  }

  *((void *)self + 11) = v8;
  if (*((void *)self + 17))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__deallocate_node(*((void **)self + 16));
    *((void *)self + 16) = 0LL;
    uint64_t v9 = *((void *)self + 15);
    if (v9)
    {
      for (uint64_t k = 0LL; k != v9; ++k)
        *(void *)(*((void *)self + 14) + 8 * k) = 0LL;
    }

    *((void *)self + 17) = 0LL;
  }

  v11 = (void *)*((void *)self + 19);
  *((void *)self + 19) = 0LL;

  uint64_t v12 = (void *)*((void *)self + 20);
  *((void *)self + 20) = 0LL;

  [*((id *)self + 22) removeAllObjects];
  v13 = (void *)*((void *)self + 22);
  *((void *)self + 22) = 0LL;

  [*((id *)self + 23) removeAllObjects];
  uint64_t v14 = (void *)*((void *)self + 23);
  *((void *)self + 23) = 0LL;

  [*((id *)self + 24) removeAllObjects];
  v15 = (void *)*((void *)self + 24);
  *((void *)self + 24) = 0LL;

  id v16 = (void **)*((void *)self + 25);
  uint64_t v17 = (void **)*((void *)self + 26);
  while (v17 != v16)
  {
    v17 -= 3;
    uint64_t v30 = v17;
    std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }

  *((void *)self + 26) = v16;
  v18 = (void **)*((void *)self + 28);
  uint64_t v19 = (void **)*((void *)self + 29);
  while (v19 != v18)
  {
    v19 -= 3;
    uint64_t v30 = v19;
    std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }

  *((void *)self + 29) = v18;
  id v20 = (void **)*((void *)self + 31);
  id v21 = (void **)*((void *)self + 32);
  while (v21 != v20)
  {
    v21 -= 3;
    uint64_t v30 = v21;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }

  *((void *)self + 32) = v20;
  id v22 = (void **)*((void *)self + 34);
  unint64_t v23 = (void **)*((void *)self + 35);
  while (v23 != v22)
  {
    v23 -= 3;
    uint64_t v30 = v23;
    std::vector<std::unique_ptr<std::vector<double>>>::__destroy_vector::operator()[abi:nn180100](&v30);
  }

  *((void *)self + 35) = v22;
  uint64_t v25 = *((void *)self + 37);
  for (uint64_t m = *((void *)self + 38);
        m != v25;
    ;
  }

  *((void *)self + 38) = v25;
  *((void *)self + 41) = *((void *)self + 40);
  uint64_t v26 = (char *)self + 344;
  do
  {
    *((void *)v26 + 1) = *(void *)v26;
    v26 += 24;
  }

  while (v26 != (char *)self + 416);
  uint64_t v27 = (void *)*((void *)self + 57);
  *((void *)self + 57) = 0LL;

  *((void *)self + 59) = *((void *)self + 58);
  v28 = (void *)*((void *)self + 61);
  *((void *)self + 61) = 0LL;

  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((void *)self + 62);
  [*((id *)self + 21) removeAllObjects];
  v29 = (void *)*((void *)self + 21);
  *((void *)self + 21) = 0LL;
}

- (unsigned)_computeSampleNormFactorForSample:(const ShaderProfilerUSCSampleInfo *)a3 forProgramStartAddress:(unint64_t)a4 forProgramEndAddress:(unint64_t)a5
{
  unint64_t var1 = a3->var6.var1;
  uint64_t v6 = (var1 >> 36) & 3;
  if ((_DWORD)v6 == 3)
  {
    unint64_t var4 = a3->var4;
    if (var4 <= a4 || var4 >= a5) {
      goto LABEL_17;
    }
    unint64_t var0 = a3->var5.var0;
    BOOL v8 = var0 < a4 || var0 >= a5;
    unsigned int v9 = var1 >> 12;
    var1 >>= 24;
  }

  else
  {
    if ((_DWORD)v6 != 2) {
      goto LABEL_17;
    }
    unint64_t v7 = a3->var4;
    BOOL v8 = v7 < a5 && v7 >= a4;
    unsigned int v9 = var1 >> 12;
  }

  if (v8) {
    LOWORD(var1) = v9;
  }
LABEL_17:
  if ((var1 & 0xFFE) != 0) {
    return var1 & 0xFFF;
  }
  else {
    return 1;
  }
}

- (void)_processTracePackets:(unsigned int *)a3 forRenderIndex:(unsigned int)a4 andGenerateSampleList:(void *)a5 forTargetIndex:(int)a6 forLimiterIndex:(unsigned int)a7
{
  v36 = self;
  unsigned int v34 = a7;
  unsigned int v35 = a4;
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  int v29 = 1;
  unsigned int v30 = -1;
  v28[0] = v32;
  v28[1] = &v30;
  v28[2] = v31;
  v28[3] = &v29;
  v28[4] = v33;
  v28[5] = &v35;
  v28[6] = &v34;
  v28[7] = &v36;
  v28[8] = a5;
  uint64_t v27 = 0LL;
  objc_super v10 = operator new(0x1B0uLL);
  v26[2] = v10 + 27;
  *objc_super v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  v10[8] = 0u;
  v10[9] = 0u;
  v10[10] = 0u;
  v10[11] = 0u;
  v10[12] = 0u;
  v10[13] = 0u;
  v10[14] = 0u;
  v10[15] = 0u;
  v10[16] = 0u;
  v10[17] = 0u;
  v10[18] = 0u;
  v10[19] = 0u;
  v10[20] = 0u;
  v10[21] = 0u;
  v10[22] = 0u;
  v10[23] = 0u;
  v10[24] = 0u;
  v10[25] = 0u;
  v10[26] = 0u;
  v26[0] = v10;
  v26[1] = v10 + 27;
  memset(v24, 0, sizeof(v24));
  int v25 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v24,  0x24uLL);
  unint64_t v11 = 0LL;
  v23[0] = (unsigned int *)&v27 + 1;
  v23[1] = (unsigned int *)v32;
  v23[2] = &v30;
  v23[3] = (unsigned int *)v31;
  v23[4] = (unsigned int *)&v29;
  v23[5] = (unsigned int *)&v27;
  v23[6] = (unsigned int *)v26;
  v23[7] = (unsigned int *)v24;
  v23[8] = (unsigned int *)v33;
  v23[9] = &v35;
  char v12 = 1;
  v23[10] = (unsigned int *)&v36;
  v23[11] = (unsigned int *)a5;
  do
  {
    unsigned int v13 = a3[v11];
    if ((v13 & 1) != 0)
    {
      if (v11)
      {
        if (a6 > 1)
        {
          std::deque<ProfileEvent>::deque((uint64_t)v21, v33);
          v15 = v21;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()( v23,  v21);
        }

        else
        {
          std::deque<ProfileEvent>::deque((uint64_t)v22, v33);
          v15 = v22;
          -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()( (uint64_t)v28,  v22);
        }

        std::deque<ProfileEvent>::~deque[abi:nn180100](v15);
        char v12 = 1;
      }

      unsigned int v30 = a3[++v11];
    }

    else if ((a3[v11] & 3) == 2)
    {
      LODWORD(v20) = ((v13 << 26) | (v13 >> 5)) & 0x70000FFF;
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      if ((v12 & 1) != 0)
      {
        unsigned int v14 = (v13 >> 5) & 0xFFF;
        if (v14 <= 1) {
          unsigned int v14 = 1;
        }
        int v29 = v14;
      }

      LODWORD(v20) = (v13 >> 20) & 0x8FFFFFFF | (((v13 >> 17) & 7) << 28);
      HIDWORD(v20) = -1;
      std::deque<ProfileEvent>::emplace_back<ProfileEvent&>(v33, &v20);
      char v12 = 0;
    }
  }

  while (v11++ < 7);
  if (a6 >= 2)
  {
    std::deque<ProfileEvent>::deque((uint64_t)v18, v33);
    uint64_t v17 = v18;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_1::operator()( v23,  v18);
  }

  else
  {
    std::deque<ProfileEvent>::deque((uint64_t)v19, v33);
    uint64_t v17 = v19;
    -[DYPMTLShaderProfilerHelper _processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:]::$_0::operator()( (uint64_t)v28,  v19);
  }

  std::deque<ProfileEvent>::~deque[abi:nn180100](v17);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v24);
  v23[0] = (unsigned int *)v26;
  std::vector<std::vector<ProfileEvent>>::__destroy_vector::operator()[abi:nn180100]((void ***)v23);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v31);
  std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)v32);
  std::deque<ProfileEvent>::~deque[abi:nn180100](v33);
}

- (void)_setupShaderBinaryInfo:(id)a3 withBinaryKey:(const void *)a4 andNumDraws:(unsigned int)a5
{
  id v15 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v15 binary]);

  if (v8)
  {
    if (!std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]( (void *)self + 14,  (uint64_t)a4))
    {
      unsigned int v9 = (GPUToolsPlatformLLVMShaderProfilerHelper *)operator new(8uLL);
      GPUToolsPlatformLLVMShaderProfilerHelper::GPUToolsPlatformLLVMShaderProfilerHelper(v9);
      id v16 = v10;
      id v11 = objc_claimAutoreleasedReturnValue([v15 binary]);
      char v12 = (const char *)[v11 bytes];
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v15 binary]);
      GPUToolsPlatformLLVMShaderProfilerHelper::SetBinaryForAnalysis( v9,  v12,  (uint64_t)[v13 length],  *((_DWORD *)self + 182));

      *(_DWORD *)(*GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*(GPUToolsPlatformLLVMShaderProfilerHelperImpl **)v9)
                + 248LL) = a5;
      std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>( (uint64_t)self + 112,  (uint64_t)a4,  (uint64_t)a4,  (uint64_t *)&v16);
      unsigned int v14 = v16;
      if (v16)
      {
        std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelperImpl>::reset[abi:nn180100](v16, 0LL);
        operator delete(v14);
      }
    }
  }
}

- (void)setupDataForEvaluatingStreamingSamples:(id)a3 forRingBufferCount:(unsigned int)a4 forTargetIndex:(int)a5
{
  v241 = (id *)a3;
  unsigned int v251 = a4;
  context = objc_autoreleasePoolPush();
  objc_storeStrong((id *)self + 20, a3);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v241 drawCallInfoList]);
  unint64_t v10 = (unint64_t)[v9 count];
  id v11 = (void *)*((void *)self + 7);
  char v12 = (void *)*((void *)self + 8);
  unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v12 - v11);
  unint64_t v14 = v10 - v13;
  if (v10 > v13)
  {
    uint64_t v15 = *((void *)self + 9);
    if (0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v12) >> 3) >= v14)
    {
      bzero(*((void **)self + 8), 24 * ((24 * v14 - 24) / 0x18) + 24);
      *((void *)self + 8) = &v12[3 * ((24 * v14 - 24) / 0x18) + 3];
      goto LABEL_25;
    }

    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v15 - (uint64_t)v11) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v10) {
      uint64_t v17 = v10;
    }
    if (v16 >= 0x555555555555555LL) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v17;
    }
    if (v18 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v19 = (char *)operator new(24 * v18);
    uint64_t v20 = &v19[8 * (v12 - v11)];
    id v21 = &v19[24 * v18];
    size_t v22 = 24 * ((24 * v14 - 24) / 0x18) + 24;
    bzero(v20, v22);
    unint64_t v23 = &v20[v22];
    if (v12 == v11)
    {
      *((void *)self + 7) = v20;
      *((void *)self + 8) = v23;
      *((void *)self + 9) = v21;
      if (!v12) {
        goto LABEL_25;
      }
    }

    else
    {
      do
      {
        *((void *)v20 - 3) = 0LL;
        *((void *)v20 - 2) = 0LL;
        v20 -= 24;
        *((void *)v20 + 2) = 0LL;
        __int128 v24 = *(_OWORD *)(v12 - 3);
        v12 -= 3;
        *(_OWORD *)uint64_t v20 = v24;
        *((void *)v20 + 2) = v12[2];
        *char v12 = 0LL;
        v12[1] = 0LL;
        v12[2] = 0LL;
      }

      while (v12 != v11);
      int v25 = (void *)*((void *)self + 7);
      char v12 = (void *)*((void *)self + 8);
      *((void *)self + 7) = v20;
      *((void *)self + 8) = v23;
      *((void *)self + 9) = v21;
      if (v12 != v25)
      {
        do
        {
          v12 -= 3;
          *(void *)v252 = v12;
          std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
        }

        while (v12 != v25);
        char v12 = v25;
      }

      if (!v12) {
        goto LABEL_25;
      }
    }

    operator delete(v12);
    goto LABEL_25;
  }

  if (v10 < v13)
  {
    uint64_t v26 = &v11[3 * v10];
    while (v12 != v26)
    {
      v12 -= 3;
      *(void *)v252 = v12;
      std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100]((void ***)v252);
    }

    *((void *)self + 8) = v26;
  }

- (double)_conservativeLatencyAdjustment:(double)a3 withLimiter:(double)a4
{
  double v4 = a3 / (a4 + 1.0 + 0.00001);
  double v5 = 1.0 - v4;
  BOOL v6 = v4 < 1.0;
  double result = 0.0;
  if (v6) {
    return v5;
  }
  return result;
}

- (double)_latencyAdjustmentEstimate:(double)a3 withLimiter:(double)a4
{
  double v5 = a3 / (a4 + 0.00001);
  if (v5 >= 1.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0 - v5;
  }
  -[DYPMTLShaderProfilerHelper _conservativeLatencyAdjustment:withLimiter:]( self,  "_conservativeLatencyAdjustment:withLimiter:",  a3);
  return (1.0 - (a3 + (1.0 - a3) * 0.5)) * v7 + (a3 + (1.0 - a3) * 0.5) * v6;
}

- (double)_waitLatencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  double v5 = a3[*(unsigned int *)(*(void *)a5 + 8LL) + a4] * 0.01;
  -[DYPMTLShaderProfilerHelper _latencyAdjustmentEstimate:withLimiter:]( self,  "_latencyAdjustmentEstimate:withLimiter:",  a3[*(unsigned int *)(*(void *)a5 + 4LL) + a4] * 0.01,  v5);
  return result;
}

- (double)_latencyAdjustmentWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5
{
  uint64_t v5 = 0LL;
  double v6 = 0.0;
  do
  {
    unint64_t v7 = *(unsigned int *)(*(void *)a5 + v5) + a4;
    if (v6 < a3[v7]) {
      double v6 = a3[v7];
    }
    v5 += 4LL;
  }

  while (v5 != 40);
  double v8 = v6 * 0.01;
  double v9 = 1.0 - v8;
  BOOL v10 = v8 < 1.0;
  double result = 0.0;
  if (v10) {
    return v9;
  }
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterDataWithLerp:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterType:(unsigned int)a6
{
  return result;
}

- (double)_latencyAdjustmentFactorWithLimiterData:(double *)a3 forIndex:(unint64_t)a4 withLimiterTypeIndexMap:(const void *)a5 forLimiterTypeLoad:(unsigned int)a6 forLimiterTypeStore:(unsigned int)a7
{
  double v7 = a3[*(unsigned int *)(*(void *)a5 + 4LL * a7) + a4] * 0.01;
  -[DYPMTLShaderProfilerHelper _latencyAdjustmentEstimate:withLimiter:]( self,  "_latencyAdjustmentEstimate:withLimiter:",  a3[*(unsigned int *)(*(void *)a5 + 4LL) + a4] * 0.01,  v7);
  return result;
}

- (void)evaluateStreamingSamples:(unint64_t *)a3 withUSCSampleNum:(unsigned int)a4 withProgramAddressLUT:(void *)a5 targetIndex:(int)a6 forRingBufferIndex:(unsigned int)a7 withMinEncoderIndex:(unsigned int)a8 withMaxEncoderIndex:(unsigned int)a9 withEncoderIdToEncoderIndexMap:(void *)a10 withProfilingData:(id)a11
{
  uint64_t v437 = *(void *)&a7;
  id v433 = a11;
  unint64_t v12 = *((void *)a10 + 3);
  if (v12 > [*((id *)self + 20) encoderCount]
    || [*((id *)self + 21) count] <= v437)
  {
    goto LABEL_450;
  }

  uint64_t v575 = 0LL;
  v576 = &v575;
  uint64_t v577 = 0x3032000000LL;
  v578 = __Block_byref_object_copy__2952;
  v579 = __Block_byref_object_dispose__2953;
  id v580 = 0LL;
  v439 = (void *)objc_claimAutoreleasedReturnValue([v433 objectForKeyedSubscript:@"usc sample data thread offsets"]);
  if (!v439) {
    goto LABEL_449;
  }
  v455 = (std::mutex *)((char *)self + 536);
  std::mutex::lock((std::mutex *)((char *)self + 536));
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v433 objectForKeyedSubscript:@"frame index"]);
  val = self;
  unsigned int v14 = [v13 unsignedIntValue];

  uint64_t v15 = (uint64_t *)((char *)self + 416);
  unint64_t v16 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( (void *)self + 52,  v14);
  if (v16) {
    goto LABEL_44;
  }
  uint64_t v17 = *((void *)self + 55);
  unint64_t v18 = *((void *)self + 53);
  if (v18)
  {
    uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      self = (DYPMTLShaderProfilerHelper *)v14;
      if (v18 <= v14) {
        self = (DYPMTLShaderProfilerHelper *)(v14 % v18);
      }
    }

    else
    {
      self = (DYPMTLShaderProfilerHelper *)(((_DWORD)v18 - 1) & v14);
    }

    uint64_t v20 = *(void ***)(*v15 + 8LL * (void)self);
    if (v20)
    {
      unint64_t v16 = *v20;
      if (*v20)
      {
        do
        {
          unint64_t v21 = v16[1];
          if (v21 == v14)
          {
            if (*((_DWORD *)v16 + 4) == v14)
            {
              self = val;
              goto LABEL_44;
            }
          }

          else
          {
            if (v19.u32[0] > 1uLL)
            {
              if (v21 >= v18) {
                v21 %= v18;
              }
            }

            else
            {
              v21 &= v18 - 1;
            }

            if ((DYPMTLShaderProfilerHelper *)v21 != self) {
              break;
            }
          }

          unint64_t v16 = (void *)*v16;
        }

        while (v16);
      }
    }
  }

  unint64_t v16 = operator new(0x18uLL);
  *unint64_t v16 = 0LL;
  v16[1] = v14;
  *((_DWORD *)v16 + 4) = v14;
  *((_DWORD *)v16 + 5) = v17;
  float v22 = (float)(unint64_t)(v17 + 1);
  float v23 = *((float *)val + 112);
  if (!v18 || (float)(v23 * (float)v18) < v22)
  {
    BOOL v24 = 1LL;
    if (v18 >= 3) {
      BOOL v24 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v18);
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      size_t v27 = v26;
    }
    else {
      size_t v27 = v25;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v15,  v27);
    unint64_t v18 = *((void *)val + 53);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v18 <= v14) {
        self = (DYPMTLShaderProfilerHelper *)(v14 % v18);
      }
      else {
        self = (DYPMTLShaderProfilerHelper *)v14;
      }
    }

    else
    {
      self = (DYPMTLShaderProfilerHelper *)(((_DWORD)v18 - 1) & v14);
    }
  }

  uint64_t v28 = *v15;
  unint64_t v29 = *(void **)(*v15 + 8LL * (void)self);
  if (v29)
  {
    *unint64_t v16 = *v29;
    self = val;
LABEL_42:
    void *v29 = v16;
    goto LABEL_43;
  }

  *unint64_t v16 = *((void *)val + 54);
  *((void *)val + 54) = v16;
  *(void *)(v28 + 8LL * (void)self) = (char *)val + 432;
  self = val;
  if (*v16)
  {
    unint64_t v30 = *(void *)(*v16 + 8LL);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v30 >= v18) {
        v30 %= v18;
      }
    }

    else
    {
      v30 &= v18 - 1;
    }

    unint64_t v29 = (void *)(*v15 + 8 * v30);
    goto LABEL_42;
  }

- (void)_calculateAndAppendPerBatchCosts:(void *)a3 forFrameIndex:(unsigned int)a4 atTimestamp:(unint64_t)a5 withLimiterIndices:(void *)a6 withTimestampBuffers:(void *)a7 withActiveBatches:(const void *)a8 withPerRingBufferLimiterEncoderCosts:(void *)a9
{
  uint64_t v9 = *(void *)a6;
  if (*((void *)a6 + 1) != *(void *)a6)
  {
    unint64_t v11 = a5;
    unint64_t v13 = 0LL;
    do
    {
      unsigned int v14 = (void *)(*(void *)a3 + 40 * v13);
      if (v14[3])
      {
        uint64_t v15 = (void *)v14[2];
        if (v15)
        {
          do
          {
            unint64_t v16 = (void *)*v15;
            operator delete(v15);
            uint64_t v15 = v16;
          }

          while (v16);
        }

        v14[2] = 0LL;
        uint64_t v17 = v14[1];
        if (v17)
        {
          for (uint64_t i = 0LL; i != v17; ++i)
            *(void *)(*v14 + 8 * i) = 0LL;
        }

        v14[3] = 0LL;
        uint64_t v9 = *(void *)a6;
      }

      uint8x8_t v19 = (uint64_t *)(*(void *)a7 + 24 * v13);
      unint64_t v20 = *(unsigned int *)(v9 + 4 * v13);
      unint64_t v21 = v19[2];
      uint64_t v22 = *v19;
      if (v21 <= v20)
      {
        unsigned int v25 = *(_DWORD *)(v9 + 4 * v13);
        unint64_t v23 = v25;
      }

      else
      {
        unint64_t v23 = *(unsigned int *)(v9 + 4 * v13);
        unsigned int v24 = *(_DWORD *)(v9 + 4 * v13);
        while (*(void *)(v22 + 8 * v23) < v11)
        {
          unint64_t v23 = v24 + 1;
          unsigned int v24 = v23;
          unsigned int v25 = v23;
          if (v21 <= v23) {
            goto LABEL_17;
          }
        }

        unsigned int v25 = v24;
      }

- (void)_dumpAggregatedGPUTimePerBatchForFrame:(unsigned int)a3
{
  unsigned int v59 = a3;
  if (*((_BYTE *)self + 752))
  {
    unsigned int v57 = [*((id *)self + 20) encoderCount];
    if (v57)
    {
      uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/AggregatedEffectiveGPUTimePerBatch.txt",  *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)self + 496,  a3,  &v59)
             + 5));
      double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingLastPathComponent]);
      [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

      unint64_t end = v6;
      BOOL v10 = fopen((const char *)[(id)end UTF8String], "wb");

      uint64_t v11 = *((void *)self + 37) + 40LL * a3;
      memset(&v58, 0, sizeof(v58));
      std::vector<unsigned int>::reserve(&v58, *(void *)(v11 + 24));
      unint64_t v12 = *(uint64_t **)(v11 + 16);
      uint64_t v55 = (void *)(v11 + 16);
      begin = v58.__begin_;
      if (v12)
      {
        value = v58.__end_cap_.__value_;
        do
        {
          unsigned int v15 = *((_DWORD *)v12 + 4);
          if (v15 != -1)
          {
            unint64_t end = (unint64_t)v58.__end_;
            if (v58.__end_ >= value)
            {
              uint64_t v17 = v58.__end_ - begin;
              unint64_t v18 = v17 + 1;
              if ((unint64_t)(v17 + 1) >> 62)
              {
                v58.__end_cap_.__value_ = value;
                v58.__begin_ = begin;
                abort();
              }

              else {
                unint64_t v19 = v18;
              }
              if (v19)
              {
                unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v19);
                unsigned int v15 = *((_DWORD *)v12 + 4);
              }

              else
              {
                uint64_t v20 = 0LL;
              }

              unint64_t v21 = (unsigned int *)(v19 + 4 * v17);
              *unint64_t v21 = v15;
              unint64_t v16 = v21 + 1;
              while ((unsigned int *)end != begin)
              {
                unsigned int v22 = *(_DWORD *)(end - 4);
                end -= 4LL;
                *--unint64_t v21 = v22;
              }

              value = (unsigned int *)(v19 + 4 * v20);
              v58.__end_ = v16;
              if (begin) {
                operator delete(begin);
              }
              begin = v21;
            }

            else
            {
              *v58.__end_ = v15;
              end += 4LL;
              unint64_t v16 = (unsigned int *)end;
            }

            v58.__end_ = v16;
          }

          unint64_t v12 = (uint64_t *)*v12;
        }

        while (v12);
        v58.__end_cap_.__value_ = value;
        v58.__begin_ = begin;
      }

      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(begin, v58.__end_, &v60);
      std::vector<unsigned int>::pointer __p = v58.__begin_;
      std::vector<unsigned int>::pointer v56 = v58.__end_;
      if (v58.__begin_ != v58.__end_)
      {
        std::vector<unsigned int>::pointer v23 = v58.__begin_;
        while (1)
        {
          unint64_t v24 = *v23;
          unint64_t v25 = *(void *)(v11 + 8);
          if (v25)
          {
            uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              unint64_t end = *v23;
              if (v25 <= v24) {
                unint64_t end = v24 % v25;
              }
            }

            else
            {
              unint64_t end = ((_DWORD)v25 - 1) & v24;
            }

            double v27 = *(void ***)(*(void *)v11 + 8 * end);
            if (v27)
            {
              uint64_t v28 = (char *)*v27;
              if (*v27)
              {
                do
                {
                  unint64_t v29 = *((void *)v28 + 1);
                  if (v29 == v24)
                  {
                    if (*((_DWORD *)v28 + 4) == (_DWORD)v24) {
                      goto LABEL_100;
                    }
                  }

                  else
                  {
                    if (v26.u32[0] > 1uLL)
                    {
                      if (v29 >= v25) {
                        v29 %= v25;
                      }
                    }

                    else
                    {
                      v29 &= v25 - 1;
                    }

                    if (v29 != end) {
                      break;
                    }
                  }

                  uint64_t v28 = *(char **)v28;
                }

                while (v28);
              }
            }
          }

          uint64_t v28 = (char *)operator new(0x50uLL);
          *(void *)uint64_t v28 = 0LL;
          *((void *)v28 + 1) = v24;
          *((_DWORD *)v28 + 4) = *v23;
          *(_OWORD *)(v28 + 24) = 0u;
          *(_OWORD *)(v28 + 40) = 0u;
          *(_OWORD *)(v28 + 56) = 0u;
          *((void *)v28 + 9) = 0LL;
          float v30 = (float)(unint64_t)(*(void *)(v11 + 24) + 1LL);
          float v31 = *(float *)(v11 + 32);
LABEL_90:
          uint64_t v47 = *(void **)v11;
          uint64_t v48 = *(void **)(*(void *)v11 + 8 * end);
          if (v48)
          {
            *(void *)uint64_t v28 = *v48;
          }

          else
          {
            *(void *)uint64_t v28 = *v55;
            *uint64_t v55 = v28;
            v47[end] = v55;
            if (!*(void *)v28) {
              goto LABEL_99;
            }
            unint64_t v49 = *(void *)(*(void *)v28 + 8LL);
            if ((v25 & (v25 - 1)) != 0)
            {
              if (v49 >= v25) {
                v49 %= v25;
              }
            }

            else
            {
              v49 &= v25 - 1;
            }

            uint64_t v48 = (void *)(*(void *)v11 + 8 * v49);
          }

          *uint64_t v48 = v28;
LABEL_99:
          ++*(void *)(v11 + 24);
          LODWORD(v24) = *v23;
LABEL_100:
          unint64_t end = 0LL;
          unsigned int v50 = v24 % v57;
          do
          {
            uint64_t v51 = (double *)&v28[8 * end];
            double v52 = v51[3];
            if (v52 > 2.22044605e-16) {
              fprintf( v10,  "%u %u\t%f µs / %f µs = %f %% \n",  v50,  end,  v51[6] * 0.001,  v52 * 0.001,  v51[6] * 100.0 / v52);
            }
            ++end;
          }

          while (end != 3);
          if (++v23 == v56) {
            goto LABEL_115;
          }
        }

        BOOL v32 = (v25 & (v25 - 1)) != 0;
        if (v25 < 3) {
          BOOL v32 = 1LL;
        }
        unint64_t v33 = v32 | (2 * v25);
        unint64_t v34 = vcvtps_u32_f32(v30 / v31);
        if (v33 <= v34) {
          int8x8_t prime = (int8x8_t)v34;
        }
        else {
          int8x8_t prime = (int8x8_t)v33;
        }
        if (*(void *)&prime == 1LL)
        {
          int8x8_t prime = (int8x8_t)2LL;
        }

        else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }

        unint64_t v25 = *(void *)(v11 + 8);
        if (*(void *)&prime > v25) {
          goto LABEL_56;
        }
        if (*(void *)&prime < v25)
        {
          unint64_t v42 = vcvtps_u32_f32((float)*(unint64_t *)(v11 + 24) / *(float *)(v11 + 32));
          if (v25 < 3 || (uint8x8_t v43 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v43.i16[0] = vaddlv_u8(v43), v43.u32[0] > 1uLL))
          {
            unint64_t v42 = std::__next_prime(v42);
          }

          else
          {
            uint64_t v44 = 1LL << -(char)__clz(v42 - 1);
            if (v42 >= 2) {
              unint64_t v42 = v44;
            }
          }

          if (*(void *)&prime <= v42) {
            int8x8_t prime = (int8x8_t)v42;
          }
          if (*(void *)&prime >= v25)
          {
            unint64_t v25 = *(void *)(v11 + 8);
          }

          else
          {
            if (prime)
            {
LABEL_56:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:nn180100]();
              }
              unint64_t v36 = operator new(8LL * *(void *)&prime);
              unint64_t v37 = *(void **)v11;
              *(void *)uint64_t v11 = v36;
              if (v37) {
                operator delete(v37);
              }
              uint64_t v38 = 0LL;
              *(int8x8_t *)(v11 + 8) = prime;
              do
                *(void *)(*(void *)v11 + 8 * v38++) = 0LL;
              while (*(void *)&prime != v38);
              uint8x8_t v39 = (void *)*v55;
              if (*v55)
              {
                unint64_t v40 = v39[1];
                uint8x8_t v41 = (uint8x8_t)vcnt_s8(prime);
                v41.i16[0] = vaddlv_u8(v41);
                if (v41.u32[0] > 1uLL)
                {
                  if (v40 >= *(void *)&prime) {
                    v40 %= *(void *)&prime;
                  }
                }

                else
                {
                  v40 &= *(void *)&prime - 1LL;
                }

                *(void *)(*(void *)v11 + 8 * v40) = v55;
                double v45 = (void *)*v39;
                if (*v39)
                {
                  do
                  {
                    unint64_t v46 = v45[1];
                    if (v41.u32[0] > 1uLL)
                    {
                      if (v46 >= *(void *)&prime) {
                        v46 %= *(void *)&prime;
                      }
                    }

                    else
                    {
                      v46 &= *(void *)&prime - 1LL;
                    }

                    if (v46 != v40)
                    {
                      if (!*(void *)(*(void *)v11 + 8 * v46))
                      {
                        *(void *)(*(void *)v11 + 8 * v46) = v39;
                        goto LABEL_81;
                      }

                      *uint8x8_t v39 = *v45;
                      *double v45 = **(void **)(*(void *)v11 + 8 * v46);
                      **(void **)(*(void *)v11 + 8 * v46) = v45;
                      double v45 = v39;
                    }

                    unint64_t v46 = v40;
LABEL_81:
                    uint8x8_t v39 = v45;
                    double v45 = (void *)*v45;
                    unint64_t v40 = v46;
                  }

                  while (v45);
                }
              }

              unint64_t v25 = (unint64_t)prime;
              goto LABEL_85;
            }

            uint64_t v53 = *(void **)v11;
            *(void *)uint64_t v11 = 0LL;
            if (v53) {
              operator delete(v53);
            }
            unint64_t v25 = 0LL;
            *(void *)(v11 + 8) = 0LL;
          }
        }

- (void)_calculateAverageGPUCommandDuration
{
  id v2 = self;
  uint64_t v3 = (char *)self + 344;
  double v4 = (char *)self + 416;
  uint64_t v5 = (char *)self + 344;
  do
  {
    *((void *)v5 + 1) = *(void *)v5;
    std::vector<double>::resize((char **)v5, *((unsigned int *)v2 + 26));
    v5 += 24;
  }

  while (v5 != v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v2 + 24) objectAtIndexedSubscript:0]);
  unsigned int v7 = [v6 count];

  if (v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  *((unsigned int *)v2 + 26)));
    [*((id *)v2 + 20) setAveragePerDrawKickDurations:v8];

    uint64_t v9 = *((unsigned int *)v2 + 26);
    BOOL v10 = (__int128 *)operator new(0x30uLL);
    *BOOL v10 = xmmword_3183F0;
    v10[1] = xmmword_3183F0;
    v10[2] = xmmword_3183F0;
    uint64_t v51 = 0LL;
    uint64_t v52 = 0LL;
    unsigned int v50 = 0LL;
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100](&v50, v7);
    uint64_t v11 = v51;
    unint64_t v12 = &v51[3 * v7];
    uint64_t v13 = 24LL * v7;
    do
    {
      void *v11 = 0LL;
      v11[1] = 0LL;
      v11[2] = 0LL;
      std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>( v11,  v10,  v10 + 3,  3uLL);
      v11 += 3;
      v13 -= 24LL;
    }

    while (v13);
    uint64_t v51 = v12;
    uint64_t v53 = 0LL;
    unint64_t v54 = 0LL;
    uint64_t v55 = 0LL;
    unint64_t v49 = v2;
    if ((_DWORD)v9)
    {
      unsigned int v14 = operator new(24 * v9);
      unsigned int v15 = &v14[3 * v9];
      uint64_t v53 = v14;
      uint64_t v55 = v15;
      do
      {
        *unsigned int v14 = 0LL;
        v14[1] = 0LL;
        v14[2] = 0LL;
        unint64_t v16 = v50;
        uint64_t v17 = v51;
        if (v51 != (void **)v50)
        {
          std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100]( v14,  0xAAAAAAAAAAAAAAABLL * (((char *)v51 - (char *)v50) >> 3));
          uint64_t v18 = v14[1];
          do
          {
            *(void *)uint64_t v18 = 0LL;
            *(void *)(v18 + 8) = 0LL;
            *(void *)(v18 + 16) = 0LL;
            std::vector<std::pair<unsigned long long,unsigned long long>>::__init_with_size[abi:nn180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>( (_OWORD *)v18,  *v16,  v16[1],  v16[1] - *v16);
            v18 += 24LL;
            v16 += 3;
          }

          while (v16 != (__int128 **)v17);
          v14[1] = v18;
        }

        v14 += 3;
      }

      while (v14 != v15);
      unint64_t v54 = v15;
      id v2 = v49;
    }

    std::vector<unsigned int>::pointer v56 = (void ***)&v50;
    std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v56);
    operator delete(v10);
    unint64_t v19 = (uint64_t *)*((void *)v2 + 28);
    uint64_t v20 = (uint64_t *)*((void *)v2 + 29);
    if (v19 != v20)
    {
      if (v7 <= 1) {
        uint64_t v21 = 1LL;
      }
      else {
        uint64_t v21 = v7;
      }
      do
      {
        uint64_t v22 = 0LL;
        uint64_t v23 = *v19;
        do
        {
          uint64_t v24 = 0LL;
          uint64_t v25 = **(void **)(v23 + 8 * v22);
          unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)(*(void *)(v23 + 8 * v22) + 8LL) - v25) >> 3);
          double v27 = v53;
          do
          {
            if (v24 == v26) {
              abort();
            }
            for (uint64_t i = *(uint64_t ***)(v25 + 40 * v24 + 16); i; uint64_t i = (uint64_t **)*i)
            {
              unint64_t v29 = (uint64_t *)(*(void *)(v27[3 * *((unsigned int *)i + 4)] + 24 * v22) + 16 * v24);
              float v30 = (uint64_t *)*v29;
              unint64_t v31 = v29[1];
              uint64_t *v29 = (uint64_t)v30;
              unint64_t v32 = (unint64_t)i[4];
              if (v31 > v32) {
                unint64_t v32 = v31;
              }
              v29[1] = v32;
            }

            ++v24;
          }

          while (v24 != 3);
          ++v22;
        }

        while (v22 != v21);
        v19 += 3;
      }

      while (v19 != v20);
    }

    if (*((_DWORD *)v2 + 26))
    {
      unint64_t v33 = 0LL;
      if (v7 <= 1) {
        uint64_t v34 = 1LL;
      }
      else {
        uint64_t v34 = v7;
      }
      double v35 = 1.0 / (double)v7;
      do
      {
        unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  3LL,  v49));
        for (uint64_t j = 0LL; j != 3; ++j)
        {
          uint64_t v38 = 0LL;
          uint8x8_t v39 = (uint64_t *)v53[3 * v33];
          uint64_t v40 = v34;
          do
          {
            uint64_t v41 = *v39;
            v39 += 3;
            unint64_t v42 = (unint64_t *)(v41 + 16 * j);
            unint64_t v44 = *v42;
            unint64_t v43 = v42[1];
            BOOL v45 = v43 >= v44;
            unint64_t v46 = v43 - v44;
            if (!v45) {
              unint64_t v46 = 0LL;
            }
            v38 += v46;
            --v40;
          }

          while (v40);
          *(double *)(*(void *)&v3[24 * j] + 8 * v33) = v35 * (double)(125 * v38 / 3uLL);
          uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v36 addObject:v47];
        }

        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v49 + 20) averagePerDrawKickDurations]);
        [v48 addObject:v36];

        ++v33;
      }

      while (v33 < *((unsigned int *)v49 + 26));
    }

    unsigned int v50 = (__int128 **)&v53;
    std::vector<std::vector<std::vector<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData,std::allocator<GRCInfo::MergeCounterData(NSArray *,NSArray*<NSArray*<NSString *>>,NSArray *,std::vector<std::unordered_map<unsigned int,GRCInfo::EncoderCounterInfo>> &,NSMutableDictionary<NSArray*,NSNumber *> *)::CounterValueData>>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v50);
  }

- (void)_calculateAggregatedEffectiveGPUEncoderCost
{
  *((void *)self + 41) = *((void *)self + 40);
  unsigned int v3 = [*((id *)self + 20) encoderCount];
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  unint64_t v5 = v3;
  unsigned int v7 = (_BYTE *)*((void *)self + 40);
  double v6 = (char *)*((void *)self + 41);
  unint64_t v8 = 0x6DB6DB6DB6DB6DB7LL * ((v6 - v7) >> 3);
  unint64_t v9 = v3 - v8;
  unint64_t v75 = v3;
  if (v3 > v8)
  {
    uint64_t v10 = *((void *)self + 42);
    if (0x6DB6DB6DB6DB6DB7LL * ((v10 - (uint64_t)v6) >> 3) < v9)
    {
      unint64_t v11 = 0x6DB6DB6DB6DB6DB7LL * ((v10 - (uint64_t)v7) >> 3);
      unint64_t v12 = 0xDB6DB6DB6DB6DB6ELL * ((v10 - (uint64_t)v7) >> 3);
      if (v12 <= v3) {
        unint64_t v12 = v3;
      }
      if (v11 >= 0x249249249249249LL) {
        unint64_t v13 = 0x492492492492492LL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13 > 0x492492492492492LL) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v14 = 56 * v13;
      unsigned int v15 = (char *)operator new(56 * v13);
      unint64_t v16 = &v15[8 * ((v6 - v7) >> 3)];
      uint64_t v17 = &v15[v14];
      bzero(v16, 56 * ((56 * v9 - 56) / 0x38) + 56);
      uint64_t v18 = &v16[56 * ((56 * v9 - 56) / 0x38) + 56];
      if (v6 != v7)
      {
        do
        {
          __int128 v19 = *(_OWORD *)(v6 - 56);
          __int128 v20 = *(_OWORD *)(v6 - 40);
          __int128 v21 = *(_OWORD *)(v6 - 24);
          *((void *)v16 - 1) = *((void *)v6 - 1);
          *(_OWORD *)(v16 - 24) = v21;
          *(_OWORD *)(v16 - 40) = v20;
          *(_OWORD *)(v16 - 56) = v19;
          v16 -= 56;
          v6 -= 56;
        }

        while (v6 != v7);
        double v6 = (char *)*((void *)self + 40);
      }

      *((void *)self + 40) = v16;
      *((void *)self + 41) = v18;
      *((void *)self + 42) = v17;
      unint64_t v5 = v75;
      if (v6) {
        operator delete(v6);
      }
      goto LABEL_19;
    }

    bzero(v6, 56 * ((56 * v9 - 56) / 0x38) + 56);
    uint64_t v22 = &v6[56 * ((56 * v9 - 56) / 0x38) + 56];
    goto LABEL_18;
  }

  if (v3 < v8)
  {
    uint64_t v22 = &v7[56 * v3];
LABEL_18:
    *((void *)self + 41) = v22;
  }

- (void)_dumpLimiterBatchInfoCosts:(void *)a3 forRingBuffer:(unsigned int)a4 forFrame:(unsigned int)a5
{
  unsigned int v17 = a5;
  if (*((_BYTE *)self + 752))
  {
    double v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/perLimiterBatchCosts.txt",  *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)self + 496,  a5,  &v17)
           + 5),
           *(void *)&a4);
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    unint64_t v8 = fopen((const char *)[v7 UTF8String], "wt");
    if (v8)
    {
      fwrite("Limiter Index : BatchIdx Cost\n", 0x1EuLL, 1uLL, v8);
      uint64_t v10 = *(void *)a3;
      uint64_t v9 = *((void *)a3 + 1);
      if (v9 != *(void *)a3)
      {
        unint64_t v11 = 0LL;
        do
        {
          if (*(void *)(v10 + 24 * v11) != *(void *)(v10 + 24 * v11 + 8))
          {
            fprintf(v8, "%lu: ", v11);
            unint64_t v12 = (double **)(*(void *)a3 + 24 * v11);
            unint64_t v13 = *v12;
            uint64_t v14 = (int *)v12[1];
            while (v13 != (double *)v14)
            {
              double v15 = v13[1];
              int v16 = *(_DWORD *)v13;
              v13 += 2;
              fprintf(v8, "\t%u %f, ", v16, v15);
            }

            fputc(10, v8);
            uint64_t v10 = *(void *)a3;
            uint64_t v9 = *((void *)a3 + 1);
          }

          ++v11;
        }

        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v9 - v10) >> 3));
      }

      fclose(v8);
    }
  }

- (void)adjustHWBiasAndFinalizeResult
{
  id v2 = (char *)*a1;
  if (*a1)
  {
    unsigned int v3 = (char *)a1[1];
    unsigned int v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        unint64_t v5 = (void *)*((void *)v3 - 3);
        if (v5)
        {
          *((void *)v3 - 2) = v5;
          operator delete(v5);
        }

        v3 -= 48;
      }

      while (v3 != v2);
      unsigned int v4 = *a1;
    }

    a1[1] = v2;
    operator delete(v4);
  }

  return a1;
}

- (void)generateTargetSamplesForResult:(id)a3 withProgramAddressLUT:(void *)a4 withBatchIndexMin:(unsigned int)a5 withProgramAddressList:(DYMTLShaderProfilerProgramAddress *)a6 withUSCSampleBuffer:(unint64_t *)a7 withUSCSampleNum:(unsigned int)a8 withBatchIDToEncoderIndex:(void *)a9 andEncoderIndexToBatchIdMap:(void *)a10 targetIndex:(int)a11
{
  v451 = (id *)a3;
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v451 drawCallInfoList]);
  unint64_t v14 = (unint64_t)[v13 count];
  v597 = 0LL;
  v596 = 0LL;
  uint64_t v598 = 0LL;
  if (v14)
  {
    std::vector<std::vector<std::pair<ShaderBinaryInfo * {__strong},std::string>>>::__vallocate[abi:nn180100]( &v596,  v14);
    double v15 = (char *)v597;
    size_t v16 = 24 * ((24 * v14 - 24) / 0x18) + 24;
    bzero(v597, v16);
    v597 = &v15[v16];
  }

  v443 = self;

  unsigned int v18 = 0;
  unsigned int v458 = 0;
  while (1)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v451 drawCallInfoList]);
    uint64_t v20 = v18;
    BOOL v21 = (unint64_t)[v19 count] > v18;

    if (!v21) {
      break;
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v451 drawCallInfoList]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v20]);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 programInfo]);
    if (!v24
      || (uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 programInfo]),
          BOOL v26 = [v25 programId] == (id)-1,
          v25,
          v24,
          !v26))
    {
      uint64_t v27 = v596;
      id v586 = 0LL;
      std::string::basic_string[abi:nn180100]<0>(__p, "");
      uint64_t v28 = &v27[3 * v458];
      unsigned int v29 = (unint64_t *)(v28 + 1);
      uint64_t v30 = (void *)v28[1];
      uint64_t v31 = *v28;
      uint64_t v32 = (uint64_t)v30 - *v28;
      if ((unint64_t)v32 > 0xBF)
      {
        if (v32 != 192)
        {
          uint64_t v55 = (void *)(v31 + 192);
          while (v30 != v55)
          {
            v30 -= 4;
            std::allocator<std::pair<ShaderBinaryInfo * {__strong},std::string>>::destroy[abi:nn180100]((uint64_t)v30);
          }

          unint64_t *v29 = (unint64_t)v55;
        }
      }

      else
      {
        uint64_t v33 = a9;
        uint64_t v34 = v32 >> 5;
        unint64_t v35 = 6 - (v32 >> 5);
        unint64_t v36 = &v27[3 * v458];
        uint64_t v39 = v36[2];
        unsigned int v38 = (char **)(v36 + 2);
        uint64_t v37 = v39;
        if (v35 <= (v39 - (uint64_t)v30) >> 5)
        {
          unint64_t v56 = &v30[4 * v35];
          uint64_t v57 = 192 - 32 * v34;
          a9 = v33;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v30, (uint64_t)&v586);
            v30 += 4;
            v57 -= 32LL;
          }

          while (v57);
          unint64_t *v29 = (unint64_t)v56;
        }

        else
        {
          v603 = v38;
          uint64_t v40 = v37 - v31;
          uint64_t v41 = v40 >> 4;
          else {
            unint64_t v42 = v41;
          }
          unint64_t v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<GTMMappedBufferBlock>>(v42);
          unint64_t v44 = &v43[32 * v34];
          *(void *)v601 = v43;
          *(void *)&v601[8] = v44;
          *(void *)&v601[16] = v44;
          v602 = &v43[32 * v45];
          unint64_t v46 = v43 + 192;
          uint64_t v47 = v34 - 6;
          do
          {
            std::pair<ShaderBinaryInfo * {__strong},std::string>::pair[abi:nn180100](v44, (uint64_t)&v586);
            v44 += 32;
          }

          while (!__CFADD__(v47++, 1LL));
          unint64_t v49 = *v29;
          uint64_t v50 = *v28;
          uint64_t v51 = *(void *)&v601[8];
          if (*v29 == *v28)
          {
            int64x2_t v54 = vdupq_n_s64(v49);
          }

          else
          {
            do
            {
              uint64_t v52 = *(void *)(v49 - 32);
              v49 -= 32LL;
              *(void *)unint64_t v49 = 0LL;
              *(void *)(v51 - 32) = v52;
              v51 -= 32LL;
              __int128 v53 = *(_OWORD *)(v49 + 8);
              *(void *)(v51 + 24) = *(void *)(v49 + 24);
              *(_OWORD *)(v51 + 8) = v53;
              *(void *)(v49 + 16) = 0LL;
              *(void *)(v49 + 24) = 0LL;
              *(void *)(v49 + 8) = 0LL;
            }

            while (v49 != v50);
            int64x2_t v54 = *(int64x2_t *)v28;
          }

          uint64_t *v28 = v51;
          unint64_t *v29 = (unint64_t)v46;
          *(int64x2_t *)&v601[8] = v54;
          double v58 = *v38;
          char *v38 = v602;
          v602 = v58;
          *(void *)v601 = v54.i64[0];
          std::__split_buffer<std::pair<ShaderBinaryInfo * {__strong},std::string>>::~__split_buffer((uint64_t)v601);
          a9 = v33;
        }
      }

      if (SHIBYTE(v588) < 0) {
        operator delete(__p[0]);
      }

      uint64_t v59 = objc_claimAutoreleasedReturnValue([v451[30] objectForKeyedSubscript:v23[1]]);
      char v60 = *(void **)(*v28 + 32);
      *(void *)(*v28 + 32) = v59;

      uint64_t v61 = (void *)v23[1];
      if (v61)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)[v61 UTF8String]);
        uint64_t v62 = *v28 + 40;
        *(_OWORD *)uint64_t v62 = *(_OWORD *)v601;
        *(void *)(v62 + 16) = *(void *)&v601[16];
      }

      uint64_t v63 = objc_claimAutoreleasedReturnValue([v451[31] objectForKeyedSubscript:v23[2]]);
      uint64_t v64 = *(void **)(*v28 + 64);
      *(void *)(*v28 + 64) = v63;

      double v65 = (void *)v23[2];
      if (v65)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)[v65 UTF8String]);
        uint64_t v66 = *v28 + 72;
        *(_OWORD *)uint64_t v66 = *(_OWORD *)v601;
        *(void *)(v66 + 16) = *(void *)&v601[16];
      }

      uint64_t v67 = objc_claimAutoreleasedReturnValue([v451[32] objectForKeyedSubscript:v23[3]]);
      uint64_t v68 = *(void **)(*v28 + 96);
      *(void *)(*v28 + 96) = v67;

      ++v458;
      uint64_t v69 = (void *)v23[3];
      if (v69)
      {
        std::string::basic_string[abi:nn180100]<0>(v601, (char *)[v69 UTF8String]);
        uint64_t v70 = *v28;
        uint64_t v71 = *v28 + 104;
        *(_OWORD *)uint64_t v71 = *(_OWORD *)v601;
        *(void *)(v71 + 16) = *(void *)&v601[16];
      }
    }

    unsigned int v18 = v20 + 1;
  }

  id v593 = 0LL;
  std::string::basic_string[abi:nn180100]<0>(&v594, "");
  id v586 = 0LL;
  __p[0] = &v586;
  __p[1] = (void *)0x5812000000LL;
  v588 = __Block_byref_object_copy__549;
  v589 = __Block_byref_object_dispose__550;
  memset(v590, 0, sizeof(v590));
  uint64_t v591 = 0LL;
  int v592 = 1065353216;
  id v72 = v451[33];
  v585[0] = _NSConcreteStackBlock;
  v585[1] = 3221225472LL;
  v585[2] = __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke;
  v585[3] = &unk_58EBD0;
  v585[4] = &v586;
  [v72 enumerateKeysAndObjectsUsingBlock:v585];
  if (*((__int16 *)a7 + 3) == -275LL)
  {
    BOOL v73 = 1;
  }

  else
  {
    uint64_t v74 = 1LL;
    unint64_t v75 = 1023LL;
    while (v74 != 1024)
    {
      uint64_t v76 = SHIWORD(a7[v74++]);
      if (v76 == -275)
      {
        unint64_t v75 = v74 - 2;
        break;
      }
    }

    BOOL v73 = v75 < 0x3FF;
  }

  __int128 v77 = a9;
  v583 = 0LL;
  __int128 v582 = 0LL;
  uint64_t v584 = 0LL;
  unint64_t v78 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)&v582, v78);
  unsigned int v79 = std::thread::hardware_concurrency();
  uint64_t v573 = 0LL;
  unsigned int v574 = &v573;
  if (v79 <= 1) {
    unint64_t v80 = 1LL;
  }
  else {
    unint64_t v80 = v79 >> 1;
  }
  uint64_t v575 = 0x4812000000LL;
  v576 = __Block_byref_object_copy__552;
  uint64_t v577 = __Block_byref_object_dispose__553;
  v578 = "";
  v579 = 0LL;
  v581 = 0LL;
  id v580 = 0LL;
  v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v80);
  v579 = v81;
  v581 = &v81[4 * v82];
  bzero(v81, 4 * v80);
  id v580 = &v81[4 * v80];
  uint64_t v564 = 0LL;
  v565 = &v564;
  uint64_t v566 = 0x4812000000LL;
  v567 = __Block_byref_object_copy__552;
  v568 = __Block_byref_object_dispose__553;
  int v569 = "";
  __int128 v570 = 0LL;
  __int128 v572 = 0LL;
  __int128 v571 = 0LL;
  uint64_t v83 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v80);
  __int128 v570 = v83;
  __int128 v572 = &v83[4 * v84];
  bzero(v83, 4 * v80);
  __int128 v571 = &v83[4 * v80];
  uint64_t v557 = 0LL;
  v558 = &v557;
  uint64_t v559 = 0x4812000000LL;
  v560 = __Block_byref_object_copy__509;
  uint64_t v561 = __Block_byref_object_dispose__510;
  v562 = "";
  memset(v563, 0, sizeof(v563));
  v553[0] = 0LL;
  v553[1] = v553;
  v553[3] = __Block_byref_object_copy__513;
  v553[4] = __Block_byref_object_dispose__514;
  v553[2] = 0x4812000000LL;
  v553[5] = "";
  v554 = 0LL;
  uint64_t v556 = 0LL;
  v555 = 0LL;
  std::vector<ShaderProfilerUSCSampleInfo>::reserve(&v554, 0x100000uLL);
  std::vector<std::vector<ShaderProfilerUSCSampleInfo>>::resize((uint64_t)(v558 + 6), v80);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  group = dispatch_group_create();
  unint64_t v86 = std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((v80 + 1));
  bzero(v86, 4LL * (v80 + 1));
  uint64_t v448 = (uint64_t *)v86;
  v452 = (FILE *)v80;
  if ((_DWORD)v80)
  {
    uint64_t v87 = 0LL;
    unint64_t v88 = v80;
    do
    {
      *v86++ = a8 / v80 * v87++;
      --v88;
    }

    while (v88);
    *((_DWORD *)v448 + v80) = a8;
    if (!v73)
    {
      uint64_t v89 = 0LL;
      do
      {
        uint64_t v90 = v89;
        uint64_t v91 = *((unsigned int *)v448 + v89++);
        if (v91 < *((_DWORD *)v448 + v89))
        {
          while (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( a10,  a7[v91]))
          {
          }

          *((_DWORD *)v448 + v90) = v91;
        }

- (BOOL)dumpInstructions
{
  return *((_BYTE *)self + 752);
}

- (void)setDumpInstructions:(BOOL)a3
{
  *((_BYTE *)self + 752) = a3;
}

- (void).cxx_destruct
{
  unsigned int v3 = (void *)*((void *)self + 58);
  if (v3)
  {
    *((void *)self + 59) = v3;
    operator delete(v3);
  }

  objc_storeStrong((id *)self + 57, 0LL);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)self + 416);
  for (uint64_t i = 0LL; i != -72; i -= 24LL)
  {
    unint64_t v5 = *(void **)((char *)self + i + 392);
    if (v5)
    {
      *(void *)((char *)self + i + 400) = v5;
      operator delete(v5);
    }
  }

  double v6 = (void *)*((void *)self + 40);
  if (v6)
  {
    *((void *)self + 41) = v6;
    operator delete(v6);
  }

  uint64_t v7 = *((void *)self + 37);
  if (v7)
  {
    uint64_t v8 = *((void *)self + 38);
    uint64_t v9 = (void *)*((void *)self + 37);
    if (v8 != v7)
    {
      do
        uint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v8 - 40);
      while (v8 != v7);
      uint64_t v9 = (void *)*((void *)self + 37);
    }

    *((void *)self + 38) = v7;
    operator delete(v9);
  }

  uint64_t v23 = (void **)((char *)self + 272);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  uint64_t v23 = (void **)((char *)self + 248);
  std::vector<std::vector<std::unique_ptr<std::vector<double>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
  uint64_t v10 = (void **)*((void *)self + 28);
  if (v10)
  {
    unint64_t v11 = (void **)*((void *)self + 29);
    unint64_t v12 = (void *)*((void *)self + 28);
    if (v11 != v10)
    {
      do
      {
        v11 -= 3;
        uint64_t v23 = v11;
        std::vector<std::unique_ptr<std::vector<std::unordered_map<unsigned int,std::pair<unsigned long long,unsigned long long>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }

      while (v11 != v10);
      unint64_t v12 = (void *)*((void *)self + 28);
    }

    *((void *)self + 29) = v10;
    operator delete(v12);
  }

  unint64_t v13 = (void **)*((void *)self + 25);
  if (v13)
  {
    unint64_t v14 = (void **)*((void *)self + 26);
    double v15 = (void *)*((void *)self + 25);
    if (v14 != v13)
    {
      do
      {
        v14 -= 3;
        uint64_t v23 = v14;
        std::vector<std::unique_ptr<std::vector<std::vector<std::pair<unsigned int,double>>>>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }

      while (v14 != v13);
      double v15 = (void *)*((void *)self + 25);
    }

    *((void *)self + 26) = v13;
    operator delete(v15);
  }

  objc_storeStrong((id *)self + 24, 0LL);
  objc_storeStrong((id *)self + 23, 0LL);
  objc_storeStrong((id *)self + 22, 0LL);
  objc_storeStrong((id *)self + 21, 0LL);
  objc_storeStrong((id *)self + 20, 0LL);
  objc_storeStrong((id *)self + 19, 0LL);
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::~__hash_table((uint64_t)self + 112);
  uint64_t v16 = *((void *)self + 10);
  if (v16)
  {
    uint64_t v17 = *((void *)self + 11);
    unsigned int v18 = (void *)*((void *)self + 10);
    if (v17 != v16)
    {
      do
        uint64_t v17 = std::__hash_table<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::pair<ShaderBinaryStatsInfo *,std::string>>>>::~__hash_table(v17 - 40);
      while (v17 != v16);
      unsigned int v18 = (void *)*((void *)self + 10);
    }

    *((void *)self + 11) = v16;
    operator delete(v18);
  }

  __int128 v19 = (void **)*((void *)self + 7);
  if (v19)
  {
    uint64_t v20 = (void **)*((void *)self + 8);
    BOOL v21 = (void *)*((void *)self + 7);
    if (v20 != v19)
    {
      do
      {
        v20 -= 3;
        uint64_t v23 = v20;
        std::vector<std::pair<ShaderBinaryStatsInfo *,std::string>>::__destroy_vector::operator()[abi:nn180100](&v23);
      }

      while (v20 != v19);
      BOOL v21 = (void *)*((void *)self + 7);
    }

    *((void *)self + 8) = v19;
    operator delete(v21);
  }

  std::__hash_table<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::__unordered_map_hasher<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,std::unique_ptr<ShaderBinaryStatsInfo>>>>::__deallocate_node(*((void **)self + 4));
  uint64_t v22 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0LL;
  if (v22) {
    operator delete(v22);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 55) = 0LL;
  *((_DWORD *)self + 112) = 1065353216;
  *((void *)self + 59) = 0LL;
  *((void *)self + 60) = 0LL;
  *((void *)self + 58) = 0LL;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_DWORD *)self + 132) = 1065353216;
  *((void *)self + 67) = 850045863LL;
  *((_OWORD *)self + 34) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((void *)self + 74) = 0LL;
  *((void *)self + 75) = 850045863LL;
  *((void *)self + 82) = 0LL;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 38) = 0u;
  *((void *)self + 83) = 850045863LL;
  *((void *)self + 90) = 0LL;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  return self;
}

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  unint64_t v9 = strtoull((const char *)[v8 UTF8String], 0, 16);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v11 = v8;
  unint64_t v12 = (char *)[v11 UTF8String];
  id v13 = v7;
  unint64_t v43 = v13;
  std::string::basic_string[abi:nn180100]<0>(&__p, v12);
  unint64_t v14 = *(void *)(v10 + 56);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v14) {
        unint64_t v3 = v9 % v14;
      }
    }

    else
    {
      unint64_t v3 = (v14 - 1) & v9;
    }

    uint64_t v16 = *(void **)(*(void *)(v10 + 48) + 8 * v3);
    if (v16)
    {
      for (uint64_t i = (void *)*v16; i; uint64_t i = (void *)*i)
      {
        unint64_t v18 = i[1];
        if (v18 == v9)
        {
          if (i[2] == v9) {
            goto LABEL_74;
          }
        }

        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v18 >= v14) {
              v18 %= v14;
            }
          }

          else
          {
            v18 &= v14 - 1;
          }

          if (v18 != v3) {
            break;
          }
        }
      }
    }
  }

  __int128 v19 = operator new(0x38uLL);
  uint64_t v20 = (void *)(v10 + 64);
  v46[0] = v19;
  v46[1] = v10 + 64;
  *__int128 v19 = 0LL;
  v19[1] = v9;
  unint64_t v43 = 0LL;
  v19[2] = v9;
  v19[3] = v13;
  void v19[6] = v45;
  *((_OWORD *)v19 + 2) = __p;
  __int128 __p = 0uLL;
  uint64_t v45 = 0LL;
  char v47 = 1;
  float v21 = (float)(unint64_t)(*(void *)(v10 + 72) + 1LL);
  float v22 = *(float *)(v10 + 80);
  if (!v14 || (float)(v22 * (float)v14) < v21)
  {
    BOOL v23 = 1LL;
    if (v14 >= 3) {
      BOOL v23 = (v14 & (v14 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v14);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v14 = *(void *)(v10 + 56);
    if (*(void *)&prime > v14) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v14)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*(unint64_t *)(v10 + 72) / *(float *)(v10 + 80));
      if (v14 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v14), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }

      else
      {
        uint64_t v35 = 1LL << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }

      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v14)
      {
        unint64_t v14 = *(void *)(v10 + 56);
      }

      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v27 = operator new(8LL * *(void *)&prime);
          uint64_t v28 = *(void **)(v10 + 48);
          *(void *)(v10 + 48) = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0LL;
          *(int8x8_t *)(v10 + 56) = prime;
          do
            *(void *)(*(void *)(v10 + 48) + 8 * v29++) = 0LL;
          while (*(void *)&prime != v29);
          uint64_t v30 = (void *)*v20;
          if (*v20)
          {
            unint64_t v31 = v30[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }

            else
            {
              v31 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)(v10 + 48) + 8 * v31) = v20;
            unint64_t v36 = (void *)*v30;
            if (*v30)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }

                else
                {
                  v37 &= *(void *)&prime - 1LL;
                }

                if (v37 != v31)
                {
                  uint64_t v38 = *(void *)(v10 + 48);
                  if (!*(void *)(v38 + 8 * v37))
                  {
                    *(void *)(v38 + 8 * v37) = v30;
                    goto LABEL_55;
                  }

                  *uint64_t v30 = *v36;
                  void *v36 = **(void **)(*(void *)(v10 + 48) + 8 * v37);
                  **(void **)(*(void *)(v10 + 48) + 8 * v37) = v36;
                  unint64_t v36 = v30;
                }

                unint64_t v37 = v31;
LABEL_55:
                uint64_t v30 = v36;
                unint64_t v36 = (void *)*v36;
                unint64_t v31 = v37;
              }

              while (v36);
            }
          }

          unint64_t v14 = (unint64_t)prime;
          goto LABEL_59;
        }

        unint64_t v42 = *(void **)(v10 + 48);
        *(void *)(v10 + 48) = 0LL;
        if (v42) {
          operator delete(v42);
        }
        unint64_t v14 = 0LL;
        *(void *)(v10 + 56) = 0LL;
      }
    }

id __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_558( uint64_t a1)
{
  if ([*(id *)(a1 + 32) dumpInstructions])
  {
    snprintf( __str,  0x80uLL,  "/tmp/com.apple.gputools.profiling/shaderProfilerResults/uscSamplingProcessedSample_%d.txt",  *(_DWORD *)(a1 + 104));
    uint64_t v76 = fopen(__str, "wt");
  }

  else
  {
    uint64_t v76 = 0LL;
  }

  unsigned int v2 = *(_DWORD *)(a1 + 108);
  if (v2 < *(_DWORD *)(a1 + 112))
  {
    while (1)
    {
      uint64_t v3 = *(void *)(a1 + 72);
      uint64_t v4 = v2;
      if (!*(_BYTE *)(a1 + 128)) {
        break;
      }
      if (*(__int16 *)(v3 + 8LL * v2 + 6) == -275LL)
      {
        uint64_t v5 = 0LL;
        unsigned int v6 = *(_DWORD *)(a1 + 116);
        do
        {
          *(void *)&__str[8 * v5] = *(void *)(v3 + 8LL * ((v2 + v5) % v6));
          ++v5;
        }

        while (v5 != 3);
        unsigned int v80 = v86;
        unsigned int v7 = ((*(_DWORD *)__str >> 4) & 7) + v2;
        LODWORD(v8) = (*(_DWORD *)__str >> 7) & 0x7F;
        unsigned int v2 = v7 + v8;
        uint64_t v79 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }

void __227__DYPMTLShaderProfilerHelper_generateTargetSamplesForResult_withProgramAddressLUT_withBatchIndexMin_withProgramAddressList_withUSCSampleBuffer_withUSCSampleNum_withBatchIDToEncoderIndex_andEncoderIndexToBatchIdMap_targetIndex___block_invoke_575( uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v325 = 0LL;
  memset(v324, 0, sizeof(v324));
  unint64_t v4 = *(unsigned int *)(a1 + 200);
  unint64_t v3 = *(unsigned int *)(a1 + 204);
  if (v4 >= v3) {
    goto LABEL_231;
  }
  unint64_t v287 = (id *)(a1 + 120);
  do
  {
    unint64_t v285 = v4;
    uint64_t v5 = (unint64_t *)(**(void **)(v2 + 112) + 24LL * *(void *)(*(void *)(v2 + 88) + 8 * v4));
    unint64_t v1 = *v5;
    unint64_t v288 = v5[1];
    uint64_t v289 = *(void *)(*(void *)(v2 + 88) + 8 * v4);
    if (*v5 == v288) {
      goto LABEL_230;
    }
    do
    {
      unsigned int v6 = *(unsigned __int8 **)v1;
      unsigned int v7 = *(_DWORD *)(*(void *)v1 + 4LL) % *(_DWORD *)(v2 + 208);
      unsigned int v323 = v7;
      unint64_t v8 = *v6;
      if (v8 == 98)
      {
        unint64_t v8 = v6[40];
        unint64_t v9 = *((void *)v6 + 4);
      }

      else
      {
        unint64_t v9 = -1LL;
      }

      unint64_t v10 = *(int8x8_t **)(*(void *)(v2 + 40) + 8LL);
      int8x8_t v11 = v10[7];
      if (v11)
      {
        uint8x8_t v12 = (uint8x8_t)vcnt_s8(v11);
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] > 1uLL)
        {
          unint64_t v13 = v9;
          if (v9 >= *(void *)&v11) {
            unint64_t v13 = v9 % *(void *)&v11;
          }
        }

        else
        {
          unint64_t v13 = (*(void *)&v11 - 1LL) & v9;
        }

        unsigned int v14 = *(void **)(*(void *)&v10[6] + 8 * v13);
        if (v14)
        {
          for (uint64_t i = (void *)*v14; i; uint64_t i = (void *)*i)
          {
            unint64_t v16 = i[1];
            if (v16 == v9)
            {
              if (i[2] == v9)
              {
                unint64_t v168 = (id *)(i + 3);
                goto LABEL_25;
              }
            }

            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= *(void *)&v11) {
                  v16 %= *(void *)&v11;
                }
              }

              else
              {
                v16 &= *(void *)&v11 - 1LL;
              }

              if (v16 != v13) {
                break;
              }
            }
          }
        }
      }

      unint64_t v168 = v287;
      if (v8 <= 5) {
        unint64_t v168 = (id *)(*(void *)(*(void *)(v2 + 152) + 24LL * v7) + 32 * v8);
      }
LABEL_25:
      int v292 = v8;
      unsigned int v294 = v168;
      uint64_t v298 = (uint64_t)(v168 + 1);
      id v311 = *v168;
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v311 binary]);

      if (v17)
      {
        uint64_t v300 = std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]( (void *)(*(void *)(*(void *)(*(void *)(v2 + 48) + 8LL) + 48LL)
                          + 40LL * *(unsigned int *)(v2 + 212)),
                 v298);
        if (!v300)
        {
          uint64_t v18 = (GPUToolsPlatformLLVMShaderProfilerHelper *)operator new(8uLL);
          GPUToolsPlatformLLVMShaderProfilerHelper::GPUToolsPlatformLLVMShaderProfilerHelper(v18);
          v319.__r_.__value_.__r.__words[0] = v19;
          id v20 = objc_claimAutoreleasedReturnValue([v311 binary]);
          float v21 = (const char *)[v20 bytes];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v311 binary]);
          GPUToolsPlatformLLVMShaderProfilerHelper::SetBinaryForAnalysis( v18,  v21,  (uint64_t)[v22 length],  *(_DWORD *)(v2 + 216));

          *(_DWORD *)(*GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(*(GPUToolsPlatformLLVMShaderProfilerHelperImpl **)v18)
                    + 248LL) = *(_DWORD *)(v2 + 208);
          uint64_t v300 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelper>>( *(void *)(*(void *)(*(void *)(v2 + 48) + 8LL) + 48LL) + 40LL * *(unsigned int *)(v2 + 212),  v298,  v298,  (uint64_t *)&v319);
          BOOL v23 = (void *)v319.__r_.__value_.__r.__words[0];
          if (v319.__r_.__value_.__r.__words[0])
          {
            std::unique_ptr<GPUToolsPlatformLLVMShaderProfilerHelperImpl>::reset[abi:nn180100]( (uint64_t *)v319.__r_.__value_.__l.__data_,  0LL);
            operator delete(v23);
          }
        }
      }

      else
      {
        uint64_t v300 = 0LL;
      }

      unint64_t v309 = v1;
      uint64_t v24 = *(void *)v1;
      HIDWORD(v324[0]) = *(void *)(*(void *)v1 + 8LL);
      uint64_t v25 = (char **)(*(void *)(v2 + 176) + 24 * v289);
      uint64_t v27 = *v25;
      unsigned int v26 = v25[1];
      uint64_t v28 = v26 - *v25;
      if (v28)
      {
        unint64_t v29 = 0xCCCCCCCCCCCCCCCDLL * (v28 >> 3);
        unsigned int v306 = v27;
        do
        {
          uint64_t v30 = (uint64_t)&v27[40 * (v29 >> 1)];
          BOOL v31 = USCSampleComparator::operator()(v30, (uint64_t)v324);
          if (v31) {
            v29 += ~(v29 >> 1);
          }
          else {
            v29 >>= 1;
          }
          if (v31) {
            uint64_t v27 = (char *)(v30 + 40);
          }
        }

        while (v29);
        unint64_t v32 = v306;
        if (v26 != v27)
        {
          HIDWORD(v324[0]) = *(void *)(v24 + 16);
          if (v26 != v306)
          {
            unint64_t v33 = 0xCCCCCCCCCCCCCCCDLL * ((v26 - v306) >> 3);
            do
            {
              if (USCSampleComparator::operator()((uint64_t)v324, (uint64_t)&v32[40 * (v33 >> 1)]))
              {
                v33 >>= 1;
              }

              else
              {
                v32 += 40 * (v33 >> 1) + 40;
                v33 += ~(v33 >> 1);
              }
            }

            while (v33);
          }

          if (v27 != v32)
          {
            v307 = v32;
            while (1)
            {
              unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v311, "binary", v285));

              if (!v34)
              {
                uint64_t v52 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned long long,unsigned long long>>>(1uLL);
                *(_DWORD *)uint64_t v52 = *((_DWORD *)v27 + 3);
                *(void *)(v52 + 4) = 1LL;
                *((_DWORD *)v52 + 3) = 0;
                v313 = (unsigned int *)v52;
                uint64_t v53 = (uint64_t)(v52 + 16);
                int v54 = 1;
                goto LABEL_172;
              }

              TargetClauseAnalysis = (uint64_t **)GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v300 + 5));
              unint64_t v36 = *TargetClauseAnalysis;
              unint64_t v37 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( *TargetClauseAnalysis + 7,  (*((_DWORD *)v27 + 3) - *(_DWORD *)(*(void *)v309 + 8LL)));
              __int128 v38 = v307;
              if (v37)
              {
                unsigned int v39 = *((_DWORD *)v37 + 6);
                if (v39 != -1) {
                  break;
                }
              }

- (void)generateTargetSamplesForResult:(uint64_t)a3 withProgramAddressLUT:(char)a4 withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:
{
LABEL_1:
  unint64_t v8 = a2 - 7;
  unint64_t v9 = a1;
  while (2)
  {
    a1 = v9;
    uint64_t v10 = (uint64_t)a2 - v9;
    uint64_t v11 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)((uint64_t)a2 - v9) >> 2);
    switch(v11)
    {
      case 0LL:
      case 1LL:
        return;
      case 2LL:
        unsigned int v58 = *(a2 - 7);
        BOOL v77 = v58 == *(_DWORD *)v9;
        BOOL v59 = v58 < *(_DWORD *)v9;
        if (v77) {
          BOOL v59 = *(a2 - 2) < *(_DWORD *)(v9 + 20);
        }
        if (v59)
        {
          *(_OWORD *)&v151[12] = *(_OWORD *)(v9 + 12);
          *(_OWORD *)unint64_t v151 = *(_OWORD *)v9;
          __int128 v60 = *(_OWORD *)v8;
          *(_OWORD *)(v9 + 12) = *((_OWORD *)a2 - 1);
          *(_OWORD *)unint64_t v9 = v60;
          *((_OWORD *)a2 - 1) = *(_OWORD *)&v151[12];
          *(_OWORD *)unint64_t v8 = *(_OWORD *)v151;
        }

        return;
      case 3LL:
        std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( v9,  (int *)(v9 + 28),  (uint64_t)(a2 - 7));
        return;
      case 4LL:
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( v9,  v9 + 28,  v9 + 56,  (uint64_t)(a2 - 7));
        return;
      case 5LL:
        uint64_t v61 = (_OWORD *)(v9 + 28);
        unint64_t v62 = (_OWORD *)(v9 + 56);
        uint64_t v63 = (_OWORD *)(v9 + 84);
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( v9,  v9 + 28,  v9 + 56,  v9 + 84);
        unsigned int v64 = *(a2 - 7);
        unsigned int v65 = *(_DWORD *)(v9 + 84);
        BOOL v77 = v64 == v65;
        BOOL v66 = v64 < v65;
        if (v77) {
          BOOL v66 = *(a2 - 2) < *(_DWORD *)(v9 + 104);
        }
        if (v66)
        {
          *(_OWORD *)int v152 = *v63;
          *(_OWORD *)&v152[12] = *(_OWORD *)(v9 + 96);
          __int128 v67 = *(_OWORD *)v8;
          *(_OWORD *)(v9 + 96) = *((_OWORD *)a2 - 1);
          *uint64_t v63 = v67;
          *((_OWORD *)a2 - 1) = *(_OWORD *)&v152[12];
          *(_OWORD *)unint64_t v8 = *(_OWORD *)v152;
          unsigned int v68 = *(_DWORD *)(v9 + 84);
          unsigned int v69 = *(_DWORD *)(v9 + 56);
          BOOL v77 = v68 == v69;
          BOOL v70 = v68 < v69;
          if (v77) {
            BOOL v70 = *(_DWORD *)(v9 + 104) < *(_DWORD *)(v9 + 76);
          }
          if (v70)
          {
            *(_OWORD *)unsigned int v153 = *v62;
            *(_OWORD *)&v153[12] = *(_OWORD *)(v9 + 68);
            _OWORD *v62 = *v63;
            *(_OWORD *)(v9 + 68) = *(_OWORD *)(v9 + 96);
            *uint64_t v63 = *(_OWORD *)v153;
            *(_OWORD *)(v9 + 96) = *(_OWORD *)&v153[12];
            unsigned int v71 = *(_DWORD *)(v9 + 56);
            unsigned int v72 = *(_DWORD *)(v9 + 28);
            BOOL v77 = v71 == v72;
            BOOL v73 = v71 < v72;
            if (v77) {
              BOOL v73 = *(_DWORD *)(v9 + 76) < *(_DWORD *)(v9 + 48);
            }
            if (v73)
            {
              *(_OWORD *)unint64_t v154 = *v61;
              *(_OWORD *)&v154[12] = *(_OWORD *)(v9 + 40);
              *uint64_t v61 = *v62;
              *(_OWORD *)(v9 + 40) = *(_OWORD *)(v9 + 68);
              _OWORD *v62 = *(_OWORD *)v154;
              *(_OWORD *)(v9 + 68) = *(_OWORD *)&v154[12];
              unsigned int v74 = *(_DWORD *)(v9 + 28);
              BOOL v77 = v74 == *(_DWORD *)v9;
              BOOL v75 = v74 < *(_DWORD *)v9;
              if (v77) {
                BOOL v75 = *(_DWORD *)(v9 + 48) < *(_DWORD *)(v9 + 20);
              }
              if (v75)
              {
                *(_OWORD *)&v155[12] = *(_OWORD *)(v9 + 12);
                *(_OWORD *)unint64_t v155 = *(_OWORD *)v9;
                *(_OWORD *)unint64_t v9 = *v61;
                *(_OWORD *)(v9 + 12) = *(_OWORD *)(v9 + 40);
                *uint64_t v61 = *(_OWORD *)v155;
                *(_OWORD *)(v9 + 40) = *(_OWORD *)&v155[12];
              }
            }
          }
        }

        return;
      default:
        if (v10 <= 671)
        {
          uint64_t v76 = (unsigned int *)(v9 + 28);
          BOOL v77 = (unsigned int *)v9 == a2 || v76 == a2;
          char v78 = v77;
          if ((a4 & 1) != 0)
          {
            if ((v78 & 1) == 0)
            {
              uint64_t v79 = 0LL;
              unint64_t v80 = v9;
              do
              {
                unsigned int v81 = v76;
                unsigned int v82 = *(_DWORD *)(v80 + 28);
                unsigned int v83 = *(_DWORD *)(v80 + 48);
                BOOL v84 = v82 < *(_DWORD *)v80;
                if (v82 == *(_DWORD *)v80) {
                  BOOL v84 = v83 < *(_DWORD *)(v80 + 20);
                }
                if (v84)
                {
                  __int128 v156 = *(_OWORD *)(v80 + 32);
                  int v85 = *(_DWORD *)(v80 + 52);
                  uint64_t v86 = v79;
                  while (1)
                  {
                    uint64_t v87 = v9 + v86;
                    *(_OWORD *)(v87 + 28) = *(_OWORD *)(v9 + v86);
                    *(_OWORD *)(v87 + 40) = *(_OWORD *)(v9 + v86 + 12);
                    if (!v86) {
                      break;
                    }
                    unsigned int v88 = *(_DWORD *)(v87 - 28);
                    BOOL v89 = v83 < *(_DWORD *)(v87 - 8);
                    BOOL v77 = v82 == v88;
                    BOOL v90 = v82 < v88;
                    if (!v77) {
                      BOOL v89 = v90;
                    }
                    v86 -= 28LL;
                    if (!v89)
                    {
                      uint64_t v91 = v9 + v86 + 28;
                      goto LABEL_115;
                    }
                  }

                  uint64_t v91 = v9;
LABEL_115:
                  *(_DWORD *)uint64_t v91 = v82;
                  *(_OWORD *)(v91 + 4) = v156;
                  *(_DWORD *)(v91 + 20) = v83;
                  *(_DWORD *)(v91 + 24) = v85;
                }

                uint64_t v76 = v81 + 7;
                v79 += 28LL;
                unint64_t v80 = (unint64_t)v81;
              }

              while (v81 + 7 != a2);
            }
          }

          else if ((v78 & 1) == 0)
          {
            do
            {
              uint64_t v135 = (uint64_t)v76;
              unsigned int v136 = *(_DWORD *)(a1 + 28);
              unsigned int v137 = *(_DWORD *)(a1 + 48);
              BOOL v138 = v136 < *(_DWORD *)a1;
              if (v136 == *(_DWORD *)a1) {
                BOOL v138 = v137 < *(_DWORD *)(a1 + 20);
              }
              if (v138)
              {
                __int128 v159 = *(_OWORD *)(a1 + 32);
                int v139 = *(_DWORD *)(a1 + 52);
                uint64_t v140 = v135;
                do
                {
                  *(_OWORD *)uint64_t v140 = *(_OWORD *)(v140 - 28);
                  *(_OWORD *)(v140 + 12) = *(_OWORD *)(v140 - 16);
                  unsigned int v141 = *(_DWORD *)(v140 - 56);
                  unsigned int v142 = *(_DWORD *)(v140 - 36);
                  v140 -= 28LL;
                  BOOL v143 = v137 < v142;
                  BOOL v77 = v136 == v141;
                  BOOL v144 = v136 < v141;
                  if (v77) {
                    BOOL v144 = v143;
                  }
                }

                while (v144);
                *(_DWORD *)uint64_t v140 = v136;
                *(_OWORD *)(v140 + 4) = v159;
                *(_DWORD *)(v140 + 20) = v137;
                *(_DWORD *)(v140 + 24) = v139;
              }

              uint64_t v76 = (unsigned int *)(v135 + 28);
              a1 = v135;
            }

            while ((unsigned int *)(v135 + 28) != a2);
          }

          return;
        }

        if (!a3)
        {
          if ((unsigned int *)v9 != a2)
          {
            int64_t v92 = (unint64_t)(v11 - 2) >> 1;
            int64_t v93 = v92;
            do
            {
              int64_t v94 = v93;
              if (v92 >= v93)
              {
                uint64_t v95 = (2 * v93) | 1;
                unint64_t v96 = v9 + 28 * v95;
                if (2 * v94 + 2 >= v11)
                {
                  unsigned int v97 = *(_DWORD *)v96;
                }

                else
                {
                  unsigned int v97 = *(_DWORD *)(v96 + 28);
                  BOOL v98 = *(_DWORD *)(v9 + 28 * v95 + 20) < *(_DWORD *)(v96 + 48);
                  if (*(_DWORD *)v96 != v97) {
                    BOOL v98 = *(_DWORD *)v96 < v97;
                  }
                  if (v98)
                  {
                    v96 += 28LL;
                    uint64_t v95 = 2 * v94 + 2;
                  }

                  else
                  {
                    unsigned int v97 = *(_DWORD *)v96;
                  }
                }

                unint64_t v99 = v9 + 28 * v94;
                unsigned int v100 = *(_DWORD *)v99;
                unsigned int v101 = *(_DWORD *)(v99 + 20);
                BOOL v77 = v97 == *(_DWORD *)v99;
                BOOL v102 = v97 < *(_DWORD *)v99;
                if (v77) {
                  BOOL v102 = *(_DWORD *)(v96 + 20) < v101;
                }
                if (!v102)
                {
                  __int128 v157 = *(_OWORD *)(v99 + 4);
                  int v103 = *(_DWORD *)(v99 + 24);
                  do
                  {
                    uint8x8_t v104 = (_OWORD *)v99;
                    unint64_t v99 = v96;
                    __int128 v105 = *(_OWORD *)v96;
                    *(_OWORD *)((char *)v104 + 12) = *(_OWORD *)(v96 + 12);
                    _OWORD *v104 = v105;
                    if (v92 < v95) {
                      break;
                    }
                    uint64_t v106 = (2 * v95) | 1;
                    unint64_t v96 = v9 + 28 * v106;
                    uint64_t v95 = 2 * v95 + 2;
                    if (v95 >= v11)
                    {
                      unsigned int v107 = *(_DWORD *)v96;
                      uint64_t v95 = v106;
                    }

                    else
                    {
                      unsigned int v107 = *(_DWORD *)v96;
                      unsigned int v108 = *(_DWORD *)(v96 + 28);
                      BOOL v109 = *(_DWORD *)(v9 + 28 * v106 + 20) < *(_DWORD *)(v96 + 48);
                      if (*(_DWORD *)v96 != v108) {
                        BOOL v109 = *(_DWORD *)v96 < v108;
                      }
                      if (v109)
                      {
                        unsigned int v107 = *(_DWORD *)(v96 + 28);
                        v96 += 28LL;
                      }

                      else
                      {
                        uint64_t v95 = v106;
                      }
                    }

                    BOOL v110 = *(_DWORD *)(v96 + 20) < v101;
                    BOOL v77 = v107 == v100;
                    BOOL v111 = v107 < v100;
                    if (!v77) {
                      BOOL v110 = v111;
                    }
                  }

                  while (!v110);
                  *(_DWORD *)unint64_t v99 = v100;
                  *(_OWORD *)(v99 + 4) = v157;
                  *(_DWORD *)(v99 + 20) = v101;
                  *(_DWORD *)(v99 + 24) = v103;
                }
              }

              int64_t v93 = v94 - 1;
            }

            while (v94);
            int64_t v112 = v10 / 0x1CuLL;
            do
            {
              uint64_t v113 = 0LL;
              *(_OWORD *)&v158[12] = *(_OWORD *)(v9 + 12);
              *(_OWORD *)unint64_t v158 = *(_OWORD *)v9;
              unint64_t v114 = (_OWORD *)v9;
              do
              {
                uint64_t v115 = v113 + 1;
                uint64_t v116 = (unsigned int *)v114 + 7 * v113 + 7;
                uint64_t v117 = (2 * v113) | 1;
                uint64_t v118 = 2 * v113 + 2;
                if (v118 < v112)
                {
                  unsigned int v119 = v116[7];
                  BOOL v120 = *((_DWORD *)v114 + 7 * v115 + 5) < v116[12];
                  BOOL v77 = *v116 == v119;
                  BOOL v121 = *v116 < v119;
                  if (!v77) {
                    BOOL v120 = v121;
                  }
                  if (v120)
                  {
                    v116 += 7;
                    uint64_t v117 = v118;
                  }
                }

                __int128 v122 = *(_OWORD *)v116;
                *(_OWORD *)((char *)v114 + 12) = *(_OWORD *)(v116 + 3);
                *unint64_t v114 = v122;
                unint64_t v114 = v116;
                uint64_t v113 = v117;
              }

              while (v117 <= (uint64_t)((unint64_t)(v112 - 2) >> 1));
              a2 -= 7;
              if (v116 == a2)
              {
                *(_OWORD *)(v116 + 3) = *(_OWORD *)&v158[12];
                *(_OWORD *)uint64_t v116 = *(_OWORD *)v158;
              }

              else
              {
                __int128 v123 = *(_OWORD *)a2;
                *(_OWORD *)(v116 + 3) = *(_OWORD *)(a2 + 3);
                *(_OWORD *)uint64_t v116 = v123;
                *(_OWORD *)(a2 + 3) = *(_OWORD *)&v158[12];
                *(_OWORD *)a2 = *(_OWORD *)v158;
                uint64_t v124 = (uint64_t)v116 - v9 + 28;
                if (v124 >= 29)
                {
                  unint64_t v125 = (v124 / 0x1CuLL - 2) >> 1;
                  unint64_t v126 = v9 + 28 * v125;
                  unsigned int v127 = *v116;
                  unsigned int v128 = v116[5];
                  BOOL v129 = *(_DWORD *)v126 < *v116;
                  if (*(_DWORD *)v126 == *v116) {
                    BOOL v129 = *(_DWORD *)(v126 + 20) < v128;
                  }
                  if (v129)
                  {
                    __int128 v147 = *(_OWORD *)(v116 + 1);
                    unsigned int v130 = v116[6];
                    do
                    {
                      uint64_t v131 = v116;
                      uint64_t v116 = (unsigned int *)v126;
                      __int128 v132 = *(_OWORD *)v126;
                      *(_OWORD *)(v131 + 3) = *(_OWORD *)(v126 + 12);
                      *(_OWORD *)uint64_t v131 = v132;
                      if (!v125) {
                        break;
                      }
                      unint64_t v125 = (v125 - 1) >> 1;
                      unint64_t v126 = v9 + 28 * v125;
                      BOOL v133 = *(_DWORD *)v126 < v127;
                      if (*(_DWORD *)v126 == v127) {
                        BOOL v133 = *(_DWORD *)(v126 + 20) < v128;
                      }
                    }

                    while (v133);
                    unsigned int *v116 = v127;
                    *(_OWORD *)(v116 + 1) = v147;
                    v116[5] = v128;
                    v116[6] = v130;
                  }
                }
              }
            }

            while (v112-- > 2);
          }

          return;
        }

        unint64_t v12 = (unint64_t)v11 >> 1;
        unint64_t v13 = v9 + 28 * ((unint64_t)v11 >> 1);
        if ((unint64_t)v10 < 0xE01)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( a1 + 28 * v12,  (int *)a1,  (uint64_t)(a2 - 7));
        }

        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( a1,  (int *)(a1 + 28 * v12),  (uint64_t)(a2 - 7));
          uint64_t v14 = 28 * v12;
          uint64_t v15 = (int *)(28 * v12 + a1 - 28);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( a1 + 28,  v15,  (uint64_t)(a2 - 14));
          unint64_t v16 = (int *)(a1 + 28 + v14);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( a1 + 56,  v16,  (uint64_t)(a2 - 21));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( (uint64_t)v15,  (int *)v13,  (uint64_t)v16);
          *(_OWORD *)&v148[12] = *(_OWORD *)(a1 + 12);
          *(_OWORD *)__int128 v148 = *(_OWORD *)a1;
          __int128 v17 = *(_OWORD *)v13;
          *(_OWORD *)(a1 + 12) = *(_OWORD *)(v13 + 12);
          *(_OWORD *)a1 = v17;
          *(_OWORD *)(v13 + 12) = *(_OWORD *)&v148[12];
          *(_OWORD *)unint64_t v13 = *(_OWORD *)v148;
        }

        --a3;
        unsigned int v18 = *(_DWORD *)a1;
        if ((a4 & 1) == 0)
        {
          unsigned int v20 = *(_DWORD *)(a1 - 28);
          unsigned int v19 = *(_DWORD *)(a1 + 20);
          BOOL v77 = v20 == v18;
          BOOL v21 = v20 < v18;
          if (v77) {
            BOOL v21 = *(_DWORD *)(a1 - 8) < v19;
          }
          if (v21) {
            goto LABEL_13;
          }
          __int128 v146 = *(_OWORD *)(a1 + 4);
          unsigned int v40 = *(a2 - 7);
          BOOL v77 = v18 == v40;
          BOOL v41 = v18 < v40;
          if (v77) {
            BOOL v41 = v19 < *(a2 - 2);
          }
          if (v41)
          {
            unint64_t v9 = a1;
            do
            {
              unsigned int v42 = *(_DWORD *)(v9 + 28);
              v9 += 28LL;
              BOOL v43 = v18 < v42;
              if (v18 == v42) {
                BOOL v43 = v19 < *(_DWORD *)(v9 + 20);
              }
            }

            while (!v43);
          }

          else
          {
            __int128 v44 = (unsigned int *)(a1 + 28);
            do
            {
              unint64_t v9 = (unint64_t)v44;
              if (v44 >= a2) {
                break;
              }
              unsigned int v45 = *v44;
              BOOL v46 = v19 < *(_DWORD *)(v9 + 20);
              BOOL v77 = v18 == v45;
              BOOL v47 = v18 < v45;
              if (!v77) {
                BOOL v46 = v47;
              }
              __int128 v44 = (unsigned int *)(v9 + 28);
            }

            while (!v46);
          }

          uint64_t v48 = a2;
          if (v9 < (unint64_t)a2)
          {
            uint64_t v48 = a2;
            do
            {
              unsigned int v49 = *(v48 - 7);
              v48 -= 7;
              BOOL v50 = v18 < v49;
              if (v18 == v49) {
                BOOL v50 = v19 < v48[5];
              }
            }

            while (v50);
          }

          int v51 = *(_DWORD *)(a1 + 24);
          while (v9 < (unint64_t)v48)
          {
            *(_OWORD *)&v150[12] = *(_OWORD *)(v9 + 12);
            *(_OWORD *)unsigned int v150 = *(_OWORD *)v9;
            __int128 v52 = *(_OWORD *)v48;
            *(_OWORD *)(v9 + 12) = *(_OWORD *)(v48 + 3);
            *(_OWORD *)unint64_t v9 = v52;
            *(_OWORD *)(v48 + 3) = *(_OWORD *)&v150[12];
            *(_OWORD *)uint64_t v48 = *(_OWORD *)v150;
            do
            {
              unsigned int v53 = *(_DWORD *)(v9 + 28);
              v9 += 28LL;
              BOOL v54 = v18 < v53;
              if (v18 == v53) {
                BOOL v54 = v19 < *(_DWORD *)(v9 + 20);
              }
            }

            while (!v54);
            do
            {
              unsigned int v55 = *(v48 - 7);
              v48 -= 7;
              BOOL v56 = v18 < v55;
              if (v18 == v55) {
                BOOL v56 = v19 < v48[5];
              }
            }

            while (v56);
          }

          if (v9 - 28 != a1)
          {
            __int128 v57 = *(_OWORD *)(v9 - 28);
            *(_OWORD *)(a1 + 12) = *(_OWORD *)(v9 - 16);
            *(_OWORD *)a1 = v57;
          }

          a4 = 0;
          *(_DWORD *)(v9 - 28) = v18;
          *(_OWORD *)(v9 - 24) = v146;
          *(_DWORD *)(v9 - 8) = v19;
          *(_DWORD *)(v9 - 4) = v51;
          continue;
        }

        unsigned int v19 = *(_DWORD *)(a1 + 20);
LABEL_13:
        __int128 v145 = *(_OWORD *)(a1 + 4);
        int v22 = *(_DWORD *)(a1 + 24);
        unint64_t v23 = a1;
        do
        {
          unint64_t v24 = v23;
          unsigned int v25 = *(_DWORD *)(v23 + 28);
          v23 += 28LL;
          BOOL v26 = v25 < v18;
          if (v25 == v18) {
            BOOL v26 = *(_DWORD *)(v24 + 48) < v19;
          }
        }

        while (v26);
        uint64_t v27 = a2;
        if (v24 == a1)
        {
          uint64_t v27 = a2;
          do
          {
            unsigned int v30 = *(v27 - 7);
            v27 -= 7;
            BOOL v31 = v30 < v18;
            if (v30 == v18) {
              BOOL v31 = v27[5] < v19;
            }
          }

          while (!v31);
        }

        else
        {
          do
          {
            unsigned int v28 = *(v27 - 7);
            v27 -= 7;
            BOOL v29 = v28 < v18;
            if (v28 == v18) {
              BOOL v29 = v27[5] < v19;
            }
          }

          while (!v29);
        }

        unint64_t v9 = v23;
        if (v23 < (unint64_t)v27)
        {
          unint64_t v32 = (unint64_t)v27;
          do
          {
            *(_OWORD *)int v149 = *(_OWORD *)v9;
            *(_OWORD *)&v149[12] = *(_OWORD *)(v9 + 12);
            __int128 v33 = *(_OWORD *)v32;
            *(_OWORD *)(v9 + 12) = *(_OWORD *)(v32 + 12);
            *(_OWORD *)unint64_t v9 = v33;
            *(_OWORD *)(v32 + 12) = *(_OWORD *)&v149[12];
            *(_OWORD *)unint64_t v32 = *(_OWORD *)v149;
            do
            {
              unsigned int v34 = *(_DWORD *)(v9 + 28);
              v9 += 28LL;
              BOOL v35 = v34 < v18;
              if (v34 == v18) {
                BOOL v35 = *(_DWORD *)(v9 + 20) < v19;
              }
            }

            while (v35);
            do
            {
              unsigned int v36 = *(_DWORD *)(v32 - 28);
              v32 -= 28LL;
              BOOL v37 = v36 < v18;
              if (v36 == v18) {
                BOOL v37 = *(_DWORD *)(v32 + 20) < v19;
              }
            }

            while (!v37);
          }

          while (v9 < v32);
        }

        if (v9 - 28 != a1)
        {
          __int128 v38 = *(_OWORD *)(v9 - 28);
          *(_OWORD *)(a1 + 12) = *(_OWORD *)(v9 - 16);
          *(_OWORD *)a1 = v38;
        }

        *(_DWORD *)(v9 - 28) = v18;
        *(_OWORD *)(v9 - 24) = v145;
        *(_DWORD *)(v9 - 8) = v19;
        *(_DWORD *)(v9 - 4) = v22;
        if (v23 < (unint64_t)v27)
        {
LABEL_42:
          std::__introsort<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *,false>( a1,  v9 - 28,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v39 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( a1,  v9 - 28);
        if (!std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,-[DYPMTLShaderProfilerHelper generateTargetSamplesForResult:withProgramAddressLUT:withBatchIndexMin:withProgramAddressList:withUSCSampleBuffer:withUSCSampleNum:withBatchIDToEncoderIndex:andEncoderIndexToBatchIdMap:targetIndex:]::$_6 &,ClauseData *>( v9,  (uint64_t)a2))
        {
          if (v39) {
            continue;
          }
          goto LABEL_42;
        }

        a2 = (unsigned int *)(v9 - 28);
        if (!v39) {
          goto LABEL_1;
        }
        return;
    }
  }

- (uint64_t)adjustHWBiasAndFinalizeResult
{
  if (0xAAAAAAAAAAAAAAABLL * ((result[2] - *result) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556LL) {
      abort();
    }
    uint64_t v2 = result;
    std::__split_buffer<-[DYPMTLShaderProfilerHelper adjustHWBiasAndFinalizeResult]::ClauseInfo>::__split_buffer( v3,  a2,  0xAAAAAAAAAAAAAAABLL * ((result[1] - *result) >> 4),  (uint64_t)(result + 2));
    std::vector<DynamicBuffer>::__swap_out_circular_buffer(v2, v3);
    return (uint64_t *)std::__split_buffer<DynamicBuffer>::~__split_buffer((uint64_t)v3);
  }

  return result;
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) + 24LL * *(unsigned int *)(a1 + 48);
  unint64_t v3 = *(void **)v2;
  BOOL v26 = *(void **)(v2 + 8);
  if (*(void **)v2 != v26)
  {
    do
    {
      unint64_t v4 = (unsigned int *)v3[3];
      uint64_t v27 = v3;
      unsigned int v28 = (unsigned int *)v3[4];
      if (v4 != v28)
      {
        uint64_t v5 = *v3;
        uint64_t v32 = v3[1] + 24LL;
        unsigned int v34 = (void *)(*v3 + 40LL);
        BOOL v29 = (uint64_t *)v3[2];
        unsigned int v30 = (void *)(*v3 + 88LL);
        do
        {
          unsigned int v35 = *v4;
          unsigned int v36 = *v4;
          if (v4[2])
          {
            unsigned int v6 = 0;
            __int128 v33 = v4;
            do
            {
              unsigned int v7 = v4[1];
              unint64_t v8 = *(void *)(*((void *)std::__hash_table<std::__hash_value_type<unsigned int,DrawDurationInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,DrawDurationInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,DrawDurationInfo>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( v32,  v35,  &v36)
                               + 4)
                             + 8LL * (v7 + v6));
              unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[21] objectAtIndexedSubscript:v8 & 0x1F]);
              uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v8 >> 5]);

              uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:HIDWORD(v8)]);
              unint64_t v13 = *(double **)(v11 + 48);
              unint64_t v12 = *(unsigned int **)(v11 + 56);
              if (v13 != (double *)v12)
              {
                uint64_t v14 = *v29;
                unint64_t v15 = (v29[1] - *v29) >> 2;
                do
                {
                  unint64_t v16 = *(unsigned int *)v13;
                  if (v15 > v16)
                  {
                    unsigned int v17 = *(_DWORD *)(v14 + 4 * v16);
                    unsigned int v18 = *(_DWORD *)(v5 + 80);
                    unint64_t v19 = v17 - v18;
                    if (v17 >= v18 && v17 <= *(_DWORD *)(v5 + 84))
                    {
                      unsigned int v20 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v34,  v35);
                      if (v20)
                      {
                        uint64_t v21 = v20[3];
                        if (v19 < (v20[4] - v21) >> 2)
                        {
                          int v22 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v30,  v35);
                          if (v22)
                          {
                            LODWORD(v23) = *((_DWORD *)v22 + 5);
                            LODWORD(v24) = *(_DWORD *)(v21 + 4 * v19);
                            double v25 = (double)v23 / (double)v24;
                            if (v25 > 1.0) {
                              double v25 = 1.0 - *(double *)(v11 + 32) + v25 * *(double *)(v11 + 32);
                            }
                            if (v25 > 50.0) {
                              double v25 = 50.0;
                            }
                            v13[1] = v13[1] * v25;
                          }
                        }
                      }
                    }
                  }

                  v13 += 2;
                }

                while (v13 != (double *)v12);
              }

              ++v6;
              unint64_t v4 = v33;
            }

            while (v6 < v33[2]);
          }

          v4 += 3;
        }

        while (v4 != v28);
      }

      unint64_t v3 = v27 + 6;
    }

    while (v27 + 6 != v26);
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  for (uint64_t i = (void *)WeakRetained[4]; i; uint64_t i = (void *)*i)
  {
    uint64_t v2 = i[3];
    unint64_t v3 = *(unint64_t ***)(v2 + 16);
    unint64_t v4 = *(unint64_t ***)(v2 + 24);
    if (v3 != v4)
    {
      unint64_t v5 = 0LL;
      do
      {
        unsigned int v6 = *v3;
        unsigned int v7 = v3[1];
        while (v6 != v7)
        {
          do
            unint64_t v8 = __ldaxr(v6);
          while (__stlxr(v5, v6));
          unint64_t v9 = atomic_load(v6);
          unint64_t v5 = v9 + v8;
          ++v6;
        }

        v3 += 3;
      }

      while (v3 != v4);
      uint64_t v2 = i[3];
    }

    unsigned int v10 = atomic_load((unsigned int *)(v2 + 40));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 16LL * v10));
    [*(id *)(i[3] + 8) setUscSamples:v11];
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_DWORD *)(v1 + 40))
  {
    unint64_t v2 = 0LL;
    uint64_t v53 = v1;
    do
    {
      BOOL v56 = *(void **)(*(void *)(*((void *)WeakRetained + 25) + 24 * v2) + 8LL * *(unsigned int *)(v1 + 44));
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)WeakRetained + 21), "objectAtIndexedSubscript:", v2, WeakRetained));
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:*(unsigned int *)(v1 + 44)]);

      id v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (!v4) {
        goto LABEL_58;
      }
      unint64_t v54 = v2;
      uint64_t v55 = *(void *)v62;
      do
      {
        id v57 = v4;
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v61 + 1) + 8 * v5);
          unsigned int v7 = *(_DWORD *)(v6 + 16);
          unint64_t v8 = (void *)(*v56 + 24LL * v7);
          unint64_t v9 = (char *)*v8;
          uint64_t v11 = (char **)(v8 + 1);
          unsigned int v10 = (char *)v8[1];
          uint64_t v58 = v5;
          if ((char *)*v8 != v10)
          {
            while (*(_DWORD *)v9 != *(_DWORD *)(v6 + 20))
            {
              v9 += 16;
              if (v9 == v10)
              {
                unint64_t v9 = (char *)v8[1];
                break;
              }
            }
          }

          uint64_t v13 = *(void *)(v6 + 48);
          uint64_t v12 = *(void *)(v6 + 56);
          if (v13 != v12)
          {
            uint64_t i = (char **)(*v56 + 24LL * v7 + 16);
            BOOL v59 = i;
            uint64_t v60 = *(void *)(v6 + 56);
            do
            {
              if (v9 == *v11)
              {
                unint64_t v16 = (char *)*v8;
                uint64_t v17 = (uint64_t)&v9[-*v8];
                uint64_t v18 = v17 >> 4;
                unint64_t v15 = (char *)(*v8 + (v17 & 0xFFFFFFFFFFFFFFF0LL));
                unint64_t v19 = *i;
                if (v9 >= *i)
                {
                  double v25 = v8;
                  uint64_t v26 = v6;
                  uint64_t v27 = v18 + 1;
                  unint64_t v28 = v19 - v16;
                  unint64_t v29 = (v19 - v16) >> 3;
                  if (v29 <= v27) {
                    unint64_t v29 = v18 + 1;
                  }
                  if (v28 >= 0x7FFFFFFFFFFFFFF0LL) {
                    unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v30 = v29;
                  }
                  if (v30)
                  {
                    uint64_t v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned long long,unsigned long long>>>(v30);
                  }

                  else
                  {
                    uint64_t v32 = 0LL;
                    uint64_t v31 = 0LL;
                  }

                  unsigned int v36 = &v32[16 * v18];
                  BOOL v37 = &v32[16 * v31];
                  if (v18 == v31)
                  {
                    if ((uint64_t)(v17 & 0xFFFFFFFFFFFFFFF0LL) < 1)
                    {
                      else {
                        unint64_t v39 = (v17 >> 3) & 0xFFFFFFFFFFFFFFFELL;
                      }
                      unsigned int v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned long long,unsigned long long>>>(v39);
                      unsigned int v36 = &v40[16 * (v39 >> 2)];
                      BOOL v37 = &v40[16 * v41];
                      if (v32)
                      {
                        unsigned int v42 = &v40[16 * v41];
                        operator delete(v32);
                        BOOL v37 = v42;
                      }
                    }

                    else
                    {
                      if (v27 >= 0) {
                        unint64_t v38 = v18 + 1;
                      }
                      else {
                        unint64_t v38 = v18 + 2;
                      }
                      v36 -= 16 * (v38 >> 1);
                    }
                  }

                  uint64_t v6 = v26;
                  *(_DWORD *)unsigned int v36 = *(_DWORD *)(v26 + 20);
                  *((void *)v36 + 1) = *(void *)(v13 + 8);
                  unint64_t v8 = v25;
                  BOOL v43 = (char *)*v25;
                  __int128 v44 = v36;
                  if ((char *)*v25 != v15)
                  {
                    unsigned int v45 = v15;
                    BOOL v46 = v36;
                    do
                    {
                      __int128 v44 = v46 - 16;
                      *((_OWORD *)v46 - 1) = *((_OWORD *)v45 - 1);
                      v45 -= 16;
                      v46 -= 16;
                    }

                    while (v45 != v43);
                  }

                  BOOL v47 = v36 + 16;
                  uint64_t v48 = *v11;
                  for (uint64_t i = v59; v15 != v48; v47 += 16)
                  {
                    __int128 v49 = *(_OWORD *)v15;
                    v15 += 16;
                    *(_OWORD *)BOOL v47 = v49;
                  }

                  BOOL v50 = (char *)*v8;
                  void *v8 = v44;
                  void *v11 = v47;
                  *BOOL v59 = v37;
                  if (v50) {
                    operator delete(v50);
                  }
                  unint64_t v15 = v36;
                  uint64_t v12 = v60;
                  goto LABEL_55;
                }

                int v20 = *(_DWORD *)(v6 + 20);
                if (v15 != v9)
                {
                  uint64_t v21 = *(void *)(v13 + 8);
                  int v22 = v9 - 16;
                  unint64_t v23 = v9;
                  while (v22 < v9)
                  {
                    __int128 v24 = *(_OWORD *)v22;
                    v22 += 16;
                    *(_OWORD *)unint64_t v23 = v24;
                    v23 += 16;
                  }

                  void *v11 = v23;
                  if (v9 != v15 + 16)
                  {
                    uint64_t v33 = (v9 - (v15 + 16)) >> 4;
                    unsigned int v34 = v9 - 8;
                    uint64_t v35 = 16 * v33;
                    do
                    {
                      *((_DWORD *)v34 - 2) = *(_DWORD *)&v15[v35 - 16];
                      *(void *)unsigned int v34 = *(void *)&v15[v35 - 8];
                      v34 -= 16;
                      v35 -= 16LL;
                    }

                    while (v35);
                  }

                  *(_DWORD *)unint64_t v15 = v20;
                  *(void *)&v16[16 * v18 + 8] = v21;
                  goto LABEL_55;
                }

                *(_DWORD *)unint64_t v9 = v20;
                *(void *)&v16[16 * v18 + 8] = *(void *)(v13 + 8);
                void *v11 = v9 + 16;
              }

              else
              {
                *((double *)v9 + 1) = *(double *)(v13 + 8) + *((double *)v9 + 1);
              }

              unint64_t v15 = v9;
LABEL_55:
              v13 += 16LL;
              unint64_t v9 = v15;
            }

            while (v13 != v12);
          }

          uint64_t v5 = v58 + 1;
          uint64_t v1 = v53;
          unint64_t v2 = v54;
        }

        while ((id)(v58 + 1) != v57);
        id v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }

      while (v4);
LABEL_58:

      ++v2;
    }

    while (v2 < *(unsigned int *)(v1 + 40));
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateAverageGPUCommandDuration];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateAggregatedEffectiveGPUEncoderCost];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _calculateEffectiveGPUEncoderCostForFrameIndex:*(unsigned int *)(a1 + 40)];
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_7(uint64_t a1)
{
  unsigned int v17 = std::thread::hardware_concurrency();
  unint64_t v2 = v17 >> 1;
  uint64_t v18 = a1;
  unint64_t v3 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = 0LL;
  unint64_t v16 = v2 - 1;
  if (v2 <= 1) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v17 >> 1;
  }
  uint64_t v15 = v5;
  while (v4 < objc_msgSend(WeakRetained[21], "count", v15))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[21] objectAtIndexedSubscript:v4]);
    unint64_t v7 = (unint64_t)[v6 count];

    if (v17 >= 2)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = v15;
      unint64_t v10 = (v16 + v7) / (v17 >> 1);
      do
      {
        uint64_t v11 = v8 + 1;
        unint64_t v12 = v8 * v10;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        if (v7 >= (v8 + 1) * v10) {
          uint64_t v13 = (v8 + 1) * v10;
        }
        else {
          uint64_t v13 = v7;
        }
        v20[2] = __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8;
        v20[3] = &unk_58EB80;
        objc_copyWeak(v21, v3);
        v21[1] = (id)v12;
        v21[2] = (id)v13;
        v21[3] = v4;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v20));
        [WeakRetained[92] addOperation:v14];
        [*(id *)(v18 + 32) addDependency:v14];

        objc_destroyWeak(v21);
        uint64_t v8 = v11;
        --v9;
      }

      while (v9);
    }

    ++v4;
  }
}

void __59__DYPMTLShaderProfilerHelper_adjustHWBiasAndFinalizeResult__block_invoke_8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  for (unint64_t i = *(void *)(a1 + 40); i < *(void *)(a1 + 48); ++i)
  {
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[21] objectAtIndexedSubscript:*(void *)(a1 + 56)]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:i]);

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    obuint64_t j = v4;
    id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        unint64_t v7 = 0LL;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v7);
          uint64_t v9 = v8[1];
          if (v9)
          {
            unint64_t v10 = (unint64_t *)(*(void *)(*(void *)(v9 + 16) + 24LL * *(void *)(a1 + 56)) + 8 * i);
            uint64_t v11 = (uint64_t)(v8[7] - v8[6]) >> 4;
            do
              unint64_t v12 = __ldaxr(v10);
            while (__stlxr(v12 + v11, v10));
            uint64_t v13 = v8[6];
            uint64_t v14 = v8[7];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v8[1] + 8) uscSamples]);
            objc_msgSend(v15, "replaceBytesInRange:withBytes:", 16 * v12, v14 - v13, v8[6]);
          }

          unint64_t v7 = (char *)v7 + 1;
        }

        while (v7 != v5);
        id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v5);
    }
  }
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([*(id *)(a1 + 32) dumpInstructions])
  {
    unint64_t v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"/tmp/com.apple.gputools.profiling/shaderProfilerResults/Frames/%u/%u/evaluateStreamingSamples_%lu.txt",  *((unsigned int *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( (uint64_t)WeakRetained + 496,  *(_DWORD *)(a1 + 120),  (_DWORD *)(a1 + 120))
           + 5),
           *(unsigned int *)(a1 + 124),
           *(void *)(a1 + 72));
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingLastPathComponent]);
    [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

    id v6 = v3;
    unint64_t v99 = fopen((const char *)[v6 UTF8String], "wt");
  }

  else
  {
    unint64_t v99 = 0LL;
  }

  int v7 = *(_DWORD *)(a1 + 128);
  memset(v106, 0, sizeof(v106));
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  memset(v118, 0, sizeof(v118));
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  memset(v122, 0, sizeof(v122));
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  float v126 = 1.0;
  unint64_t v130 = 0LL;
  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v127 = 0u;
  float v131 = 1.0;
  BOOL v133 = v7 < 2;
  int v123 = 1050253722;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v122,  0x36uLL);
  if (*((void *)&v124 + 1)) {
    float v8 = (float)*((unint64_t *)&v125 + 1) / (float)*((unint64_t *)&v124 + 1);
  }
  else {
    float v8 = 0.0;
  }
  float v126 = fmaxf(v8, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v124,  vcvtps_u32_f32(16.0 / v126));
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)v118, 0x10uLL);
  if ((void)v129) {
    float v9 = (float)v130 / (float)(unint64_t)v129;
  }
  else {
    float v9 = 0.0;
  }
  float v131 = fmaxf(v9, 0.3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&v128 + 8,  vcvtps_u32_f32(18.0 / v131));
  std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v127);
  std::vector<ShaderProfilerUSCSampleInfo>::reserve((void **)&v118[1] + 1, 0x10uLL);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  unint64_t v12 = (unsigned int *)(v11 + 8 * v10);
  unsigned int v13 = *v12;
  if (*v12 < v12[1])
  {
    while (1)
    {
      uint64_t v14 = *(void *)(a1 + 104);
      uint64_t v103 = v14;
      unint64_t v15 = *(void *)(v14 + 8LL * v13);
      if ((_DWORD)v15 == -1
        || (unint64_t v16 = std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( *(void **)(a1 + 112),  *(void *)(v14 + 8LL * v13))) == 0LL)
      {
        int v17 = -1;
      }

      else
      {
        int v17 = *((_DWORD *)v16 + 5);
      }

      int v101 = v17;
      unsigned int v18 = v13 + 1;
      uint64_t v19 = (v15 >> 30) & 0x1FC;
      unsigned int v20 = *(_DWORD *)(v11 + 8 * v10 + 4);
      unsigned int v98 = v19 + v13 + 1;
      if (v98 >= v20) {
        goto LABEL_127;
      }
      if ((_DWORD)v19 && (v15 & 0x7F00000000LL) != 0) {
        break;
      }
LABEL_126:
      unsigned int v13 = v98;
      if (v98 >= v20) {
        goto LABEL_127;
      }
    }

    int v22 = 0;
    unint64_t v100 = v15 >> 39;
    uint64_t v102 = v13;
LABEL_21:
    int v104 = v22;
    uint64_t v23 = 0LL;
    uint64_t v24 = *(void *)(a1 + 104);
    unsigned int v25 = v18;
    do
    {
      uint64_t v26 = v24 + 8LL * v25;
      uint64_t v27 = &v138[v23];
      *uint64_t v27 = *(void *)v26;
      v27[1] = *(_DWORD *)(v26 + 4);
      v23 += 2LL;
      ++v25;
    }

    while (v23 != 8);
    if ((v138[0] & 0xF) != 1) {
      goto LABEL_124;
    }
    int v116 = v101;
    int v117 = v100;
    uint64_t v132 = 0x1FFFFFFFFLL;
    unint64_t v28 = (void **)*((void *)&v110 + 1);
    *((void *)&v112 + 1) = 0LL;
    unint64_t v29 = v111 - *((void *)&v110 + 1);
    if ((void)v111 - *((void *)&v110 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v28);
        unint64_t v28 = (void **)(*((void *)&v110 + 1) + 8LL);
        *((void *)&v110 + 1) = v28;
        unint64_t v29 = v111 - (void)v28;
      }

      while ((void)v111 - (void)v28 > 0x10uLL);
    }

    if (v29 >> 3 == 1)
    {
      uint64_t v30 = 512LL;
    }

    else
    {
      if (v29 >> 3 != 2) {
        goto LABEL_31;
      }
      uint64_t v30 = 1024LL;
    }

    *(void *)&__int128 v112 = v30;
LABEL_31:
    uint64_t v31 = (void **)*((void *)&v113 + 1);
    *((void *)&v115 + 1) = 0LL;
    unint64_t v32 = v114 - *((void *)&v113 + 1);
    if ((void)v114 - *((void *)&v113 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v31);
        uint64_t v31 = (void **)(*((void *)&v113 + 1) + 8LL);
        *((void *)&v113 + 1) = v31;
        unint64_t v32 = v114 - (void)v31;
      }

      while ((void)v114 - (void)v31 > 0x10uLL);
    }

    if (v32 >> 3 == 1)
    {
      uint64_t v33 = 512LL;
    }

    else
    {
      if (v32 >> 3 != 2) {
        goto LABEL_38;
      }
      uint64_t v33 = 1024LL;
    }

    *(void *)&__int128 v115 = v33;
LABEL_38:
    unsigned int v34 = (void **)*((void *)&v119 + 1);
    *((void *)&v121 + 1) = 0LL;
    unint64_t v35 = v120 - *((void *)&v119 + 1);
    if ((void)v120 - *((void *)&v119 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v34);
        unsigned int v34 = (void **)(*((void *)&v119 + 1) + 8LL);
        *((void *)&v119 + 1) = v34;
        unint64_t v35 = v120 - (void)v34;
      }

      while ((void)v120 - (void)v34 > 0x10uLL);
    }

    if (v35 >> 3 == 1)
    {
      uint64_t v36 = 256LL;
    }

    else
    {
      if (v35 >> 3 != 2) {
        goto LABEL_45;
      }
      uint64_t v36 = 512LL;
    }

    *(void *)&__int128 v121 = v36;
LABEL_45:
    BOOL v37 = (void **)*((void *)&v107 + 1);
    *((void *)&v109 + 1) = 0LL;
    unint64_t v38 = v108 - *((void *)&v107 + 1);
    if ((void)v108 - *((void *)&v107 + 1) >= 0x11uLL)
    {
      do
      {
        operator delete(*v37);
        BOOL v37 = (void **)(*((void *)&v107 + 1) + 8LL);
        *((void *)&v107 + 1) = v37;
        unint64_t v38 = v108 - (void)v37;
      }

      while ((void)v108 - (void)v37 > 0x10uLL);
    }

    if (v38 >> 3 == 1)
    {
      uint64_t v39 = 256LL;
    }

    else
    {
      if (v38 >> 3 != 2)
      {
LABEL_52:
        uint64_t v40 = *((void *)&v127 + 1);
        uint64_t v41 = v127;
        if (*((void *)&v127 + 1) != (void)v127)
        {
          uint64_t v42 = *((void *)&v127 + 1);
          do
          {
            __int128 v44 = *(void **)(v42 - 24);
            v42 -= 24LL;
            BOOL v43 = v44;
            if (v44)
            {
              *(void *)(v40 - 16) = v43;
              operator delete(v43);
            }

            uint64_t v40 = v42;
          }

          while (v42 != v41);
        }

        *((void *)&v127 + 1) = v41;
        std::vector<std::vector<ProfileEvent>>::resize((uint64_t)&v127);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(v122);
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&v124);
        *((void *)&v118[0] + 1) = *(void *)&v118[0];
        std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear((void *)&v128 + 1);
        unint64_t v45 = 0LL;
        uint64_t v105 = 0LL;
        char v46 = 1;
        while (1)
        {
          unsigned int v47 = v138[v45];
          if ((v47 & 1) != 0)
          {
            if (v45)
            {
              if (v133) {
                ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v105);
              }
              else {
                ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v105);
              }
              if (v45 == 7)
              {
LABEL_75:
                if (v133) {
                  ProfileEventHelper::ProcessQueueLegacy((ProfileEventHelper *)&v105);
                }
                else {
                  ProfileEventHelper::ProcessQueue((ProfileEventHelper *)&v105);
                }
                if ([*(id *)(a1 + 32) dumpInstructions]) {
                  [*(id *)(a1 + 32) _dumpTraceBufferPacketsInFile:v99 usingTracePackets:v138 withExtractedSamples:v118 withTraceBufferCount:++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) forTargetIndex:*(unsigned int *)(a1 + 128)];
                }
                BOOL v50 = (int *)*((void *)&v118[0] + 1);
                for (unint64_t i = *(unsigned int **)&v118[0]; i != (unsigned int *)v50; i += 10)
                {
                  unsigned int v52 = *i;
                  BOOL v53 = *i != -1 || i[3] == -1;
                  if (v53
                    && v52 <= *(_DWORD *)(a1 + 132)
                    && (v54 = *(_DWORD *)(a1 + 136), BOOL v49 = v52 >= v54, v55 = v52 - v54, v49))
                  {
                    BOOL v77 = (void **)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 48LL)
                                              + 24LL * *(void *)(a1 + 72))
                                  + 24LL * v55);
                    uint64_t v79 = v77 + 1;
                    char v78 = (char *)v77[1];
                    unint64_t v80 = (char *)v77[2];
                    if (v78 >= v80)
                    {
                      unint64_t v84 = 0xCCCCCCCCCCCCCCCDLL * ((v78 - (_BYTE *)*v77) >> 3);
                      unint64_t v85 = v84 + 1;
                      if (v84 + 1 > 0x666666666666666LL) {
LABEL_130:
                      }
                        abort();
                      unint64_t v86 = 0xCCCCCCCCCCCCCCCDLL * ((v80 - (_BYTE *)*v77) >> 3);
                      if (2 * v86 > v85) {
                        unint64_t v85 = 2 * v86;
                      }
                      if (v86 >= 0x333333333333333LL) {
                        unint64_t v87 = 0x666666666666666LL;
                      }
                      else {
                        unint64_t v87 = v85;
                      }
                      if (v87) {
                        unint64_t v87 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v87);
                      }
                      else {
                        uint64_t v88 = 0LL;
                      }
                      unint64_t v89 = v87 + 40 * v84;
                      __int128 v90 = *(_OWORD *)i;
                      __int128 v91 = *((_OWORD *)i + 1);
                      *(void *)(v89 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v89 = v90;
                      *(_OWORD *)(v89 + 16) = v91;
                      int64_t v92 = (char *)*v79;
                      int64_t v93 = (char *)*v77;
                      unint64_t v94 = v89;
                      if (*v79 != *v77)
                      {
                        do
                        {
                          __int128 v95 = *(_OWORD *)(v92 - 40);
                          __int128 v96 = *(_OWORD *)(v92 - 24);
                          *(void *)(v94 - 8) = *((void *)v92 - 1);
                          *(_OWORD *)(v94 - 24) = v96;
                          *(_OWORD *)(v94 - 40) = v95;
                          v94 -= 40LL;
                          v92 -= 40;
                        }

                        while (v92 != v93);
                        int64_t v92 = (char *)*v77;
                      }

                      *BOOL v77 = (void *)v94;
                      unsigned int v83 = (void *)(v89 + 40);
                      void *v79 = (void *)(v89 + 40);
                      v77[2] = (void *)(v87 + 40 * v88);
                      if (v92) {
                        operator delete(v92);
                      }
                    }

                    else
                    {
                      __int128 v81 = *(_OWORD *)i;
                      __int128 v82 = *((_OWORD *)i + 1);
                      *((void *)v78 + 4) = *((void *)i + 4);
                      *(_OWORD *)char v78 = v81;
                      *((_OWORD *)v78 + 1) = v82;
                      unsigned int v83 = v78 + 40;
                    }

                    void *v79 = v83;
                  }

                  else
                  {
                    uint64_t v58 = (void **)(v56 + 1);
                    unint64_t v57 = v56[1];
                    uint64_t v60 = v56 + 2;
                    unint64_t v59 = v56[2];
                    if (v57 >= v59)
                    {
                      unint64_t v64 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v57 - *v56) >> 3);
                      unint64_t v65 = v64 + 1;
                      if (v64 + 1 > 0x666666666666666LL) {
                        goto LABEL_130;
                      }
                      unint64_t v66 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v59 - *v56) >> 3);
                      if (2 * v66 > v65) {
                        unint64_t v65 = 2 * v66;
                      }
                      if (v66 >= 0x333333333333333LL) {
                        unint64_t v67 = 0x666666666666666LL;
                      }
                      else {
                        unint64_t v67 = v65;
                      }
                      if (v67) {
                        unint64_t v67 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<ShaderProfilerUSCSampleInfo>>(v67);
                      }
                      else {
                        uint64_t v68 = 0LL;
                      }
                      unint64_t v69 = v67 + 40 * v64;
                      __int128 v70 = *(_OWORD *)i;
                      __int128 v71 = *((_OWORD *)i + 1);
                      *(void *)(v69 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v69 = v70;
                      *(_OWORD *)(v69 + 16) = v71;
                      unsigned int v72 = (char *)*v58;
                      BOOL v73 = (char *)*v56;
                      unint64_t v74 = v69;
                      if (*v58 != (void *)*v56)
                      {
                        do
                        {
                          __int128 v75 = *(_OWORD *)(v72 - 40);
                          __int128 v76 = *(_OWORD *)(v72 - 24);
                          *(void *)(v74 - 8) = *((void *)v72 - 1);
                          *(_OWORD *)(v74 - 24) = v76;
                          *(_OWORD *)(v74 - 40) = v75;
                          v74 -= 40LL;
                          v72 -= 40;
                        }

                        while (v72 != v73);
                        unsigned int v72 = (char *)*v56;
                      }

                      unint64_t *v56 = v74;
                      __int128 v63 = (void *)(v69 + 40);
                      char *v58 = (void *)(v69 + 40);
                      void *v60 = v67 + 40 * v68;
                      if (v72) {
                        operator delete(v72);
                      }
                    }

                    else
                    {
                      __int128 v61 = *(_OWORD *)i;
                      __int128 v62 = *((_OWORD *)i + 1);
                      *(void *)(v57 + 32) = *((void *)i + 4);
                      *(_OWORD *)unint64_t v57 = v61;
                      *(_OWORD *)(v57 + 16) = v62;
                      __int128 v63 = (void *)(v57 + 40);
                    }

                    char *v58 = v63;
                  }
                }

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_524( uint64_t a1)
{
  if (*(_DWORD *)(a1 + 88))
  {
    uint64_t v2 = 0LL;
    unint64_t v3 = 0LL;
    do
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
        std::vector<ShaderProfilerUSCSampleInfo>::reserve( (void **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL) + v2),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL)
      }
                               + 24LL * *(void *)(a1 + 72)
                               + 8)
                   - *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL)
                               + 24LL * *(void *)(a1 + 72))) >> 3)
        * *(void *)(a1 + 80));
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL) + v2;
      id v5 = (char **)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 48LL)
                               + 24LL * *(void *)(a1 + 72))
                   + v2);
      std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>( v4,  *(char **)(v4 + 8),  *v5,  v5[1],  0xCCCCCCCCCCCCCCCDLL * ((v5[1] - *v5) >> 3));
      ++v3;
      v2 += 24LL;
    }

    while (v3 < *(unsigned int *)(a1 + 88));
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v7 = v6 + 48;
  float v8 = *(char **)(v6 + 56);
  float v9 = (char **)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 48LL) + 24LL * *(void *)(a1 + 72));
  std::vector<ShaderProfilerUSCSampleInfo>::__insert_with_size[abi:nn180100]<std::__wrap_iter<ShaderProfilerUSCSampleInfo*>,std::__wrap_iter<ShaderProfilerUSCSampleInfo*>>( v7,  v8,  *v9,  v9[1],  0xCCCCCCCCCCCCCCCDLL * ((v9[1] - *v9) >> 3));
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(unint64_t)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[2] - *a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667LL) {
      abort();
    }
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer( &v10,  a2,  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[1] - *a1) >> 3),  (uint64_t)(a1 + 2));
    uint64_t v4 = (char *)*a1;
    unint64_t v3 = (char *)a1[1];
    id v5 = v11;
    if (v3 == (char *)*a1)
    {
      float v8 = (char *)a1[1];
    }

    else
    {
      do
      {
        __int128 v6 = *(_OWORD *)(v3 - 40);
        __int128 v7 = *(_OWORD *)(v3 - 24);
        *((void *)v5 - 1) = *((void *)v3 - 1);
        *(_OWORD *)(v5 - 24) = v7;
        *(_OWORD *)(v5 - 40) = v6;
        v5 -= 40;
        v3 -= 40;
      }

      while (v3 != v4);
      float v8 = (char *)*a1;
      unint64_t v3 = (char *)a1[1];
    }

    *a1 = v5;
    uint64_t v9 = a1[2];
    *(_OWORD *)(a1 + 1) = v12;
    *(void *)&__int128 v12 = v3;
    *((void *)&v12 + 1) = v9;
    uint64_t v10 = v8;
    uint64_t v11 = v8;
    if (v3 != v8) {
      *(void *)&__int128 v12 = &v8[(v3 - v8 - 40) % 0x28uLL];
    }
    if (v8) {
      operator delete(v8);
    }
  }

- (void)evaluateStreamingSamples:(uint64_t)a3 withUSCSampleNum:(uint64_t)a4 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  a1[3] = 0LL;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x666666666666667LL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    __int128 v7 = (char *)operator new(40 * a2);
  }

  else
  {
    __int128 v7 = 0LL;
  }

  float v8 = &v7[40 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[40 * a2];
  return a1;
}

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:(__int128 *)a2 withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  uint64_t v4 = (char *)a1[2];
  id v5 = (char *)a1[1];
  if (v5 >= v4)
  {
    uint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (_BYTE *)*a1) >> 3);
    unint64_t v10 = v9 + 1;
    unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x333333333333333LL) {
      unint64_t v12 = 0x666666666666666LL;
    }
    else {
      unint64_t v12 = v10;
    }
    std::__split_buffer<-[DYPMTLShaderProfilerHelper evaluateStreamingSamples:withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:]::ThreadRangeInfo>::__split_buffer( &v23,  v12,  v9,  (uint64_t)(a1 + 2));
    unsigned int v13 = v25;
    __int128 v14 = *a2;
    __int128 v15 = a2[1];
    *((void *)v25 + 4) = *((void *)a2 + 4);
    *(_OWORD *)unsigned int v13 = v14;
    *((_OWORD *)v13 + 1) = v15;
    unint64_t v16 = v24;
    float v8 = v25 + 40;
    v25 += 40;
    unsigned int v18 = (char *)*a1;
    int v17 = (char *)a1[1];
    if (v17 == *a1)
    {
      __int128 v21 = (char *)a1[1];
    }

    else
    {
      do
      {
        __int128 v19 = *(_OWORD *)(v17 - 40);
        __int128 v20 = *(_OWORD *)(v17 - 24);
        *((void *)v16 - 1) = *((void *)v17 - 1);
        *(_OWORD *)(v16 - 24) = v20;
        *(_OWORD *)(v16 - 40) = v19;
        v16 -= 40;
        v17 -= 40;
      }

      while (v17 != v18);
      __int128 v21 = (char *)*a1;
      int v17 = (char *)a1[1];
      float v8 = v25;
    }

    *a1 = v16;
    a1[1] = v8;
    int v22 = a1[2];
    a1[2] = v26;
    unsigned int v25 = v17;
    uint64_t v26 = v22;
    uint64_t v23 = v21;
    uint64_t v24 = v21;
    if (v17 != v21) {
      unsigned int v25 = &v21[(v17 - v21 - 40) % 0x28uLL];
    }
    if (v21) {
      operator delete(v21);
    }
  }

  else
  {
    __int128 v6 = *a2;
    __int128 v7 = a2[1];
    *((void *)v5 + 4) = *((void *)a2 + 4);
    *(_OWORD *)id v5 = v6;
    *((_OWORD *)v5 + 1) = v7;
    float v8 = v5 + 40;
  }

  a1[1] = v8;
}

uint64_t __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_532( uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8LL);
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 56);
  while (v2 != v3)
  {
    uint64_t v4 = *(double **)v2;
    uint64_t v5 = *(void *)(v2 + 8) - *(void *)v2;
    if (v5)
    {
      unint64_t v6 = v5 >> 3;
      __int128 v7 = **(double ***)(result + 48);
      if (v6 <= 1) {
        unint64_t v6 = 1LL;
      }
      do
      {
        double v8 = *v4++;
        double *v7 = v8 + *v7;
        ++v7;
        --v6;
      }

      while (v6);
    }

    v2 += 24LL;
  }

  uint64_t v9 = *(void *)(*(void *)(result + 40) + 8LL);
  uint64_t v10 = *(void *)(v9 + 48);
  uint64_t v11 = *(void *)(v9 + 56);
  while (v10 != v11)
  {
    unint64_t v12 = *(double **)v10;
    uint64_t v13 = *(void *)(v10 + 8) - *(void *)v10;
    if (v13)
    {
      unint64_t v14 = v13 >> 3;
      __int128 v15 = **(double ***)(result + 56);
      if (v14 <= 1) {
        unint64_t v14 = 1LL;
      }
      do
      {
        double v16 = *v12++;
        double *v15 = v16 + *v15;
        ++v15;
        --v14;
      }

      while (v14);
    }

    v10 += 24LL;
  }

  return result;
}

void __214__DYPMTLShaderProfilerHelper_evaluateStreamingSamples_withUSCSampleNum_withProgramAddressLUT_targetIndex_forRingBufferIndex_withMinEncoderIndex_withMaxEncoderIndex_withEncoderIdToEncoderIndexMap_withProfilingData___block_invoke_2( unint64_t a1)
{
  unint64_t v1 = a1;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v2 = *(uint64_t ***)(v1 + 88);
  uint64_t v3 = *v2;
  __int128 v156 = v2[1];
  if (*v2 != v156)
  {
    unsigned int v4 = *(_DWORD *)(v1 + 168);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 48LL) + 40LL * v4;
    unint64_t v161 = (void *)(*(void *)(*(void *)(*(void *)(v1 + 40) + 8LL) + 48LL) + 24LL * v4);
    uint64_t v154 = v1 + 112;
    unint64_t v155 = WeakRetained + 464;
    unint64_t v153 = v1 + 72;
    unint64_t v152 = v1 + 64;
    unint64_t v160 = (float **)(v5 + 16);
    unint64_t v169 = v1;
    uint64_t v163 = v5;
    while (1)
    {
      unsigned int v6 = *((_DWORD *)v3 + 2);
      unsigned int v176 = v6;
      __int128 v7 = std::__hash_table<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::vector<DYMTLShaderProfilerProgramAddress *>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( *(void *)(v1 + 96),  v6,  &v176);
      unsigned int v8 = *((_DWORD *)v3 + 4);
      uint64_t v170 = *(void *)(v7[3] + 8LL * *((unsigned int *)v3 + 3));
      unsigned int v175 = v8;
      unsigned int v9 = *(_DWORD *)(v1 + 172);
      if (v8 < v9) {
        unsigned int v9 = v8;
      }
      uint64_t v10 = (void *)(**(void **)(v1 + 104) + 40LL * v9);
      unint64_t v11 = *v3;
      int8x8_t v12 = (int8x8_t)v10[1];
      if (v12)
      {
        uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
        v13.i16[0] = vaddlv_u8(v13);
        if (v13.u32[0] > 1uLL)
        {
          unint64_t v14 = *v3;
          if (v11 >= *(void *)&v12) {
            unint64_t v14 = v11 % *(void *)&v12;
          }
        }

        else
        {
          unint64_t v14 = (*(void *)&v12 - 1LL) & v11;
        }

        unint64_t i = *(void **)(*v10 + 8 * v14);
        if (i)
        {
          for (unint64_t i = (void *)*i; i; unint64_t i = (void *)*i)
          {
            unint64_t v16 = i[1];
            if (v16 == v11)
            {
              if (i[2] == v11) {
                break;
              }
            }

            else
            {
              if (v13.u32[0] > 1uLL)
              {
                if (v16 >= *(void *)&v12) {
                  v16 %= *(void *)&v12;
                }
              }

              else
              {
                v16 &= *(void *)&v12 - 1LL;
              }

              if (v16 != v14) {
                goto LABEL_22;
              }
            }
          }
        }
      }

      else
      {
LABEL_22:
        unint64_t i = 0LL;
      }

      uint64_t v17 = *((unsigned int *)v3 + 5);
      unsigned int v18 = (void **)(i + 3);
      uint64_t v19 = v154;
      if (!i) {
        unsigned int v18 = (void **)v154;
      }
      if (v11 == -1LL) {
        __int128 v20 = (void **)v19;
      }
      else {
        __int128 v20 = v18;
      }
      unint64_t v166 = v20;
      __int128 v21 = *v20;
      if (v21) {
        __int128 v21 = (void *)v21[1];
      }
      unint64_t v158 = v21;
      int v22 = (void *)objc_claimAutoreleasedReturnValue([v158 binary]);

      int v157 = v17;
      unint64_t v165 = v22
           ? std::unordered_map<std::string,std::vector<-[GTShaderProfilerHelper _processPerLineCostDataForLineTable:withFileCost:withDebugInfo:andAllDrawCost:withKey:withShaderSourcePath:withDrawCost:]::LineSourceInfo>>::find[abi:nn180100]( (void *)WeakRetained + 14,  (uint64_t)(v166 + 1))
           : 0LL;
      unsigned int v23 = *((_DWORD *)v3 + 6);
      unsigned int v24 = *((_DWORD *)v3 + 7);
      __int128 v159 = v3;
      if (v23 != v24) {
        break;
      }
LABEL_36:

      uint64_t v3 = v159 + 5;
      if (v159 + 5 == v156) {
        goto LABEL_224;
      }
    }

    uint64_t v25 = *(void *)(*(void *)(*(void *)(*(void *)(v1 + 48) + 8LL) + 48LL) + 24LL * (v6 - *(_DWORD *)(v1 + 176)));
    unint64_t v168 = (_DWORD *)(v25 + 40LL * v24);
    uint64_t v26 = (_DWORD *)(v25 + 40LL * v23);
    uint64_t v27 = *((unsigned int *)v3 + 8);
    unsigned int v167 = v17 - 1;
    int v162 = (_DWORD)v17 << 28;
    uint64_t v164 = v22;
    while (1)
    {
      if (!v22)
      {
        int v40 = 0;
        unsigned int v34 = 0LL;
        double v38 = 1.0;
        goto LABEL_135;
      }

      TargetClauseAnalysis = GPUToolsPlatformLLVMShaderProfilerHelperImpl::GetTargetClauseAnalysis(**((GPUToolsPlatformLLVMShaderProfilerHelperImpl ***)v165 + 5));
      unint64_t v29 = (void *)*TargetClauseAnalysis;
      uint64_t v30 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( (void *)(*TargetClauseAnalysis + 56LL),  (v26[3] - *(_DWORD *)(v170 + 8)));
      if (!v30) {
        goto LABEL_194;
      }
      unsigned int v31 = *((_DWORD *)v30 + 6);
      if (v31 == -1) {
        goto LABEL_194;
      }
      uint64_t v32 = *v29 + 88LL * *(void *)(v29[3] + 48LL * v31 + 8LL * v26[8]);
      unint64_t v35 = *(int **)(v32 + 64);
      unsigned int v34 = (int **)(v32 + 64);
      uint64_t v33 = v35;
      BOOL v37 = v34 + 1;
      uint64_t v36 = v34[1];
      double v38 = 1.0;
      if (v35 != v36 && (unint64_t)((char *)v36 - (char *)v33) <= 0x2F && *(void *)(v1 + 152) != 0LL)
      {
        double v38 = 0.0;
        switch(v33[3])
        {
          case 6:
          case 7:
          case 8:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
            objc_msgSend( WeakRetained,  "_latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterType:");
            goto LABEL_55;
          case 9:
            objc_msgSend( WeakRetained,  "_latencyAdjustmentFactorWithLimiterData:forIndex:withLimiterTypeIndexMap:forLimiterTypeLoad:forLimiterTypeStore:");
            goto LABEL_55;
          case 15:
            goto LABEL_53;
          case 17:
            objc_msgSend(WeakRetained, "_waitLatencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:");
            goto LABEL_55;
          case 18:
          case 19:
            break;
          default:
            int v42 = v33[2];
            if (v42 == 3)
            {
LABEL_53:
              objc_msgSend( WeakRetained,  "_latencyAdjustmentFactorWithLimiterDataWithLerp:forIndex:withLimiterTypeIndexMap:forLimiterType:");
            }

            else
            {
              double v38 = 1.0;
              if (v42 != 4) {
                break;
              }
              objc_msgSend(WeakRetained, "_latencyAdjustmentWithLimiterData:forIndex:withLimiterTypeIndexMap:");
            }

- (void)evaluateStreamingSamples:(void *)a1 withUSCSampleNum:withProgramAddressLUT:targetIndex:forRingBufferIndex:withMinEncoderIndex:withMaxEncoderIndex:withEncoderIdToEncoderIndexMap:withProfilingData:
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    unsigned int v4 = *a1;
    if (v3 != v2)
    {
      uint64_t v5 = (char *)a1[1];
      do
      {
        __int128 v7 = (void *)*((void *)v5 - 3);
        v5 -= 24;
        unsigned int v6 = v7;
        if (v7)
        {
          *((void *)v3 - 2) = v6;
          operator delete(v6);
        }

        uint64_t v3 = v5;
      }

      while (v5 != v2);
      unsigned int v4 = *a1;
    }

    a1[1] = v2;
    operator delete(v4);
  }

  return a1;
}

- (uint64_t)setupDataForEvaluatingStreamingSamples:forRingBufferCount:forTargetIndex:
{
  id v10 = a2;
  size_t v11 = a3;
  id v12 = a5;
  uint8x8_t v13 = v12;
  if (!v11)
  {
    uint64_t v17 = 0LL;
    goto LABEL_98;
  }

  id v56 = v12;
  if (v10) {
    [v12 setObject:v11 forKeyedSubscript:v10];
  }
  int8x8_t v14 = (int8x8_t)a4[1];
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v16 = v11;
      if (*(void *)&v14 <= v11) {
        unint64_t v16 = v11 % *(void *)&v14;
      }
    }

    else
    {
      unint64_t v16 = (*(void *)&v14 - 1LL) & v11;
    }

    unsigned int v18 = *(void ***)(*a4 + 8 * v16);
    if (v18)
    {
      for (unint64_t i = *v18; i; unint64_t i = (void *)*i)
      {
        unint64_t v20 = i[1];
        if (v20 == v11)
        {
          if (i[2] == v11) {
            goto LABEL_97;
          }
        }

        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v20 >= *(void *)&v14) {
              v20 %= *(void *)&v14;
            }
          }

          else
          {
            v20 &= *(void *)&v14 - 1LL;
          }

          if (v20 != v16) {
            break;
          }
        }
      }
    }
  }

  __int128 v21 = *a1;
  int v22 = operator new(0x30uLL);
  uint64_t v23 = *v21;
  id v24 = v10;
  id v25 = (id)v11;
  id v26 = v24;
  *int v22 = v26;
  id v27 = v25;
  v22[2] = 0LL;
  v22[1] = v27;
  v22[3] = 0LL;
  v22[4] = 0LL;
  *((_DWORD *)v22 + 10) = 0;
  if ((_DWORD)v23)
  {
    unint64_t v28 = (char *)operator new(24 * v23);
    size_t v5 = 24 * ((24 * v23 - 24) / 0x18uLL) + 24;
    bzero(v28, v5);
    v22[2] = v28;
    v22[3] = &v28[v5];
    v22[4] = &v28[24 * v23];
  }

  unint64_t v29 = a4[1];
  if (v29)
  {
    uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v29);
    v30.i16[0] = vaddlv_u8(v30);
    if (v30.u32[0] > 1uLL)
    {
      size_t v5 = v11;
      if (v29 <= v11) {
        size_t v5 = v11 % v29;
      }
    }

    else
    {
      size_t v5 = (v29 - 1) & v11;
    }

    unsigned int v31 = *(void ***)(*a4 + 8 * v5);
    if (v31)
    {
      for (unint64_t i = *v31; i; unint64_t i = (void *)*i)
      {
        unint64_t v32 = i[1];
        if (v32 == v11)
        {
          if (i[2] == v11)
          {
            std::default_delete<ShaderBinaryStatsInfo>::operator()[abi:nn180100]((id *)v22);
            goto LABEL_96;
          }
        }

        else
        {
          if (v30.u32[0] > 1uLL)
          {
            if (v32 >= v29) {
              v32 %= v29;
            }
          }

          else
          {
            v32 &= v29 - 1;
          }

          if (v32 != v5) {
            break;
          }
        }
      }
    }
  }

  unint64_t i = operator new(0x20uLL);
  uint64_t v33 = a4 + 2;
  *unint64_t i = 0LL;
  i[1] = v11;
  i[2] = v11;
  i[3] = v22;
  float v34 = (float)(unint64_t)(a4[3] + 1);
  float v35 = *((float *)a4 + 8);
  if (!v29 || (float)(v35 * (float)v29) < v34)
  {
    BOOL v36 = 1LL;
    if (v29 >= 3) {
      BOOL v36 = (v29 & (v29 - 1)) != 0;
    }
    unint64_t v37 = v36 | (2 * v29);
    unint64_t v38 = vcvtps_u32_f32(v34 / v35);
    if (v37 <= v38) {
      int8x8_t prime = (int8x8_t)v38;
    }
    else {
      int8x8_t prime = (int8x8_t)v37;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v29 = a4[1];
    }

    if (*(void *)&prime > v29) {
      goto LABEL_52;
    }
    if (*(void *)&prime < v29)
    {
      unint64_t v46 = vcvtps_u32_f32((float)(unint64_t)a4[3] / *((float *)a4 + 8));
      if (v29 < 3 || (uint8x8_t v47 = (uint8x8_t)vcnt_s8((int8x8_t)v29), v47.i16[0] = vaddlv_u8(v47), v47.u32[0] > 1uLL))
      {
        unint64_t v46 = std::__next_prime(v46);
      }

      else
      {
        uint64_t v48 = 1LL << -(char)__clz(v46 - 1);
        if (v46 >= 2) {
          unint64_t v46 = v48;
        }
      }

      if (*(void *)&prime <= v46) {
        int8x8_t prime = (int8x8_t)v46;
      }
      if (*(void *)&prime >= v29)
      {
        unint64_t v29 = a4[1];
      }

      else
      {
        if (prime)
        {
LABEL_52:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          int v40 = operator new(8LL * *(void *)&prime);
          double v41 = (void *)*a4;
          *a4 = (uint64_t)v40;
          if (v41) {
            operator delete(v41);
          }
          uint64_t v42 = 0LL;
          a4[1] = (uint64_t)prime;
          do
            *(void *)(*a4 + 8 * v42++) = 0LL;
          while (*(void *)&prime != v42);
          BOOL v43 = (void *)*v33;
          if (*v33)
          {
            unint64_t v44 = v43[1];
            uint8x8_t v45 = (uint8x8_t)vcnt_s8(prime);
            v45.i16[0] = vaddlv_u8(v45);
            if (v45.u32[0] > 1uLL)
            {
              if (v44 >= *(void *)&prime) {
                v44 %= *(void *)&prime;
              }
            }

            else
            {
              v44 &= *(void *)&prime - 1LL;
            }

            *(void *)(*a4 + 8 * v44) = v33;
            BOOL v49 = (void *)*v43;
            if (*v43)
            {
              do
              {
                unint64_t v50 = v49[1];
                if (v45.u32[0] > 1uLL)
                {
                  if (v50 >= *(void *)&prime) {
                    v50 %= *(void *)&prime;
                  }
                }

                else
                {
                  v50 &= *(void *)&prime - 1LL;
                }

                if (v50 != v44)
                {
                  if (!*(void *)(*a4 + 8 * v50))
                  {
                    *(void *)(*a4 + 8 * v50) = v43;
                    goto LABEL_77;
                  }

                  *BOOL v43 = *v49;
                  *BOOL v49 = **(void **)(*a4 + 8 * v50);
                  **(void **)(*a4 + 8 * v50) = v49;
                  BOOL v49 = v43;
                }

                unint64_t v50 = v44;
LABEL_77:
                BOOL v43 = v49;
                BOOL v49 = (void *)*v49;
                unint64_t v44 = v50;
              }

              while (v49);
            }
          }

          unint64_t v29 = (unint64_t)prime;
          goto LABEL_81;
        }

        BOOL v55 = (void *)*a4;
        *a4 = 0LL;
        if (v55) {
          operator delete(v55);
        }
        unint64_t v29 = 0LL;
        a4[1] = 0LL;
      }
    }

- (uint64_t)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
  unsigned int v4 = **a1;
  memset(v122, 0, sizeof(v122));
  int v123 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v122,  0x24uLL);
  std::deque<unsigned int>::push_front((char **)a1[1], a1[2]);
  std::deque<unsigned int>::push_front((char **)a1[3], a1[4]);
  for (uint64_t i = a2[5]; i; uint64_t i = a2[5])
  {
    ++**a1;
    uint64_t v6 = *(void *)(*(void *)(a2[1] + ((a2[4] >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (a2[4] & 0x1FFLL));
    ++a2[4];
    a2[5] = i - 1;
    std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)a2);
    if (v6 >> 28)
    {
      unsigned int v7 = v6 >> 28;
      unsigned int v8 = (v6 >> 28) - 3;
      if (v8 >= 6)
      {
        if (v7 == 2)
        {
          int v22 = a1[6];
          id v24 = *(void **)v22;
          uint64_t v23 = (void *)*((void *)v22 + 1);
          while (v24 != v23)
          {
            id v25 = (_DWORD *)*v24;
            if (*v24 != v24[1] && *v25 >> 28 == 1)
            {
              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v122,  v25[1],  v25[1]);
              *(_DWORD *)void *v24 = *(_DWORD *)*v24 & 0xFFFFFFF | 0x20000000;
              *(_DWORD *)(*v24 + 4LL) = **a1;
              break;
            }

            v24 += 3;
          }
        }

        else if (v7 == 1)
        {
          uint64_t v13 = **a1;
          uint8x8_t v15 = a1[5];
          int8x8_t v14 = a1[6];
          unsigned int v16 = (*v15)++;
          uint64_t v17 = (void **)(*(void *)v14 + 24LL * v16);
          uint64_t v19 = v17 + 1;
          unsigned int v18 = (unint64_t *)v17[1];
          unint64_t v20 = (unint64_t)v17[2];
          if ((unint64_t)v18 >= v20)
          {
            uint64_t v26 = ((char *)v18 - (_BYTE *)*v17) >> 3;
            uint64_t v27 = v20 - (void)*v17;
            uint64_t v28 = v27 >> 2;
            else {
              unint64_t v29 = v28;
            }
            if (v29) {
              unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,unsigned int>>>(v29);
            }
            else {
              uint64_t v30 = 0LL;
            }
            unsigned int v31 = (unint64_t *)(v29 + 8 * v26);
            *unsigned int v31 = v6 | (unint64_t)(v13 << 32);
            __int128 v21 = v31 + 1;
            unint64_t v32 = (char *)*v19;
            uint64_t v33 = (char *)*v17;
            if (*v19 != *v17)
            {
              do
              {
                unint64_t v34 = *((void *)v32 - 1);
                v32 -= 8;
                *--unsigned int v31 = v34;
              }

              while (v32 != v33);
              unint64_t v32 = (char *)*v17;
            }

            *uint64_t v17 = v31;
            *uint64_t v19 = v21;
            v17[2] = (void *)(v29 + 8 * v30);
            if (v32) {
              operator delete(v32);
            }
          }

          else
          {
            unint64_t *v18 = v6 | (unint64_t)(v13 << 32);
            __int128 v21 = v18 + 1;
          }

          *uint64_t v19 = v21;
        }
      }

      else
      {
        unsigned int v9 = (void *)(*(void *)a1[6] + 24LL * v8);
        if (*v9 == v9[1])
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v122,  **a1,  **a1);
        }

        else
        {
          int v10 = *(_DWORD *)(*v9 + 4LL);
          uint64_t v11 = (uint64_t)a1[7];
          v119.i32[0] = v6 >> 28;
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( v11,  v7,  &v119)
          + 5) = v10;
          uint64_t v12 = *(void *)a1[6] + 24LL * v8;
          *(void *)(v12 + 8) -= 8LL;
        }
      }
    }
  }

  for (uint64_t j = 0LL; j != 144; j += 24LL)
  {
    BOOL v36 = (void *)(*(void *)a1[6] + j);
    if (*v36 != v36[1]) {
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)v122,  *(_DWORD *)(*v36 + 4LL),  *(_DWORD *)(*v36 + 4LL));
    }
  }

  __int128 v120 = 0u;
  __int128 v121 = 0u;
  int64x2_t v119 = 0u;
  memset(v117, 0, sizeof(v117));
  int v118 = 1056964608;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v117,  0x24uLL);
  *a1[5] = 0;
  unint64_t v37 = a1[8];
  uint64_t v38 = *((void *)v37 + 5);
  if (v38)
  {
    uint64_t v39 = 0LL;
    unint64_t v40 = 0LL;
    unint64_t v114 = 0LL;
    uint64_t v41 = 0LL;
    int v42 = 0;
    while (1)
    {
      unint64_t v43 = *((void *)v37 + 4);
      ++v4;
      uint64_t v116 = *(void *)(*(void *)(*((void *)v37 + 1) + ((v43 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v43 & 0x1FF));
      unsigned int v44 = v116;
      *((void *)v37 + 4) = v43 + 1;
      *((void *)v37 + 5) = v38 - 1;
      std::deque<ProfileEvent>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v37);
      if ((v44 & 0xF0000000) == 0x10000000)
      {
        ++*a1[5];
        if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v122,  v4)) {
          goto LABEL_44;
        }
      }

      else if (v44 >> 28 {
             && !std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( v122,  v4))
      }
      {
        if ((v44 & 0xF0000000) == 0x20000000 && *a1[5] == 6)
        {
          LODWORD(v116) = v44 & 0xFFFFFFF | 0x80000000;
          unsigned int v44 = v116;
        }

- (void)_processTracePackets:forRenderIndex:andGenerateSampleList:forTargetIndex:forLimiterIndex:
{
LABEL_1:
  unsigned int v8 = (__int128 *)(a2 - 40);
  unint64_t v9 = a1;
  while (2)
  {
    a1 = v9;
    uint64_t v10 = a2 - v9;
    uint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2 - v9) >> 3);
    switch(v11)
    {
      case 0LL:
      case 1LL:
        return;
      case 2LL:
        if (*(_DWORD *)(a2 - 8) < *(_DWORD *)(v9 + 32))
        {
          uint64_t v154 = *(void *)(v9 + 32);
          __int128 v136 = *(_OWORD *)v9;
          __int128 v145 = *(_OWORD *)(v9 + 16);
          __int128 v54 = *v8;
          __int128 v55 = *(_OWORD *)(a2 - 24);
          *(void *)(v9 + 32) = *(void *)(a2 - 8);
          *(_OWORD *)unint64_t v9 = v54;
          *(_OWORD *)(v9 + 16) = v55;
          *(void *)(a2 - 8) = v154;
          __int128 *v8 = v136;
          *(_OWORD *)(a2 - 24) = v145;
        }

        return;
      case 3LL:
        std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( (__int128 *)v9,  (__int128 *)(v9 + 40),  (__int128 *)(a2 - 40));
        return;
      case 4LL:
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( v9,  v9 + 40,  v9 + 80,  a2 - 40);
        return;
      case 5LL:
        id v56 = (__int128 *)(v9 + 40);
        unint64_t v57 = (__int128 *)(v9 + 80);
        unint64_t v58 = (__int128 *)(v9 + 120);
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( v9,  v9 + 40,  v9 + 80,  v9 + 120);
        if (*(_DWORD *)(a2 - 8) < *(_DWORD *)(v9 + 152))
        {
          __int128 v59 = *v58;
          __int128 v146 = *(_OWORD *)(v9 + 136);
          uint64_t v60 = *(void *)(v9 + 152);
          __int128 v62 = *v8;
          __int128 v61 = *(_OWORD *)(a2 - 24);
          *(void *)(v9 + 152) = *(void *)(a2 - 8);
          __int128 *v58 = v62;
          *(_OWORD *)(v9 + 136) = v61;
          *(void *)(a2 - 8) = v60;
          __int128 *v8 = v59;
          *(_OWORD *)(a2 - 24) = v146;
          if (*(_DWORD *)(v9 + 152) < *(_DWORD *)(v9 + 112))
          {
            uint64_t v63 = *(void *)(v9 + 112);
            __int128 v65 = *v57;
            __int128 v64 = *(_OWORD *)(v9 + 96);
            __int128 v66 = *(_OWORD *)(v9 + 136);
            *unint64_t v57 = *v58;
            *(_OWORD *)(v9 + 96) = v66;
            *(void *)(v9 + 112) = *(void *)(v9 + 152);
            __int128 *v58 = v65;
            *(_OWORD *)(v9 + 136) = v64;
            *(void *)(v9 + 152) = v63;
            if (*(_DWORD *)(v9 + 112) < *(_DWORD *)(v9 + 72))
            {
              uint64_t v67 = *(void *)(v9 + 72);
              __int128 v69 = *v56;
              __int128 v68 = *(_OWORD *)(v9 + 56);
              __int128 v70 = *(_OWORD *)(v9 + 96);
              __int128 *v56 = *v57;
              *(_OWORD *)(v9 + 56) = v70;
              *(void *)(v9 + 72) = *(void *)(v9 + 112);
              *unint64_t v57 = v69;
              *(_OWORD *)(v9 + 96) = v68;
              *(void *)(v9 + 112) = v67;
              if (*(_DWORD *)(v9 + 72) < *(_DWORD *)(v9 + 32))
              {
                uint64_t v155 = *(void *)(v9 + 32);
                __int128 v137 = *(_OWORD *)v9;
                __int128 v147 = *(_OWORD *)(v9 + 16);
                __int128 v71 = *(_OWORD *)(v9 + 56);
                *(_OWORD *)unint64_t v9 = *v56;
                *(_OWORD *)(v9 + 16) = v71;
                *(void *)(v9 + 32) = *(void *)(v9 + 72);
                __int128 *v56 = v137;
                *(_OWORD *)(v9 + 56) = v147;
                *(void *)(v9 + 72) = v155;
              }
            }
          }
        }

        return;
      default:
        if (v10 <= 959)
        {
          unsigned int v72 = (_OWORD *)(v9 + 40);
          BOOL v74 = v9 == a2 || v72 == (_OWORD *)a2;
          if ((a4 & 1) != 0)
          {
            if (!v74)
            {
              uint64_t v75 = 0LL;
              unint64_t v76 = (_DWORD *)v9;
              do
              {
                uint64_t v77 = v72;
                unsigned int v78 = v76[18];
                if (v78 < v76[8])
                {
                  __int128 v138 = *v77;
                  __int128 v148 = v77[1];
                  int v79 = v76[19];
                  uint64_t v80 = v75;
                  while (1)
                  {
                    uint64_t v81 = v9 + v80;
                    __int128 v82 = *(_OWORD *)(v9 + v80 + 16);
                    *(_OWORD *)(v81 + 40) = *(_OWORD *)(v9 + v80);
                    *(_OWORD *)(v81 + 56) = v82;
                    *(void *)(v81 + 72) = *(void *)(v9 + v80 + 32);
                    if (!v80) {
                      break;
                    }
                    v80 -= 40LL;
                    if (v78 >= *(_DWORD *)(v81 - 8))
                    {
                      uint64_t v83 = v9 + v80 + 40;
                      goto LABEL_79;
                    }
                  }

                  uint64_t v83 = v9;
LABEL_79:
                  *(_OWORD *)uint64_t v83 = v138;
                  *(_OWORD *)(v83 + 16) = v148;
                  *(_DWORD *)(v83 + 32) = v78;
                  *(_DWORD *)(v83 + 36) = v79;
                }

                unsigned int v72 = (_OWORD *)((char *)v77 + 40);
                v75 += 40LL;
                unint64_t v76 = v77;
              }

              while ((_OWORD *)((char *)v77 + 40) != (_OWORD *)a2);
            }
          }

          else if (!v74)
          {
            do
            {
              unint64_t v122 = v72;
              unsigned int v123 = *(_DWORD *)(a1 + 72);
              if (v123 < *(_DWORD *)(a1 + 32))
              {
                __int128 v141 = *v72;
                __int128 v151 = v72[1];
                int v124 = *(_DWORD *)(a1 + 76);
                unint64_t v125 = v122;
                do
                {
                  __int128 v126 = *(_OWORD *)((char *)v125 - 24);
                  _OWORD *v125 = *(_OWORD *)((char *)v125 - 40);
                  v125[1] = v126;
                  *((void *)v125 + 4) = *((void *)v125 - 1);
                  unsigned int v127 = *((_DWORD *)v125 - 12);
                  unint64_t v125 = (_OWORD *)((char *)v125 - 40);
                }

                while (v123 < v127);
                _OWORD *v125 = v141;
                v125[1] = v151;
                *((_DWORD *)v125 + 8) = v123;
                *((_DWORD *)v125 + 9) = v124;
              }

              unsigned int v72 = (_OWORD *)((char *)v122 + 40);
              a1 = (uint64_t)v122;
            }

            while ((_OWORD *)((char *)v122 + 40) != (_OWORD *)a2);
          }

          return;
        }

        if (!a3)
        {
          if (v9 != a2)
          {
            int64_t v84 = (unint64_t)(v11 - 2) >> 1;
            int64_t v85 = v84;
            do
            {
              int64_t v86 = v85;
              if (v84 >= v85)
              {
                uint64_t v87 = (2 * v85) | 1;
                unint64_t v88 = v9 + 40 * v87;
                if (2 * v86 + 2 < v11)
                {
                  unsigned int v89 = *(_DWORD *)(v9 + 40 * v87 + 32);
                  unsigned int v90 = *(_DWORD *)(v88 + 72);
                  v88 += 40LL * (v89 < v90);
                  if (v89 < v90) {
                    uint64_t v87 = 2 * v86 + 2;
                  }
                }

                unsigned int v91 = *(_DWORD *)(v9 + 40 * v86 + 32);
                if (*(_DWORD *)(v88 + 32) >= v91)
                {
                  unint64_t v92 = v9 + 40 * v86;
                  __int128 v139 = *(_OWORD *)v92;
                  __int128 v149 = *(_OWORD *)(v92 + 16);
                  int v93 = *(_DWORD *)(v92 + 36);
                  do
                  {
                    unint64_t v94 = v92;
                    unint64_t v92 = v88;
                    __int128 v95 = *(_OWORD *)v88;
                    __int128 v96 = *(_OWORD *)(v88 + 16);
                    *(void *)(v94 + 32) = *(void *)(v88 + 32);
                    *(_OWORD *)unint64_t v94 = v95;
                    *(_OWORD *)(v94 + 16) = v96;
                    if (v84 < v87) {
                      break;
                    }
                    uint64_t v97 = (2 * v87) | 1;
                    unint64_t v88 = v9 + 40 * v97;
                    uint64_t v98 = 2 * v87 + 2;
                    if (v98 < v11)
                    {
                      unsigned int v99 = *(_DWORD *)(v9 + 40 * v97 + 32);
                      unsigned int v100 = *(_DWORD *)(v88 + 72);
                      v88 += 40LL * (v99 < v100);
                      if (v99 < v100) {
                        uint64_t v97 = v98;
                      }
                    }

                    uint64_t v87 = v97;
                  }

                  while (*(_DWORD *)(v88 + 32) >= v91);
                  *(_OWORD *)unint64_t v92 = v139;
                  *(_OWORD *)(v92 + 16) = v149;
                  *(_DWORD *)(v92 + 32) = v91;
                  *(_DWORD *)(v92 + 36) = v93;
                }
              }

              int64_t v85 = v86 - 1;
            }

            while (v86);
            int64_t v101 = v10 / 0x28uLL;
            do
            {
              uint64_t v102 = 0LL;
              uint64_t v156 = *(void *)(v9 + 32);
              __int128 v140 = *(_OWORD *)v9;
              __int128 v150 = *(_OWORD *)(v9 + 16);
              unint64_t v103 = v9;
              do
              {
                uint64_t v104 = v102 + 1;
                unint64_t v105 = v103 + 40 * (v102 + 1);
                uint64_t v106 = (2 * v102) | 1;
                uint64_t v107 = 2 * v102 + 2;
                if (v107 < v101)
                {
                  unsigned int v108 = *(_DWORD *)(v103 + 40 * v104 + 32);
                  unsigned int v109 = *(_DWORD *)(v105 + 72);
                  v105 += 40LL * (v108 < v109);
                  if (v108 < v109) {
                    uint64_t v106 = v107;
                  }
                }

                __int128 v110 = *(_OWORD *)v105;
                __int128 v111 = *(_OWORD *)(v105 + 16);
                *(void *)(v103 + 32) = *(void *)(v105 + 32);
                *(_OWORD *)unint64_t v103 = v110;
                *(_OWORD *)(v103 + 16) = v111;
                unint64_t v103 = v105;
                uint64_t v102 = v106;
              }

              while (v106 <= (uint64_t)((unint64_t)(v101 - 2) >> 1));
              a2 -= 40LL;
              if (v105 == a2)
              {
                *(void *)(v105 + 32) = v156;
                *(_OWORD *)unint64_t v105 = v140;
                *(_OWORD *)(v105 + 16) = v150;
              }

              else
              {
                __int128 v112 = *(_OWORD *)a2;
                __int128 v113 = *(_OWORD *)(a2 + 16);
                *(void *)(v105 + 32) = *(void *)(a2 + 32);
                *(_OWORD *)unint64_t v105 = v112;
                *(_OWORD *)(v105 + 16) = v113;
                *(void *)(a2 + 32) = v156;
                *(_OWORD *)a2 = v140;
                *(_OWORD *)(a2 + 16) = v150;
                uint64_t v114 = v105 - v9 + 40;
                if (v114 >= 41)
                {
                  unint64_t v115 = (v114 / 0x28uLL - 2) >> 1;
                  unsigned int v116 = *(_DWORD *)(v105 + 32);
                  if (*(_DWORD *)(v9 + 40 * v115 + 32) < v116)
                  {
                    __int128 v130 = *(_OWORD *)v105;
                    __int128 v133 = *(_OWORD *)(v105 + 16);
                    int v117 = *(_DWORD *)(v105 + 36);
                    do
                    {
                      unint64_t v118 = v105;
                      unint64_t v105 = v9 + 40 * v115;
                      __int128 v119 = *(_OWORD *)v105;
                      __int128 v120 = *(_OWORD *)(v105 + 16);
                      *(void *)(v118 + 32) = *(void *)(v105 + 32);
                      *(_OWORD *)unint64_t v118 = v119;
                      *(_OWORD *)(v118 + 16) = v120;
                      if (!v115) {
                        break;
                      }
                      unint64_t v115 = (v115 - 1) >> 1;
                    }

                    while (*(_DWORD *)(v9 + 40 * v115 + 32) < v116);
                    *(_OWORD *)unint64_t v105 = v130;
                    *(_OWORD *)(v105 + 16) = v133;
                    *(_DWORD *)(v105 + 32) = v116;
                    *(_DWORD *)(v105 + 36) = v117;
                  }
                }
              }
            }

            while (v101-- > 2);
          }

          return;
        }

        unint64_t v12 = (unint64_t)v11 >> 1;
        unint64_t v13 = v9 + 40 * ((unint64_t)v11 >> 1);
        if ((unint64_t)v10 < 0x1401)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( (__int128 *)v13,  (__int128 *)a1,  (__int128 *)(a2 - 40));
        }

        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( (__int128 *)a1,  (__int128 *)v13,  (__int128 *)(a2 - 40));
          uint64_t v14 = 5 * v12;
          uint8x8_t v15 = (__int128 *)(a1 + 40 * v12 - 40);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( (__int128 *)(a1 + 40),  v15,  (__int128 *)(a2 - 80));
          unsigned int v16 = (__int128 *)(a1 + 40 + 8 * v14);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( (__int128 *)(a1 + 80),  v16,  (__int128 *)(a2 - 120));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,ProfileEventHelper::ProcessQueue(void)::{lambda(ShaderProfilerUSCSampleInfo const&,ShaderProfilerUSCSampleInfo&)#1} &,ShaderProfilerUSCSampleInfo*>( v15,  (__int128 *)v13,  v16);
          uint64_t v152 = *(void *)(a1 + 32);
          __int128 v134 = *(_OWORD *)a1;
          __int128 v142 = *(_OWORD *)(a1 + 16);
          __int128 v17 = *(_OWORD *)v13;
          __int128 v18 = *(_OWORD *)(v13 + 16);
          *(void *)(a1 + 32) = *(void *)(v13 + 32);
          *(_OWORD *)a1 = v17;
          *(_OWORD *)(a1 + 16) = v18;
          *(void *)(v13 + 32) = v152;
          *(_OWORD *)unint64_t v13 = v134;
          *(_OWORD *)(v13 + 16) = v142;
        }

        --a3;
        if ((a4 & 1) == 0)
        {
          unsigned int v19 = *(_DWORD *)(a1 + 32);
          if (*(_DWORD *)(a1 - 8) < v19) {
            goto LABEL_11;
          }
          __int128 v129 = *(_OWORD *)a1;
          __int128 v132 = *(_OWORD *)(a1 + 16);
          if (v19 >= *(_DWORD *)(a2 - 8))
          {
            unint64_t v41 = a1 + 40;
            do
            {
              unint64_t v9 = v41;
              if (v41 >= a2) {
                break;
              }
              unsigned int v42 = *(_DWORD *)(v41 + 32);
              v41 += 40LL;
            }

            while (v19 >= v42);
          }

          else
          {
            uint64_t v39 = a1;
            do
            {
              unint64_t v9 = v39 + 40;
              unsigned int v40 = *(_DWORD *)(v39 + 72);
              v39 += 40LL;
            }

            while (v19 >= v40);
          }

          unint64_t v43 = a2;
          if (v9 < a2)
          {
            unint64_t v44 = a2;
            do
            {
              unint64_t v43 = v44 - 40;
              unsigned int v45 = *(_DWORD *)(v44 - 8);
              v44 -= 40LL;
            }

            while (v19 < v45);
          }

          int v46 = *(_DWORD *)(a1 + 36);
          while (v9 < v43)
          {
            uint64_t v153 = *(void *)(v9 + 32);
            __int128 v135 = *(_OWORD *)v9;
            __int128 v144 = *(_OWORD *)(v9 + 16);
            __int128 v47 = *(_OWORD *)v43;
            __int128 v48 = *(_OWORD *)(v43 + 16);
            *(void *)(v9 + 32) = *(void *)(v43 + 32);
            *(_OWORD *)unint64_t v9 = v47;
            *(_OWORD *)(v9 + 16) = v48;
            *(void *)(v43 + 32) = v153;
            *(_OWORD *)unint64_t v43 = v135;
            *(_OWORD *)(v43 + 16) = v144;
            do
            {
              unsigned int v49 = *(_DWORD *)(v9 + 72);
              v9 += 40LL;
            }

            while (v19 >= v49);
            do
            {
              unsigned int v50 = *(_DWORD *)(v43 - 8);
              v43 -= 40LL;
            }

            while (v19 < v50);
          }

          uint64_t v51 = (__int128 *)(v9 - 40);
          if (v9 - 40 != a1)
          {
            __int128 v52 = *v51;
            __int128 v53 = *(_OWORD *)(v9 - 24);
            *(void *)(a1 + 32) = *(void *)(v9 - 8);
            *(_OWORD *)a1 = v52;
            *(_OWORD *)(a1 + 16) = v53;
          }

          a4 = 0;
          *uint64_t v51 = v129;
          *(_OWORD *)(v9 - 24) = v132;
          *(_DWORD *)(v9 - 8) = v19;
          *(_DWORD *)(v9 - 4) = v46;
          continue;
        }

        unsigned int v19 = *(_DWORD *)(a1 + 32);
LABEL_11:
        __int128 v128 = *(_OWORD *)a1;
        __int128 v131 = *(_OWORD *)(a1 + 16);
        int v20 = *(_DWORD *)(a1 + 36);
        unint64_t v21 = a1;
        do
        {
          unint64_t v22 = v21;
          v21 += 40LL;
        }

        while (*(_DWORD *)(v22 + 72) < v19);
        unint64_t v23 = a2;
        if (v22 == a1)
        {
          unint64_t v26 = a2;
          while (v21 < v26)
          {
            unint64_t v24 = v26 - 40;
            unsigned int v27 = *(_DWORD *)(v26 - 8);
            v26 -= 40LL;
            if (v27 < v19) {
              goto LABEL_21;
            }
          }

          unint64_t v24 = v26;
        }

        else
        {
          do
          {
            unint64_t v24 = v23 - 40;
            unsigned int v25 = *(_DWORD *)(v23 - 8);
            v23 -= 40LL;
          }

          while (v25 >= v19);
        }

@end