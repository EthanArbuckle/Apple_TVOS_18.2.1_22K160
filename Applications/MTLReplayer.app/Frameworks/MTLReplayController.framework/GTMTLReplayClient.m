@interface GTMTLReplayClient
@end

@implementation GTMTLReplayClient

void __GTMTLReplayClient_displayTexture_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 error]);
  [*(id *)(*(void *)(a1 + 40) + 280) setDisplayTextureEncoder:*(void *)(a1 + 32)];
}

void __GTMTLReplayClient_displayAttachment_block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 error]);
  [*(id *)(*(void *)(a1 + 40) + 280) setDisplayTextureEncoder:*(void *)(a1 + 32)];
}

void __GTMTLReplayClient_streamShaderProfilingData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8LL);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  uint64_t v128 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 64) objectForKeyedSubscript:@"useOverlap"]);
  id v129 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }
  byte_5B955A = v4;
  uint64_t v127 = v1 + 48;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  GTUSCSamplingStreamingManagerHelper::GatherCommandBufferRestoreInfo((uint64_t **)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  unsigned __int8 v7 = atomic_load(byte_5B979C);
  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v6);
    [v8 setObject:*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 56) forKeyedSubscript:@"MetalPluginName"];
    v182 = _NSConcreteStackBlock;
    uint64_t v183 = 3221225472LL;
    uint64_t v184 = (uint64_t)___ZN35GTUSCSamplingStreamingManagerHelper23StreamHarvestedBinariesEv_block_invoke;
    v185 = (__n128 (*)(__n128 *, __n128 *))&unk_58F270;
    v187 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
    v9 = v8;
    v186 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v182));
    [v10 setQueuePriority:-8];
    [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v10];
    [v10 waitUntilFinished];
    (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16LL))();
  }

  unsigned __int8 v11 = atomic_load(byte_5B979C);
  if ((v11 & 1) == 0)
  {
    id v125 = *(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:@"perEncoderDrawCallCount"]);
    id v123 = [v12 count];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v125 objectForKeyedSubscript:@"perCommandBufferEncoderCount"]);
    id v14 = [v13 count];

    v16 = (void *)objc_opt_new(&OBJC_CLASS___NSOperation, v15);
    v17 = (GTUSCSamplingStreamingManagerHelper *)[*((id *)&xmmword_5B8CE0 + 1) count];
    if (v17)
    {
      GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v17);
      v136 = v16;
      v182 = 0LL;
      uint64_t v183 = (uint64_t)&v182;
      uint64_t v184 = 0x4812000000LL;
      v185 = __Block_byref_object_copy__315;
      v186 = __Block_byref_object_dispose__316;
      v187 = (__int128 *)"";
      v18 = (char *)operator new(0x78uLL);
      uint64_t v19 = 0LL;
      v188[0] = v18;
      v188[2] = v18 + 120;
      do
      {
        v20 = &v18[v19];
        *(_OWORD *)v20 = 0uLL;
        *((_OWORD *)v20 + 1) = 0uLL;
        *((_DWORD *)v20 + 8) = 1065353216;
        v19 += 40LL;
      }

      while (v19 != 120);
      uint64_t v21 = 0LL;
      v188[1] = v18 + 120;
      do
      {
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( *(void *)(v183 + 48) + v21,  vcvtps_u32_f32((float)(unint64_t)(6LL * (void)v123) / *(float *)(*(void *)(v183 + 48) + v21 + 32)));
        v21 += 40LL;
      }

      while (v21 != 120);
      v22 = objc_autoreleasePoolPush();
      uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
      uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
      objc_autoreleasePoolPop(v22);
      v134 = (void *)v24;
      v130 = (void *)v23;
      v25 = (char *)operator new(0x48uLL);
      uint64_t v26 = 0LL;
      *((void *)v25 + 8) = 0LL;
      *((_OWORD *)v25 + 2) = 0u;
      *((_OWORD *)v25 + 3) = 0u;
      *(_OWORD *)v25 = 0u;
      *((_OWORD *)v25 + 1) = 0u;
      v146.__begin_ = (std::vector<unsigned int>::pointer)v25;
      v146.__end_ = (std::vector<unsigned int>::pointer)(v25 + 72);
      unint64_t v27 = 2LL * (void)v14;
      v146.__end_cap_.__value_ = (unsigned int *)(v25 + 72);
      do
      {
        std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long>>::reserve( (void **)&v25[v26],  v27);
        v26 += 24LL;
      }

      while (v26 != 72);
      v28 = 0LL;
      int v29 = 0;
      int v30 = *(_DWORD *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 68);
      do
      {
        v31 = objc_autoreleasePoolPush();
        v33 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v32);
        v35 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, v34);
        [v134 addObject:v35];

        objc_autoreleasePoolPop(v31);
        v173 = (const __CFString *)_NSConcreteStackBlock;
        uint64_t v174 = 3221225472LL;
        v175 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke;
        v176 = (const __CFString *)&unk_58D860;
        int v180 = v30;
        int v181 = v29;
        v178 = &v182;
        v179 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v36 = v33;
        v177 = v36;
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v173));
        [v37 setQueuePriority:-8];
        if (v28) {
          [v37 addDependency:v28];
        }
        [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v37];
        if (dword_5B9514 && dword_5B9510)
        {
          v166 = (const __CFString *)_NSConcreteStackBlock;
          uint64_t v167 = 3221225472LL;
          v168 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_2;
          v169 = (const __CFString *)&unk_58D888;
          v171 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
          id v170 = v134;
          int v172 = v29;
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v166));
          [v38 addDependency:v37];
          [v136 addDependency:v38];
          [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v38];
        }

        else
        {
          [v136 addDependency:v37];
        }

        v159 = _NSConcreteStackBlock;
        uint64_t v160 = 3221225472LL;
        v161 = ___ZN35GTUSCSamplingStreamingManagerHelper19StreamFrameTimeDataEv_block_invoke_3;
        v162 = &unk_58EDA8;
        v165 = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
        v39 = v36;
        v163 = v39;
        id v132 = v130;
        id v164 = v132;
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v159));
        [v40 addDependency:v37];
        id v138 = v40;

        [v136 addDependency:v138];
        [*(id *)(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8) addOperation:v138];

        ++v29;
        v28 = v138;
      }

      while (v29 != 3);
      [*(id *)(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) + 8) addOperation:v136];
      [v136 waitUntilFinished];
      v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
      LODWORD(v41) = 0;
      memset(&v192, 0, sizeof(v192));
      for (uint64_t i = 24LL; i != 144; i += 40LL)
      {
        uint64_t v43 = *(void *)(v183 + 48);
        int v44 = *(_DWORD *)(v43 + i);
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v183 + 56) - v43) >> 3)));
        [v140 addObject:v45];

        std::vector<unsigned int>::size_type v41 = (v41 + v44);
      }

      std::vector<unsigned int>::reserve(&v192, v41);
      for (uint64_t j = 0LL; j != 3; ++j)
      {
        v47 = *(uint64_t **)(*(void *)(v183 + 48) + 40 * j + 16);
        if (v47)
        {
          uint64_t v142 = j;
          value = v192.__end_cap_.__value_;
          begin = v192.__begin_;
          do
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v47 + 7)));
            v189 = v50;
            v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v47 + 8)));
            v190 = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v47 + 9)));
            v191 = v52;
            v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v189,  3LL));
            v54 = (void *)objc_claimAutoreleasedReturnValue([v140 objectAtIndexedSubscript:v142]);
            v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v47 + 4)));
            [v54 setObject:v53 forKeyedSubscript:v55];

            std::vector<unsigned int>::pointer end = v192.__end_;
            if (v192.__end_ >= value)
            {
              uint64_t v58 = v192.__end_ - begin;
              unint64_t v59 = v58 + 1;
              if ((unint64_t)(v58 + 1) >> 62)
              {
                v192.__end_cap_.__value_ = value;
                v192.__begin_ = begin;
                abort();
              }

              else {
                unint64_t v60 = v59;
              }
              if (v60) {
                unint64_t v60 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v60);
              }
              else {
                uint64_t v61 = 0LL;
              }
              v62 = (unsigned int *)(v60 + 4 * v58);
              unsigned int *v62 = *((_DWORD *)v47 + 4);
              v57 = v62 + 1;
              while (end != begin)
              {
                unsigned int v63 = *--end;
                *--v62 = v63;
              }

              value = (unsigned int *)(v60 + 4 * v61);
              v192.__end_ = v57;
              if (begin) {
                operator delete(begin);
              }
              begin = v62;
            }

            else
            {
              *v192.__end_ = *((_DWORD *)v47 + 4);
              v57 = end + 1;
            }

            v192.__end_ = v57;
            v47 = (uint64_t *)*v47;
          }

          while (v47);
          v192.__end_cap_.__value_ = value;
          v192.__begin_ = begin;
          uint64_t j = v142;
        }
      }

      id v145 = 0LL;
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v140,  1LL,  &v145));
      id v65 = v145;
      v66 = v192.__begin_;
      v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v192.__begin_,  (char *)v192.__end_ - (char *)v192.__begin_));
      *(void *)&__int128 v147 = @"Frame Time Data";
      *((void *)&v147 + 1) = @"Encoder TraceId Data";
      *(void *)&__int128 v153 = v132;
      *((void *)&v153 + 1) = v67;
      v148[0] = (std::vector<unsigned int>::size_type)@"Num Encoders";
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v123));
      __n[0] = (std::vector<unsigned int>::size_type)v68;
      v148[1] = (std::vector<unsigned int>::size_type)@"Num Ring Buffers";
      v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  qword_5B9548));
      __n[1] = (std::vector<unsigned int>::size_type)v69;
      v155 = &off_5A0490;
      v149 = @"Num Frame Iterations";
      v150 = @"Sample Marker";
      v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  qword_5B8CF0));
      v156 = v70;
      v157 = v64;
      v151 = @"TraceId to SampleIndex";
      v152 = @"Frame Encoder Times Data";
      v158 = v134;
      v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v153,  &v147,  8LL));

      (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16LL))();
      if (v66)
      {
        v192.__end_ = v66;
        operator delete(v66);
      }

      v192.__begin_ = (std::vector<unsigned int>::pointer)&v146;
      std::vector<std::vector<DYMTLEncoderInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v192);

      _Block_object_dispose(&v182, 8);
      v146.__begin_ = (std::vector<unsigned int>::pointer)v188;
      std::vector<std::unordered_map<unsigned int,GTEncoderSampleIndexInfo>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v146);

      v16 = v136;
    }
  }

  unsigned __int8 v72 = atomic_load(byte_5B979C);
  if ((v72 & 1) == 0)
  {
    __int128 v153 = 0u;
    *(_OWORD *)__n = 0u;
    LODWORD(v155) = 1065353216;
    __int128 v147 = 0u;
    *(_OWORD *)v148 = 0u;
    LODWORD(v149) = 1065353216;
    v137 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
    v139 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v73);
    v133 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, v74);
    v135 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, v75);
    id v76 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData( 0,  v137,  v133,  (uint64_t)&v153,  0LL);
    v122 = (void *)objc_claimAutoreleasedReturnValue(v76);
    id v77 = GTUSCSamplingStreamingManagerHelper::GatherFrameMiscEncoderPostProcessedData( 1,  v139,  v135,  (uint64_t)&v147,  v122);
    v124 = (void *)objc_claimAutoreleasedReturnValue(v77);
    [v124 waitUntilFinished];
    v143 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  __n[1]));
    memset(&v146, 0, sizeof(v146));
    std::vector<unsigned int>::reserve(&v146, __n[1]);
    std::vector<unsigned int>::size_type v78 = __n[0];
    if (__n[0])
    {
      v79 = v146.__end_cap_.__value_;
      v80 = v146.__begin_;
      do
      {
        v81 = (unsigned int *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v78 + 28)));
        v192.__begin_ = v81;
        v82 = (unsigned int *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v78 + 32)));
        v192.__end_ = v82;
        v83 = (unsigned int *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v78 + 36)));
        v192.__end_cap_.__value_ = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v192, 3LL));
        v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v78 + 16)));
        [v143 setObject:v84 forKeyedSubscript:v85];

        std::vector<unsigned int>::pointer v86 = v146.__end_;
        if (v146.__end_ >= v79)
        {
          uint64_t v88 = v146.__end_ - v80;
          unint64_t v89 = v88 + 1;
          if ((unint64_t)(v88 + 1) >> 62)
          {
            v146.__begin_ = v80;
            abort();
          }

          else {
            unint64_t v90 = v89;
          }
          if (v90) {
            unint64_t v90 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v90);
          }
          else {
            uint64_t v91 = 0LL;
          }
          v92 = (unsigned int *)(v90 + 4 * v88);
          unsigned int *v92 = *(_DWORD *)(v78 + 16);
          v87 = v92 + 1;
          while (v86 != v80)
          {
            unsigned int v93 = *--v86;
            *--v92 = v93;
          }

          v79 = (unsigned int *)(v90 + 4 * v91);
          v146.__end_ = v87;
          if (v80) {
            operator delete(v80);
          }
          v80 = v92;
        }

        else
        {
          *v146.__end_ = *(_DWORD *)(v78 + 16);
          v87 = v86 + 1;
        }

        v146.__end_ = v87;
        std::vector<unsigned int>::size_type v78 = *(void *)v78;
      }

      while (v78);
      v146.__end_cap_.__value_ = v79;
      v146.__begin_ = v80;
    }

    else
    {
      v80 = v146.__begin_;
      v87 = v146.__end_;
    }

    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(v80, v87, &v182);
    v141 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v148[1]));
    std::vector<unsigned int>::reserve(&v146, v148[1]);
    std::vector<unsigned int>::size_type v94 = v148[0];
    if (v148[0])
    {
      v95 = 0LL;
      unint64_t v96 = 0LL;
      v97 = 0LL;
      do
      {
        v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v94 + 28)));
        v189 = v98;
        v99 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v94 + 32)));
        v190 = v99;
        v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v94 + 36)));
        v191 = v100;
        v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v189,  3LL));
        v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(v94 + 16)));
        [v141 setObject:v101 forKeyedSubscript:v102];

        if ((unint64_t)v95 >= v96)
        {
          uint64_t v104 = (v95 - v97) >> 2;
          unint64_t v105 = v104 + 1;
          else {
            unint64_t v106 = v105;
          }
          if (v106) {
            unint64_t v106 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v106);
          }
          else {
            uint64_t v107 = 0LL;
          }
          v108 = (char *)(v106 + 4 * v104);
          *(_DWORD *)v108 = *(_DWORD *)(v94 + 16);
          v103 = v108 + 4;
          while (v95 != v97)
          {
            int v109 = *((_DWORD *)v95 - 1);
            v95 -= 4;
            *((_DWORD *)v108 - 1) = v109;
            v108 -= 4;
          }

          unint64_t v96 = v106 + 4 * v107;
          if (v97) {
            operator delete(v97);
          }
          v97 = v108;
        }

        else
        {
          *(_DWORD *)v95 = *(_DWORD *)(v94 + 16);
          v103 = v95 + 4;
        }

        std::vector<unsigned int>::size_type v94 = *(void *)v94;
        v95 = v103;
      }

      while (v94);
    }

    else
    {
      v103 = 0LL;
      v97 = 0LL;
    }

    std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(v97, v103, &v182);
    v110 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v146.__begin_,  (char *)v146.__end_ - (char *)v146.__begin_));
    v131 = (__n128 (*)(__n128 *, __n128 *))objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v97,  v103 - v97));
    id v145 = 0LL;
    v126 = (void **)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v143,  1LL,  &v145));
    id v111 = v145;
    id v144 = v111;
    v112 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v141,  1LL,  &v144));
    id v121 = v144;

    v173 = @"Blit Encoder Frame Data";
    uint64_t v174 = (uint64_t)@"Blit Encoder Info";
    v182 = (void **)v137;
    uint64_t v183 = (uint64_t)v110;
    v175 = (void (*)(uint64_t))@"Blit Split Encoder Frame Data";
    v176 = @"Blit Split Encoder Info";
    uint64_t v184 = (uint64_t)v139;
    v185 = v131;
    v177 = @"Blit Encoder Indices";
    v113 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue( [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"blitEncoderIndices"]);
    v186 = v113;
    v178 = (void ***)@"Encoder Draw Call Count";
    v114 = (__int128 *)objc_claimAutoreleasedReturnValue( [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"activePerEncoderDrawCallCount"]);
    v187 = v114;
    v179 = (__int128 *)@"Source Sample Marker";
    v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  qword_5B8CF0));
    v188[0] = v115;
    v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v182,  &v173,  7LL));
    v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v116));

    if (dword_5B9514 && dword_5B9510)
    {
      v166 = @"Blit TraceId to Sample Index";
      uint64_t v167 = (uint64_t)@"Blit Encoder Time Data";
      v159 = v126;
      uint64_t v160 = (uint64_t)v133;
      v168 = (void (*)(uint64_t))@"Blit Split TraceId to Sample Index";
      v169 = @"Blit Split Encoder Time Data";
      v161 = v112;
      v162 = v135;
      v118 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v159,  &v166,  4LL));
      [v117 addEntriesFromDictionary:v118];
    }

    (*(void (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 32) + 16LL))();
    NSLog(@"Sent Blit Misc Data");

    if (v97) {
      operator delete(v97);
    }

    if (v146.__begin_) {
      operator delete(v146.__begin_);
    }

    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v147);
    v5 = (GTUSCSamplingStreamingManagerHelper *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v153);
  }

  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v119);
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
  (*(void (**)(void))(*(void *)(v128 + 80) + 16LL))();
  unint64_t v120 = atomic_load((unint64_t *)&xmmword_5B9770);
  if (v120 == v127) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_streamDerivedCounterData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8LL);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 7LL));
  v5 = (void *)qword_5B9498;
  qword_5B9498 = v4;

  uint64_t v6 = (void *)qword_5B94A0;
  qword_5B94A0 = 0LL;

  for (uint64_t i = 0LL; i != 7; ++i)
  {
    v8 = (void *)qword_5B9498;
    v9 = (void *)objc_claimAutoreleasedReturnValue([&off_59F830 objectAtIndexedSubscript:i]);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[GPURawCounterSelect selectWithName:options:]( &OBJC_CLASS___GPURawCounterSelect,  "selectWithName:options:",  v9,  0LL));
    [v8 addObject:v10];
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  v12 = (void *)qword_5B94D8;
  qword_5B94D8 = v11;

  v13 = (void *)qword_5B94D8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GPURawCounterSourceTriggerSelect selectWithName:options:]( &OBJC_CLASS___GPURawCounterSourceTriggerSelect,  "selectWithName:options:",  @"KickBoundary",  0LL));
  [v13 addObject:v14];

  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  v16 = (void *)*((void *)&xmmword_5B94C8 + 1);
  *((void *)&xmmword_5B94C8 + 1) = v15;

  v17 = (void *)*((void *)&xmmword_5B94C8 + 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[GPURawCounterSourceTriggerSelect selectWithName:options:]( &OBJC_CLASS___GPURawCounterSourceTriggerSelect,  "selectWithName:options:",  @"TimerNClock",  &off_59FC78));
  [v17 addObject:v18];

  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v19);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v20);
  (*(void (**)(void))(*(void *)(v1 + 80) + 16LL))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
  unint64_t v21 = atomic_load((unint64_t *)&xmmword_5B9770);
  if (v21 == v1 + 48) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_streamBatchFilteredData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8LL);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  GTUSCSamplingStreamingManagerHelper::Init((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v2);
  id v3 = (GTUSCSamplingStreamingManagerHelper *)dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
  GTUSCSamplingStreamingManagerHelper::SetupGPURawCounters(v3);
  if ((_DWORD)qword_5B9550 != -1) {
    GTAGXProfilingSupportHelper::Initialize((GTAGXProfilingSupportHelper *)qword_5B9490, v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16),  "objectForKeyedSubscript:",  @"encoderBatchPriorityList",  v1 + 48));
  uint64_t v6 = -[GTBatchedCounterManager initWithEncoderBatchPriorityList:]( objc_alloc(&OBJC_CLASS___GTBatchedCounterManager),  "initWithEncoderBatchPriorityList:",  v5);
  id v7 = qword_5B9560;
  qword_5B9560 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"pause"]);
  if (!v8) {
    [qword_5B9560 resume];
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 7LL));
  v10 = (void *)qword_5B9498;
  qword_5B9498 = v9;

  for (uint64_t i = 0LL; i != 7; ++i)
  {
    v12 = (void *)qword_5B9498;
    v13 = (void *)objc_claimAutoreleasedReturnValue([&off_59F830 objectAtIndexedSubscript:i]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[GPURawCounterSelect selectWithName:options:]( &OBJC_CLASS___GPURawCounterSelect,  "selectWithName:options:",  v13,  0LL));
    [v12 addObject:v14];
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"perEncoderDrawCallCount"]);
  id v16 = [v15 count];

  id v17 = [v5 count];
  if (v17 <= v16) {
    id v18 = v16;
  }
  else {
    id v18 = v17;
  }
  unint64_t v19 = 2LL * (void)v18;
  uint64_t v20 = *((void *)&xmmword_5B9568 + 1);
  unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&xmmword_5B9568 + 1) - xmmword_5B9568) >> 3);
  unint64_t v22 = v19 - v21;
  if (v19 <= v21)
  {
    if (v19 >= v21)
    {
      uint64_t v25 = *((void *)&xmmword_5B9568 + 1);
      goto LABEL_29;
    }

    uint64_t v25 = xmmword_5B9568 + 24 * v19;
    if (*((void *)&xmmword_5B9568 + 1) != v25)
    {
      uint64_t v26 = *((void *)&xmmword_5B9568 + 1);
      do
      {
        v28 = *(void **)(v26 - 24);
        v26 -= 24LL;
        unint64_t v27 = v28;
        if (v28)
        {
          *(void *)(v20 - 16) = v27;
          operator delete(v27);
        }

        uint64_t v20 = v26;
      }

      while (v26 != v25);
    }

void __GTMTLReplayClient_collectGPUShaderTimelineData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8LL);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 64) objectForKeyedSubscript:@"useOverlap"]);
  id v9 = v2;
  if (v2) {
    unsigned __int8 v4 = objc_msgSend(v2, "BOOLValue", v2);
  }
  else {
    unsigned __int8 v4 = 1;
  }
  byte_5B955A = v4;
  GTUSCSamplingStreamingManagerHelper::InitQueryShaderInfo((GTUSCSamplingStreamingManagerHelper *)(v1 + 48), v3);
  HIDWORD(qword_5B9550) = 1;
  GTUSCSamplingStreamingManagerHelper::SetupMTLCounterAPIBuffer(v5);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = ___ZN35GTUSCSamplingStreamingManagerHelper17StreamGPUTimelineEv_block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v10));
  GTUSCSamplingStreamingManagerHelper::StreamShaderProfilingData((GTUSCSamplingStreamingManagerHelper *)[**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v7]);

  (*(void (**)(void))(*(void *)(v1 + 80) + 16LL))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
  unint64_t v8 = atomic_load((unint64_t *)&xmmword_5B9770);
  if (v8 == v1 + 48) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_collectAPSData_block_invoke(GTUSCSamplingStreamingManagerHelper *a1)
{
  uint64_t v1 = *(void *)(*((void *)a1 + 4) + 8LL);
  GTUSCSamplingStreamingManagerHelper::Instance(a1);
  uint64_t v153 = v1;
  id v147 = (id)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 64) objectForKeyedSubscript:@"apsProfilingConfig"]);
  if (v147)
  {
    id v2 = v147;
    id v3 = (GTUSCSamplingStreamingManager *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"fractionOfCores"]);
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"thresholdInSeconds"]);
    v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      *((void *)&xmmword_5B9928 + 1) = v6;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"drawCountThreshold"]);
    unint64_t v8 = v7;
    if (v7) {
      qword_5B9938 = (uint64_t)[v7 unsignedLongLongValue];
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"usingMinimumTracingMode"]);
    v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 BOOLValue];
      uint64_t v12 = 2LL;
      if (!v11) {
        uint64_t v12 = 0LL;
      }
      qword_5B9940 = qword_5B9940 & 0xFFFFFFFFFFFFFFFDLL | v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v14 = [v13 BOOLForKey:@"GPUDebugger.ShaderProfiler.ForceMinTracingMode"];

      if (v14) {
        qword_5B9940 |= 2uLL;
      }
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"usedCoreMasks"]);
    id v16 = v15;
    if (v15 && [v15 count])
    {
      std::vector<BOOL>::resize((uint64_t)&qword_5B9948, (unint64_t)[v16 count], 0);
      __int128 v156 = 0u;
      __int128 v157 = 0u;
      __int128 v154 = 0u;
      __int128 v155 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v154 objects:&v158 count:16];
      if (v18)
      {
        id v145 = v10;
        v149 = v5;
        v151 = v3;
        uint64_t v19 = 0LL;
        unsigned int v20 = 0;
        uint64_t v21 = *(void *)v155;
        do
        {
          for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v155 != v21) {
              objc_enumerationMutation(v17);
            }
            unsigned int v23 = [*(id *)(*((void *)&v154 + 1) + 8 * (void)i) BOOLValue];
            unint64_t v24 = ((unint64_t)i + v19) >> 6;
            uint64_t v25 = 1LL << (v19 + i);
            if (v23) {
              uint64_t v26 = *(void *)(qword_5B9948 + 8 * v24) | v25;
            }
            else {
              uint64_t v26 = *(void *)(qword_5B9948 + 8 * v24) & ~v25;
            }
            *(void *)(qword_5B9948 + 8 * v24) = v26;
            v20 += v23;
          }

          id v18 = [v17 countByEnumeratingWithState:&v154 objects:&v158 count:16];
          v19 += (uint64_t)i;
        }

        while (v18);
        double v27 = (double)v20;
        v5 = v149;
        id v3 = v151;
        v10 = v145;
      }

      else
      {
        double v27 = 0.0;
      }

      uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  v27 / (double)(unint64_t)[v17 count]));
      id v3 = (GTUSCSamplingStreamingManager *)v28;
    }

    if (v3)
    {
      -[GTUSCSamplingStreamingManager doubleValue](v3, "doubleValue");
      *(void *)&xmmword_5B9928 = v29;
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"useOverlap"]);
    v31 = v30;
    if (v30) {
      unsigned int v32 = [v30 BOOLValue];
    }
    else {
      unsigned int v32 = 1;
    }
    qword_5B9940 = qword_5B9940 & 0xFFFFFFFFFFFFFFFELL | v32;
  }

  id v144 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v153 + 64) objectForKeyedSubscript:@"useOverlap"]);
  if (v144)
  {
    unsigned int v33 = [v144 BOOLValue];
    qword_5B9940 = qword_5B9940 & 0xFFFFFFFFFFFFFFFELL | v33;
    byte_5B955A = v33;
  }

  LODWORD(xmmword_5B955C) = 0;
  *(void *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance = v153 + 48;
  v152 = (GTUSCSamplingStreamingManagerHelper *)(v153 + 48);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(v153 + 48) + 8) defaultDevice]);
  id v35 = DEVICEOBJECT(v34);
  unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  CFTypeRef v37 = GTProfilerConfigurationVariables((io_registry_entry_t)[v36 acceleratorPort]);
  uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
  uint64_t v39 = (void *)qword_5B9490;
  qword_5B9490 = v38;

  id v40 = (id)qword_5B9490;
  std::vector<unsigned int>::size_type v41 = v40;
  if (!qword_5B9950)
  {
    id v146 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"num_cores"]);
    unsigned int v150 = [v42 unsignedIntValue];

    if (*(double *)&xmmword_5B9928 >= 1.0)
    {
      std::vector<BOOL>::resize((uint64_t)&qword_5B9948, v150, 1);
    }

    else
    {
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", @"core_mask_list", *(double *)&xmmword_5B9928));
      unsigned int v44 = [v43 count];
      if (v44 <= 1) {
        int v45 = 1;
      }
      else {
        int v45 = v44;
      }
      unsigned int v148 = v45;
      std::vector<BOOL>::resize((uint64_t)&qword_5B9948, v150, 0);
      double v46 = *(double *)&xmmword_5B9928;
      id v47 = [v43 count];
      if (v47)
      {
        v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>((unint64_t)v47);
        v50 = &v48[24 * v49];
      }

      else
      {
        v48 = 0LL;
        v50 = 0LL;
      }

      unint64_t v51 = 0LL;
      double v52 = v46 * (double)v150;
      unint64_t v143 = v150 / v148;
      int v142 = (int)(ceil(v52) / (double)v148);
      uint64_t v141 = vcvtpd_s64_f64(v52) - v148 * v142;
      unint64_t v53 = (unint64_t)v48;
      while (v51 < (unint64_t)objc_msgSend(v43, "count", v141))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue([v43 objectAtIndexedSubscript:v51]);
        id v55 = [v54 unsignedLongLongValue];

        uint8x8_t v56 = (uint8x8_t)vcnt_s8((int8x8_t)v55);
        v56.i16[0] = vaddlv_u8(v56);
        int v57 = -v56.i32[0];
        if (v53 >= (unint64_t)v50)
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - (void)v48) >> 3) + 1;
          if (v58 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          if (0x5555555555555556LL * ((v50 - v48) >> 3) > v58) {
            unint64_t v58 = 0x5555555555555556LL * ((v50 - v48) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v50 - v48) >> 3) >= 0x555555555555555LL) {
            unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v59 = v58;
          }
          if (v59) {
            unint64_t v59 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<NSObject  {objcproto21OS_dispatch_semaphore}* {__strong}>>>(v59);
          }
          else {
            uint64_t v60 = 0LL;
          }
          unint64_t v61 = v59 + 8 * ((uint64_t)(v53 - (void)v48) >> 3);
          *(_DWORD *)unint64_t v61 = v57;
          *(void *)(v61 + 8) = v51;
          *(void *)(v61 + 16) = v55;
          if ((char *)v53 == v48)
          {
            unsigned int v63 = (char *)(v59 + 8 * ((uint64_t)(v53 - (void)v48) >> 3));
            std::vector<unsigned int>::size_type v41 = v146;
          }

          else
          {
            unint64_t v62 = v59 + 8 * ((uint64_t)(v53 - (void)v48) >> 3);
            std::vector<unsigned int>::size_type v41 = v146;
            do
            {
              unsigned int v63 = (char *)(v62 - 24);
              __int128 v64 = *(_OWORD *)(v53 - 24);
              *(void *)(v62 - 8) = *(void *)(v53 - 8);
              *(_OWORD *)(v62 - 24) = v64;
              v53 -= 24LL;
              v62 -= 24LL;
            }

            while ((char *)v53 != v48);
          }

          v50 = (char *)(v59 + 24 * v60);
          unint64_t v53 = v61 + 24;
          if (v48) {
            operator delete(v48);
          }
          v48 = v63;
        }

        else
        {
          *(_DWORD *)unint64_t v53 = v57;
          *(void *)(v53 + 8) = v51;
          *(void *)(v53 + 16) = v55;
          v53 += 24LL;
        }

        ++v51;
      }

      unint64_t v65 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v53 - (void)v48) >> 3));
      else {
        uint64_t v66 = v65;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<int,unsigned long,unsigned long long> *,false>( (unint64_t)v48,  v53,  v66,  1);
      if ((char *)v53 != v48)
      {
        unint64_t v67 = 0LL;
        uint64_t v68 = v150 / v148;
        if (v143 <= 1) {
          uint64_t v68 = 1LL;
        }
        v69 = v48;
        do
        {
          else {
            int v70 = -1;
          }
          if (v148 <= v150)
          {
            uint64_t v71 = 0LL;
            unint64_t v72 = *((void *)v69 + 1) * v143;
            uint64_t v73 = qword_5B9948;
            int v74 = v142;
            do
            {
              if (v74 <= v70) {
                break;
              }
              uint64_t v75 = *((void *)v69 + 2);
              if ((v75 & (1 << v71)) != 0)
              {
                *((void *)v69 + 2) = v75 & ~(1 << v71);
                --v74;
                *(void *)(v73 + (((v72 + v71) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << (v72
                                                                                        + v71);
              }

              ++v71;
            }

            while (v68 != v71);
          }

          ++v67;
          v69 += 24;
        }

        while (v69 != (char *)v53);
      }

      if (v48) {
        operator delete(v48);
      }
    }
  }

  uint64_t v158 = 0LL;
  v159 = &v158;
  uint64_t v160 = 0x3032000000LL;
  v161 = __Block_byref_object_copy_;
  v162 = __Block_byref_object_dispose_;
  id v163 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v76);
  *(void *)&__int128 v154 = _NSConcreteStackBlock;
  *((void *)&v154 + 1) = 3221225472LL;
  *(void *)&__int128 v155 = ___ZN35GTUSCSamplingStreamingManagerHelper18CalculateFrameTimeEv_block_invoke;
  *((void *)&v155 + 1) = &unk_58F698;
  *(void *)&__int128 v156 = &v158;
  *((void *)&v156 + 1) = &GTUSCSamplingStreamingManagerHelper::Instance(void)::instance;
  id v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v154));
  [**(id **)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 8) addOperation:v77];
  [v77 waitUntilFinished];
  if ([(id)v159[5] count])
  {
    std::vector<unsigned int>::size_type v78 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:0]);
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectAtIndexedSubscript:1]);
    [v79 doubleValue];
    double v81 = v80;
  }

  else
  {
    double v81 = 0.0;
  }

  if ([(id)v159[5] count])
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:0]);
    v83 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndexedSubscript:0]);
    [v83 doubleValue];
    double v85 = v84;

    double v86 = v81 - v85;
  }

  else
  {
    double v86 = 0.0;
  }

  for (unint64_t j = 1; j < (unint64_t)[(id)v159[5] count]; ++j)
  {
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:j]);
    unint64_t v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectAtIndexedSubscript:1]);
    [v89 doubleValue];
    BOOL v91 = v81 < v90;

    if (v91)
    {
      v92 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:j]);
      unsigned int v93 = (void *)objc_claimAutoreleasedReturnValue([v92 objectAtIndexedSubscript:1]);
      [v93 doubleValue];
      double v95 = v94;
      unint64_t v96 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:j]);
      v97 = (void *)objc_claimAutoreleasedReturnValue([v96 objectAtIndexedSubscript:0]);
      [v97 doubleValue];
      if (v81 >= v98) {
        double v99 = v81;
      }
      else {
        double v99 = v98;
      }

      double v86 = v86 + v95 - v99;
    }

    v100 = (void *)objc_claimAutoreleasedReturnValue([(id)v159[5] objectAtIndexedSubscript:j]);
    v101 = (void *)objc_claimAutoreleasedReturnValue([v100 objectAtIndexedSubscript:1]);
    [v101 doubleValue];
    if (v81 < v102) {
      double v81 = v102;
    }
  }

  qword_5B9920 = *(void *)&v86;

  _Block_object_dispose(&v158, 8);
  char v104 = qword_5B9940;
  if ((qword_5B9940 & 2) == 0)
  {
    unint64_t v105 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v153 + 64) objectForKeyedSubscript:@"totalDrawCallCount"]);
    id v106 = [v105 unsignedIntegerValue];

    double v107 = *(double *)&xmmword_5B9928 + *(double *)&xmmword_5B9928;
    double v108 = v86 * v107;
    BOOL v109 = (unint64_t)v106 <= qword_5B9938 && v108 <= 0.5;
    uint64_t v110 = 2LL;
    if (v109) {
      uint64_t v110 = 0LL;
    }
    qword_5B9940 = v110 | qword_5B9940 & 0xFFFFFFFFFFFFFFFDLL;
    *((void *)&xmmword_5B9928 + 1) = 0x3FE0000000000000LL;
    id v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", v108));
    unsigned int v112 = [v111 BOOLForKey:@"GPUDebugger.ShaderProfiler.DisableMinTracingMode"];

    if (v112) {
      qword_5B9940 &= ~2uLL;
    }
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v114 = [v113 BOOLForKey:@"GPUDebugger.ShaderProfiler.ForceMinTracingMode"];

    char v104 = qword_5B9940;
    if (v114)
    {
      char v104 = qword_5B9940 | 2;
      qword_5B9940 |= 2uLL;
    }
  }

  if ((v104 & 2) != 0)
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v152, v103);
  }

  else
  {
    for (unsigned int k = 0; k != 5; ++k)
    {
      GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v152, v103);
      GTUSCSamplingStreamingManagerHelper::StreamAPS(v116);
      if ((v117 & 1) != 0) {
        break;
      }
      uint64_t v117 = (*(uint64_t (**)(void))(*(void *)(v153 + 80) + 16LL))();
      if (k <= 3) {
        uint64_t v117 = dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
      }
    }
  }

  LODWORD(xmmword_5B955C) = 1;
  int v118 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::CleanupForAPSStreaming((GTUSCSamplingStreamingManagerHelper *)v117);
    id v119 = GTUSCSamplingStreamingManagerHelper::AllocUSCSamplingAddressBuffer((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
    qword_5B9460 = (uint64_t)[(id)qword_5B9480 mutableBytes];
    id v120 = -[ProgramAddressTableCollector initForHarvestingBinaries]( objc_alloc(&OBJC_CLASS___ProgramAddressTableCollector),  "initForHarvestingBinaries");
    id v121 = (void *)xmmword_5B9468;
    *(void *)&xmmword_5B9468 = v120;

    if ((_DWORD)qword_5B9550 != -1)
    {
      GTUSCSamplingStreamingManagerHelper::SetupBuffersForAPSSource(v122);
      if ((qword_5B9940 & 2) != 0)
      {
        id v125 = -[GTGPUAPSConfig initForMinimumInfoCounters]( objc_alloc(&OBJC_CLASS___GTGPUAPSConfig),  "initForMinimumInfoCounters");
      }

      else
      {
        id v123 = -[GTGPUAPSConfig initForCounters](objc_alloc(&OBJC_CLASS___GTGPUAPSConfig), "initForCounters");
        v124 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance + 16) objectForKeyedSubscript:@"CounterConfig"]);
        if (v124) {
          [v123 readConfig:v124];
        }

        id v125 = v123;
      }

      uint64_t v126 = objc_claimAutoreleasedReturnValue([v125 grcOptions]);
      uint64_t v127 = (void *)qword_5B94E0;
      qword_5B94E0 = v126;

      uint64_t v128 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
      id v129 = (void *)xmmword_5B94E8;
      *(void *)&xmmword_5B94E8 = v128;

      v130 = (void *)xmmword_5B94E8;
      v131 = (void *)objc_claimAutoreleasedReturnValue([v125 grcTrigger]);
      id v132 = (void *)objc_claimAutoreleasedReturnValue( +[GPURawCounterSourceTriggerSelect selectWithName:options:]( &OBJC_CLASS___GPURawCounterSourceTriggerSelect,  "selectWithName:options:",  @"KickAndStateTracing",  v131));
      [v130 addObject:v132];

      v133 = (GTUSCSamplingStreamingManagerHelper *)(*(uint64_t (**)(void))(*(void *)(GTUSCSamplingStreamingManagerHelper::Instance(void)::instance
                                                                                     + 32)
                                                                         + 16LL))();
      GTUSCSamplingStreamingManagerHelper::InitRDELimiterCounters(v133);
    }

    GTUSCSamplingStreamingManagerHelper::StreamAPS(v122);
    if ((v134 & 1) != 0) {
      break;
    }
    uint64_t v117 = (*(uint64_t (**)(void))(*(void *)(v153 + 80) + 16LL))();
    --v118;
  }

  while (v118);
  GTUSCSamplingStreamingManager::InitDerivedCountersInfo((id *)v152);
  GTUSCSamplingStreamingManagerHelper::StreamEncoderDerivedCounterData(v135);
  LODWORD(xmmword_5B955C) = 2;
  int v137 = 5;
  do
  {
    GTUSCSamplingStreamingManagerHelper::InitAPSStreaming(v152, v136);
    GTUSCSamplingStreamingManagerHelper::StreamAPS(v138);
    if ((v139 & 1) != 0) {
      break;
    }
    (*(void (**)(void))(*(void *)(v153 + 80) + 16LL))();
    --v137;
  }

  while (v137);
  (*(void (**)(void))(*(void *)(v153 + 80) + 16LL))();
  dispatch_semaphore_signal((dispatch_semaphore_t)xmmword_5B9690);
  unint64_t v140 = atomic_load((unint64_t *)&xmmword_5B9770);
  if ((GTUSCSamplingStreamingManagerHelper *)v140 == v152) {
    GTUSCSamplingStreamingManagerHelper::CleanUp((GTUSCSamplingStreamingManagerHelper *)&GTUSCSamplingStreamingManagerHelper::Instance(void)::instance);
  }
}

void __GTMTLReplayClient_harvestTexture_block_invoke(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) contents] + *(void *)(a1 + 40);
  size_t v3 = *(void *)(a1 + 136);
  unsigned __int8 v4 = malloc(v3);
  v5 = v4;
  if ((int)*(void *)(a1 + 80) >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 72);
    id v9 = v2;
    do
    {
      if ((int)v8 >= 1)
      {
        uint64_t v10 = 0LL;
        do
        {
          uint64_t v11 = *(void *)&vorr_s8( (int8x8_t)vshl_n_s32((int32x2_t)__PAIR64__(v10, v6), 8uLL),  vand_s8((int8x8_t)__PAIR64__(v10, v6), (int8x8_t)0xFFFF0000FFFFLL)) & 0xFF00FF00FF00FFLL;
          unint64_t v12 = *(void *)&vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v11, 4uLL), (int8x8_t)v11) & 0xFF0FFF0FFF0FFF0FLL;
          int8x8_t v13 = vand_s8( vorr_s8((int8x8_t)vshl_n_s32((int32x2_t)v12, 2uLL), (int8x8_t)v12),  (int8x8_t)0x3333333333333333LL);
          int8x8_t v14 = (int8x8_t)vshl_u32((uint32x2_t)v13, (uint32x2_t)0x200000001LL);
          v13.i32[1] *= 2;
          int32x2_t v15 = (int32x2_t)vand_s8(vorr_s8(v14, v13), (int8x8_t)0xAAAAAAAA55555555LL);
          *((void *)v4 + vorr_s8((int8x8_t)v15, (int8x8_t)vdup_lane_s32(v15, 1)).i32[0]) = *(void *)&v9[8 * v10++];
        }

        while (v8 != v10);
      }

      ++v6;
      v9 += 8 * (int)v8;
    }

    while (v6 != v7);
  }

  memcpy(v2, v4, v3);
  free(v5);
}

void __GTMTLReplayClient_createOldTransport_block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __GTMTLReplayClient_createOldTransport_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __GTMTLReplayClient_createNewTransport_block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPort");
    id v5 = objc_msgSend( [GTRelayedXPCConnection alloc],  "initWithConnection:relayPort:relayPid:",  WeakRetained,  uint64,  xpc_dictionary_get_uint64(xdict, "_remoteDeviceRelayPid"));
    [WeakRetained dispatchMessage:xdict replyConnection:v5];
  }
}

void __GTMTLReplayClient_createNewTransport_block_invoke_2(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  exit(0);
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setPerfState:");
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 72) + 8) defaultCommandQueue]);
  [v2 setStatEnabled:1];
  if (g_runningInCI)
  {
    size_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"QueryShaderInfo - subdividing counter list"));
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    id v5 = __stdoutp;
    id v6 = v4;
    fprintf(v5, "#CI-INFO# %s\n", (const char *)[v6 UTF8String]);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 subdivideCounterList:*(void *)(a1 + 48)]);
  validateSubdividedCounterLists(*(void **)(a1 + 48), v7);
  [v2 setStatEnabled:0];
  uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v11 = *(id **)(a1 + 80);
  uint64_t v29 = *(void **)(a1 + 56);
  uint64_t v30 = v2;
  int8x8_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  id v14 = *(id *)(a1 + 48);
  id v15 = v13;
  id v16 = *(void **)(v12 + 8);
  id v17 = v7;

  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  id v19 = CollectFrameCounters(v12, v11, v14, v17, 41493LL, v18);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v19);
  unsigned int v20 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  id v21 = CollectFrameCounters(v12, v11, v14, v17, 63LL, v20);
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = __ProfileFrame_block_invoke;
  v31[3] = &unk_58F710;
  id v32 = v15;
  unsigned int v33 = v18;
  uint64_t v34 = v20;
  id v35 = v14;
  id v23 = v15;
  unint64_t v24 = v18;
  uint64_t v25 = v20;
  id v26 = v14;
  double v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v31));
  [v27 addDependency:v28];
  [v27 addDependency:v22];
  [v11[1] addOperation:v27];

  [v29 addDependency:v27];
  [*(id *)(*(void *)(a1 + 80) + 8) addOperation:*(void *)(a1 + 56)];
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 40);
  mach_timebase_info(&info);
  id v70 = v1[1];
  id v2 = *v1;
  uint64_t v67 = *((void *)*v1 + 2);
  uint64_t v3 = *((void *)*v1 + 14);
  uint64_t v4 = *(int *)(v3 + 12);
  if ((int)v4 < 1)
  {
    int v64 = 0;
  }

  else
  {
    int v64 = 0;
    uint64_t v5 = *(void *)(v3 + 24);
    do
    {
      if (GetFuncEnumConstructorType(*(_DWORD *)(v5 + 28)) == 25)
      {
        unint64_t v6 = v2[12];
        BOOL v8 = v6 > *(void *)v5;
        unint64_t v7 = v2[13] + v6;
        BOOL v8 = !v8 && v7 > *(void *)v5;
        if (v8) {
          int v9 = v64 + 1;
        }
        else {
          int v9 = v64;
        }
        int v64 = v9;
      }

      v5 += 32LL;
      --v4;
    }

    while (v4);
  }

  v69 = (double *)calloc(32 * v64, 0x10uLL);
  uint64_t v68 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, v10);
  GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
  uint64_t v11 = *v1;
  uint64_t v12 = (unsigned int *)(v1 + 2810);
  for (i = *((unsigned int *)v1 + 5620); v11[13] + v11[12] > i; unsigned int *v12 = i)
  {
    id v14 = objc_autoreleasePoolPush();
    uint64_t v15 = *(void *)(v11[15] + 24LL) + ((unint64_t)*v12 << 6);
    if (GetFuncEnumConstructorType(*(_DWORD *)(v15 + 8)) == 25)
    {
      int v16 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v15);
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v15);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v15);
      if (v16)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", *v12));
        [v68 addObject:v17];
      }
    }

    else
    {
      GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v15);
      GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v15);
    }

    objc_autoreleasePoolPop(v14);
    unint64_t i = *v12 + 1;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v70 defaultDevice]);
  id v72 = [v18 newEvent];

  uint64_t v63 = mach_absolute_time();
  int v71 = 0;
  LODWORD(v19) = 0;
  int v20 = 1;
  do
  {
    int v21 = v20;
    unsigned int v66 = v19;
    objc_msgSend((id)g_activityLog, "enterPerformFrameTimingForIndex:");
    unint64_t v22 = (os_log_s *)g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v66;
      _os_signpost_emit_with_name_impl( &dword_0,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Replayer-1-serial",  "performFrameTiming %d",  buf,  8u);
    }

    GTMTLReplayController_prePlayForProfiling((uint64_t)v1);
    int v65 = v21;
    if (v2[13] + v2[12] > (unint64_t)*v12)
    {
      do
      {
        id v23 = objc_autoreleasePoolPush();
        uint64_t v24 = *(void *)(v2[15] + 24LL);
        uint64_t v25 = *v12;
        int FuncEnumConstructorType = GetFuncEnumConstructorType(*(_DWORD *)(v24 + (v25 << 6) + 8));
        if (FuncEnumConstructorType == 25)
        {
          double v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v25));
          unsigned int v28 = [v68 containsObject:v27];

          if (v28)
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v70 defaultCommandQueue]);
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 commandBuffer]);

            ++performFrameTimingDesktop_signalCounter;
            objc_msgSend(v30, "encodeSignalEvent:value:", v72);
            [v30 encodeWaitForEvent:v72 value:performFrameTimingDesktop_signalCounter];
            [v30 commit];
          }

          int v31 = GTMTLReplayController_restoreCommandBuffer((uint64_t)v1, v24 + (v25 << 6));
        }

        else
        {
          int v31 = 0;
        }

        GTMTLReplayController_updateCommandEncoder((uint64_t)v1, v24 + (v25 << 6));
        GTMTLReplayController_defaultDispatchFunction((uint64_t)v1, v24 + (v25 << 6));
        if (FuncEnumConstructorType == 25)
        {
          id v32 = objc_msgSend( v70,  "commandBufferForKey:",  *((void *)GTTraceFunc_argumentBytesWithMap( (void *)(v24 + (v25 << 6)),  *(unsigned __int8 *)(v24 + (v25 << 6) + 13),  *((void *)*v1 + 2))
                  + 1));
          unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472LL;
          v73[2] = __performFrameTimingDesktop_block_invoke;
          v73[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          v73[4] = &v69[2 * v71];
          [v33 addCompletedHandler:v73];

          ++v71;
        }

        if (v31)
        {
          id v34 = objc_msgSend( v70,  "commandBufferForKey:",  *((void *)GTTraceFunc_argumentBytesWithMap( (void *)(v24 + (v25 << 6)),  *(unsigned __int8 *)(v24 + (v25 << 6) + 13),  v67)
                  + 1));
          id v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          ++performFrameTimingDesktop_signalCounter;
          objc_msgSend(v35, "encodeSignalEvent:value:", v72);
          [v35 encodeWaitForEvent:v72 value:performFrameTimingDesktop_signalCounter];
        }

        objc_autoreleasePoolPop(v23);
        unint64_t v36 = *v12 + 1;
        unsigned int *v12 = v36;
      }

      while (v2[13] + v2[12] > v36);
    }

    uint64_t v37 = mach_absolute_time();
    uint64_t v38 = (os_log_s *)g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v66;
      _os_signpost_emit_with_name_impl( &dword_0,  v38,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Replayer-1-serial",  "performFrameTiming %d",  buf,  8u);
    }

    BOOL v39 = (v37 - v63) * info.numer / info.denom < 0x3B9ACA00;
    [(id)g_activityLog leaveActivity];
    BOOL v40 = v66 < 0x1F && v39;
    int v20 = v65 + 1;
    uint64_t v19 = v66 + 1;
  }

  while (v40);
  std::vector<unsigned int>::size_type v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[1], "defaultCommandQueue", v19));
  [v41 finish];

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v66 + 1));
  uint64_t v43 = 0LL;
  unsigned int v44 = v69 + 1;
  do
  {
    qsort(&v69[2 * v43 * v64], v64, 0x10uLL, (int (__cdecl *)(const void *, const void *))CommandBufferTimeInfo_compare);
    if (v64 <= 0)
    {
      double v48 = 0.0;
    }

    else
    {
      double v45 = 0.0;
      double v46 = v44;
      uint64_t v47 = v64;
      double v48 = 0.0;
      do
      {
        if (v45 < *(v46 - 1)) {
          double v45 = *(v46 - 1);
        }
        double v49 = *v46;
        v46 += 2;
        double v50 = v49;
        double v51 = v49 - v45;
        BOOL v52 = v49 <= v45;
        if (v49 <= v45) {
          double v51 = -0.0;
        }
        double v48 = v48 + v51;
        if (!v52) {
          double v45 = v50;
        }
        --v47;
      }

      while (v47);
    }

    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (unint64_t)(v48 * 1000000000.0)));
    [v42 addObject:v53];

    ++v43;
    v44 += 2 * v64;
  }

  while (v43 != v65);
  free(v69);
  [v42 sortUsingComparator:&__block_literal_global_323];
  if ([v42 count]) {
    v54 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( objc_msgSend( v42,  "objectAtIndexedSubscript:",  (unint64_t)objc_msgSend(v42, "count") >> 1));
  }
  else {
    v54 = &off_5A0B38;
  }
  if (g_runningInCI)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"GPU Time = %@",  v54));
    uint8x8_t v56 = (void *)objc_claimAutoreleasedReturnValue( [v55 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n#CI-INFO# "]);

    int v57 = __stdoutp;
    id v58 = v56;
    fprintf(v57, "#CI-INFO# %s\n", (const char *)[v58 UTF8String]);
  }

  v75[0] = @"frametime";
  v75[1] = @"frameGPUTime";
  *(void *)buf = v42;
  id v77 = v54;
  uint64_t v59 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  v75,  2LL));

  uint64_t v60 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unint64_t v61 = *(void **)(v60 + 40);
  *(void *)(v60 + 40) = v59;
}

id *__GTMTLReplayClient_queryShaderInfo_block_invoke_3(id *result)
{
  if (result[4])
  {
    uint64_t v1 = result;
    result = (id *)[result[5] getStateOccupancy];
    *(void *)(*((void *)v1[6] + 1) + 24LL) = v2;
  }

  return result;
}

void __GTMTLReplayClient_queryShaderInfo_block_invoke_4(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 8) defaultDevice]);
  id Analysis = DYMTLReplayFrameProfiler_loadAnalysis(v6);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(Analysis);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end