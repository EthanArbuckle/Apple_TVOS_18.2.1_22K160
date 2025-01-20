@interface DiskImageParamsRaw_XPC
+ (BOOL)supportsSecureCoding;
- (BOOL)isWritableFormat;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createSinkDiskImage;
@end

@implementation DiskImageParamsRaw_XPC

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v4 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v6 = v5;
  if (v5)
  {
    [v5 backend];
  }

  else
  {
    uint64_t v61 = 0LL;
    v62 = 0LL;
  }

  sub_100116E98((uint64_t)&v61, &lpsrc);
  if (lpsrc
  {
    v65 = v7;
    v66 = v64;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = (void **)&v65;
  }

  *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  v9 = v64;
  if (v64)
  {
    p_shared_owners = (unint64_t *)&v64->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  v12 = v62;
  if (v62)
  {
    v13 = (unint64_t *)&v62->__shared_owners_;
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  uint64_t v16 = (uint64_t)v65;
  if (v65)
  {
    -[DiskImageParamsXPC setBlockSize:](self, "setBlockSize:", *(void *)(v65[3] + 64LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    v18 = v17;
    if (v17)
    {
      [v17 backend];
    }

    else
    {
      lpsrc = 0LL;
      v64 = 0LL;
    }

    unint64_t v19 = -[DiskImageParamsXPC blockSize](self, "blockSize", v61);
    v20 = operator new(0x58uLL);
    uint64_t v21 = sub_100118D8C();
    v20[8] = 0;
    *(void *)v20 = off_1001777E0;
    v23 = v64;
    *((void *)v20 + 2) = lpsrc;
    *((void *)v20 + 3) = v23;
    if (v23)
    {
      v24 = (unint64_t *)&v23->__shared_owners_;
      do
        unint64_t v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
      v26 = v64;
    }

    else
    {
      v26 = 0LL;
    }

    *((void *)v20 + 9) = v21;
    *((void *)v20 + 10) = v22;
    *((void *)v20 + 4) = 512LL;
    *((void *)v20 + 5) = v19;
    *((void *)v20 + 6) = 1LL;
    *((void *)v20 + 7) = 2 * v19;
    *((void *)v20 + 8) = 0LL;
    void *v4 = v20;
    if (v26)
    {
      v27 = (unint64_t *)&v26->__shared_owners_;
      do
        unint64_t v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }

  v29 = v66;
  if (!v66) {
    goto LABEL_37;
  }
  v30 = (unint64_t *)&v66->__shared_owners_;
  do
    unint64_t v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    if (v16) {
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
    }
  }

  else
  {
LABEL_37:
    if (v16) {
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
    }
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC", v61));
  v33 = v32;
  if (v32)
  {
    [v32 backend];
    if (lpsrc)
    {
      if (v34)
      {
        v65 = v34;
        v66 = v64;
        v35 = &lpsrc;
        goto LABEL_46;
      }
    }
  }

  else
  {
    lpsrc = 0LL;
    v64 = 0LL;
  }

  v35 = (void **)&v65;
LABEL_46:
  *v35 = 0LL;
  v35[1] = 0LL;
  v36 = v64;
  if (v64)
  {
    v37 = (unint64_t *)&v64->__shared_owners_;
    do
      unint64_t v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  uint64_t v39 = (uint64_t)v65;
  if (v65)
  {
    uint64_t v40 = sub_1000F860C((uint64_t)v65);
    v41 = sub_1000E65B4((AEAContext_impl **)(*(void *)(v39 + 56) + 8LL));
    uint64_t v43 = v42;
    v15 = operator new(0x58uLL);
    v44 = v15;
    v45 = v66;
    if (v66)
    {
      v46 = (unint64_t *)&v66->__shared_owners_;
      do
        unint64_t v47 = __ldxr(v46);
      while (__stxr(v47 + 1, v46));
      v15[8] = 0;
      *(void *)v15 = off_1001777E0;
      *((void *)v15 + 2) = v39;
      *((void *)v15 + 3) = v45;
      do
        unint64_t v48 = __ldxr(v46);
      while (__stxr(v48 + 1, v46));
    }

    else
    {
      v15[8] = 0;
      *(void *)v15 = off_1001777E0;
      *((void *)v15 + 2) = v39;
      *((void *)v15 + 3) = 0LL;
    }

    *((void *)v15 + 9) = v41;
    *((void *)v15 + 10) = v43;
    *((void *)v15 + 4) = 512LL;
    *((void *)v15 + 5) = v40;
    *((void *)v15 + 6) = 1LL;
    *((void *)v15 + 7) = 2 * v40;
    *((void *)v15 + 8) = 0LL;
    if (v45)
    {
      v49 = (unint64_t *)&v45->__shared_owners_;
      do
        unint64_t v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }

    void *v4 = v44;
  }

  v51 = v66;
  if (!v66) {
    goto LABEL_69;
  }
  v52 = (unint64_t *)&v66->__shared_owners_;
  do
    unint64_t v53 = __ldaxr(v52);
  while (__stlxr(v53 - 1, v52));
  if (!v53)
  {
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
    if (v39) {
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
    }
  }

  else
  {
LABEL_69:
    if (v39) {
      return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
    }
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v55 = v54;
  if (v54)
  {
    [v54 backend];
  }

  else
  {
    v65 = 0LL;
    v66 = 0LL;
  }

  unint64_t v56 = -[DiskImageParamsXPC blockSize](self, "blockSize");
  v57 = operator new(0x28uLL);
  sub_10004E370((uint64_t)v57, &v65, v56);
  void *v4 = v57;
  v58 = v66;
  if (v66)
  {
    v59 = (unint64_t *)&v66->__shared_owners_;
    do
      unint64_t v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }

  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isWritableFormat
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v3 = v2;
  if (v2)
  {
    [v2 backend];
  }

  else
  {
    uint64_t v17 = 0LL;
    v18 = 0LL;
  }

  sub_100116E98((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    uint64_t v21 = v4;
    uint64_t v22 = v20;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = &v21;
  }

  *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  v7 = v21;
  v6 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  v10 = v20;
  if (v20)
  {
    unint64_t v11 = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  v13 = v18;
  if (v18)
  {
    unint64_t v14 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v7 == 0LL;
}

- (unint64_t)numBlocks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
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

@end