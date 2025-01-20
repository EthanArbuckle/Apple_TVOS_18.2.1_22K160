@interface DiskImageParamsUDIF_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header;
- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)instanceID;
- (unint64_t)blockSize;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DiskImageParamsUDIF_XPC

- (DiskImageParamsUDIF_XPC)initWithBackendXPC:(id)a3 header:()unique_ptr<udif:(std::default_delete<udif::header>>)a4 :header
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DiskImageParamsUDIF_XPC;
  v5 = -[DiskImageParamsXPC initWithBackendXPC:](&v11, sel_initWithBackendXPC_, a3);
  v6 = v5;
  if (v5)
  {
    v7 = *(header **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0LL;
    value = v5->_header.__ptr_.__value_;
    v6->_header.__ptr_.__value_ = v7;
    if (value)
    {
      operator delete(value);
      v7 = v6->_header.__ptr_.__value_;
    }

    if (!*(void *)((char *)v7 + 492))
    {
      -[DiskImageParamsUDIF_XPC createSinkDiskImage](v6, "createSinkDiskImage");
      *(void *)((char *)v6->_header.__ptr_.__value_ + 492) = (*(uint64_t (**)())(*(void *)v10 + 32LL))();
      if (v10) {
        (*(void (**)())(*(void *)v10 + 16LL))();
      }
    }
  }

  return v6;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v4 = v2;
  v5 = -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v6 = v5;
  if (v5) {
    [v5 backend];
  }
  else {
    *(_OWORD *)v50 = 0uLL;
  }

  if ((*(unsigned int (**)(uint64_t))(*(void *)v50[0] + 48LL))(v50[0]))
  {
    v7 = -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    int v8 = [v7 isUnlocked];

    if (v8)
    {
      __p = -[DiskImageParamsUDIF_XPC blockSize](self, "blockSize");
      std::allocate_shared[abi:ne180100]<BufferedWriteBackend,std::allocator<BufferedWriteBackend>,std::shared_ptr<Backend> &,unsigned long,void>( (uint64_t)v50,  &__p,  v47);
      __int128 v9 = *(_OWORD *)v47;
      v47[0] = 0LL;
      v47[1] = 0LL;
      uint64_t v10 = (std::__shared_weak_count *)v50[1];
      *(_OWORD *)v50 = v9;
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          unint64_t v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }

      v13 = (std::__shared_weak_count *)v47[1];
      if (v47[1])
      {
        v14 = (unint64_t *)((char *)v47[1] + 8);
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
    }
  }

  value = self->_header.__ptr_.__value_;
  v17 = (char *)operator new(0x1F4uLL);
  *(void *)v17 = 0x4796C6F6BLL;
  *((_DWORD *)v17 + 2) = 512;
  *((_DWORD *)v17 + 3) = *((_DWORD *)value + 3);
  __int128 v18 = *((_OWORD *)value + 1);
  __int128 v19 = *((_OWORD *)value + 2);
  *((void *)v17 + 6) = *((void *)value + 6);
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v19;
  *((_DWORD *)v17 + 14) = *((_DWORD *)value + 14);
  *((_DWORD *)v17 + 15) = *((_DWORD *)value + 15);
  *((_OWORD *)v17 + 4) = *((_OWORD *)value + 4);
  *((void *)v17 + 10) = *((void *)value + 10);
  __int128 v20 = *(_OWORD *)((char *)value + 88);
  __int128 v21 = *(_OWORD *)((char *)value + 104);
  __int128 v22 = *(_OWORD *)((char *)value + 120);
  *(_OWORD *)(v17 + 136) = *(_OWORD *)((char *)value + 136);
  *(_OWORD *)(v17 + 120) = v22;
  *(_OWORD *)(v17 + 104) = v21;
  *(_OWORD *)(v17 + 88) = v20;
  __int128 v23 = *(_OWORD *)((char *)value + 152);
  __int128 v24 = *(_OWORD *)((char *)value + 168);
  __int128 v25 = *(_OWORD *)((char *)value + 184);
  *(_OWORD *)(v17 + 200) = *(_OWORD *)((char *)value + 200);
  *(_OWORD *)(v17 + 184) = v25;
  *(_OWORD *)(v17 + 168) = v24;
  *(_OWORD *)(v17 + 152) = v23;
  __int128 v26 = *(_OWORD *)((char *)value + 248);
  __int128 v27 = *(_OWORD *)((char *)value + 264);
  __int128 v28 = *(_OWORD *)((char *)value + 280);
  *(_OWORD *)(v17 + 232) = *(_OWORD *)((char *)value + 232);
  *(_OWORD *)(v17 + 264) = v27;
  *(_OWORD *)(v17 + 280) = v28;
  *(_OWORD *)(v17 + 248) = v26;
  __int128 v30 = *(_OWORD *)((char *)value + 312);
  __int128 v29 = *(_OWORD *)((char *)value + 328);
  __int128 v31 = *(_OWORD *)((char *)value + 296);
  *((void *)v17 + 43) = *((void *)value + 43);
  *(_OWORD *)(v17 + 312) = v30;
  *(_OWORD *)(v17 + 328) = v29;
  *(_OWORD *)(v17 + 296) = v31;
  *(_OWORD *)(v17 + 216) = *(_OWORD *)((char *)value + 216);
  *((void *)v17 + 44) = *((void *)value + 44);
  __int128 v32 = *(_OWORD *)((char *)value + 360);
  __int128 v33 = *(_OWORD *)((char *)value + 376);
  __int128 v34 = *(_OWORD *)((char *)value + 392);
  *(_OWORD *)(v17 + 408) = *(_OWORD *)((char *)value + 408);
  *(_OWORD *)(v17 + 392) = v34;
  *(_OWORD *)(v17 + 376) = v33;
  *(_OWORD *)(v17 + 360) = v32;
  __int128 v35 = *(_OWORD *)((char *)value + 424);
  __int128 v36 = *(_OWORD *)((char *)value + 440);
  __int128 v37 = *(_OWORD *)((char *)value + 456);
  *(_OWORD *)(v17 + 472) = *(_OWORD *)((char *)value + 472);
  *(_OWORD *)(v17 + 456) = v37;
  *(_OWORD *)(v17 + 440) = v36;
  *(_OWORD *)(v17 + 424) = v35;
  *((_DWORD *)v17 + 122) = *((_DWORD *)value + 122);
  *(void *)(v17 + 492) = *(void *)((char *)value + 492);
  __p = v17;
  UDIF_header::UDIF_header(v47, (uint64_t *)&__p, v50);
  v38 = __p;
  __p = 0LL;
  if (v38) {
    operator delete(v38);
  }
  v39 = operator new(0xC8uLL);
  DiskImageUDIF::DiskImageUDIF(v39, (uint64_t *)v47, v50);
  void *v4 = v39;
  v40 = v48;
  if (v48)
  {
    v41 = (unint64_t *)&v48->__shared_owners_;
    do
      unint64_t v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }

  v43 = v47[0];
  v47[0] = 0LL;
  if (v43) {
    operator delete(v43);
  }
  v44 = (std::__shared_weak_count *)v50[1];
  if (v50[1])
  {
    v45 = (unint64_t *)(v50[1] + 8);
    do
      unint64_t v46 = __ldaxr(v45);
    while (__stlxr(v46 - 1, v45));
    if (!v46)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }

  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v43;
}

- (unint64_t)numBlocks
{
  return *(void *)((char *)self->_header.__ptr_.__value_ + 492);
}

- (unint64_t)blockSize
{
  return 512LL;
}

- (BOOL)isWritableFormat
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsUDIF_XPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___DiskImageParamsUDIF_XPC;
  v5 = -[DiskImageParamsXPC initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v32 = 0LL;
    uint64_t v6 = [v4 decodeBytesForKey:@"udifHeader" returnedLength:&v32];
    if (!v6 || v32 != 500)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v31);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v31,  (uint64_t)"Unexpected UDIF header length (",  31LL);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)")", 1LL);
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v31, 0x9Au);
    }

    v7 = (char *)operator new(0x1F4uLL);
    *(void *)v7 = 0x4796C6F6BLL;
    *((_DWORD *)v7 + 2) = 512;
    *((_DWORD *)v7 + 3) = *(_DWORD *)(v6 + 12);
    __int128 v8 = *(_OWORD *)(v6 + 16);
    __int128 v9 = *(_OWORD *)(v6 + 32);
    *((void *)v7 + 6) = *(void *)(v6 + 48);
    *((_OWORD *)v7 + 1) = v8;
    *((_OWORD *)v7 + 2) = v9;
    *((_DWORD *)v7 + 14) = *(_DWORD *)(v6 + 56);
    *((_DWORD *)v7 + 15) = *(_DWORD *)(v6 + 60);
    *((_OWORD *)v7 + 4) = *(_OWORD *)(v6 + 64);
    *((void *)v7 + 10) = *(void *)(v6 + 80);
    __int128 v10 = *(_OWORD *)(v6 + 88);
    __int128 v11 = *(_OWORD *)(v6 + 104);
    __int128 v12 = *(_OWORD *)(v6 + 120);
    *(_OWORD *)(v7 + 136) = *(_OWORD *)(v6 + 136);
    *(_OWORD *)(v7 + 120) = v12;
    *(_OWORD *)(v7 + 104) = v11;
    *(_OWORD *)(v7 + 88) = v10;
    __int128 v13 = *(_OWORD *)(v6 + 152);
    __int128 v14 = *(_OWORD *)(v6 + 168);
    __int128 v15 = *(_OWORD *)(v6 + 184);
    *(_OWORD *)(v7 + 200) = *(_OWORD *)(v6 + 200);
    *(_OWORD *)(v7 + 184) = v15;
    *(_OWORD *)(v7 + 168) = v14;
    *(_OWORD *)(v7 + 152) = v13;
    __int128 v16 = *(_OWORD *)(v6 + 248);
    __int128 v17 = *(_OWORD *)(v6 + 264);
    __int128 v18 = *(_OWORD *)(v6 + 280);
    *(_OWORD *)(v7 + 232) = *(_OWORD *)(v6 + 232);
    *(_OWORD *)(v7 + 264) = v17;
    *(_OWORD *)(v7 + 280) = v18;
    *(_OWORD *)(v7 + 248) = v16;
    __int128 v20 = *(_OWORD *)(v6 + 312);
    __int128 v19 = *(_OWORD *)(v6 + 328);
    __int128 v21 = *(_OWORD *)(v6 + 296);
    *((void *)v7 + 43) = *(void *)(v6 + 344);
    *(_OWORD *)(v7 + 312) = v20;
    *(_OWORD *)(v7 + 328) = v19;
    *(_OWORD *)(v7 + 296) = v21;
    *(_OWORD *)(v7 + 216) = *(_OWORD *)(v6 + 216);
    *((void *)v7 + 44) = *(void *)(v6 + 352);
    __int128 v22 = *(_OWORD *)(v6 + 360);
    __int128 v23 = *(_OWORD *)(v6 + 376);
    __int128 v24 = *(_OWORD *)(v6 + 392);
    *(_OWORD *)(v7 + 408) = *(_OWORD *)(v6 + 408);
    *(_OWORD *)(v7 + 392) = v24;
    *(_OWORD *)(v7 + 376) = v23;
    *(_OWORD *)(v7 + 360) = v22;
    __int128 v25 = *(_OWORD *)(v6 + 424);
    __int128 v26 = *(_OWORD *)(v6 + 440);
    __int128 v27 = *(_OWORD *)(v6 + 456);
    *(_OWORD *)(v7 + 472) = *(_OWORD *)(v6 + 472);
    *(_OWORD *)(v7 + 456) = v27;
    *(_OWORD *)(v7 + 440) = v26;
    *(_OWORD *)(v7 + 424) = v25;
    *((_DWORD *)v7 + 122) = *(_DWORD *)(v6 + 488);
    *(void *)(v7 + 492) = *(void *)(v6 + 492);
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
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DiskImageParamsUDIF_XPC;
  -[DiskImageParamsXPC encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  [v4 encodeBytes:self->_header.__ptr_.__value_ length:500 forKey:@"udifHeader"];
}

- (id)instanceID
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  bzero(v10, 0x210uLL);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DiskImageParamsUDIF_XPC;
  v3 = -[DiskImageParamsXPC instanceID](&v8, sel_instanceID);
  [v3 getUUIDBytes:v10];
  udif::header::write((udif::header *)self->_header.__ptr_.__value_, v11);
  id v4 = objc_alloc(MEMORY[0x189607AB8]);
  v9[0] = di_utils::buffer_to_uuid((di_utils *)v10, 528LL);
  v9[1] = v5;
  uint64_t v6 = (void *)[v4 initWithUUIDBytes:v9];

  return v6;
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