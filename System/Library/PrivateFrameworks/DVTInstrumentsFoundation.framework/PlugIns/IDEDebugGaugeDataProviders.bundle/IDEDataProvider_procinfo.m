@interface IDEDataProvider_procinfo
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_procinfo)init;
- (id).cxx_construct;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider_procinfo

+ (id)sharedDataProvider
{
  if (qword_11420 != -1) {
    dispatch_once(&qword_11420, &stru_C698);
  }
  return (id)qword_11418;
}

- (IDEDataProvider_procinfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDEDataProvider_procinfo;
  v2 = -[IDEDataProvider_procinfo init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Lock to protect multithread access during capturing", 0LL);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (id)supportedAttributes
{
  if (qword_11430 != -1) {
    dispatch_once(&qword_11430, &stru_C6B8);
  }
  return (id)qword_11428;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  signed int v12 = [v11 intValue];
  signed int v13 = v12;
  p_processInfoByPID = &self->_processInfoByPID;
  unint64_t v15 = v12;
  unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v5 = v12;
      if (value <= v12) {
        unint64_t v5 = v12 % value;
      }
    }

    else
    {
      unint64_t v5 = (value - 1) & v12;
    }

    v18 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v18)
    {
      v19 = (char *)*v18;
      if (*v18)
      {
        do
        {
          unint64_t v20 = *((void *)v19 + 1);
          if (v20 == v12)
          {
            if (*((_DWORD *)v19 + 4) == v12) {
              goto LABEL_74;
            }
          }

          else
          {
            if (v17.u32[0] > 1uLL)
            {
              if (v20 >= value) {
                v20 %= value;
              }
            }

            else
            {
              v20 &= value - 1;
            }

            if (v20 != v5) {
              break;
            }
          }

          v19 = *(char **)v19;
        }

        while (v19);
      }
    }
  }

  v19 = (char *)operator new(0x40uLL);
  *(void *)v19 = 0LL;
  *((void *)v19 + 1) = v15;
  *((_DWORD *)v19 + 4) = v13;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  *((void *)v19 + 7) = 0LL;
  float v21 = (float)(p_processInfoByPID->__table_.__p2_.__value_ + 1);
  float v22 = p_processInfoByPID->__table_.__p3_.__value_;
  if (!value || (float)(v22 * (float)value) < v21)
  {
    BOOL v23 = (value & (value - 1)) == 0;
    if (value < 3) {
      BOOL v23 = 0;
    }
    unint64_t v24 = (2 * value) | !v23;
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
      unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }

    if (*(void *)&prime > value) {
      goto LABEL_30;
    }
    if (*(void *)&prime < value)
    {
      unint64_t v33 = vcvtps_u32_f32((float)p_processInfoByPID->__table_.__p2_.__value_ / p_processInfoByPID->__table_.__p3_.__value_);
      if (value < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)value), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
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
      if (*(void *)&prime >= value)
      {
        unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }

      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_446C();
          }
          v27 = (void **)operator new(8LL * *(void *)&prime);
          v28 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
          p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0LL;
          p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v29++] = 0LL;
          while (*(void *)&prime != v29);
          next = p_processInfoByPID->__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v31 = next[1];
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

            p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v31] = &p_processInfoByPID->__table_.__p1_;
            v36 = (void *)*next;
            if (*next)
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
                  if (!p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37])
                  {
                    p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37] = next;
                    goto LABEL_55;
                  }

                  void *next = *v36;
                  void *v36 = *(void *)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(void *)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  v36 = next;
                }

                unint64_t v37 = v31;
LABEL_55:
                next = v36;
                v36 = (void *)*v36;
                unint64_t v31 = v37;
              }

              while (v36);
            }
          }

          unint64_t value = (unint64_t)prime;
          goto LABEL_59;
        }

        v94 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
        p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0LL;
        if (v94) {
          operator delete(v94);
        }
        unint64_t value = 0LL;
        p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0LL;
      }
    }

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  capture_lock = self->_capture_lock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_7894;
  v16[3] = &unk_C480;
  id v17 = v7;
  v18 = self;
  id v19 = v6;
  id v10 = v8;
  unint64_t v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync((dispatch_queue_t)capture_lock, v16);
  signed int v13 = v20;
  v14 = v10;

  return v14;
}

- (void).cxx_destruct
{
  p_processInfoByPID = &self->_processInfoByPID;
  next = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v5 = (void *)*next;
      operator delete(next);
      next = v5;
    }

    while (v5);
  }

  unint64_t value = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_capture_lock, 0LL);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

@end