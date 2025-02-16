@interface SMTGradientBuffer
+ (void)initialize;
- (SMTGradientBuffer)initWithTensorBefore:(id)a3 tensorAfter:(id)a4 withScale:(float)a5 shouldSparsify:(BOOL)a6 error:(id *)a7;
- (float)l2norm;
- (id).cxx_construct;
- (id)description;
- (unint64_t)size;
- (void)accumulateDifferenceBetweenTensorBefore:(id)a3 andTensorAfter:(id)a4 withScale:(float)a5 error:(id *)a6;
- (void)applyToTensor:(id)a3 scale:(float)a4 error:(id *)a5;
- (void)multiply:(float)a3;
- (void)reset;
@end

@implementation SMTGradientBuffer

- (SMTGradientBuffer)initWithTensorBefore:(id)a3 tensorAfter:(id)a4 withScale:(float)a5 shouldSparsify:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v59 = a4;
  v64.receiver = self;
  v64.super_class = (Class)&OBJC_CLASS___SMTGradientBuffer;
  v13 = -[SMTGradientBuffer init](&v64, "init");
  v14 = v13;
  id v58 = v12;
  if (v13)
  {
    unint64_t v15 = (unint64_t)v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 shape]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v59 shape]);
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      v55 = (os_log_s *)qword_100016038;
      if (os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v69 = @"unable to compute difference between two tensors of different shapes";
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        if (!a7) {
          goto LABEL_74;
        }
      }

      else if (!a7)
      {
        goto LABEL_74;
      }

      NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
      v67 = @"unable to compute difference between two tensors of different shapes";
      v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL,  v12));
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  1LL,  v56));

      a7 = 0LL;
      goto LABEL_74;
    }

    v14->_isSparse = a6;
    v14->_size = 1LL;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v12 shape]);
    id v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v20)
    {
      unint64_t v15 = *(void *)v61;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v61 != v15) {
            objc_enumerationMutation(v19);
          }
          id v22 = *(id *)(*((void *)&v60 + 1) + 8LL * (void)i);
          v14->_size *= (int)[v22 intValue];
        }

        id v20 = [v19 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }

      while (v20);
    }

    v23 = (float *)[v12 dataPointer];
    v24 = (float *)[v59 dataPointer];
    if (v14->_size)
    {
      v25 = v24;
      unint64_t v26 = 0LL;
      p_sparseData = &v14->_sparseData;
      p_p1 = &v14->_sparseData.__table_.__p1_;
      do
      {
        float v29 = (float)(v25[v26] - v23[v26]) * a5;
        if (v14->_isSparse)
        {
          if (v29 != 0.0)
          {
            unint64_t value = v14->_sparseData.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            if (value)
            {
              uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)value);
              v31.i16[0] = vaddlv_u8(v31);
              if (v31.u32[0] > 1uLL)
              {
                unint64_t v15 = (int)v26;
              }

              else
              {
                unint64_t v15 = (value - 1) & (int)v26;
              }

              v41 = (void **)p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v15];
              if (v41)
              {
                v42 = *v41;
                if (*v41)
                {
                  do
                  {
                    unint64_t v43 = v42[1];
                    if (v43 == (int)v26)
                    {
                      if (*((_DWORD *)v42 + 4) == (_DWORD)v26) {
                        goto LABEL_68;
                      }
                    }

                    else
                    {
                      if (v31.u32[0] > 1uLL)
                      {
                        if (v43 >= value) {
                          v43 %= value;
                        }
                      }

                      else
                      {
                        v43 &= value - 1;
                      }

                      if (v43 != v15) {
                        break;
                      }
                    }

                    v42 = (void *)*v42;
                  }

                  while (v42);
                }
              }
            }

            v42 = operator new(0x18uLL);
            void *v42 = 0LL;
            v42[1] = (int)v26;
            *((_DWORD *)v42 + 4) = v26;
            *((_DWORD *)v42 + 5) = 0;
            float v44 = (float)(v14->_sparseData.__table_.__p2_.__value_ + 1);
            float v45 = v14->_sparseData.__table_.__p3_.__value_;
            if (!value || (float)(v45 * (float)value) < v44)
            {
              BOOL v46 = (value & (value - 1)) != 0;
              if (value < 3) {
                BOOL v46 = 1LL;
              }
              unint64_t v47 = v46 | (2 * value);
              unint64_t v48 = vcvtps_u32_f32(v44 / v45);
              if (v47 <= v48) {
                size_t v49 = v48;
              }
              else {
                size_t v49 = v47;
              }
              sub_100007558((uint64_t)&v14->_sparseData, v49);
              unint64_t value = v14->_sparseData.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
              if ((value & (value - 1)) != 0)
              {
                else {
                  unint64_t v15 = (int)v26;
                }
              }

              else
              {
                unint64_t v15 = (value - 1) & (int)v26;
              }
            }

            v52 = p_sparseData->__table_.__bucket_list_.__ptr_.__value_;
            v53 = (void **)p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v15];
            if (v53)
            {
              void *v42 = *v53;
              goto LABEL_66;
            }

            void *v42 = p_p1->__value_.__next_;
            p_p1->__value_.__next_ = v42;
            v52[v15] = p_p1;
            if (*v42)
            {
              unint64_t v54 = *(void *)(*v42 + 8LL);
              if ((value & (value - 1)) != 0)
              {
                if (v54 >= value) {
                  v54 %= value;
                }
              }

              else
              {
                v54 &= value - 1;
              }

              v53 = &p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v54];
LABEL_66:
              *v53 = v42;
            }

            ++v14->_sparseData.__table_.__p2_.__value_;
LABEL_68:
            *((float *)v42 + 5) = v29;
          }
        }

        else
        {
          end = v14->_data.__end_;
          unint64_t v32 = (unint64_t)v14->_data.__end_cap_.__value_;
          if ((unint64_t)end >= v32)
          {
            begin = v14->_data.__begin_;
            uint64_t v35 = end - begin;
            unint64_t v36 = v35 + 1;
            uint64_t v37 = v32 - (void)begin;
            if (v37 >> 1 > v36) {
              unint64_t v36 = v37 >> 1;
            }
            BOOL v38 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL;
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
            if (!v38) {
              unint64_t v39 = v36;
            }
            if (v39)
            {
              unint64_t v39 = (unint64_t)sub_1000041AC(v39);
              begin = v14->_data.__begin_;
              end = v14->_data.__end_;
            }

            else
            {
              uint64_t v40 = 0LL;
            }

            v50 = (float *)(v39 + 4 * v35);
            float *v50 = v29;
            unint64_t v15 = (unint64_t)(v50 + 1);
            while (end != begin)
            {
              int v51 = *((_DWORD *)end-- - 1);
              *((_DWORD *)v50-- - 1) = v51;
            }

            v14->_data.__begin_ = v50;
            v14->_data.__end_ = (float *)v15;
            v14->_data.__end_cap_.__value_ = (float *)(v39 + 4 * v40);
            if (begin) {
              operator delete(begin);
            }
          }

          else
          {
            float *end = v29;
            unint64_t v15 = (unint64_t)(end + 1);
          }

          v14->_data.__end_ = (float *)v15;
        }

        ++v26;
      }

      while (v26 < v14->_size);
    }
  }

  a7 = v14;
  id v12 = v58;
LABEL_74:

  return (SMTGradientBuffer *)a7;
}

- (void)accumulateDifferenceBetweenTensorBefore:(id)a3 andTensorAfter:(id)a4 withScale:(float)a5 error:(id *)a6
{
  id v10 = a3;
  id v42 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 shape]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v42 shape]);
  unsigned __int8 v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    v21 = (os_log_s *)qword_100016038;
    if (os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = @"unable to compute difference between two tensors of different shapes";
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (!a6) {
        goto LABEL_57;
      }
    }

    else if (!a6)
    {
      goto LABEL_57;
    }

    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    int v51 = @"unable to compute difference between two tensors of different shapes";
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  151LL,  v22));
LABEL_56:
    *a6 = v23;

    goto LABEL_57;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 shape]);
  id v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v44;
    uint64_t v17 = 1LL;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v43 + 1) + 8LL * (void)i);
        signed int v20 = [v19 intValue];

        v17 *= v20;
      }

      id v15 = [v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v15);
  }

  else
  {
    uint64_t v17 = 1LL;
  }

  if (v17 != self->_size)
  {
    v41 = (os_log_s *)qword_100016038;
    if (os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = @"unable to accumulate difference of mismatch size";
      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (!a6) {
        goto LABEL_57;
      }
    }

    else if (!a6)
    {
      goto LABEL_57;
    }

    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    unint64_t v48 = @"unable to accumulate difference of mismatch size";
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  151LL,  v22));
    goto LABEL_56;
  }

  v24 = (float *)[v10 dataPointer];
  v25 = (float *)[v42 dataPointer];
  unint64_t size = self->_size;
  if (size)
  {
    v27 = v25;
    unint64_t v28 = 0LL;
    p_sparseData = &self->_sparseData;
    do
    {
      float v30 = (float)(v27[v28] - v24[v28]) * a5;
      if (self->_isSparse)
      {
        if (v30 != 0.0)
        {
          *(_DWORD *)buf = v28;
          uint8x8_t v31 = (float *)sub_100009094(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, v28);
          if (v31 && (float v30 = v30 + v31[5], v30 == 0.0))
          {
            unint64_t value = self->_sparseData.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            unint64_t v33 = *((void *)v31 + 1);
            uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v34.i16[0] = vaddlv_u8(v34);
            if (v34.u32[0] > 1uLL)
            {
              if (v33 >= value) {
                v33 %= value;
              }
            }

            else
            {
              v33 &= value - 1;
            }

            uint64_t v35 = (float *)p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v33];
            do
            {
              unint64_t v36 = v35;
              uint64_t v35 = *(float **)v35;
            }

            while (v35 != v31);
            unint64_t v37 = *((void *)v36 + 1);
            if (v34.u32[0] > 1uLL)
            {
              if (v37 >= value) {
                v37 %= value;
              }
            }

            else
            {
              v37 &= value - 1;
            }

            if (v37 != v33)
            {
LABEL_40:
              if (!*(void *)v31) {
                goto LABEL_41;
              }
              unint64_t v38 = *(void *)(*(void *)v31 + 8LL);
              if (v34.u32[0] > 1uLL)
              {
                if (v38 >= value) {
                  v38 %= value;
                }
              }

              else
              {
                v38 &= value - 1;
              }

              if (v38 != v33) {
LABEL_41:
              }
                p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v33] = 0LL;
            }

            uint64_t v39 = *(void *)v31;
            if (*(void *)v31)
            {
              unint64_t v40 = *(void *)(v39 + 8);
              if (v34.u32[0] > 1uLL)
              {
                if (v40 >= value) {
                  v40 %= value;
                }
              }

              else
              {
                v40 &= value - 1;
              }

              if (v40 != v33)
              {
                p_sparseData->__table_.__bucket_list_.__ptr_.__value_[v40] = v36;
                uint64_t v39 = *(void *)v31;
              }
            }

            *(void *)unint64_t v36 = v39;
            --self->_sparseData.__table_.__p2_.__value_;
            operator delete(v31);
          }

          else
          {
            *((float *)sub_100009148((uint64_t)&self->_sparseData, v28, buf) + 5) = v30;
          }

          unint64_t size = self->_size;
        }
      }

      else
      {
        self->_data.__begin_[v28] = v30 + self->_data.__begin_[v28];
      }

      ++v28;
    }

    while (v28 < size);
  }

- (void)applyToTensor:(id)a3 scale:(float)a4 error:(id *)a5
{
  id v8 = a3;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shape", 0));
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = 1LL;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v30 + 1) + 8LL * (void)i);
        signed int v15 = [v14 intValue];

        v12 *= v15;
      }

      id v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }

    while (v10);
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  if (v12 != self->_size)
  {
    v23 = (os_log_s *)qword_100016038;
    if (os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39[0] = @"Unable to apply gradient to mismatch tensor";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (!a5) {
        goto LABEL_22;
      }
    }

    else if (!a5)
    {
      goto LABEL_22;
    }

    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    v41 = @"Unable to apply gradient to mismatch tensor";
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  1LL,  v21));
LABEL_21:
    *a5 = v22;

    goto LABEL_22;
  }

  uint64_t v16 = (float *)[v8 dataPointer];
  if (!self->_isSparse)
  {
    begin = self->_data.__begin_;
    uint64_t v25 = (char *)self->_data.__end_ - (char *)begin;
    if (!v25) {
      goto LABEL_22;
    }
    uint64_t v26 = 0LL;
    unint64_t v27 = v25 >> 2;
    if (v27 <= 1) {
      unint64_t v27 = 1LL;
    }
    while (1)
    {
      float v28 = v16[v26] + (float)(begin[v26] * a4);
      v16[v26] = v28;
      if (COERCE_INT(fabs(v28)) >= 2139095040) {
        break;
      }
      if (v27 == ++v26) {
        goto LABEL_22;
      }
    }

    float v29 = (os_log_s *)qword_100016038;
    if (os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v39[0]) = v26;
      WORD2(v39[0]) = 2048;
      *(double *)((char *)v39 + 6) = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "ptr[%d] == %f", buf, 0x12u);
      if (!a5) {
        goto LABEL_22;
      }
    }

    else if (!a5)
    {
      goto LABEL_22;
    }

    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    uint64_t v35 = @"inf/nan found during accumulation";
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  1LL,  v21));
    goto LABEL_21;
  }

  p_p1 = &self->_sparseData.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, float>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, float>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      goto LABEL_22;
    }
    uint64_t next_low = SLODWORD(p_p1[2].__value_.__next_);
    float v19 = v16[next_low] + (float)(*((float *)&p_p1[2].__value_.__next_ + 1) * a4);
    v16[next_low] = v19;
  }

  while (COERCE_INT(fabs(v19)) < 2139095040);
  signed int v20 = (os_log_s *)qword_100016038;
  if (!os_log_type_enabled((os_log_t)qword_100016038, OS_LOG_TYPE_ERROR))
  {
    if (!a5) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }

  *(_DWORD *)buf = 67109376;
  LODWORD(v39[0]) = next_low;
  WORD2(v39[0]) = 2048;
  *(double *)((char *)v39 + 6) = v19;
  _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "ptr[%d] == %f", buf, 0x12u);
  if (a5)
  {
LABEL_17:
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    unint64_t v37 = @"inf/nan found during accumulation";
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  1LL,  v21));
    goto LABEL_21;
  }

- (void)reset
{
  if (self->_isSparse)
  {
    if (self->_sparseData.__table_.__p2_.__value_)
    {
      next = self->_sparseData.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          v4 = (void *)*next;
          operator delete(next);
          next = v4;
        }

        while (v4);
      }

      self->_sparseData.__table_.__p1_.__value_.__next_ = 0LL;
      unint64_t value = self->_sparseData.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t i = 0LL; i != value; ++i)
          self->_sparseData.__table_.__bucket_list_.__ptr_.__value_[i] = 0LL;
      }

      self->_sparseData.__table_.__p2_.__value_ = 0LL;
    }
  }

  else
  {
    begin = self->_data.__begin_;
    uint64_t v8 = (char *)self->_data.__end_ - (char *)begin;
    if (v8)
    {
      unint64_t v9 = v8 >> 2;
      if (v9 <= 1) {
        unint64_t v9 = 1LL;
      }
      bzero(begin, 4 * v9);
    }
  }

- (float)l2norm
{
  if (self->_isSparse)
  {
    next = (float *)self->_sparseData.__table_.__p1_.__value_.__next_;
    if (next)
    {
      float v3 = 0.0;
      do
      {
        float v3 = v3 + (float)(next[5] * next[5]);
        next = *(float **)next;
      }

      while (next);
      return sqrtf(v3);
    }

- (void)multiply:(float)a3
{
  if (self->_isSparse)
  {
  }

  else
  {
    begin = self->_data.__begin_;
    uint64_t v5 = (char *)self->_data.__end_ - (char *)begin;
    if (v5)
    {
      unint64_t v6 = v5 >> 2;
      if (v6 <= 1) {
        unint64_t v6 = 1LL;
      }
      do
      {
        float *begin = *begin * a3;
        ++begin;
        --v6;
      }

      while (v6);
    }
  }

- (id)description
{
  if (self->_isSparse) {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"sparse gradient of size %lu with %lu non-zero values",  self->_size,  self->_sparseData.__table_.__p2_.__value_);
  }
  else {
    v2 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dense gradient with %lu values",  self->_size,  v4);
  }
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  next = self->_sparseData.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      uint64_t v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }

    while (v4);
  }

  unint64_t value = self->_sparseData.__table_.__bucket_list_.__ptr_.__value_;
  self->_sparseData.__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  begin = self->_data.__begin_;
  if (begin)
  {
    self->_data.__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  *((void *)self + 8) = 0LL;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SMTGradientBuffer, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SMTGradientBuffer");
    float v3 = (void *)qword_100016038;
    qword_100016038 = (uint64_t)v2;
  }

@end