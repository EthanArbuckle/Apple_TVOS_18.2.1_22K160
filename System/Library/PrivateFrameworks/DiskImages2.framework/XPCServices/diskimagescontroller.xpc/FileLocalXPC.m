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
  unsigned int v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  v7 = -[FileLocalXPC init](&v18, "init");
  if (v7)
  {
    v15 = (char *)[v6 fileSystemRepresentation];
    sub_1000BCC54(&v15, &v19, &v16);
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
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  id v6 = -[BackendXPC initWithCoder:](&v21, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSFileHandle, v5),  @"file_handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned __int8 v20 = [v4 decodeBoolForKey:@"is_writable"];
    unsigned __int8 v19 = [v4 decodeBoolForKey:@"is_locked"];
    unsigned int v18 = dup((int)[v8 fileDescriptor]);
    sub_1000BCD90(&v18, &v20, (char *)&v19, &v16);
    __int128 v17 = v16;
    __int128 v16 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v17, 0LL);
    v9 = (std::__shared_weak_count *)*((void *)&v17 + 1);
    if (*((void *)&v17 + 1))
    {
      unint64_t v10 = (unint64_t *)(*((void *)&v17 + 1) + 8LL);
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    v12 = (std::__shared_weak_count *)*((void *)&v16 + 1);
    if (*((void *)&v16 + 1))
    {
      unint64_t v13 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[BackendXPC backend](self, "backend");
  uint64_t v6 = v11;
  uint64_t v5 = v12;
  uint64_t v13 = v11;
  unint64_t v14 = v12;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FileLocalXPC;
  -[BackendXPC encodeWithCoder:](&v10, "encodeWithCoder:", v4);
  id v7 = -[NSFileHandle initWithFileDescriptor:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:",  (*(uint64_t (**)(uint64_t))(*(void *)v6 + 176LL))(v6));
  [v4 encodeObject:v7 forKey:@"file_handle"];
  [v4 encodeBool:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  [v4 encodeBool:sub_100105444(v6) forKey:@"is_locked"];

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