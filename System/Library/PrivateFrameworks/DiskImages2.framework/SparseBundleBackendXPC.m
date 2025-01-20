@interface SparseBundleBackendXPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnlocked;
- (SparseBundleBackendXPC)initWithCoder:(id)a3;
- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4;
- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5;
- (id)newWithCryptoFormat:(const void *)a3;
- (shared_ptr<Backend>)getCryptoHeaderBackend;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
@end

@implementation SparseBundleBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SparseBundleBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundle_handle"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v33 = dup([v6 fileDescriptor]);
    unsigned __int8 v32 = [v4 decodeBoolForKey:@"is_writable"];
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lock_backend"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    __int128 v31 = 0uLL;
    if (v7)
    {
      [v7 backend];
      __int128 v9 = v30;
      __int128 v30 = 0uLL;
      v10 = (std::__shared_weak_count *)*((void *)&v31 + 1);
      __int128 v31 = v9;
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

      if (*((void *)&v30 + 1))
      {
        v13 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
        do
          unint64_t v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          (*(void (**)(void))(**((void **)&v30 + 1) + 16LL))(*((void *)&v30 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v30 + 1));
        }
      }
    }

    crypto::format_serializer::decode(v4, (uint64_t *)-[BackendXPC cryptoHeader](v5, "cryptoHeader"), &v30);
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,int &,BOOL &,std::shared_ptr<FileLocal> &,std::shared_ptr<crypto::format> &,void>( (unsigned int *)&v33,  &v32,  &v28);
    __int128 v29 = v28;
    __int128 v28 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v29, 0LL);
    v15 = (std::__shared_weak_count *)*((void *)&v29 + 1);
    if (*((void *)&v29 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = (std::__shared_weak_count *)*((void *)&v28 + 1);
    if (*((void *)&v28 + 1))
    {
      v19 = (unint64_t *)(*((void *)&v28 + 1) + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    v21 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      v22 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }

    v24 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    if (*((void *)&v31 + 1))
    {
      v25 = (unint64_t *)(*((void *)&v31 + 1) + 8LL);
      do
        unint64_t v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[BackendXPC backend](self, "backend");
  uint64_t v6 = v24;
  v5 = v25;
  uint64_t v26 = v24;
  v27 = v25;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  -[BackendXPC encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  v7 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:(**(uint64_t (***)(uint64_t))(v6 + 24))(v6 + 24)];
  [v4 encodeObject:v7 forKey:@"bundle_handle"];
  [v4 encodeBool:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  __int128 v9 = *(NSCoder **)(v6 + 96);
  if (v9) {
    crypto::format_serializer::encode((crypto::format_serializer *)v4, v9, v8);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 192LL))(v6))
  {
    v10 = objc_alloc_init(&OBJC_CLASS___FileLocalXPC);
    v11 = v10;
    uint64_t v13 = *(void *)(v6 + 80);
    unint64_t v12 = *(std::__shared_weak_count **)(v6 + 88);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }

    uint64_t v21 = v13;
    v22 = v12;
    -[BackendXPC setBackend:](v10, "setBackend:", &v21, 0LL);
    v16 = v22;
    if (v22)
    {
      unint64_t v17 = (unint64_t *)&v22->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }

    [v4 encodeObject:v11 forKey:@"lock_backend"];

    v5 = v27;
  }

  if (v5)
  {
    v19 = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5
{
  id v8 = a3;
  unsigned int v22 = a4;
  unint64_t v21 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  __int128 v9 = -[SparseBundleBackendXPC init](&v20, sel_init);
  if (v9)
  {
    unint64_t v17 = (char *)[v8 fileSystemRepresentation];
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,char const*,int &,unsigned long &,void>( &v17,  &v22,  (uint64_t *)&v21,  &v18);
    __int128 v19 = v18;
    __int128 v18 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v19);
    v10 = (std::__shared_weak_count *)*((void *)&v19 + 1);
    if (*((void *)&v19 + 1))
    {
      v11 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    uint64_t v13 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1))
    {
      unint64_t v14 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
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

  return v9;
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6 = a3;
  unsigned int v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  v7 = -[SparseBundleBackendXPC init](&v18, sel_init);
  if (v7)
  {
    unint64_t v15 = (char *)[v6 fileSystemRepresentation];
    std::allocate_shared[abi:ne180100]<SparseBundleBackend,std::allocator<SparseBundleBackend>,char const*,int &,void>( &v15,  &v19,  &v16);
    __int128 v17 = v16;
    __int128 v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    id v8 = (std::__shared_weak_count *)*((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      __int128 v9 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    v11 = (std::__shared_weak_count *)*((void *)&v16 + 1);
    if (*((void *)&v16 + 1))
    {
      unint64_t v12 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  return v7;
}

- (shared_ptr<Backend>)getCryptoHeaderBackend
{
  v3 = v2;
  -[BackendXPC backend](self, "backend");
  id v4 = (std::__shared_weak_count *)*((void *)&v9[0] + 1);
  v9[1] = v9[0];
  SparseBundleBackend::open_token_file(*(SparseBundleBackend **)&v9[0], v9);
  _OWORD *v3 = v9[0];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4 = a3;
  -[BackendXPC backend](self, "backend");
  __int128 v20 = v19;
  uint64_t v5 = *(void *)(v19 + 104);
  *(void *)&__int128 v19 = *(void *)(v19 + 96);
  *((void *)&v19 + 1) = v5;
  if (v5)
  {
    id v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  -[BackendXPC replaceWithBackendXPC:](&v18, sel_replaceWithBackendXPC_, v4);
  -[BackendXPC backend](self, "backend");
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((void *)(v16 + 96), (uint64_t *)&v19);
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  unint64_t v10 = (std::__shared_weak_count *)*((void *)&v19 + 1);
  if (*((void *)&v19 + 1))
  {
    v11 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unint64_t v13 = (std::__shared_weak_count *)*((void *)&v20 + 1);
  if (*((void *)&v20 + 1))
  {
    unint64_t v14 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
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

- (BOOL)isUnlocked
{
  uint64_t v2 = *(void *)(v6 + 96);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return v2 != 0;
}

- (id)newWithCryptoFormat:(const void *)a3
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___SparseBundleBackendXPC);
  -[BackendXPC backend](self, "backend");
  uint64_t v19 = v17;
  __int128 v20 = v18;
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((void *)(v17 + 96), (uint64_t *)a3);
  uint64_t v15 = v17;
  uint64_t v16 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }

  -[BackendXPC setBackend:](v5, "setBackend:", &v15);
  unint64_t v8 = v16;
  if (v16)
  {
    unint64_t v9 = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  v11 = v20;
  if (v20)
  {
    unint64_t v12 = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return v5;
}

@end