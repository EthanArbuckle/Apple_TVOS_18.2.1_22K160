@interface DiskImageParamsASIF_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header;
- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)instanceID;
- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DiskImageParamsASIF_XPC

- (DiskImageParamsASIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<di_asif:(std::default_delete<di_asif::header>>)a4 :header
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v10, "initWithBackendXPC:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0LL;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value) {
      operator delete(value);
    }
  }

  return v6;
}

- (BOOL)isSparseFormat
{
  return 1;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v4 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v6 = v5;
  if (v5)
  {
    [v5 backend];
  }

  else
  {
    lpsrc[0] = 0LL;
    lpsrc[1] = 0LL;
  }

  v87 = lpsrc[0];
  v88 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v7 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  while (1)
  {
    if (lpsrc[0])
    {
      if (v9) {
        break;
      }
    }

    sub_10001C610(&v87, (uint64_t *)lpsrc);
    sub_10011F1C0((uint64_t)lpsrc, &v90);
    __int128 v10 = v90;
    __int128 v90 = 0uLL;
    v11 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v10;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    v14 = lpsrc[0];
    v15 = v87;
    v16 = (std::__shared_weak_count *)*((void *)&v90 + 1);
    if (*((void *)&v90 + 1))
    {
      v17 = (unint64_t *)(*((void *)&v90 + 1) + 8LL);
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    if (v14 == v15) {
      goto LABEL_20;
    }
  }

  v21 = v9;
  v22 = (std::__shared_weak_count *)lpsrc[1];
  *(void *)&__int128 v90 = v9;
  *((void **)&v90 + 1) = lpsrc[1];
  if (lpsrc[1])
  {
    v23 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      unint64_t v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }

  *(void *)&__int128 v92 = 0x200000001LL;
  sub_100095CC4((uint64_t)"header_ignore_fields_t", 2, (int *)&v92, 2LL);
  v21[48] = 2;
  if (v22)
  {
    v25 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
  int v6 = -[DiskImageParamsXPC setSizeWithDiskImage:newSize:](&v16, "setSizeWithDiskImage:newSize:", a3, a4);
  if (!v6)
  {
    uint64_t v7 = *(void *)a3;
    uint64_t v8 = *(void *)(*(void *)a3 + 36LL);
    int v9 = *(_DWORD *)(*(void *)a3 + 44LL);
    __int128 v10 = *(_OWORD *)(*(void *)a3 + 64LL);
    __int128 v17 = *(_OWORD *)(*(void *)a3 + 48LL);
    __int128 v18 = v10;
    *(_OWORD *)v19 = *(_OWORD *)(v7 + 80);
    *(void *)&v19[14] = *(void *)(v7 + 94);
    uint64_t v11 = *(void *)(v7 + 104);
    v12 = (char *)operator new(0x50uLL);
    *(_DWORD *)v12 = 2003069043;
    *(void *)(v12 + 4) = v8;
    *((_DWORD *)v12 + 3) = v9;
    __int128 v13 = v18;
    *((_OWORD *)v12 + 1) = v17;
    *((_OWORD *)v12 + 2) = v13;
    *((_OWORD *)v12 + 3) = *(_OWORD *)v19;
    *(void *)(v12 + 62) = *(void *)&v19[14];
    *((_WORD *)v12 + 35) = 0;
    *((void *)v12 + 9) = v11;
    value = self->_header.__ptr_.__value_;
    self->_header.__ptr_.__value_ = (header *)v12;
    if (value) {
      operator delete(value);
    }
  }

  return v6;
}

- (unint64_t)numBlocks
{
  return *((void *)self->_header.__ptr_.__value_ + 6);
}

- (BOOL)isWritableFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsASIF_XPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
  v5 = -[DiskImageParamsXPC initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5 && [v4 containsValueForKey:@"sparseHeader"])
  {
    uint64_t v12 = 0LL;
    id v6 = [v4 decodeBytesForKey:@"sparseHeader" returnedLength:&v12];
    if (!v6 || v12 != 80)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      sub_100005148((uint64_t)v11);
      sub_10000552C(v11, (uint64_t)"Unexpected ASIF header length (", 31LL);
      std::ostream::operator<<(v11, v12);
      sub_10000552C(v11, (uint64_t)")", 1LL);
      sub_100006AA8((uint64_t)exception, (uint64_t)v11, 0x9Au);
    }

    uint64_t v7 = (header *)operator new(0x50uLL);
    sub_1000D01AC(v7, (uint64_t)v6);
    value = v5->_header.__ptr_.__value_;
    v5->_header.__ptr_.__value_ = v7;
    if (value) {
      operator delete(value);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  value = self->_header.__ptr_.__value_;
  if (value) {
    [v4 encodeBytes:value length:80 forKey:@"sparseHeader"];
  }
}

- (id)instanceID
{
  if (self->_header.__ptr_.__value_)
  {
    bzero(v13, 0x210uLL);
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
    v3 = -[DiskImageParamsXPC instanceID](&v10, "instanceID");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    [v4 getUUIDBytes:v13];
    v5 = objc_alloc(&OBJC_CLASS___NSUUID);
    v12[0] = sub_100120C80(v13, 528LL);
    v12[1] = v6;
    uint64_t v7 = -[NSUUID initWithUUIDBytes:](v5, "initWithUUIDBytes:", v12);

    return v7;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
    int v9 = -[DiskImageParamsXPC instanceID](&v11, "instanceID");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }

- (void).cxx_destruct
{
  value = self->_header.__ptr_.__value_;
  self->_header.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0LL;
  return self;
}

@end