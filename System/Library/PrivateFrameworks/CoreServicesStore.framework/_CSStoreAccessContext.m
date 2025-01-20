@interface _CSStoreAccessContext
- (id).cxx_construct;
- (id)description;
- (id)initForSharedReading;
@end

@implementation _CSStoreAccessContext

- (id)initForSharedReading
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____CSStoreAccessContext;
  v2 = -[_CSStoreAccessContext init](&v9, sel_init);
  if (v2)
  {
    v3 = (char *)operator new(0x50uLL);
    *((void *)v3 + 1) = 0LL;
    *((void *)v3 + 2) = 0LL;
    *((void *)v3 + 3) = off_189D66520;
    *(void *)v3 = off_189D664E8;
    *((_DWORD *)v3 + 8) = 0;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *((_DWORD *)v3 + 18) = 1065353216;
    *(void *)&__int128 v4 = v3 + 24;
    *((void *)&v4 + 1) = v3;
    v5 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        unint64_t v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }

  return v2;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  __int128 v4 = (void *)(*(uint64_t (**)(CSStoreAccessContextInterface *))(*(void *)self->_impl.__ptr_ + 32LL))(self->_impl.__ptr_);
  v5 = (void *)[v3 initWithFormat:@"<_CSStoreAccessContext: %@>", v4];

  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_impl.__cntrl_;
  if (cntrl)
  {
    id v3 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16LL))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  return self;
}

@end