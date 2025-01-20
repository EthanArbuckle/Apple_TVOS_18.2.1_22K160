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
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v38, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSFileHandle, v5),  @"bundle_handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v37 = dup((int)[v8 fileDescriptor]);
    unsigned __int8 v36 = [v4 decodeBoolForKey:@"is_writable"];
    id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(BackendXPC, v9),  @"lock_backend");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    __int128 v35 = 0uLL;
    if (v11)
    {
      [v11 backend];
      __int128 v13 = v34;
      __int128 v34 = 0uLL;
      v14 = (std::__shared_weak_count *)*((void *)&v35 + 1);
      __int128 v35 = v13;
      if (v14)
      {
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          unint64_t v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }

      if (*((void *)&v34 + 1))
      {
        v17 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
        do
          unint64_t v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          (*(void (**)(void))(**((void **)&v34 + 1) + 16LL))(*((void *)&v34 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
        }
      }
    }

    sub_1000B8B0C(v4, (uint64_t *)-[BackendXPC cryptoHeader](v6, "cryptoHeader"), &v34);
    sub_1000BCE5C((unsigned int *)&v37, &v36, &v32);
    __int128 v33 = v32;
    __int128 v32 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v33, 0LL);
    v19 = (std::__shared_weak_count *)*((void *)&v33 + 1);
    if (*((void *)&v33 + 1))
    {
      v20 = (unint64_t *)(*((void *)&v33 + 1) + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    v22 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      v23 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }

    v25 = (std::__shared_weak_count *)*((void *)&v34 + 1);
    if (*((void *)&v34 + 1))
    {
      v26 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
      do
        unint64_t v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }

    v28 = (std::__shared_weak_count *)*((void *)&v35 + 1);
    if (*((void *)&v35 + 1))
    {
      v29 = (unint64_t *)(*((void *)&v35 + 1) + 8LL);
      do
        unint64_t v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[BackendXPC backend](self, "backend");
  uint64_t v6 = v23;
  uint64_t v5 = v24;
  uint64_t v25 = v23;
  v26 = v24;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  -[BackendXPC encodeWithCoder:](&v22, "encodeWithCoder:", v4);
  id v7 = -[NSFileHandle initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:",  (**(uint64_t (***)(uint64_t))(v6 + 24))(v6 + 24));
  [v4 encodeObject:v7 forKey:@"bundle_handle"];
  [v4 encodeBool:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  v8 = *(void **)(v6 + 96);
  if (v8) {
    sub_1000B8F00(v4, v8);
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v6 + 192LL))(v6))
  {
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___FileLocalXPC);
    id v10 = v9;
    uint64_t v12 = *(void *)(v6 + 80);
    v11 = *(std::__shared_weak_count **)(v6 + 88);
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }

    uint64_t v20 = v12;
    unint64_t v21 = v11;
    -[BackendXPC setBackend:](v9, "setBackend:", &v20, 0LL);
    v15 = v21;
    if (v21)
    {
      unint64_t v16 = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    [v4 encodeObject:v10 forKey:@"lock_backend"];

    uint64_t v5 = v26;
  }

  if (v5)
  {
    unint64_t v18 = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (SparseBundleBackendXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4 bandSize:(unint64_t)a5
{
  id v8 = a3;
  int v22 = a4;
  unint64_t v21 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  uint64_t v9 = -[SparseBundleBackendXPC init](&v20, "init");
  if (v9)
  {
    unint64_t v17 = (char *)[v8 fileSystemRepresentation];
    sub_1000BCF6C(&v17, &v22, &v21, &v18);
    __int128 v19 = v18;
    __int128 v18 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v19);
    id v10 = (std::__shared_weak_count *)*((void *)&v19 + 1);
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

    __int128 v13 = (std::__shared_weak_count *)*((void *)&v18 + 1);
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
  int v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SparseBundleBackendXPC;
  id v7 = -[SparseBundleBackendXPC init](&v18, "init");
  if (v7)
  {
    unint64_t v15 = (char *)[v6 fileSystemRepresentation];
    sub_1000BD0F8(&v15, &v19, &v16);
    __int128 v17 = v16;
    __int128 v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    id v8 = (std::__shared_weak_count *)*((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      uint64_t v9 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
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
  sub_1000736E8(*(int **)&v9[0], v9);
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
  -[BackendXPC replaceWithBackendXPC:](&v18, "replaceWithBackendXPC:", v4);
  -[BackendXPC backend](self, "backend");
  sub_10001C610((void *)(v16 + 96), (uint64_t *)&v19);
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
  sub_10001C610((void *)(v17 + 96), (uint64_t *)a3);
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