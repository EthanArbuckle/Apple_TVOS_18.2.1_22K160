@interface DiskImageParamsXPC
+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4;
+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4;
+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5;
+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4;
+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4;
- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3;
- (BOOL)isSparseFormat;
- (BOOL)isWritableFormat;
- (BOOL)lockBackendsWithError:(id *)a3;
- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4;
- (BOOL)lockWritableBackendsWithError:(id *)a3;
- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4;
- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5;
- (BOOL)mountedOnAPFS;
- (BackendXPC)backendXPC;
- (BackendXPC)cacheBackendXPC;
- (DIShadowChain)shadowChain;
- (DiskImageParamsXPC)initWithBackendXPC:(id)a3;
- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4;
- (DiskImageParamsXPC)initWithCoder:(id)a3;
- (NSURL)cacheURL;
- (NSUUID)instanceID;
- (id)description;
- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4;
- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7;
- (unint64_t)blockSize;
- (unint64_t)numBlocks;
- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBackendXPC:(id)a3;
- (void)setBlockSize:(unint64_t)a3;
- (void)setCacheBackendXPC:(id)a3;
- (void)setCacheURL:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setShadowChain:(id)a3;
@end

@implementation DiskImageParamsXPC

+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 scheme];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 isEqualToString:@"ram"];

  if (v9)
  {
    v10 = 0LL;
    v11 = -[DiskImageParamsRAM_XPC initWithURL:error:]( objc_alloc(&OBJC_CLASS___DiskImageParamsRAM_XPC),  "initWithURL:error:",  v7,  a5);
LABEL_3:
    v12 = (DiskImageParamsPlugin_XPC *)v11;
    goto LABEL_4;
  }

  [v7 scheme];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = [v14 isEqualToString:@"knox"];

  if (!v15)
  {
    if (![v7 isFileURL])
    {
      [v7 scheme];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = [v30 isEqualToString:@"plugin"];

      if (v31)
      {
        v32 = -[PluginBackendXPC initWithURL:openMode:]( objc_alloc(&OBJC_CLASS___PluginBackendXPC),  "initWithURL:openMode:",  v7,  v6);
        v12 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsPlugin_XPC),  "initWithBackendXPC:",  v32);
        v10 = (ReadSynchronizerBackendXPC *)v32;
        goto LABEL_4;
      }

      v10 = 0LL;
      +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Unsupported URL scheme",  a5);
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }

    v10 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]( &OBJC_CLASS___BackendXPC,  "newFileBackendWithURL:fileOpenFlags:error:",  v7,  v6,  a5);
    if (!v10)
    {
      v12 = 0LL;
      goto LABEL_4;
    }

    int v26 = *__error();
    if (DIForwardLogs())
    {
      lpsrc = 0LL;
      getDIOSLog();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      [v7 path];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158467;
      *(_DWORD *)&buf[4] = 53;
      *(_WORD *)v59 = 2080;
      *(void *)&v59[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
      __int16 v60 = 2113;
      v61 = v28;
      __int16 v62 = 1024;
      int v63 = v6;
      LODWORD(v53) = 34;
      v52 = buf;
      v29 = (char *)_os_log_send_and_compose_impl();

      if (v29)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v29);
        free(v29);
      }
    }

    else
    {
      getDIOSLog();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        [v7 path];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158467;
        *(_DWORD *)&buf[4] = 53;
        *(_WORD *)v59 = 2080;
        *(void *)&v59[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
        __int16 v60 = 2113;
        v61 = v42;
        __int16 v62 = 1024;
        int v63 = v6;
        _os_log_impl( &dword_188046000,  v41,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image file %{private}@ opened with flags %d",  buf,  0x22u);
      }
    }

    *__error() = v26;
    -[BackendXPC backend](v10, "backend");
    if (lpsrc
    {
      *(void *)buf = v43;
      *(void *)v59 = v55;
      p_lpsrc = &lpsrc;
    }

    else
    {
      p_lpsrc = buf;
    }

    void *p_lpsrc = 0LL;
    p_lpsrc[1] = 0LL;
    v45 = v55;
    if (v55)
    {
      p_shared_owners = (unint64_t *)&v55->__shared_owners_;
      do
        unint64_t v47 = __ldaxr(p_shared_owners);
      while (__stlxr(v47 - 1, p_shared_owners));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }

    v12 = *(DiskImageParamsPlugin_XPC **)buf;
    if (*(void *)buf && FileDescriptor::is_device(*(FileDescriptor **)(*(void *)buf + 40LL)))
    {
      v12 = -[DiskImageParamsXPC initWithBackendXPC:blockSize:]( objc_alloc(&OBJC_CLASS___DiskImageParamsRaw_XPC),  "initWithBackendXPC:blockSize:",  v10,  v12->super._cacheURL->_clients);
      char v48 = 0;
    }

    else
    {
      char v48 = 1;
    }

    v49 = *(std::__shared_weak_count **)v59;
    if (*(void *)v59)
    {
      v50 = (unint64_t *)(*(void *)v59 + 8LL);
      do
        unint64_t v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }

    if ((v48 & 1) != 0) {
      goto LABEL_56;
    }
    goto LABEL_4;
  }

  v16 = operator new[](0x800uLL);
  std::shared_ptr<char>::shared_ptr[abi:ne180100]<char,std::default_delete<char []>,void>(buf, (uint64_t)v16);
  v57 = *(DiskImageParamsPlugin_XPC **)buf;
  v17 = operator new[](0x20uLL);
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>( &lpsrc,  (uint64_t)v17);
  id v18 = [v7 absoluteString];
  v19 = (const char *)[v18 UTF8String];
  int v20 = AAS3KnoxResolveURL(v19, 0LL, &v57, 0x20uLL, lpsrc, &v56, 0LL);

  if (v20 < 0)
  {
    uint64_t v33 = *__error();
    v34 = @"Error with resolving knox url";
LABEL_18:
    +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  v33,  v34,  a5);
    v12 = (DiskImageParamsPlugin_XPC *)objc_claimAutoreleasedReturnValue();
    char v25 = 0;
    v10 = 0LL;
    goto LABEL_19;
  }

  if (v56 != 32)
  {
    v34 = @"Error with decryption key size";
    uint64_t v33 = 22LL;
    goto LABEL_18;
  }

  [NSString stringWithUTF8String:v57];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604030] URLWithString:v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v22);

  v24 = objc_alloc(&OBJC_CLASS___ReadSynchronizerBackendXPC);
  v12 = -[KNOXBackendXPC initWithURL:key:](objc_alloc(&OBJC_CLASS___KNOXBackendXPC), "initWithURL:key:", v23, &lpsrc);
  v10 = -[ReadSynchronizerBackendXPC initWithBackend:](v24, "initWithBackend:", v12);

  char v25 = 1;
  id v7 = v23;
LABEL_19:
  v35 = v55;
  if (v55)
  {
    v36 = (unint64_t *)&v55->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  v38 = *(std::__shared_weak_count **)v59;
  if (*(void *)v59)
  {
    v39 = (unint64_t *)(*(void *)v59 + 8LL);
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  if ((v25 & 1) != 0)
  {
    if (!v10)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Error creating backendXPC",  a5);
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }

+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 backend];
    id v7 = v13;
  }

  else
  {
    id v7 = 0LL;
    v14 = 0LL;
  }

  v8 = (udsp_header *)operator new(0x40uLL);
  udsp_header::udsp_header(v8, v7);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  BOOL v11 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  45LL,  @"sparseimage format is not supported by DiskImages2 framework",  a4);
  operator delete(v8);

  return v11;
}

+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6
{
  BOOL v11 = a4;
  id v12 = a1;
  int v9 = a6;
  unint64_t v10 = a5;
  v8[0] = &v11;
  v8[1] = &v10;
  v8[2] = &v9;
  v8[3] = &v12;
  v8[4] = &v11;
  v8[5] = &v9;
  v8[6] = &v11;
  v8[7] = &v10;
  v8[8] = &v9;
  v8[9] = &v11;
  v8[10] = &v10;
  uint64_t v6 = *((unsigned int *)a3 + 10);
  if ((_DWORD)v6 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v13 = v8;
  return ((uint64_t (*)(void **, char *))off_18A1CA700[v6])(&v13, (char *)a3 + 8);
}

+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    [v6 backend];
    __int128 v8 = *(_OWORD *)v28;
  }

  else
  {
    __int128 v8 = 0uLL;
  }

  __int128 v29 = v8;
  AEAHelper::AEAHelper(v28, &v29);
  int v9 = operator new[](0x20uLL);
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,std::default_delete<unsigned char []>,void>( &v26,  (uint64_t)v9);
  if ([a1 getAEAKeyWithHelper:v28 keyBuffer:v26 bufferSize:32 error:a4])
  {
    unint64_t v10 = objc_alloc(&OBJC_CLASS___AEABackendXPC);
    uint64_t v24 = v26;
    char v25 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        unint64_t v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }

    v13 = -[AEABackendXPC initWithBackend:key:](v10, "initWithBackend:key:", v7, &v24);
    v14 = v25;
    if (v25)
    {
      int v15 = (unint64_t *)&v25->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }

  else
  {
    v13 = 0LL;
  }

  v17 = v27;
  if (v27)
  {
    id v18 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::unique_ptr<unsigned char []>,AEAHelper::saks_metadata_t,AEAHelper::kms_t,AEAHelper::wkms_t>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v28[1]);
  AEAwrapper::AuthData::~AuthData(v28);
  int v20 = (std::__shared_weak_count *)*((void *)&v29 + 1);
  if (*((void *)&v29 + 1))
  {
    v21 = (unint64_t *)(*((void *)&v29 + 1) + 8LL);
    do
      unint64_t v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  return v13;
}

+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    lpsrc = 0LL;
    unint64_t v22 = 0LL;
LABEL_6:
    p_lpsrc = &v23;
    goto LABEL_7;
  }

  [v5 backend];
  if (!lpsrc) {
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_6;
  }
  id v23 = v7;
  uint64_t v24 = v22;
  p_lpsrc = &lpsrc;
LABEL_7:
  void *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  int v9 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (!v23) {
    goto LABEL_15;
  }
  int v12 = (*(uint64_t (**)(void *))(*(void *)v23 + 176LL))(v23);
  AAByteStream v25 = AAFileStreamOpenWithFD(v12, 0);
  AEAwrapper::ByteStream::ByteStream(&lpsrc, &v25);
  if (AEAwrapper::ByteStream::pread((AAByteStream *)&lpsrc, &v25, 4uLL, 0LL) < 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = off_18A1E43B0;
    int v20 = std::generic_category();
    exception[1] = 22LL;
    exception[2] = v20;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "is_aea: Error reading magic.";
  }

  int v13 = (int)v25;
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)&lpsrc);
  if (v13 == 826361153)
  {
    +[DiskImageParamsXPC createAEABackendWithBackendXPC:error:]( &OBJC_CLASS___DiskImageParamsXPC,  "createAEABackendWithBackendXPC:error:",  v6,  a4);
    v14 = v6;
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
LABEL_15:
    v14 = 0LL;
  }

  int v15 = v24;
  if (v24)
  {
    unint64_t v16 = (unint64_t *)&v24->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return v6;
}

+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsSparseBundle_XPC),  "initWithBackendXPC:",  v6);
    __int128 v8 = v6;
  }

  else
  {
    [a1 tryCreateAEABackendWithBackendXPC:v6 error:a4];
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v8 backend];
      int v9 = (Backend *)__p[1];
      unint64_t v10 = (di_asif::header *)operator new(0x50uLL);
      di_asif::header::header(v10, v9);
      unint64_t v11 = v17;
      if (v17)
      {
        p_shared_owners = (unint64_t *)&v17->__shared_owners_;
        do
          unint64_t v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }

      __p[0] = v10;
      id v7 = -[DiskImageParamsASIF_XPC initWithBackendXPC:header:]( objc_alloc(&OBJC_CLASS___DiskImageParamsASIF_XPC),  "initWithBackendXPC:header:",  v8,  __p);
      v14 = __p[0];
      __p[0] = 0LL;
      if (v14) {
        operator delete(v14);
      }
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (NSURL)cacheURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 hasBaseImageCache];

  if (v4)
  {
    -[DiskImageParamsXPC shadowChain](self, "shadowChain");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 nodes];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 firstObject];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 URL];
    __int128 v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    cacheURL = self->_cacheURL;
    self->_cacheURL = v8;
  }

  return self->_cacheURL;
}

- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v8 = (void *)[v7 newUnlockedBackendXPCWithPassphrase:0 certificate:v6 isNewImage:1 error:a4];
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v8);

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v9 != 0LL;

  return (char)a4;
}

- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = (void *)[v9 newUnlockedBackendXPCWithPassphrase:a3 certificate:v8 isNewImage:1 error:a5];
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v10);

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = v11 != 0LL;

  return (char)a5;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DiskImageParamsXPC;
  id v8 = -[DiskImageParamsXPC init](&v11, sel_init);
  int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backendXPC, a3);
    v9->_blockSize = a4;
  }

  return v9;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3
{
  return -[DiskImageParamsXPC initWithBackendXPC:blockSize:](self, "initWithBackendXPC:blockSize:", a3, 512LL);
}

- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7
{
  unint64_t v8 = a6;
  int v9 = (int)a5;
  cntrl = a3.__cntrl_;
  ptr = (Backend **)a3.__ptr_;
  unint64_t v13 = v7;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if ((*(uint64_t (**)(unint64_t, SEL))(*(void *)a4 + 24LL))(a4, a2) != 512)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v36,  (uint64_t)"Shadow file cannot be used with a ",  34LL);
    (*(void (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"-bytes block size", 17LL);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v36, 0x13u);
  }

  char v32 = 0;
  *(_DWORD *)&v33[7] = 0;
  *(void *)uint64_t v33 = 256LL;
  int v14 = *((_DWORD *)system_properties::get_resources((system_properties *)0x200) + 8);
  *(_DWORD *)&v33[3] = (v14 - (v8 > 3)) & ~((v14 - (v8 > 3)) >> 31);
  v33[7] = 1;
  if ((*(uint64_t (**)(Backend *))(*(void *)*ptr + 40LL))(*ptr))
  {
    di_asif::header::header((di_asif::header *)v36, *ptr);
    int v15 = (DiskImage *)std::allocate_shared[abi:ne180100]<DiskImageASIF,std::allocator<DiskImageASIF>,std::shared_ptr<Backend> &,di_asif::header &,di_asif::options &,void>( (DiskImageASIF **)ptr,  (Backend *)v36,  (uint64_t)&v32,  &identifier);
    if (((((*(_BYTE *)(identifier + 44) & 1) == 0) ^ v9) & 1) == 0)
    {
      uint64_t v24 = __cxa_allocate_exception(0x40uLL);
      void *v24 = off_18A1E43B0;
      AAByteStream v25 = std::generic_category();
      v24[1] = 22LL;
      v24[2] = v25;
      *((_BYTE *)v24 + 24) = 0;
      *((_BYTE *)v24 + 48) = 0;
      v24[7] = "Shadow/cache file mismatches the cache file attribute";
    }

    uint64_t v17 = v35;
    uint64_t *v13 = identifier;
    v13[1] = v17;
  }

  else
  {
    unint64_t v18 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    unint64_t v19 = 0x10000000000000LL / v18;
    unint64_t v31 = 0x10000000000000LL / v18;
    if (!cntrl)
    {
      unint64_t v18 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 32LL))(a4);
      cntrl = (__shared_weak_count *)v18;
      unint64_t v19 = v31;
    }

    v30 = cntrl;
    if ((unint64_t)cntrl > v19)
    {
      uint64_t v26 = __cxa_allocate_exception(0x40uLL);
      *uint64_t v26 = off_18A1E43B0;
      v27 = std::generic_category();
      v26[1] = 22LL;
      v26[2] = v27;
      *((_BYTE *)v26 + 24) = 0;
      *((_BYTE *)v26 + 48) = 0;
      v26[7] = "Size cannot exceed max ASIF size";
    }

    *(void *)&v36[0] = di_utils::random_uuid((di_utils *)v18);
    *((void *)&v36[0] + 1) = v20;
    uint64_t identifier = di_stackable::get_identifier((di_stackable *)a4, v20);
    uint64_t v35 = v21;
    uint64_t v28 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    v33[0] = v9;
    if (v9) {
      p_uint64_t identifier = (__int128 *)&identifier;
    }
    else {
      p_uint64_t identifier = v36;
    }
    std::allocate_shared[abi:ne180100]<DiskImageASIF,std::allocator<DiskImageASIF>,unsigned long,unsigned int const&,unsigned long long &,unsigned long long &,std::shared_ptr<Backend> &,di_asif::options &,boost::uuids::uuid const&,boost::uuids::uuid const&,void>( (unsigned __int16 *)&v28,  &di_asif::chunk_size_default,  (unint64_t *)&v30,  &v31,  (uint64_t)ptr,  (uint64_t *)&v32,  p_identifier,  &v29,  v36);
    int v15 = (DiskImage *)DiskImageASIF::set_stackable_source_identifier(v29, (uint64_t)&identifier);
    *(_OWORD *)unint64_t v13 = v29;
  }

  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = -[DiskImageParamsXPC shadowChain](self, "shadowChain", a3);
  char v4 = [v3 hasBaseImageCache];

  if ((v4 & 1) == 0)
  {
    int v5 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v11 = 56;
      __int16 v12 = 2080;
      unint64_t v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
      id v7 = (char *)_os_log_send_and_compose_impl();

      if (v7)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
        free(v7);
      }
    }

    else
    {
      getDIOSLog();
      unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v11 = 56;
        __int16 v12 = 2080;
        unint64_t v13 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
        _os_log_impl( &dword_188046000,  v8,  OS_LOG_TYPE_DEFAULT,  "%.*s: On disk cache is not supported on embedded systems",  buf,  0x12u);
      }
    }

    *__error() = v5;
  }

  return 0;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v6 = v4;
  -[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]( self,  "createDiskImageWithCache:shadowValidation:",  0LL,  0LL);
  uint64_t v7 = v10;
  if (v5) {
    uint64_t v8 = 7LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)v10 + 48LL))(&v10, v10, v8);
  *id v6 = v10;
  return (unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>>)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 16LL))(v7);
}

- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4
{
  BOOL v87 = a4;
  BOOL v5 = a3;
  v88 = v4;
  uint64_t v117 = *MEMORY[0x1895F89C0];
  -[DiskImageParamsXPC createSinkDiskImage](self, "createSinkDiskImage");
  BOOL v89 = v5
     && -[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:](self, "allowOnDiskCacheWithSinkDiskImage:", &v110);
  uint64_t v6 = -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  uint64_t v7 = (void *)v6;
  if (!v6)
  {
    if (v89) {
      goto LABEL_6;
    }
LABEL_11:
    *v88 = v110;
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v6;
  }

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v8 isEmpty];

  if (((v9 ^ 1 | v89) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v107 = 0LL;
  uint64_t v108 = 0LL;
  uint64_t v109 = 0LL;
  uint64_t v10 = v110;
  v105 = v110;
  if (v110)
  {
    int v11 = (std::__shared_weak_count *)operator new(0x20uLL);
    v11->__shared_owners_ = 0LL;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__vftable = (std::__shared_weak_count_vtbl *)off_18A1CB9E8;
    v11->__shared_weak_owners_ = 0LL;
    v11[1].__vftable = (std::__shared_weak_count_vtbl *)v10;
    v106 = v11;
    v110 = 0LL;
    v103 = v10;
    v104 = v11;
    do
      unint64_t v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }

  else
  {
    v106 = 0LL;
    v110 = 0LL;
    v103 = 0LL;
    v104 = 0LL;
  }

  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 nodes];
  id obj = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v15 = [obj countByEnumeratingWithState:&v99 objects:v116 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v100;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v100 != v16) {
          objc_enumerationMutation(obj);
        }
        unint64_t v18 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        [v18 fileBackend];
        unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = v19;
        if (v19)
        {
          [v19 backend];
        }

        else
        {
          uint64_t v97 = 0LL;
          v98 = 0LL;
        }

        uint64_t v21 = [v18 numBlocks];
        unint64_t v22 = v103;
        uint64_t v23 = [v18 isCache];
        -[DiskImageParamsXPC shadowChain](self, "shadowChain");
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 nodes];
        AAByteStream v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:]( self,  "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:",  &v97,  v21,  v22,  v23,  [v25 count] + 1);

        uint64_t v26 = v98;
        if (v98)
        {
          v27 = (unint64_t *)&v98->__shared_owners_;
          do
            unint64_t v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
            std::__shared_weak_count::__release_weak(v26);
          }
        }

        if ([v18 isCache])
        {
          int v29 = 2;
        }

        else
        {
          int v29 = (*(uint64_t (**)(void))(**(void **)buf + 40LL))(*(void *)buf) ^ 1;
          std::shared_ptr<DiskImage>::operator=[abi:ne180100](&v103, (uint64_t *)buf);
        }

        *(_OWORD *)v114 = *(_OWORD *)buf;
        *(void *)buf = 0LL;
        *(void *)&uint8_t buf[8] = 0LL;
        int v115 = v29;
        std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::insert( &v107,  v107,  (__n128 *)v114);
        v30 = *(std::__shared_weak_count **)&v114[8];
        if (*(void *)&v114[8])
        {
          unint64_t v31 = (unint64_t *)(*(void *)&v114[8] + 8LL);
          do
            unint64_t v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }

        uint64_t v33 = *(std::__shared_weak_count **)&buf[8];
        if (*(void *)&buf[8])
        {
          v34 = (unint64_t *)(*(void *)&buf[8] + 8LL);
          do
            unint64_t v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
      }

      uint64_t v15 = [obj countByEnumeratingWithState:&v99 objects:v116 count:16];
    }

    while (v15);
  }

  if (v89)
  {
    if (!confstr(65538, v114, 0x400uLL))
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = off_18A1E43B0;
      v84 = std::generic_category();
      exception[1] = 2LL;
      exception[2] = v84;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Could not determine cache dir";
    }

    v113[0] = di_stackable::get_identifier(v105, v36);
    v113[1] = v37;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    if (v113[0] | v37)
    {
      v38 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v113];
    }

    else
    {
      v38 = -[DiskImageParamsXPC instanceID](self, "instanceID");
    }

    [v38 UUIDString];
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    [NSString stringWithFormat:@"%@%@.%@", @"diskimage_", v39, @"cache"];
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:v114 isDirectory:1 relativeToURL:0];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    [v41 URLByAppendingPathComponent:v40];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageParamsXPC setCacheURL:](self, "setCacheURL:", v42);

    int v43 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v95 = 0LL;
      getDIOSLog();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
      v45 = -[DiskImageParamsXPC cacheURL](self, "cacheURL");
      [v45 path];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 64;
      *(_WORD *)&uint8_t buf[8] = 2080;
      *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
      *(_WORD *)&buf[18] = 2114;
      v112 = v46;
      LODWORD(v86) = 28;
      v85 = buf;
      unint64_t v47 = (char *)_os_log_send_and_compose_impl();

      if (v47)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v47);
        free(v47);
      }
    }

    else
    {
      getDIOSLog();
      char v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = -[DiskImageParamsXPC cacheURL](self, "cacheURL");
        [v49 path];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&uint8_t buf[4] = 64;
        *(_WORD *)&uint8_t buf[8] = 2080;
        *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
        *(_WORD *)&buf[18] = 2114;
        v112 = v50;
        _os_log_impl(&dword_188046000, v48, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache path: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v43;
    id v51 = -[DiskImageParamsXPC cacheURL](self, "cacheURL");
    *(void *)buf = [v51 fileSystemRepresentation];
    std::allocate_shared[abi:ne180100]<PurgeableFileBackend,std::allocator<PurgeableFileBackend>,char const*,void>( (char **)buf,  &v95);

    uint64_t v92 = v95;
    v93 = v96;
    if (v96)
    {
      v52 = (unint64_t *)&v96->__shared_owners_;
      do
        unint64_t v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }

    v54 = v105;
    v55 = -[DiskImageParamsXPC shadowChain](self, "shadowChain", v85, v86);
    [v55 nodes];
    size_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:]( self,  "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:",  &v92,  0,  v54,  1,  [v56 count] + 1);

    v57 = v93;
    if (v93)
    {
      v58 = (unint64_t *)&v93->__shared_owners_;
      do
        unint64_t v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }

    *(_OWORD *)buf = v94;
    __int128 v94 = 0uLL;
    *(_DWORD *)&buf[16] = 2;
    std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::emplace_back<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>( &v107,  (uint64_t)buf);
    __int16 v60 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v61 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }

    int v63 = (std::__shared_weak_count *)*((void *)&v94 + 1);
    if (*((void *)&v94 + 1))
    {
      uint64_t v64 = (unint64_t *)(*((void *)&v94 + 1) + 8LL);
      do
        unint64_t v65 = __ldaxr(v64);
      while (__stlxr(v65 - 1, v64));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }

    v66 = v96;
    if (v96)
    {
      v67 = (unint64_t *)&v96->__shared_owners_;
      do
        unint64_t v68 = __ldaxr(v67);
      while (__stlxr(v68 - 1, v67));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
  }

  int v69 = (*(uint64_t (**)(di_stackable *))(*(void *)v105 + 40LL))(v105) ^ 1;
  if (v107 != v108) {
    int v69 = 1;
  }
  *(void *)v114 = v105;
  *(void *)&v114[8] = v106;
  if (v106)
  {
    v70 = (unint64_t *)&v106->__shared_owners_;
    do
      unint64_t v71 = __ldxr(v70);
    while (__stxr(v71 + 1, v70));
  }

  int v115 = v69;
  std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::emplace_back<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>( &v107,  (uint64_t)v114);
  v72 = *(std::__shared_weak_count **)&v114[8];
  if (*(void *)&v114[8])
  {
    v73 = (unint64_t *)(*(void *)&v114[8] + 8LL);
    do
      unint64_t v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
      std::__shared_weak_count::__release_weak(v72);
    }
  }

  v75 = (di_stackable *)operator new(0x98uLL);
  if (v87) {
    int v76 = 2;
  }
  else {
    int v76 = 1;
  }
  LODWORD(v95) = v76;
  v113[0] = 0x200000001LL;
  smart_enums::validators::flags<unsigned int>((uint64_t)"config_t", v76, (int *)v113, 2LL);
  DiskImageStackable::DiskImageStackable(v75, &v107, &v95);
  *v88 = v75;
  v77 = v104;
  if (v104)
  {
    v78 = (unint64_t *)&v104->__shared_owners_;
    do
      unint64_t v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }

  v80 = v106;
  if (v106)
  {
    v81 = (unint64_t *)&v106->__shared_owners_;
    do
      unint64_t v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }

  *(void *)v114 = &v107;
  std::vector<std::tuple<std::shared_ptr<DiskImage>,DiskImageStackable::role>>::__destroy_vector::operator()[abi:ne180100]((void ***)v114);
  uint64_t v6 = (uint64_t)v110;
  v110 = 0LL;
  if (v6) {
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 16LL))(v6);
  }
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v6;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  return (*(uint64_t (**)(void, unint64_t))(**(void **)a3 + 64LL))(*(void *)a3, a4);
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v2 = 0LL;
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)self;
}

- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (-[DiskImageParamsXPC isWritableFormat](self, "isWritableFormat") || !v5)
  {
    -[DiskImageParamsXPC backendXPC](self, "backendXPC");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 lock];

    if ((_DWORD)v8) {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v8,  @"Failed locking the image",  a4);
    }
  }

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    -[DiskImageParamsXPC shadowChain](self, "shadowChain", 0LL);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 nodes];
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) fileBackend];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [v16 lock];

          if ((_DWORD)v17)
          {
            BOOL v18 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v17,  @"Failed locking the shadow file",  a4);

            return v18;
          }
        }

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }

  return 1;
}

- (BOOL)lockBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 0LL, a3);
}

- (BOOL)lockWritableBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 1LL, a3);
}

- (BOOL)isWritableFormat
{
  return 0;
}

- (BOOL)isSparseFormat
{
  return 0;
}

- (unint64_t)numBlocks
{
  return 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  char v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 description];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@[%@]", v5, v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backend"];
  BOOL v5 = (BackendXPC *)objc_claimAutoreleasedReturnValue();
  backendXPC = self->_backendXPC;
  self->_backendXPC = v5;

  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shadowChain"];
  uint64_t v7 = (DIShadowChain *)objc_claimAutoreleasedReturnValue();
  shadowChain = self->_shadowChain;
  self->_shadowChain = v7;

  self->_blockSize = [v4 decodeIntegerForKey:@"blockSize"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceID"];
  int v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  instanceID = self->_instanceID;
  self->_instanceID = v9;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v4 forKey:@"backend"];

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v5 forKey:@"shadowChain"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[DiskImageParamsXPC blockSize](self, "blockSize"), @"blockSize");
  -[DiskImageParamsXPC instanceID](self, "instanceID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v6 forKey:@"instanceID"];
}

- (NSUUID)instanceID
{
  v25[2] = *MEMORY[0x1895F89C0];
  instanceID = self->_instanceID;
  if (instanceID) {
    return instanceID;
  }
  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 instanceID];
  uint64_t v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  -[DiskImageParamsXPC shadowChain](self, "shadowChain");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[DiskImageParamsXPC shadowChain](self, "shadowChain");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 nonCacheNodes];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && [v9 count])
    {
      uint64_t v24 = (uint64_t)&v24;
      uint64_t v10 = 16 * [v9 count] + 16;
      -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", (char *)&v25[-1] - v10);
      unint64_t v11 = 0LL;
      __int16 v12 = (char *)&v25[1] - v10;
      while ([v9 count] > v11)
      {
        [v9 objectAtIndexedSubscript:v11];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 fileBackend];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 instanceID];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        [v15 getUUIDBytes:v12];
        v12 += 16;
        ++v11;
      }

      id v19 = objc_alloc(MEMORY[0x189607AB8]);
      v25[0] = di_utils::buffer_to_uuid((di_utils *)((char *)&v25[-1] - v10), v10);
      v25[1] = v20;
      uint64_t v21 = [v19 initWithUUIDBytes:v25];
      uint64_t v23 = self->_instanceID;
      p_instanceID = &self->_instanceID;
      *p_instanceID = (NSUUID *)v21;

      instanceID = *p_instanceID;
      return instanceID;
    }
  }

  else
  {
    int v9 = 0LL;
  }

  uint64_t v16 = self->_instanceID;
  self->_instanceID = v6;
  uint64_t v17 = v6;

  BOOL v18 = self->_instanceID;
  return v18;
}

- (BOOL)mountedOnAPFS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    [v2 backend];
  }

  else
  {
    uint64_t v17 = 0LL;
    BOOL v18 = 0LL;
  }

  get_sink_backend((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    uint64_t v21 = v4;
    __int128 v22 = v20;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = (void **)&v21;
  }

  void *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  uint64_t v6 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  int v9 = v18;
  if (v18)
  {
    uint64_t v10 = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (v21) {
    BOOL is_mounted_on_apfs = FileDescriptor::is_mounted_on_apfs(v21[5]);
  }
  else {
    BOOL is_mounted_on_apfs = 0;
  }
  uint64_t v13 = v22;
  if (v22)
  {
    uint64_t v14 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return is_mounted_on_apfs;
}

- (BackendXPC)backendXPC
{
  return self->_backendXPC;
}

- (void)setBackendXPC:(id)a3
{
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (void)setShadowChain:(id)a3
{
}

- (BackendXPC)cacheBackendXPC
{
  return self->_cacheBackendXPC;
}

- (void)setCacheBackendXPC:(id)a3
{
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setCacheURL:(id)a3
{
}

- (void)setInstanceID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end