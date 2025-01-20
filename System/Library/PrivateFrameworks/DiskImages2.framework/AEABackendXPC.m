@interface AEABackendXPC
+ (BOOL)supportsSecureCoding;
- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4;
- (AEABackendXPC)initWithCoder:(id)a3;
- (BackendXPC)baseBackendXPC;
- (id).cxx_construct;
- (shared_ptr<unsigned)key;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AEABackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4
{
  ptr = (uint64_t *)a4.__ptr_;
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  v8 = -[AEABackendXPC init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a3);
    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v9->_key.__ptr_, ptr);
    if (*p_baseBackendXPC) {
      [*p_baseBackendXPC backend];
    }
    else {
      v20 = 0LL;
    }
    std::allocate_shared[abi:ne180100]<AEA_backend,std::allocator<AEA_backend>,std::shared_ptr<Backend>,std::shared_ptr<unsigned char> &,void>(&v21);
    __int128 v22 = v21;
    __int128 v21 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v22);
    v11 = (std::__shared_weak_count *)*((void *)&v22 + 1);
    if (*((void *)&v22 + 1))
    {
      v12 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    v14 = (std::__shared_weak_count *)*((void *)&v21 + 1);
    if (*((void *)&v21 + 1))
    {
      v15 = (unint64_t *)(*((void *)&v21 + 1) + 8LL);
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }

  return v9;
}

- (AEABackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (!v5)
  {
LABEL_28:
    v17 = v5;
    goto LABEL_29;
  }

  id v6 = v4;
  id v7 = (_OWORD *)[v6 decodeBytesForKey:@"encKeys" returnedLength:&v31];
  if (v7 && v31 == 32LL)
  {
    v8 = operator new[](0x20uLL);
    std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>( &v30,  (uint64_t)v8);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&v5->_key, &v30);
    v9 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      v10 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    ptr = v5->_key.__ptr_;
    __int128 v13 = v7[1];
    *(_OWORD *)ptr = *v7;
    *((_OWORD *)ptr + 1) = v13;
    uint64_t v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"baseBackend"];
    baseBackendXPC = v5->_baseBackendXPC;
    v5->_baseBackendXPC = (BackendXPC *)v14;

    unint64_t v16 = v5->_baseBackendXPC;
    if (v16) {
      -[BackendXPC backend](v16, "backend");
    }
    else {
      __int128 v30 = 0uLL;
    }
    std::allocate_shared[abi:ne180100]<AEA_backend,std::allocator<AEA_backend>,std::shared_ptr<Backend>,std::shared_ptr<unsigned char> &,void>(&v28);
    __int128 v29 = v28;
    __int128 v28 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v29, 0LL);
    unint64_t v18 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1))
    {
      v19 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    __int128 v21 = (std::__shared_weak_count *)*((void *)&v28 + 1);
    if (*((void *)&v28 + 1))
    {
      __int128 v22 = (unint64_t *)(*((void *)&v28 + 1) + 8LL);
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }

    v24 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      v25 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

    goto LABEL_28;
  }

  v17 = 0LL;
LABEL_29:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  [v4 encodeBytes:self->_key.__ptr_ length:32 forKey:@"encKeys"];
  v5 = -[AEABackendXPC baseBackendXPC](self, "baseBackendXPC");
  [v4 encodeObject:v5 forKey:@"baseBackend"];
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (shared_ptr<unsigned)key
{
  cntrl = self->_key.__cntrl_;
  *v2 = self->_key.__ptr_;
  v2[1] = (char *)cntrl;
  if (cntrl)
  {
    id v4 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (char *)self;
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  *((void *)self + 6) = 0LL;
  return self;
}

@end