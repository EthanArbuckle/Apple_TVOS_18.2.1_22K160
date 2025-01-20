@interface CryptoBackendXPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnlocked;
- (BackendXPC)baseBackendXPC;
- (CryptoBackendXPC)initWithCoder:(id)a3;
- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
@end

@implementation CryptoBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CryptoBackendXPC)initWithFormat:(const void *)a3 baseBackendXPC:(id)a4
{
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CryptoBackendXPC;
  v8 = -[CryptoBackendXPC init](&v25, "init");
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a4);
    if (*p_baseBackendXPC)
    {
      [*p_baseBackendXPC backend];
    }

    else
    {
      uint64_t v21 = 0LL;
      v22 = 0LL;
    }

    sub_1000BD744((uint64_t)&v21, (uint64_t)a3, &v23);
    __int128 v24 = v23;
    __int128 v23 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v24);
    v11 = (std::__shared_weak_count *)*((void *)&v24 + 1);
    if (*((void *)&v24 + 1))
    {
      v12 = (unint64_t *)(*((void *)&v24 + 1) + 8LL);
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    v14 = (std::__shared_weak_count *)*((void *)&v23 + 1);
    if (*((void *)&v23 + 1))
    {
      v15 = (unint64_t *)(*((void *)&v23 + 1) + 8LL);
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    v17 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        unint64_t v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }

  return v9;
}

- (CryptoBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CryptoBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v33, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    sub_1000B8B0C(v4, (uint64_t *)-[BackendXPC cryptoHeader](v5, "cryptoHeader"), &v31);
    if (!v31)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100196FC8;
      v26 = std::generic_category();
      exception[1] = 154LL;
      exception[2] = v26;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Failed to deserialize crypto format";
    }

    id v8 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BackendXPC, v7),  @"baseBackend");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    baseBackendXPC = v6->_baseBackendXPC;
    v6->_baseBackendXPC = (BackendXPC *)v9;

    v11 = v6->_baseBackendXPC;
    if (v11)
    {
      -[BackendXPC backend](v11, "backend");
    }

    else
    {
      uint64_t v27 = 0LL;
      v28 = 0LL;
    }

    sub_1000BD804((uint64_t)&v27, (uint64_t)&v31, &v29);
    __int128 v30 = v29;
    __int128 v29 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v30);
    v12 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      unint64_t v13 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    v15 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1))
    {
      unint64_t v16 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    uint64_t v21 = v32;
    if (v32)
    {
      v22 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CryptoBackendXPC;
  -[BackendXPC encodeWithCoder:](&v17, "encodeWithCoder:", v4);
  -[BackendXPC backend](self, "backend");
  __int128 v16 = v14;
  v5 = *(void **)(v14 + 40);
  v6 = *(std::__shared_weak_count **)(v14 + 48);
  *(void *)&__int128 v15 = v5;
  *((void *)&v15 + 1) = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  sub_1000B8F00(v4, v5);
  if (v6)
  {
    uint64_t v9 = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CryptoBackendXPC baseBackendXPC](self, "baseBackendXPC", v15, (void)v16));
  [v4 encodeObject:v11 forKey:@"baseBackend"];

  if (*((void *)&v16 + 1))
  {
    v12 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(void))(**((void **)&v16 + 1) + 16LL))(*((void *)&v16 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v16 + 1));
    }
  }
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v5 = a3;
  -[BackendXPC backend](self, "backend");
  if (v5)
  {
    [v5 backend];
    __int128 v6 = v12;
  }

  else
  {
    __int128 v6 = 0uLL;
  }

  uint64_t v7 = *(std::__shared_weak_count **)(v13 + 32);
  *(_OWORD *)(v13 + 24) = v6;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  objc_storeStrong((id *)&self->_baseBackendXPC, a3);
  if (v14)
  {
    unint64_t v10 = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (BOOL)isUnlocked
{
  return 1;
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
}

- (void).cxx_destruct
{
}

@end