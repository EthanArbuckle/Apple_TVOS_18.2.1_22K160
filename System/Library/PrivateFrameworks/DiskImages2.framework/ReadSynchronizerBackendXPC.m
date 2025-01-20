@interface ReadSynchronizerBackendXPC
+ (BOOL)supportsSecureCoding;
- (BackendXPC)baseBackendXPC;
- (ReadSynchronizerBackendXPC)initWithBackend:(id)a3;
- (ReadSynchronizerBackendXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ReadSynchronizerBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ReadSynchronizerBackendXPC)initWithBackend:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___ReadSynchronizerBackendXPC;
  v6 = -[ReadSynchronizerBackendXPC init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    p_baseBackendXPC = (id *)&v6->_baseBackendXPC;
    objc_storeStrong((id *)&v6->_baseBackendXPC, a3);
    if (*p_baseBackendXPC)
    {
      [*p_baseBackendXPC backend];
    }

    else
    {
      uint64_t v25 = 0LL;
      v26 = 0LL;
    }

    std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,std::shared_ptr<Backend> &,void>(&v23);
    uint64_t v21 = v23;
    v22 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }

    -[BackendXPC setBackend:](v7, "setBackend:", &v21);
    v11 = v22;
    if (v22)
    {
      v12 = (unint64_t *)&v22->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    v14 = v24;
    if (v24)
    {
      v15 = (unint64_t *)&v24->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    v17 = v26;
    if (v26)
    {
      v18 = (unint64_t *)&v26->__shared_owners_;
      do
        unint64_t v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return v7;
}

- (ReadSynchronizerBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ReadSynchronizerBackendXPC;
  id v5 = -[BackendXPC initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseBackend"];
    baseBackendXPC = v5->_baseBackendXPC;
    v5->_baseBackendXPC = (BackendXPC *)v6;

    v8 = v5->_baseBackendXPC;
    if (v8) {
      -[BackendXPC backend](v8, "backend");
    }
    else {
      v18 = 0LL;
    }
    std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,std::shared_ptr<Backend>,void>(&v19);
    __int128 v20 = v19;
    __int128 v19 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v20);
    v9 = (std::__shared_weak_count *)*((void *)&v20 + 1);
    if (*((void *)&v20 + 1))
    {
      unint64_t v10 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    v12 = (std::__shared_weak_count *)*((void *)&v19 + 1);
    if (*((void *)&v19 + 1))
    {
      unint64_t v13 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ReadSynchronizerBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ReadSynchronizerBackendXPC baseBackendXPC](self, "baseBackendXPC");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"baseBackend"];
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
}

@end