@interface KNOXBackendXPC
+ (BOOL)supportsSecureCoding;
- (DIURL)URL;
- (KNOXBackendXPC)initWithCoder:(id)a3;
- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4;
- (id).cxx_construct;
- (shared_ptr<unsigned)key;
- (void)encodeWithCoder:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation KNOXBackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNOXBackendXPC)initWithURL:(id)a3 key:(void *)a4
{
  id v7 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___KNOXBackendXPC;
  v8 = -[KNOXBackendXPC init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v8->_key.__ptr_, (uint64_t *)a4);
    objc_storeStrong((id *)&v9->_URL, a3);
    v10 = -[KNOXBackendXPC URL](v9, "URL");
    id v11 = [v10 absoluteString];
    v23 = (char *)[v11 UTF8String];
    std::allocate_shared[abi:ne180100]<std::string,std::allocator<std::string>,char const*,void>(&v23, &v24);
    int v22 = 0;
    std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,std::shared_ptr<std::string>,int,std::shared_ptr<unsigned char> &,void>( (uint64_t)&v24,  &v22,  &v26);
    __int128 v27 = v26;
    __int128 v26 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v27);
    v12 = (std::__shared_weak_count *)*((void *)&v27 + 1);
    if (*((void *)&v27 + 1))
    {
      v13 = (unint64_t *)(*((void *)&v27 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    v15 = (std::__shared_weak_count *)*((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v26 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    v18 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  return v9;
}

- (KNOXBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___KNOXBackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    v8 = (_OWORD *)[v4 decodeBytesForKey:@"encKeys" returnedLength:&v33];
    if (!v8 || v33 != 32LL)
    {
      __int128 v26 = 0LL;
      goto LABEL_27;
    }

    v9 = operator new[](0x20uLL);
    std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>( &v32,  (uint64_t)v9);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&v5->_key, &v32);
    v10 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      id v11 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    ptr = v5->_key.__ptr_;
    __int128 v14 = v8[1];
    *(_OWORD *)ptr = *v8;
    *((_OWORD *)ptr + 1) = v14;
    v15 = -[KNOXBackendXPC URL](v5, "URL");
    id v16 = [v15 absoluteString];
    v29 = (char *)[v16 UTF8String];
    std::allocate_shared[abi:ne180100]<std::string,std::allocator<std::string>,char const*,void>(&v29, &v32);
    int v28 = 0;
    std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,std::shared_ptr<std::string>,int,std::shared_ptr<unsigned char> &,void>( (uint64_t)&v32,  &v28,  &v30);
    __int128 v31 = v30;
    __int128 v30 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v31);
    unint64_t v17 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    if (*((void *)&v31 + 1))
    {
      v18 = (unint64_t *)(*((void *)&v31 + 1) + 8LL);
      do
        unint64_t v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    unint64_t v20 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      v21 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    v23 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      uint64_t v24 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
  }

  __int128 v26 = v5;
LABEL_27:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KNOXBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  v5 = -[KNOXBackendXPC URL](self, "URL");
  [v4 encodeObject:v5 forKey:@"URL"];

  [v4 encodeBytes:self->_key.__ptr_ length:32 forKey:@"encKeys"];
}

- (DIURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
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