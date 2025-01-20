@interface DiskImageParamsSparseBundle_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsSparseBundle_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v4 = v2;
  v5 = -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v6 = v5;
  if (v5)
  {
    [v5 backend];
    __int128 v7 = v14;
  }

  else
  {
    __int128 v7 = 0uLL;
  }

  __int128 v15 = v7;
  unint64_t v8 = -[DiskImageParamsXPC blockSize](self, "blockSize", 0LL);
  v9 = operator new(0x2E0uLL);
  DiskImageSparseBundle::DiskImageSparseBundle(v9, &v15, v8);
  void *v4 = v9;
  v10 = (std::__shared_weak_count *)*((void *)&v15 + 1);
  if (*((void *)&v15 + 1))
  {
    v11 = (unint64_t *)(*((void *)&v15 + 1) + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v13;
}

- (BOOL)isWritableFormat
{
  return 1;
}

- (unint64_t)numBlocks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 backend];
  unint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 40LL))(v10);
  unint64_t v5 = -[DiskImageParamsXPC blockSize](self, "blockSize");
  v6 = v11;
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

  return v4 / v5;
}

- (BOOL)isSparseFormat
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end