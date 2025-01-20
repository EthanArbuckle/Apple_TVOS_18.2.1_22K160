@interface FileLocalXPC
+ (BOOL)supportsSecureCoding;
- (FileLocalXPC)initWithCoder:(id)a3;
- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FileLocalXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6 = a3;
  int v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  v7 = -[FileLocalXPC init](&v18, sel_init);
  if (v7)
  {
    v15 = (char *)[v6 fileSystemRepresentation];
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,char const*,int &,void>(&v15, &v19, &v16);
    __int128 v17 = v16;
    __int128 v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    v8 = (std::__shared_weak_count *)*((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
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
      v12 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
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

- (FileLocalXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  v5 = -[BackendXPC initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file_handle"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = [v4 decodeBoolForKey:@"is_writable"];
    char v17 = [v4 decodeBoolForKey:@"is_locked"];
    int v16 = dup([v6 fileDescriptor]);
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,BOOL &,BOOL &,void>( &v16,  &v18,  &v17,  &v14);
    __int128 v15 = v14;
    __int128 v14 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v15, 0LL);
    v7 = (std::__shared_weak_count *)*((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      v8 = (unint64_t *)(*((void *)&v15 + 1) + 8LL);
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    unint64_t v10 = (std::__shared_weak_count *)*((void *)&v14 + 1);
    if (*((void *)&v14 + 1))
    {
      v11 = (unint64_t *)(*((void *)&v14 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[BackendXPC backend](self, "backend");
  id v6 = v11;
  v5 = v12;
  unint64_t v13 = v11;
  __int128 v14 = v12;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  -[BackendXPC encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  v7 = (void *)[objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:(*(uint64_t (**)(FileLocal *))(*(void *)v6 + 176))(v6)];
  [v4 encodeObject:v7 forKey:@"file_handle"];
  [v4 encodeBool:(*(uint64_t (**)(FileLocal *))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  [v4 encodeBool:FileLocal::remove_lock_ownership(v6) forKey:@"is_locked"];

  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

@end