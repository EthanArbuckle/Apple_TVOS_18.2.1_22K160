@interface AEABackendXPC
+ (BOOL)supportsSecureCoding;
- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4;
- (AEABackendXPC)initWithCoder:(id)a3;
- (BackendXPC)baseBackendXPC;
- (id).cxx_construct;
- (shared_ptr<unsigned)key;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AEABackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AEABackendXPC)initWithBackend:(id)a3 key:(shared_ptr<unsigned char>)a4
{
  ptr = (uint64_t *)a4.__ptr_;
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  v8 = -[AEABackendXPC init](&v23, "init");
  v9 = v8;
  if (v8)
  {
    p_baseBackendXPC = (id *)&v8->_baseBackendXPC;
    objc_storeStrong((id *)&v8->_baseBackendXPC, a3);
    sub_10001C610(&v9->_key.__ptr_, ptr);
    if (*p_baseBackendXPC) {
      [*p_baseBackendXPC backend];
    }
    else {
      v20 = 0LL;
    }
    sub_1000BDA54(&v21);
    __int128 v22 = v21;
    __int128 v21 = 0uLL;
    -[BackendXPC setBackend:](v9, "setBackend:", &v22);
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

  return v9;
}

- (AEABackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  v5 = -[BackendXPC initWithCoder:](&v34, "initWithCoder:", v4);
  if (!v5)
  {
LABEL_28:
    v19 = v5;
    goto LABEL_29;
  }

  id v6 = v4;
  id v7 = [v6 decodeBytesForKey:@"encKeys" returnedLength:&v33];
  if (v7 && v33 == 32LL)
  {
    v8 = operator new[](0x20uLL);
    sub_100096200(&v32, (uint64_t)v8);
    sub_1000198A4((uint64_t)&v5->_key, &v32);
    v10 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      v11 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
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
    __int128 v14 = v7[1];
    *(_OWORD *)ptr = *v7;
    *((_OWORD *)ptr + 1) = v14;
    id v15 = objc_msgSend( v6,  "decodeObjectOfClass:forKey:",  objc_opt_class(BackendXPC, v9),  @"baseBackend");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    baseBackendXPC = v5->_baseBackendXPC;
    v5->_baseBackendXPC = (BackendXPC *)v16;

    unint64_t v18 = v5->_baseBackendXPC;
    if (v18) {
      -[BackendXPC backend](v18, "backend");
    }
    else {
      __int128 v32 = 0uLL;
    }
    sub_1000BDA54(&v30);
    __int128 v31 = v30;
    __int128 v30 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v31, 0LL);
    v20 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    if (*((void *)&v31 + 1))
    {
      __int128 v21 = (unint64_t *)(*((void *)&v31 + 1) + 8LL);
      do
        unint64_t v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }

    objc_super v23 = (std::__shared_weak_count *)*((void *)&v30 + 1);
    if (*((void *)&v30 + 1))
    {
      v24 = (unint64_t *)(*((void *)&v30 + 1) + 8LL);
      do
        unint64_t v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    v26 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      v27 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }

    goto LABEL_28;
  }

  v19 = 0LL;
LABEL_29:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AEABackendXPC;
  -[BackendXPC encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  [v4 encodeBytes:self->_key.__ptr_ length:32 forKey:@"encKeys"];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEABackendXPC baseBackendXPC](self, "baseBackendXPC"));
  [v4 encodeObject:v5 forKey:@"baseBackend"];
}

- (BackendXPC)baseBackendXPC
{
  return self->_baseBackendXPC;
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