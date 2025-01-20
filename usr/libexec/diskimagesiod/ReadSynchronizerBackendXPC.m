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
  v6 = -[ReadSynchronizerBackendXPC init](&v27, "init");
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

    sub_1000B7C28(&v23);
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
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ReadSynchronizerBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v23, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BackendXPC, v5),  @"baseBackend");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v8;

    unint64_t v10 = v6->_baseBackendXPC;
    if (v10) {
      -[BackendXPC backend](v10, "backend");
    }
    else {
      v20 = 0LL;
    }
    sub_1000B7D10(&v21);
    __int128 v22 = v21;
    __int128 v21 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v22);
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

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ReadSynchronizerBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReadSynchronizerBackendXPC baseBackendXPC](self, "baseBackendXPC"));
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