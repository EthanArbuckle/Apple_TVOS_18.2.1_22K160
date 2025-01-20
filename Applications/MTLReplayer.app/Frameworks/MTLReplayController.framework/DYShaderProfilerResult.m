@interface DYShaderProfilerResult
- (DYShaderProfilerResult)init;
- (DYShaderProfilerTiming)computeTiming;
- (DYShaderProfilerTiming)fragmentTiming;
- (DYShaderProfilerTiming)timing;
- (DYShaderProfilerTiming)vertexTiming;
- (NSArray)blitTimeData;
- (NSDictionary)derivedCountersData;
- (NSDictionary)encoderIndexToLabelMap;
- (NSMutableArray)averagePerDrawKickDurations;
- (NSMutableArray)drawCallInfoList;
- (NSMutableArray)effectiveKickTimes;
- (NSMutableArray)effectivePerEncoderDrawKickTimes;
- (NSMutableArray)encoderFunctionIndexList;
- (NSMutableArray)encoderInfoList;
- (NSMutableArray)loadActionTimes;
- (NSMutableArray)perCommandBufferEncoderCount;
- (NSMutableArray)programInfoList;
- (NSMutableArray)programPipelineInfoList;
- (NSMutableArray)shaderProfilingFrameTimes;
- (NSMutableArray)storeActionTimes;
- (NSMutableDictionary)blitEncoderTimeInfo;
- (NSMutableDictionary)encoderFunctionIndexToEncoderIndexMap;
- (double)gpuTime;
- (double)shaderProfilingTime;
- (id).cxx_construct;
- (unint64_t)frameTime;
- (unsigned)commandBufferCount;
- (unsigned)deviceUtilization;
- (unsigned)encoderCount;
- (void)buildDrawCallIndexMap;
- (void)setAveragePerDrawKickDurations:(id)a3;
- (void)setBlitEncoderTimeInfo:(id)a3;
- (void)setBlitTimeData:(id)a3;
- (void)setCommandBufferCount:(unsigned int)a3;
- (void)setComputeTiming:(DYShaderProfilerTiming *)a3;
- (void)setDerivedCountersData:(id)a3;
- (void)setDeviceUtilization:(unsigned int)a3;
- (void)setDrawCallInfoList:(id)a3;
- (void)setEffectiveKickTimes:(id)a3;
- (void)setEffectivePerEncoderDrawKickTimes:(id)a3;
- (void)setEncoderCount:(unsigned int)a3;
- (void)setEncoderIndexToLabelMap:(id)a3;
- (void)setFragmentTiming:(DYShaderProfilerTiming *)a3;
- (void)setFrameTime:(unint64_t)a3;
- (void)setGpuTime:(double)a3;
- (void)setLoadActionTimes:(id)a3;
- (void)setPerCommandBufferEncoderCount:(id)a3;
- (void)setProgramPipelineInfoList:(id)a3;
- (void)setShaderProfilingFrameTimes:(id)a3;
- (void)setShaderProfilingTime:(double)a3;
- (void)setStoreActionTimes:(id)a3;
- (void)setTiming:(DYShaderProfilerTiming *)a3;
- (void)setVertexTiming:(DYShaderProfilerTiming *)a3;
@end

@implementation DYShaderProfilerResult

- (DYShaderProfilerResult)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DYShaderProfilerResult;
  v3 = -[DYShaderProfilerResult init](&v20, "init");
  if (v3)
  {
    uint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v2);
    drawCallInfoList = v3->_drawCallInfoList;
    v3->_drawCallInfoList = (NSMutableArray *)v4;

    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
    programPipelineInfoList = v3->_programPipelineInfoList;
    v3->_programPipelineInfoList = (NSMutableArray *)v7;

    uint64_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v9);
    encoderInfoList = v3->_encoderInfoList;
    v3->_encoderInfoList = (NSMutableArray *)v10;

    uint64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v12);
    encoderFunctionIndexToEncoderIndexMap = v3->_encoderFunctionIndexToEncoderIndexMap;
    v3->_encoderFunctionIndexToEncoderIndexMap = (NSMutableDictionary *)v13;

    uint64_t v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray, v15);
    programInfoList = v3->_programInfoList;
    v3->_programInfoList = (NSMutableArray *)v16;

    v18 = v3;
  }

  return v3;
}

- (void)buildDrawCallIndexMap
{
  if (self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__deallocate_node((void *)self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_);
    self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_ = 0LL;
    unint64_t value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0LL; i != value; ++i)
        self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_[i] = 0LL;
    }

    self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_ = 0LL;
  }

  drawCallInfoList = self->_drawCallInfoList;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke;
  v6[3] = &unk_58EA70;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](drawCallInfoList, "enumerateObjectsUsingBlock:", v6);
}

- (NSMutableArray)drawCallInfoList
{
  return self->_drawCallInfoList;
}

- (void)setDrawCallInfoList:(id)a3
{
}

- (NSMutableArray)encoderInfoList
{
  return self->_encoderInfoList;
}

- (NSMutableArray)encoderFunctionIndexList
{
  return self->_encoderFunctionIndexList;
}

- (NSMutableArray)programInfoList
{
  return self->_programInfoList;
}

- (NSMutableArray)programPipelineInfoList
{
  return self->_programPipelineInfoList;
}

- (void)setProgramPipelineInfoList:(id)a3
{
}

- (NSMutableDictionary)encoderFunctionIndexToEncoderIndexMap
{
  return self->_encoderFunctionIndexToEncoderIndexMap;
}

- (DYShaderProfilerTiming)vertexTiming
{
  __int128 v3 = *(_OWORD *)&self->_time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self->_time.max;
  return self;
}

- (void)setVertexTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3 = *(_OWORD *)&a3->_cycle.average;
  __int128 v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_vertexTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_vertexTiming._cycle.max = v4;
  *(_OWORD *)&self->_vertexTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)fragmentTiming
{
  __int128 v3 = *(_OWORD *)&self[1]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[1]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[1]._time.max;
  return self;
}

- (void)setFragmentTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3 = *(_OWORD *)&a3->_cycle.average;
  __int128 v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_fragmentTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_fragmentTiming._cycle.max = v4;
  *(_OWORD *)&self->_fragmentTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)computeTiming
{
  __int128 v3 = *(_OWORD *)&self[2]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[2]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[2]._time.max;
  return self;
}

- (void)setComputeTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3 = *(_OWORD *)&a3->_cycle.average;
  __int128 v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_computeTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_computeTiming._cycle.max = v4;
  *(_OWORD *)&self->_computeTiming._cycle.average = v3;
}

- (NSMutableArray)effectiveKickTimes
{
  return self->_effectiveKickTimes;
}

- (void)setEffectiveKickTimes:(id)a3
{
}

- (NSMutableArray)effectivePerEncoderDrawKickTimes
{
  return self->_effectivePerEncoderDrawKickTimes;
}

- (void)setEffectivePerEncoderDrawKickTimes:(id)a3
{
}

- (NSMutableArray)averagePerDrawKickDurations
{
  return self->_averagePerDrawKickDurations;
}

- (void)setAveragePerDrawKickDurations:(id)a3
{
}

- (NSMutableArray)loadActionTimes
{
  return self->_loadActionTimes;
}

- (void)setLoadActionTimes:(id)a3
{
}

- (NSMutableArray)storeActionTimes
{
  return self->_storeActionTimes;
}

- (void)setStoreActionTimes:(id)a3
{
}

- (unsigned)commandBufferCount
{
  return self->_commandBufferCount;
}

- (void)setCommandBufferCount:(unsigned int)a3
{
  self->_commandBufferCount = a3;
}

- (NSMutableArray)perCommandBufferEncoderCount
{
  return self->_perCommandBufferEncoderCount;
}

- (void)setPerCommandBufferEncoderCount:(id)a3
{
}

- (NSDictionary)encoderIndexToLabelMap
{
  return self->_encoderIndexToLabelMap;
}

- (void)setEncoderIndexToLabelMap:(id)a3
{
}

- (NSDictionary)derivedCountersData
{
  return self->_derivedCountersData;
}

- (void)setDerivedCountersData:(id)a3
{
}

- (unint64_t)frameTime
{
  return self->_frameTime;
}

- (void)setFrameTime:(unint64_t)a3
{
  self->_frameTime = a3;
}

- (unsigned)deviceUtilization
{
  return self->_deviceUtilization;
}

- (void)setDeviceUtilization:(unsigned int)a3
{
  self->_deviceUtilization = a3;
}

- (double)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(double)a3
{
  self->_gpuTime = a3;
}

- (unsigned)encoderCount
{
  return self->_encoderCount;
}

- (void)setEncoderCount:(unsigned int)a3
{
  self->_encoderCount = a3;
}

- (NSArray)blitTimeData
{
  return self->_blitTimeData;
}

- (void)setBlitTimeData:(id)a3
{
}

- (NSMutableDictionary)blitEncoderTimeInfo
{
  return self->_blitEncoderTimeInfo;
}

- (void)setBlitEncoderTimeInfo:(id)a3
{
}

- (DYShaderProfilerTiming)timing
{
  __int128 v3 = *(_OWORD *)&self[3]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[3]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[3]._time.max;
  return self;
}

- (void)setTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3 = *(_OWORD *)&a3->_cycle.average;
  __int128 v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_timing._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_timing._cycle.max = v4;
  *(_OWORD *)&self->_timing._cycle.average = v3;
}

- (NSMutableArray)shaderProfilingFrameTimes
{
  return self->_shaderProfilingFrameTimes;
}

- (void)setShaderProfilingFrameTimes:(id)a3
{
}

- (double)shaderProfilingTime
{
  return self->_shaderProfilingTime;
}

- (void)setShaderProfilingTime:(double)a3
{
  self->_shaderProfilingTime = a3;
}

- (void).cxx_destruct
{
  unint64_t value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_perContextDrawCallCounterDY);
  objc_storeStrong((id *)&self->_allShaderBinaryInfo, 0LL);
  objc_storeStrong((id *)&self->_computeKernelBinaryInfo, 0LL);
  objc_storeStrong((id *)&self->_fragmentShaderBinaryInfo, 0LL);
  objc_storeStrong((id *)&self->_vertexShaderBinaryInfo, 0LL);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_drawCallInfoIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 58) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_DWORD *)self + 86) = 1065353216;
  return self;
}

void __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke(unint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v67 = v5;
  unsigned int v7 = [v5 functionIndex];
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(v6 + 320);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      a1 = v7;
      if (v9 <= v7) {
        a1 = v7 % v9;
      }
    }

    else
    {
      a1 = ((_DWORD)v9 - 1) & v7;
    }

    v11 = *(float ***)(*(void *)(v6 + 312) + 8 * a1);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(float **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v7)
        {
          if (*((void *)i + 2) == v7) {
            goto LABEL_74;
          }
        }

        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }

          else
          {
            v13 &= v9 - 1;
          }

          if (v13 != a1) {
            break;
          }
        }
      }
    }
  }

  v14 = (char *)operator new(0x40uLL);
  uint64_t v15 = (void *)(v6 + 328);
  v68[0] = v14;
  v68[1] = v6 + 328;
  *(void *)v14 = 0LL;
  *((void *)v14 + 1) = v8;
  *((void *)v14 + 2) = v8;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v69 = 1;
  float v16 = (float)(unint64_t)(*(void *)(v6 + 336) + 1LL);
  float v17 = *(float *)(v6 + 344);
  if (v9 && (float)(v17 * (float)v9) >= v16)
  {
    unint64_t v8 = a1;
    goto LABEL_64;
  }

  BOOL v18 = 1LL;
  if (v9 >= 3) {
    BOOL v18 = (v9 & (v9 - 1)) != 0;
  }
  unint64_t v19 = v18 | (2 * v9);
  unint64_t v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20) {
    int8x8_t prime = (int8x8_t)v20;
  }
  else {
    int8x8_t prime = (int8x8_t)v19;
  }
  if (*(void *)&prime == 1LL)
  {
    int8x8_t prime = (int8x8_t)2LL;
  }

  else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v9 = *(void *)(v6 + 320);
  }

  if (*(void *)&prime <= v9)
  {
    if (*(void *)&prime >= v9) {
      goto LABEL_60;
    }
    unint64_t v28 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 336) / *(float *)(v6 + 344));
    if (v9 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      unint64_t v28 = std::__next_prime(v28);
    }

    else
    {
      uint64_t v30 = 1LL << -(char)__clz(v28 - 1);
      if (v28 >= 2) {
        unint64_t v28 = v30;
      }
    }

    if (*(void *)&prime <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime >= v9)
    {
      unint64_t v9 = *(void *)(v6 + 320);
      goto LABEL_60;
    }

    if (!*(void *)&prime)
    {
      v65 = *(void **)(v6 + 312);
      *(void *)(v6 + 312) = 0LL;
      if (v65) {
        operator delete(v65);
      }
      unint64_t v9 = 0LL;
      *(void *)(v6 + 320) = 0LL;
      goto LABEL_60;
    }
  }

  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  v22 = operator new(8LL * *(void *)&prime);
  v23 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v22;
  if (v23) {
    operator delete(v23);
  }
  uint64_t v24 = 0LL;
  *(int8x8_t *)(v6 + 320) = prime;
  do
    *(void *)(*(void *)(v6 + 312) + 8 * v24++) = 0LL;
  while (*(void *)&prime != v24);
  v25 = (void *)*v15;
  if (*v15)
  {
    unint64_t v26 = v25[1];
    uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(void *)&prime) {
        v26 %= *(void *)&prime;
      }
    }

    else
    {
      v26 &= *(void *)&prime - 1LL;
    }

    *(void *)(*(void *)(v6 + 312) + 8 * v26) = v15;
    v31 = (void *)*v25;
    if (*v25)
    {
      do
      {
        unint64_t v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(void *)&prime) {
            v32 %= *(void *)&prime;
          }
        }

        else
        {
          v32 &= *(void *)&prime - 1LL;
        }

        if (v32 != v26)
        {
          uint64_t v33 = *(void *)(v6 + 312);
          if (!*(void *)(v33 + 8 * v32))
          {
            *(void *)(v33 + 8 * v32) = v25;
            goto LABEL_56;
          }

          void *v25 = *v31;
          void *v31 = **(void **)(*(void *)(v6 + 312) + 8 * v32);
          **(void **)(*(void *)(v6 + 312) + 8 * v32) = v31;
          v31 = v25;
        }

        unint64_t v32 = v26;
LABEL_56:
        v25 = v31;
        v31 = (void *)*v31;
        unint64_t v26 = v32;
      }

      while (v31);
    }
  }

  unint64_t v9 = (unint64_t)prime;
LABEL_60:
  if ((v9 & (v9 - 1)) != 0)
  {
    if (v9 <= v8) {
      v8 %= v9;
    }
  }

  else
  {
    unint64_t v8 = ((_DWORD)v9 - 1) & v8;
  }

@end