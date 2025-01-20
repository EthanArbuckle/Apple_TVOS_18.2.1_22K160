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
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v10, sel_initWithBackendXPC_, a3);
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
  uint64_t v94 = *MEMORY[0x1895F89C0];
  v5 = -[DiskImageParamsXPC backendXPC](self, "backendXPC");
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

  v88 = lpsrc[0];
  v89 = (std::__shared_weak_count *)lpsrc[1];
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

    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v88, (uint64_t *)lpsrc);
    get_next_backend_in_graph((uint64_t)lpsrc, v91);
    __int128 v10 = *(_OWORD *)v91;
    v91[0] = 0LL;
    v91[1] = 0LL;
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
    v15 = v88;
    v16 = (std::__shared_weak_count *)v91[1];
    if (v91[1])
    {
      v17 = (unint64_t *)((char *)v91[1] + 8);
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
  v91[0] = v9;
  v91[1] = (DiskImageASIF *)lpsrc[1];
  if (lpsrc[1])
  {
    v23 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      unint64_t v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }

  *(void *)&__int128 v93 = 0x200000001LL;
  smart_enums::validators::flags<unsigned int>((uint64_t)"header_ignore_fields_t", 2, (int *)&v93, 2LL);
  *((_DWORD *)v21 + 48) = 2;
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
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
  int v6 = -[DiskImageParamsXPC setSizeWithDiskImage:newSize:](&v16, sel_setSizeWithDiskImage_newSize_, a3, a4);
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
  v5 = -[DiskImageParamsXPC initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5 && [v4 containsValueForKey:@"sparseHeader"])
  {
    uint64_t v12 = 0LL;
    int v6 = (__n128 *)[v4 decodeBytesForKey:@"sparseHeader" returnedLength:&v12];
    if (!v6 || v12 != 80)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v11,  (uint64_t)"Unexpected ASIF header length (",  31LL);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)")", 1LL);
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v11, 0x9Au);
    }

    uint64_t v7 = (di_asif::header *)operator new(0x50uLL);
    di_asif::header::header(v7, v6);
    value = v5->_header.__ptr_.__value_;
    v5->_header.__ptr_.__value_ = (header *)v7;
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
  -[DiskImageParamsXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  value = self->_header.__ptr_.__value_;
  if (value) {
    [v4 encodeBytes:value length:80 forKey:@"sparseHeader"];
  }
}

- (id)instanceID
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (self->_header.__ptr_.__value_)
  {
    bzero(v11, 0x210uLL);
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
    v3 = -[DiskImageParamsXPC instanceID](&v8, sel_instanceID);
    [v3 getUUIDBytes:v11];
    id v4 = objc_alloc(MEMORY[0x189607AB8]);
    v10[0] = di_utils::buffer_to_uuid((di_utils *)v11, 528LL);
    v10[1] = v5;
    objc_super v6 = (void *)[v4 initWithUUIDBytes:v10];

    return v6;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___DiskImageParamsASIF_XPC;
    -[DiskImageParamsXPC instanceID](&v9, sel_instanceID);
    return (id)objc_claimAutoreleasedReturnValue();
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