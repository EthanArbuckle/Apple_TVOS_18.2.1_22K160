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
  v8 = -[KNOXBackendXPC init](&v28, "init");
  v9 = v8;
  if (v8)
  {
    sub_10001C610(&v8->_key.__ptr_, (uint64_t *)a4);
    objc_storeStrong((id *)&v9->_URL, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KNOXBackendXPC URL](v9, "URL"));
    id v11 = objc_claimAutoreleasedReturnValue([v10 absoluteString]);
    v23 = (char *)[v11 UTF8String];
    sub_1000BDB44(&v23, &v24);
    int v22 = 0;
    sub_1000BDC3C((uint64_t)&v24, &v22, &v26);
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
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___KNOXBackendXPC;
  v6 = -[BackendXPC initWithCoder:](&v36, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), @"URL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    v10 = [v4 decodeBytesForKey:@"encKeys" returnedLength:&v35];
    if (!v10 || v35 != 32LL)
    {
      objc_super v28 = 0LL;
      goto LABEL_27;
    }

    id v11 = operator new[](0x20uLL);
    sub_100096200(&v34, (uint64_t)v11);
    sub_1000198A4((uint64_t)&v6->_key, &v34);
    v12 = (std::__shared_weak_count *)*((void *)&v34 + 1);
    if (*((void *)&v34 + 1))
    {
      v13 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    ptr = v6->_key.__ptr_;
    __int128 v16 = v10[1];
    *(_OWORD *)ptr = *v10;
    *((_OWORD *)ptr + 1) = v16;
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[KNOXBackendXPC URL](v6, "URL"));
    id v18 = objc_claimAutoreleasedReturnValue([v17 absoluteString]);
    v31 = (char *)[v18 UTF8String];
    sub_1000BDB44(&v31, &v34);
    int v30 = 0;
    sub_1000BDC3C((uint64_t)&v34, &v30, &v32);
    __int128 v33 = v32;
    __int128 v32 = 0uLL;
    -[BackendXPC setBackend:](v6, "setBackend:", &v33);
    v19 = (std::__shared_weak_count *)*((void *)&v33 + 1);
    if (*((void *)&v33 + 1))
    {
      unint64_t v20 = (unint64_t *)(*((void *)&v33 + 1) + 8LL);
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }

    int v22 = (std::__shared_weak_count *)*((void *)&v32 + 1);
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
      __int128 v26 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
      do
        unint64_t v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }

  objc_super v28 = v6;
LABEL_27:

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___KNOXBackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNOXBackendXPC URL](self, "URL"));
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