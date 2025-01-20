@interface GTBatchedCounterManager
+ (BOOL)isInitialized;
+ (id)semaphore;
+ (id)semaphoreRequests;
+ (void)initialize;
- (BOOL)_addBatchAtEncoderIndex:(unsigned int)a3 inEncoderArray:(id)a4;
- (BOOL)nextPerEncoderBatchListForHighPriorityBatches:(id)a3 withHighPriorityInfo:(id)a4;
- (GTBatchedCounterManager)initWithEncoderBatchPriorityList:(id)a3;
- (id).cxx_construct;
- (id)nextPerEncoderBatchList:(id)a3;
- (void)_clearData;
- (void)_initializeData:(id)a3;
- (void)cleanup;
- (void)pause;
- (void)resume;
@end

@implementation GTBatchedCounterManager

- (GTBatchedCounterManager)initWithEncoderBatchPriorityList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTBatchedCounterManager;
  v5 = -[GTBatchedCounterManager init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[GTBatchedCounterManager _initializeData:](v5, "_initializeData:", v4);
    atomic_store(1u, (unsigned __int8 *)&v6->_paused);
  }

  return v6;
}

- (void)cleanup
{
  gInitialized = 0;
  -[GTBatchedCounterManager _clearData](self, "_clearData");
  v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore"));
  dispatch_semaphore_signal(v2);

  v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphoreRequests]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphoreRequests"));
  dispatch_semaphore_signal(v3);
}

- (void)_clearData
{
  uint64_t end = (uint64_t)self->_processedBatches.__end_;
  begin = self->_processedBatches.__begin_;
  self->_processedBatches.__end_ = begin;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::clear(&self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  v6 = self->_perEncoderBatchQueue.__begin_;
  for (uint64_t i = (uint64_t)self->_perEncoderBatchQueue.__end_;
        (void *)i != v6;
    ;
  }

  self->_perEncoderBatchQueue.__end_ = v6;
}

- (void)_initializeData:(id)a3
{
  id v111 = a3;
  unint64_t value = self->_batchToEncoderMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value) {
    float v5 = (float)self->_batchToEncoderMap.__table_.__p2_.__value_ / (float)value;
  }
  else {
    float v5 = 0.0;
  }
  self->_batchToEncoderMap.__table_.__p3_.__value_ = fmaxf(v5, 0.4);
  p_batchToEncoderMap = &self->_batchToEncoderMap;
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)&self->_batchToEncoderMap,  vcvtps_u32_f32( (float)(unint64_t)((void)objc_msgSend(v111, "count", v111) << 8)
    / self->_batchToEncoderMap.__table_.__p3_.__value_));
  __int128 v133 = 0u;
  __int128 v134 = 0u;
  __int128 v131 = 0u;
  __int128 v132 = 0u;
  id obj = v112;
  id v116 = [obj countByEnumeratingWithState:&v131 objects:v137 count:16];
  if (v116)
  {
    unsigned int v7 = 0;
    int v8 = 0;
    uint64_t v115 = *(void *)v132;
    v114 = self;
    v118 = &self->_batchToEncoderMap;
    do
    {
      v117 = 0LL;
      do
      {
        if (*(void *)v132 != v115) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v131 + 1) + 8LL * (void)v117);
        __int128 v129 = 0u;
        __int128 v130 = 0u;
        __int128 v128 = 0u;
        uint64_t end = (char *)self->_perEncoderBatchQueue.__end_;
        v10 = (char *)self->_perEncoderBatchQueue.__end_cap_.__value_;
        if (end >= v10)
        {
          begin = (char *)self->_perEncoderBatchQueue.__begin_;
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 4) + 1;
          if (v14 > 0x555555555555555LL) {
            abort();
          }
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v10 - begin) >> 4);
          if (2 * v15 > v14) {
            unint64_t v14 = 2 * v15;
          }
          if (v15 >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v16 = 0x555555555555555LL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            if (v16 > 0x555555555555555LL) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            v17 = (char *)operator new(48 * v16);
          }

          else
          {
            v17 = 0LL;
          }

          v18 = &v17[16 * ((end - begin) >> 4)];
          *(_OWORD *)v18 = 0u;
          *((_OWORD *)v18 + 1) = 0u;
          __int128 v128 = 0u;
          __int128 v129 = 0u;
          v19 = &v17[48 * v16];
          *((void *)v18 + 4) = 0LL;
          *((void *)v18 + 5) = 0LL;
          __int128 v130 = 0uLL;
          v12 = v18 + 48;
          if (end == begin)
          {
            self->_perEncoderBatchQueue.__begin_ = v18;
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
          }

          else
          {
            uint64_t v20 = 0LL;
            do
            {
              v21 = &v18[v20];
              v22 = &end[v20];
              *((void *)v21 - 6) = *(void *)&end[v20 - 48];
              *((void *)v21 - 5) = *(void *)&end[v20 - 40];
              *((void *)v21 - 4) = *(void *)&end[v20 - 32];
              *((void *)v21 - 3) = *(void *)&end[v20 - 24];
              *((_OWORD *)v22 - 3) = 0uLL;
              *((_OWORD *)v22 - 2) = 0uLL;
              *((void *)v21 - 2) = *(void *)&end[v20 - 16];
              *((void *)v21 - 1) = *(void *)&end[v20 - 8];
              *((void *)v22 - 2) = 0LL;
              *((void *)v22 - 1) = 0LL;
              v20 -= 48LL;
            }

            while (&end[v20] != begin);
            uint64_t end = (char *)self->_perEncoderBatchQueue.__begin_;
            uint64_t v23 = (uint64_t)self->_perEncoderBatchQueue.__end_;
            self->_perEncoderBatchQueue.__begin_ = &v18[v20];
            self->_perEncoderBatchQueue.__end_ = v12;
            self->_perEncoderBatchQueue.__end_cap_.__value_ = v19;
          }

          if (end) {
            operator delete(end);
          }
        }

        else
        {
          *(void *)uint64_t end = 0LL;
          *((void *)end + 1) = *((void *)&v128 + 1);
          *((_OWORD *)end + 1) = v129;
          __int128 v128 = 0uLL;
          __int128 v129 = 0uLL;
          *((_OWORD *)end + 2) = v130;
          __int128 v130 = 0uLL;
          v12 = end + 48;
        }

        self->_perEncoderBatchQueue.__end_ = v12;
        std::deque<unsigned int>::~deque[abi:nn180100]((uint64_t)&v128);
        __int128 v128 = 0u;
        __int128 v129 = 0u;
        LODWORD(v130) = 1065353216;
        v24 = self->_processedBatches.__end_;
        v25 = self->_processedBatches.__end_cap_.__value_;
        if (v24 < v25)
        {
          v26 = (void *)(std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table( (uint64_t)v24,  (uint64_t *)&v128)
                       + 40);
          self->_processedBatches.__end_ = v26;
          goto LABEL_49;
        }

        v27 = self->_processedBatches.__begin_;
        unint64_t v28 = 0xCCCCCCCCCCCCCCCDLL * ((v24 - v27) >> 3);
        unint64_t v29 = v28 + 1;
        if (v28 + 1 > 0x666666666666666LL) {
          abort();
        }
        unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * ((v25 - v27) >> 3);
        if (2 * v30 > v29) {
          unint64_t v29 = 2 * v30;
        }
        if (v30 >= 0x333333333333333LL) {
          unint64_t v31 = 0x666666666666666LL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31)
        {
          if (v31 > 0x666666666666666LL) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v32 = (char *)operator new(40 * v31);
        }

        else
        {
          v32 = 0LL;
        }

        v33 = &v32[40 * v31];
        v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table( (uint64_t)&v32[40 * v28],  (uint64_t *)&v128);
        v26 = v34 + 40;
        v36 = (uint64_t *)self->_processedBatches.__begin_;
        v35 = (uint64_t *)self->_processedBatches.__end_;
        if (v35 == v36)
        {
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35) {
            goto LABEL_48;
          }
        }

        else
        {
          do
          {
            v35 -= 5;
            v34 = (char *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__hash_table( (uint64_t)(v34 - 40),  v35);
          }

          while (v35 != v36);
          v37 = (uint64_t *)self->_processedBatches.__begin_;
          v35 = (uint64_t *)self->_processedBatches.__end_;
          self->_processedBatches.__begin_ = v34;
          self->_processedBatches.__end_ = v26;
          self->_processedBatches.__end_cap_.__value_ = v33;
          if (v35 != v37)
          {
            do
            {
              v35 -= 5;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v35);
            }

            while (v35 != v37);
            v35 = v37;
          }

          if (v35) {
LABEL_48:
          }
            operator delete(v35);
        }

- (BOOL)_addBatchAtEncoderIndex:(unsigned int)a3 inEncoderArray:(id)a4
{
  id v6 = a4;
  begin = (char *)self->_perEncoderBatchQueue.__begin_;
  unsigned int v8 = a3;
  v9 = (int64x2_t *)&begin[48 * a3];
  if (!v9[2].i64[1])
  {
LABEL_6:
    objc_msgSend(v6, "addObject:", &off_5A0718, v17);
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }

  __int128 v17 = xmmword_313890;
  while (1)
  {
    uint64_t v10 = ((unint64_t)v9[2].i64[0] >> 7) & 0x1FFFFFFFFFFFFF8LL;
    uint64_t v11 = v9[2].i64[0] & 0x3FF;
    uint64_t v12 = *(unsigned int *)(*(void *)(v9->i64[1] + v10) + 4 * v11);
    if (!std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( (void *)self->_processedBatches.__begin_ + 5 * v8,  *(_DWORD *)(*(void *)(v9->i64[1] + v10) + 4 * v11))) {
      break;
    }
    v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_313890);
    std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
    if (!v9[2].i64[1]) {
      goto LABEL_6;
    }
  }

  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v12));
  [v6 addObject:v15];

  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)self->_processedBatches.__begin_ + 40 * v8,  v16,  v16);
  v9[2] = vaddq_s64(v9[2], (int64x2_t)xmmword_313890);
  std::deque<unsigned int>::__maybe_remove_front_spare[abi:nn180100]((uint64_t)v9);
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (id)nextPerEncoderBatchList:(id)a3
{
  id v26 = a3;
  id v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphoreRequests]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphoreRequests"));
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (+[GTBatchedCounterManager isInitialized](&OBJC_CLASS___GTBatchedCounterManager, "isInitialized"))
  {
    float v5 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore"));
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    unint64_t v28 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
    uint64_t end = (id *)self->_highPriorityArray.__end_;
    if (self->_highPriorityArray.__begin_ == end)
    {
      [v26 removeAllObjects];
      if (self->_perEncoderBatchQueue.__end_ == self->_perEncoderBatchQueue.__begin_)
      {
        int v18 = 0;
      }

      else
      {
        unint64_t v17 = 0LL;
        int v18 = 0;
        do
          v18 += -[GTBatchedCounterManager _addBatchAtEncoderIndex:inEncoderArray:]( self,  "_addBatchAtEncoderIndex:inEncoderArray:",  v17++,  v28);
        while (v17 < 0xAAAAAAAAAAAAAAABLL
                    * (((char *)self->_perEncoderBatchQueue.__end_ - (char *)self->_perEncoderBatchQueue.__begin_) >> 4));
      }

      uint64_t v20 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore"));
      dispatch_semaphore_signal(v20);

      unsigned __int8 v21 = atomic_load((unsigned __int8 *)&self->_paused);
      if ((v21 & 1) == 0)
      {
        v22 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphoreRequests]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphoreRequests"));
        dispatch_semaphore_signal(v22);
      }

      if (v18) {
        id v16 = v28;
      }
      else {
        id v16 = 0LL;
      }
    }

    else
    {
      id v24 = *(end - 2);
      id v8 = *(end - 1);
      std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]( (uint64_t)&self->_highPriorityArray,  (uint64_t)self->_highPriorityArray.__end_ - 16);
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id obj = v8;
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = 0LL;
        uint64_t v11 = *(void *)v30;
        do
        {
          for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(id *)(*((void *)&v29 + 1) + 8LL * (void)i);
            id v14 = [v13 unsignedIntValue];
            if ((_DWORD)v14 == -1
              || std::__hash_table<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,GTEncoderSampleIndexInfo>>>::find<unsigned int>( (void *)self->_processedBatches.__begin_ + 5 * (v10 + (_DWORD)i),  v14))
            {
              -[GTBatchedCounterManager _addBatchAtEncoderIndex:inEncoderArray:]( self,  "_addBatchAtEncoderIndex:inEncoderArray:",  (char *)i + v10,  v28,  v24);
            }

            else
            {
              unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v14));
              [v28 addObject:v15];

              std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)self->_processedBatches.__begin_ + 40 * (v10 + (_DWORD)i),  v14,  (int)v14);
            }
          }

          id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          uint64_t v10 = (v10 + (_DWORD)i);
        }

        while (v9);
      }

      if ([v28 count])
      {
        id v16 = v28;
        [v26 setDictionary:v24];
      }

      else
      {
        id v16 = 0LL;
      }

      v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore",  v24));
      dispatch_semaphore_signal(v19);
    }
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (BOOL)nextPerEncoderBatchListForHighPriorityBatches:(id)a3 withHighPriorityInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore"));
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t end = (char *)self->_highPriorityArray.__end_;
  unint64_t value = (char *)self->_highPriorityArray.__end_cap_.__value_;
  if (end < value)
  {
    *(void *)uint64_t end = v7;
    *((void *)end + 1) = v6;
    uint64_t v11 = end + 16;
    goto LABEL_20;
  }

  begin = self->_highPriorityArray.__begin_;
  uint64_t v13 = (end - begin) >> 4;
  uint64_t v14 = value - begin;
  uint64_t v15 = v14 >> 3;
  else {
    unint64_t v16 = v15;
  }
  if (v16)
  {
    if (v16 >> 60) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    unint64_t v17 = (char *)operator new(16 * v16);
  }

  else
  {
    unint64_t v17 = 0LL;
  }

  int v18 = &v17[16 * v13];
  v19 = &v17[16 * v16];
  *(void *)int v18 = v7;
  *((void *)v18 + 1) = v6;
  uint64_t v11 = v18 + 16;
  uint64_t v20 = self->_highPriorityArray.__begin_;
  unsigned __int8 v21 = self->_highPriorityArray.__end_;
  if (v21 == v20)
  {
    self->_highPriorityArray.__begin_ = v18;
    self->_highPriorityArray.__end_ = v11;
    self->_highPriorityArray.__end_cap_.__value_ = v19;
    if (!v21) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  do
  {
    __int128 v22 = *((_OWORD *)v21 - 1);
    v21 -= 2;
    void *v21 = 0LL;
    v21[1] = 0LL;
    *((_OWORD *)v18 - 1) = v22;
    v18 -= 16;
  }

  while (v21 != v20);
  uint64_t v23 = self->_highPriorityArray.__begin_;
  unsigned __int8 v21 = self->_highPriorityArray.__end_;
  self->_highPriorityArray.__begin_ = v18;
  self->_highPriorityArray.__end_ = v11;
  self->_highPriorityArray.__end_cap_.__value_ = v19;
  if (v21 != v23)
  {
    do
    {

      id v24 = (void *)*(v21 - 2);
      v21 -= 2;
    }

    while (v21 != v23);
    unsigned __int8 v21 = v23;
  }

  if (v21) {
LABEL_19:
  }
    operator delete(v21);
LABEL_20:
  self->_highPriorityArray.__end_ = v11;
  id v25 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphore]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphore"));
  dispatch_semaphore_signal(v25);

  id v26 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphoreRequests]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphoreRequests"));
  dispatch_semaphore_signal(v26);

  return 1;
}

- (void)pause
{
}

- (void)resume
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_paused);
  if ((v2 & 1) != 0)
  {
    atomic_store(0, (unsigned __int8 *)&self->_paused);
    v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[GTBatchedCounterManager semaphoreRequests]( &OBJC_CLASS___GTBatchedCounterManager,  "semaphoreRequests"));
    dispatch_semaphore_signal(v3);
  }

- (void).cxx_destruct
{
  p_highPriorityArray = &self->_highPriorityArray;
  begin = self->_highPriorityArray.__begin_;
  if (begin)
  {
    std::vector<std::pair<NSDictionary * {__strong},NSArray * {__strong}>>::__base_destruct_at_end[abi:nn180100]( (uint64_t)&self->_highPriorityArray,  (uint64_t)begin);
    operator delete(p_highPriorityArray->__begin_);
  }

  float v5 = self->_perEncoderBatchQueue.__begin_;
  if (v5)
  {
    uint64_t end = (uint64_t)self->_perEncoderBatchQueue.__end_;
    id v7 = self->_perEncoderBatchQueue.__begin_;
    if ((void *)end != v5)
    {
      do
        uint64_t end = std::deque<unsigned int>::~deque[abi:nn180100](end - 48);
      while ((void *)end != v5);
      id v7 = self->_perEncoderBatchQueue.__begin_;
    }

    self->_perEncoderBatchQueue.__end_ = v5;
    operator delete(v7);
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_batchToEncoderMap);
  id v8 = self->_processedBatches.__begin_;
  if (v8)
  {
    uint64_t v9 = (uint64_t)self->_processedBatches.__end_;
    uint64_t v10 = self->_processedBatches.__begin_;
    if ((void *)v9 != v8)
    {
      do
        uint64_t v9 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table(v9 - 40);
      while ((void *)v9 != v8);
      uint64_t v10 = self->_processedBatches.__begin_;
    }

    self->_processedBatches.__end_ = v8;
    operator delete(v10);
  }

- (id).cxx_construct
{
  *((void *)self + 7) = 0LL;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

+ (id)semaphore
{
  return (id)gSemaphore;
}

+ (id)semaphoreRequests
{
  return (id)gSemaphoreRequests;
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___GTBatchedCounterManager, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(1LL);
    id v6 = (void *)gSemaphore;
    gSemaphore = (uint64_t)v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    id v8 = (void *)gSemaphoreRequests;
    gSemaphoreRequests = (uint64_t)v7;
  }

+ (BOOL)isInitialized
{
  return gInitialized;
}

@end