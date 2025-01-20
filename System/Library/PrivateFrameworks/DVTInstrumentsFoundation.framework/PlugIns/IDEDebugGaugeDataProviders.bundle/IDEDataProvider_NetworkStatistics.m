@interface IDEDataProvider_NetworkStatistics
+ (id)sharedDataProvider;
- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5;
- (IDEDataProvider_NetworkStatistics)init;
- (id).cxx_construct;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
- (void)dealloc;
@end

@implementation IDEDataProvider_NetworkStatistics

+ (id)sharedDataProvider
{
  if (qword_113B0 != -1) {
    dispatch_once(&qword_113B0, &stru_C4A0);
  }
  return (id)qword_113A8;
}

- (IDEDataProvider_NetworkStatistics)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDEDataProvider_NetworkStatistics;
  v2 = -[IDEDataProvider_NetworkStatistics init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Lock to protect multithread access during capturing", 0LL);
    capture_lock = v2->_capture_lock;
    v2->_capture_lock = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("Lock to protect _lastResults", 0LL);
    results_lock = v2->_results_lock;
    v2->_results_lock = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (id)supportedAttributes
{
  if (qword_113C0 != -1) {
    dispatch_once(&qword_113C0, &stru_C4C0);
  }
  return (id)qword_113B8;
}

- (BOOL)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5
{
  id v63 = a3;
  id v9 = a4;
  id v10 = a5;
  signed int v11 = [v10 intValue];
  signed int v12 = v11;
  p_processInfoByPID = &self->_processInfoByPID;
  unint64_t v14 = v11;
  unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v16.i16[0] = vaddlv_u8(v16);
    if (v16.u32[0] > 1uLL)
    {
      unint64_t v5 = v11;
      if (value <= v11) {
        unint64_t v5 = v11 % value;
      }
    }

    else
    {
      unint64_t v5 = (value - 1) & v11;
    }

    v17 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v17)
    {
      for (i = *v17; i; i = (void *)*i)
      {
        unint64_t v19 = i[1];
        if (v19 == v11)
        {
          if (*((_DWORD *)i + 4) == v11) {
            goto LABEL_40;
          }
        }

        else
        {
          if (v16.u32[0] > 1uLL)
          {
            if (v19 >= value) {
              v19 %= value;
            }
          }

          else
          {
            v19 &= value - 1;
          }

          if (v19 != v5) {
            break;
          }
        }
      }
    }
  }

  i = operator new(0xE8uLL);
  void *i = 0LL;
  i[1] = v14;
  *((_DWORD *)i + 4) = v12;
  *(_OWORD *)(i + 5) = 0u;
  *(_OWORD *)(i + 7) = 0u;
  *(_OWORD *)(i + 9) = 0u;
  *(_OWORD *)(i + 11) = 0u;
  *(_OWORD *)(i + 13) = 0u;
  *(_OWORD *)(i + 15) = 0u;
  *(_OWORD *)(i + 17) = 0u;
  *(_OWORD *)(i + 19) = 0u;
  *(_OWORD *)(i + 21) = 0u;
  *(_OWORD *)(i + 23) = 0u;
  *(_OWORD *)(i + 25) = 0u;
  *(_OWORD *)(i + 27) = 0u;
  *(_OWORD *)(i + 3) = 0u;
  sub_3FC4(i + 3, 0LL);
  sub_3FC4(i + 16, 0LL);
  float v20 = (float)(self->_processInfoByPID.__table_.__p2_.__value_ + 1);
  float v21 = self->_processInfoByPID.__table_.__p3_.__value_;
  if (!value || (float)(v21 * (float)value) < v20)
  {
    BOOL v22 = 1LL;
    if (value >= 3) {
      BOOL v22 = (value & (value - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * value);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_4274((uint64_t)p_processInfoByPID, v25);
    unint64_t value = self->_processInfoByPID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (value <= v14) {
        unint64_t v5 = v14 % value;
      }
      else {
        unint64_t v5 = v14;
      }
    }

    else
    {
      unint64_t v5 = (value - 1) & v14;
    }
  }

  v26 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  v27 = (void **)p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v5];
  if (v27)
  {
    void *i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }

  void *i = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  self->_processInfoByPID.__table_.__p1_.__value_.__next_ = i;
  v26[v5] = &self->_processInfoByPID.__table_.__p1_;
  if (*i)
  {
    unint64_t v28 = *(void *)(*i + 8LL);
    if ((value & (value - 1)) != 0)
    {
      if (v28 >= value) {
        v28 %= value;
      }
    }

    else
    {
      v28 &= value - 1;
    }

    v27 = &p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_[v28];
    goto LABEL_38;
  }

- (void)dealloc
{
  netstatManager = self->_netstatManager;
  if (netstatManager)
  {
    NStatManagerDestroy(netstatManager, a2);
    self->_netstatManager = 0LL;
  }

  netstatQueue = self->_netstatQueue;
  self->_netstatQueue = 0LL;

  capture_lock = self->_capture_lock;
  self->_capture_lock = 0LL;

  results_lock = self->_results_lock;
  self->_results_lock = 0LL;

  lastResults = self->_lastResults;
  self->_lastResults = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDEDataProvider_NetworkStatistics;
  -[IDEDataProvider_NetworkStatistics dealloc](&v8, "dealloc");
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  capture_lock = self->_capture_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_252C;
  block[3] = &unk_C588;
  block[4] = self;
  id v22 = v7;
  id v23 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)capture_lock, block);
  uint64_t v15 = 0LL;
  uint8x8_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_3C1C;
  unint64_t v19 = sub_3C2C;
  id v20 = 0LL;
  results_lock = self->_results_lock;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_3C34;
  v14[3] = &unk_C5B0;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync((dispatch_queue_t)results_lock, v14);
  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (void).cxx_destruct
{
  p_sourceInfosBySrcRef = &self->_sourceInfosBySrcRef;
  next = (id *)self->_sourceInfosBySrcRef.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      unint64_t v5 = (id *)*next;
      sub_44D8(next + 2);
      operator delete(next);
      next = v5;
    }

    while (v5);
  }

  unint64_t value = p_sourceInfosBySrcRef->__table_.__bucket_list_.__ptr_.__value_;
  p_sourceInfosBySrcRef->__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  p_processInfoByPID = &self->_processInfoByPID;
  objc_super v8 = self->_processInfoByPID.__table_.__p1_.__value_.__next_;
  if (v8)
  {
    do
    {
      id v9 = (void *)*v8;
      operator delete(v8);
      objc_super v8 = v9;
    }

    while (v9);
  }

  id v10 = p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_;
  p_processInfoByPID->__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (v10) {
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_netstatQueue, 0LL);
  objc_storeStrong((id *)&self->_lastResults, 0LL);
  objc_storeStrong((id *)&self->_results_lock, 0LL);
  objc_storeStrong((id *)&self->_capture_lock, 0LL);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end