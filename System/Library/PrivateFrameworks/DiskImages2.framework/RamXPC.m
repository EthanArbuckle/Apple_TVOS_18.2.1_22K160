@interface RamXPC
+ (BOOL)supportsSecureCoding;
- (RamXPC)initWithSize:(unint64_t)a3;
- (id)description;
- (void)createRamBackend;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RamXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RamXPC)initWithSize:(unint64_t)a3
{
  unint64_t v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RamXPC;
  v3 = -[RamXPC init](&v13, sel_init);
  if (v3)
  {
    std::allocate_shared[abi:ne180100]<BackendNull,std::allocator<BackendNull>,unsigned long long &,void>( (uint64_t *)&v14,  &v11);
    __int128 v12 = v11;
    __int128 v11 = 0uLL;
    -[BackendXPC setBackend:](v3, "setBackend:", &v12, 0LL);
    v4 = (std::__shared_weak_count *)*((void *)&v12 + 1);
    if (*((void *)&v12 + 1))
    {
      v5 = (unint64_t *)(*((void *)&v12 + 1) + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }

    v7 = (std::__shared_weak_count *)*((void *)&v11 + 1);
    if (*((void *)&v11 + 1))
    {
      v8 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }

  return v3;
}

- (void)createRamBackend
{
  v22[2] = *MEMORY[0x1895F89C0];
  -[BackendXPC backend](self, "backend");
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 40LL))(v20);
  -[BackendXPC backend](self, "backend");
  v22[0] = (*(uint64_t (**)())(*(void *)v15 + 160LL))();
  v22[1] = v3;
  std::allocate_shared[abi:ne180100]<Ram,std::allocator<Ram>,unsigned long long,boost::uuids::uuid,void>( (size_t *)&v17,  v22,  &v18);
  __int128 v19 = v18;
  __int128 v18 = 0uLL;
  -[BackendXPC setBackend:](self, "setBackend:", &v19);
  v4 = (std::__shared_weak_count *)*((void *)&v19 + 1);
  if (*((void *)&v19 + 1))
  {
    v5 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
    do
      unint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  v7 = (std::__shared_weak_count *)*((void *)&v18 + 1);
  if (*((void *)&v18 + 1))
  {
    v8 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  __int128 v12 = v21;
  if (v21)
  {
    objc_super v13 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RamXPC;
  -[BackendXPC encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[BackendXPC backend](self, "backend");
  [v4 encodeInt64:(*(uint64_t (**)())(*(void *)v8 + 40))() forKey:@"size"];
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v7 = -[BackendXPC instanceID](self, "instanceID");
  [v4 encodeObject:v7 forKey:@"identifier"];
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RamXPC;
  -[BackendXPC description](&v12, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BackendXPC backend](self, "backend");
  [v3 stringWithFormat:@"%@[ramsize=%llu]", v4, (*(uint64_t (**)(uint64_t))(*(void *)v10 + 40))(v10)];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  return v5;
}

@end