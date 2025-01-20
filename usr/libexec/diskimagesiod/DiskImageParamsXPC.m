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
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);
  unsigned int v9 = [v8 isEqualToString:@"ram"];

  if (v9)
  {
    v10 = 0LL;
    v11 = -[DiskImageParamsRAM_XPC initWithURL:error:]( objc_alloc(&OBJC_CLASS___DiskImageParamsRAM_XPC),  "initWithURL:error:",  v7,  a5);
LABEL_3:
    v12 = (DiskImageParamsPlugin_XPC *)v11;
    goto LABEL_4;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);
  unsigned int v15 = [v14 isEqualToString:@"knox"];

  if (!v15)
  {
    if (![v7 isFileURL])
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);
      unsigned int v34 = [v33 isEqualToString:@"plugin"];

      if (v34)
      {
        v35 = -[PluginBackendXPC initWithURL:openMode:]( objc_alloc(&OBJC_CLASS___PluginBackendXPC),  "initWithURL:openMode:",  v7,  v6);
        v12 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsPlugin_XPC),  "initWithBackendXPC:",  v35);
        v10 = (ReadSynchronizerBackendXPC *)v35;
        goto LABEL_4;
      }

      v10 = 0LL;
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Unsupported URL scheme",  a5));
      goto LABEL_3;
    }

    v10 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]( &OBJC_CLASS___BackendXPC,  "newFileBackendWithURL:fileOpenFlags:error:",  v7,  v6,  a5);
    if (!v10)
    {
      v12 = 0LL;
      goto LABEL_4;
    }

    int v26 = *__error();
    if (sub_1000B8654())
    {
      lpsrc = 0LL;
      uint64_t v27 = sub_1000B85DC();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
      *(_DWORD *)buf = 68158467;
      if (v29) {
        uint64_t v31 = 3LL;
      }
      else {
        uint64_t v31 = 2LL;
      }
      *(_DWORD *)&buf[4] = 53;
      *(_WORD *)v61 = 2080;
      *(void *)&v61[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
      __int16 v62 = 2113;
      v63 = v30;
      __int16 v64 = 1024;
      int v65 = v6;
      v32 = (char *)_os_log_send_and_compose_impl( v31,  &lpsrc,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%.*s: Image file %{private}@ opened with flags %d",  buf,  34);

      if (v32)
      {
        fprintf(__stderrp, "%s\n", v32);
        free(v32);
      }
    }

    else
    {
      uint64_t v44 = sub_1000B85DC();
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
        *(_DWORD *)buf = 68158467;
        *(_DWORD *)&buf[4] = 53;
        *(_WORD *)v61 = 2080;
        *(void *)&v61[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
        __int16 v62 = 2113;
        v63 = v46;
        __int16 v64 = 1024;
        int v65 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image file %{private}@ opened with flags %d",  buf,  0x22u);
      }
    }

    *__error() = v26;
    -[BackendXPC backend](v10, "backend");
    if (lpsrc
    {
      *(void *)buf = v47;
      *(void *)v61 = v57;
      p_lpsrc = &lpsrc;
    }

    else
    {
      p_lpsrc = buf;
    }

    void *p_lpsrc = 0LL;
    p_lpsrc[1] = 0LL;
    v49 = v57;
    if (v57)
    {
      p_shared_owners = (unint64_t *)&v57->__shared_owners_;
      do
        unint64_t v51 = __ldaxr(p_shared_owners);
      while (__stlxr(v51 - 1, p_shared_owners));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }

    v12 = *(DiskImageParamsPlugin_XPC **)buf;
    if (*(void *)buf && sub_1000FB22C(*(void *)(*(void *)buf + 40LL)))
    {
      v12 = -[DiskImageParamsXPC initWithBackendXPC:blockSize:]( objc_alloc(&OBJC_CLASS___DiskImageParamsRaw_XPC),  "initWithBackendXPC:blockSize:",  v10,  v12->super._cacheURL->_clients);
      char v52 = 0;
    }

    else
    {
      char v52 = 1;
    }

    v53 = *(std::__shared_weak_count **)v61;
    if (*(void *)v61)
    {
      v54 = (unint64_t *)(*(void *)v61 + 8LL);
      do
        unint64_t v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }

    if ((v52 & 1) != 0) {
      goto LABEL_59;
    }
    goto LABEL_4;
  }

  v16 = operator new[](0x800uLL);
  sub_10008E73C(buf, (uint64_t)v16);
  v59 = *(DiskImageParamsPlugin_XPC **)buf;
  v17 = operator new[](0x20uLL);
  sub_10008E818(&lpsrc, (uint64_t)v17);
  id v18 = objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  v19 = (const char *)[v18 UTF8String];
  int v20 = AAS3KnoxResolveURL(v19, 0LL, &v59, 0x20uLL, lpsrc, &v58, 0LL);

  if (v20 < 0)
  {
    uint64_t v36 = *__error();
    v37 = @"Error with resolving knox url";
LABEL_21:
    v12 = (DiskImageParamsPlugin_XPC *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  v36,  v37,  a5));
    char v25 = 0;
    v10 = 0LL;
    goto LABEL_22;
  }

  if (v58 != 32)
  {
    v37 = @"Error with decryption key size";
    uint64_t v36 = 22LL;
    goto LABEL_21;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v59));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v21));
  id v23 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v22);

  v24 = objc_alloc(&OBJC_CLASS___ReadSynchronizerBackendXPC);
  v12 = -[KNOXBackendXPC initWithURL:key:](objc_alloc(&OBJC_CLASS___KNOXBackendXPC), "initWithURL:key:", v23, &lpsrc);
  v10 = -[ReadSynchronizerBackendXPC initWithBackend:](v24, "initWithBackend:", v12);

  char v25 = 1;
  id v7 = v23;
LABEL_22:
  v38 = v57;
  if (v57)
  {
    v39 = (unint64_t *)&v57->__shared_owners_;
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  v41 = *(std::__shared_weak_count **)v61;
  if (*(void *)v61)
  {
    v42 = (unint64_t *)(*(void *)v61 + 8LL);
    do
      unint64_t v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  if ((v25 & 1) != 0)
  {
    if (!v10)
    {
      v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Error creating backendXPC",  a5));
      goto LABEL_3;
    }

+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 backend];
    uint64_t v7 = v13;
  }

  else
  {
    uint64_t v7 = 0LL;
    v14 = 0LL;
  }

  v8 = operator new(0x40uLL);
  sub_10007EEFC(v8, v7);
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
  unsigned int v9 = a6;
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
    sub_100017130();
  }
  uint64_t v13 = v8;
  return ((uint64_t (*)(void **, char *))off_100177570[v6])(&v13, (char *)a3 + 8);
}

+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
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
  sub_1000E42EC(v28, &v29);
  unsigned int v9 = operator new[](0x20uLL);
  sub_10008E818(&v26, (uint64_t)v9);
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

    uint64_t v13 = -[AEABackendXPC initWithBackend:key:](v10, "initWithBackend:key:", v7, &v24);
    v14 = v25;
    if (v25)
    {
      unsigned int v15 = (unint64_t *)&v25->__shared_owners_;
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
    uint64_t v13 = 0LL;
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

  sub_10008D93C((uint64_t)&v28[1]);
  sub_1000E67A8(v28);
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
  unsigned int v9 = v22;
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
  sub_1000E6458(&lpsrc, &v25);
  if (sub_1000E6488((AAByteStream *)&lpsrc, &v25, 4uLL, 0LL) < 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100189E78;
    int v20 = std::generic_category();
    exception[1] = 22LL;
    exception[2] = v20;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "is_aea: Error reading magic.";
  }

  int v13 = (int)v25;
  sub_1000E645C((AAByteStream *)&lpsrc);
  if (v13 == 826361153)
  {
    v14 = v6;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[DiskImageParamsXPC createAEABackendWithBackendXPC:error:]( &OBJC_CLASS___DiskImageParamsXPC,  "createAEABackendWithBackendXPC:error:",  v6,  a4));
  }

  else
  {
LABEL_15:
    v14 = 0LL;
  }

  unsigned int v15 = v24;
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
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SparseBundleBackendXPC, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    unsigned int v9 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsSparseBundle_XPC),  "initWithBackendXPC:",  v6);
    unint64_t v10 = v6;
  }

  else
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 tryCreateAEABackendWithBackendXPC:v6 error:a4]);

    if (v10)
    {
      [v10 backend];
      unint64_t v11 = __p[1];
      int v12 = operator new(0x50uLL);
      sub_1000CA580(v12, v11);
      int v13 = v19;
      if (v19)
      {
        p_shared_owners = (unint64_t *)&v19->__shared_owners_;
        do
          unint64_t v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }

      __p[0] = v12;
      unsigned int v9 = -[DiskImageParamsASIF_XPC initWithBackendXPC:header:]( objc_alloc(&OBJC_CLASS___DiskImageParamsASIF_XPC),  "initWithBackendXPC:header:",  v10,  __p);
      unint64_t v16 = __p[0];
      __p[0] = 0LL;
      if (v16) {
        operator delete(v16);
      }
    }

    else
    {
      unsigned int v9 = 0LL;
    }
  }

  return v9;
}

- (NSURL)cacheURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  unsigned int v4 = [v3 hasBaseImageCache];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nodes]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v8 = (NSURL *)objc_claimAutoreleasedReturnValue([v7 URL]);
    cacheURL = self->_cacheURL;
    self->_cacheURL = v8;
  }

  return self->_cacheURL;
}

- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  id v8 = [v7 newUnlockedBackendXPCWithPassphrase:0 certificate:v6 isNewImage:1 error:a4];
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v8);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  LOBYTE(a4) = v9 != 0LL;

  return (char)a4;
}

- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  id v10 = [v9 newUnlockedBackendXPCWithPassphrase:a3 certificate:v8 isNewImage:1 error:a5];
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v10);

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  LOBYTE(a5) = v11 != 0LL;

  return (char)a5;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DiskImageParamsXPC;
  id v8 = -[DiskImageParamsXPC init](&v11, "init");
  unsigned int v9 = v8;
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
  ptr = (uint64_t *)a3.__ptr_;
  int v13 = v7;
  if ((*(uint64_t (**)(unint64_t, SEL))(*(void *)a4 + 24LL))(a4, a2) != 512)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100004D60((uint64_t)v36);
    sub_100004E4C(v36, (uint64_t)"Shadow file cannot be used with a ", 34LL);
    uint64_t v23 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    std::ostream::operator<<(v36, v23);
    sub_100004E4C(v36, (uint64_t)"-bytes block size", 17LL);
    sub_10001161C((uint64_t)exception, (uint64_t)v36, 0x13u);
  }

  char v32 = 0;
  *(_DWORD *)&v33[7] = 0;
  *(void *)v33 = 256LL;
  int v14 = *((_DWORD *)sub_100037420() + 8);
  *(_DWORD *)&v33[3] = (v14 - (v8 > 3)) & ~((v14 - (v8 > 3)) >> 31);
  v33[7] = 1;
  if ((*(uint64_t (**)(uint64_t))(*(void *)*ptr + 40LL))(*ptr))
  {
    sub_1000CA580(v36, *ptr);
    unint64_t v15 = (DiskImage *)sub_10008E8F4(ptr, (uint64_t)v36, (uint64_t)&v32, &v34);
    if (((((*(_BYTE *)(v34 + 44) & 1) == 0) ^ v9) & 1) == 0)
    {
      uint64_t v24 = __cxa_allocate_exception(0x40uLL);
      void *v24 = &off_100189E78;
      AAByteStream v25 = std::generic_category();
      v24[1] = 22LL;
      v24[2] = v25;
      *((_BYTE *)v24 + 24) = 0;
      *((_BYTE *)v24 + 48) = 0;
      v24[7] = "Shadow/cache file mismatches the cache file attribute";
    }

    uint64_t v17 = v35;
    *int v13 = v34;
    v13[1] = v17;
  }

  else
  {
    unint64_t v18 = 0x10000000000000uLL / (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    unint64_t v31 = v18;
    if (!cntrl)
    {
      cntrl = (__shared_weak_count *)(*(uint64_t (**)(unint64_t))(*(void *)a4 + 32LL))(a4);
      unint64_t v18 = v31;
    }

    v30 = cntrl;
    if ((unint64_t)cntrl > v18)
    {
      uint64_t v26 = __cxa_allocate_exception(0x40uLL);
      *uint64_t v26 = &off_100189E78;
      uint64_t v27 = std::generic_category();
      v26[1] = 22LL;
      v26[2] = v27;
      *((_BYTE *)v26 + 24) = 0;
      *((_BYTE *)v26 + 48) = 0;
      v26[7] = "Size cannot exceed max ASIF size";
    }

    *(void *)&v36[0] = sub_100118D8C();
    *((void *)&v36[0] + 1) = v19;
    uint64_t v34 = sub_100059028((uint64_t (***)(void))a4);
    uint64_t v35 = v20;
    uint64_t v28 = (*(uint64_t (**)(unint64_t))(*(void *)a4 + 24LL))(a4);
    v33[0] = v9;
    if (v9) {
      v21 = (__int128 *)&v34;
    }
    else {
      v21 = v36;
    }
    sub_10008EA24( (unsigned __int16 *)&v28,  &dword_10013B9BC,  (unint64_t *)&v30,  &v31,  ptr,  (uint64_t *)&v32,  v21,  &v29,  v36);
    unint64_t v15 = (DiskImage *)sub_1000CE410((uint64_t *)v29, (uint64_t)&v34);
    *(_OWORD *)int v13 = v29;
  }

  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain", a3));
  unsigned __int8 v4 = [v3 hasBaseImageCache];

  if ((v4 & 1) == 0)
  {
    int v5 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v14 = 0LL;
      uint64_t v6 = sub_1000B85DC();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v16 = 56;
      __int16 v17 = 2080;
      unint64_t v18 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
      LODWORD(v13) = 18;
      int v9 = (char *)_os_log_send_and_compose_impl( v8,  &v14,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: On disk cache is not supported on embedded systems",  (int)buf,  v13);

      if (v9)
      {
        fprintf(__stderrp, "%s\n", v9);
        free(v9);
      }
    }

    else
    {
      uint64_t v10 = sub_1000B85DC();
      objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v16 = 56;
        __int16 v17 = 2080;
        unint64_t v18 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%.*s: On disk cache is not supported on embedded systems",  buf,  0x12u);
      }
    }

    *__error() = v5;
  }

  return 0;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v6 = v4;
  -[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]( self,  "createDiskImageWithCache:shadowValidation:",  0LL,  0LL);
  uint64_t v7 = v10;
  if (v5) {
    uint64_t v8 = 7LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)v10 + 48LL))(&v10, v10, v8);
  *uint64_t v6 = v10;
  return (unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>>)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 16LL))(v7);
}

- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4
{
  BOOL v88 = a4;
  BOOL v5 = a3;
  v89 = v4;
  -[DiskImageParamsXPC createSinkDiskImage](self, "createSinkDiskImage");
  if (v5) {
    unsigned int v90 = -[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:](self, "allowOnDiskCacheWithSinkDiskImage:", &v111);
  }
  else {
    unsigned int v90 = 0;
  }
  v6.var0.var0 = (DiskImage *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  var0 = v6.var0.var0;
  if (!v6.var0.var0)
  {
    if ((v90 & 1) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    *v89 = v111;
    return v6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  unsigned int v9 = [v8 isEmpty];

  if (((v9 ^ 1 | v90) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  v108 = 0LL;
  v109 = 0LL;
  uint64_t v110 = 0LL;
  uint64_t v10 = v111;
  v106 = v111;
  if (v111)
  {
    objc_super v11 = (std::__shared_weak_count *)operator new(0x20uLL);
    v11->__shared_owners_ = 0LL;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__vftable = (std::__shared_weak_count_vtbl *)&off_10016D3B8;
    v11->__shared_weak_owners_ = 0LL;
    v11[1].__vftable = v10;
    v107 = v11;
    v111 = 0LL;
    v104 = v10;
    v105 = v11;
    do
      unint64_t v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }

  else
  {
    v107 = 0LL;
    v111 = 0LL;
    v104 = 0LL;
    v105 = 0LL;
  }

  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v14 nodes]);

  id v15 = [obj countByEnumeratingWithState:&v100 objects:v117 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v101;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v101 != v16) {
          objc_enumerationMutation(obj);
        }
        unint64_t v18 = *(void **)(*((void *)&v100 + 1) + 8LL * (void)i);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 fileBackend]);
        uint64_t v20 = v19;
        if (v19)
        {
          [v19 backend];
        }

        else
        {
          uint64_t v98 = 0LL;
          v99 = 0LL;
        }

        id v21 = [v18 numBlocks];
        unint64_t v22 = v104;
        id v23 = [v18 isCache];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
        AAByteStream v25 = (void *)objc_claimAutoreleasedReturnValue([v24 nodes]);
        -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:]( self,  "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:",  &v98,  v21,  v22,  v23,  (char *)[v25 count] + 1);

        uint64_t v26 = v99;
        if (v99)
        {
          uint64_t v27 = (unint64_t *)&v99->__shared_owners_;
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
          sub_100026A1C(&v104, (uint64_t *)buf);
        }

        *(_OWORD *)v115 = *(_OWORD *)buf;
        *(void *)buf = 0LL;
        *(void *)&uint8_t buf[8] = 0LL;
        int v116 = v29;
        sub_10008A098((uint64_t *)&v108, (uint64_t)v108, (__n128 *)v115);
        v30 = *(std::__shared_weak_count **)&v115[8];
        if (*(void *)&v115[8])
        {
          unint64_t v31 = (unint64_t *)(*(void *)&v115[8] + 8LL);
          do
            unint64_t v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }

        v33 = *(std::__shared_weak_count **)&buf[8];
        if (*(void *)&buf[8])
        {
          uint64_t v34 = (unint64_t *)(*(void *)&buf[8] + 8LL);
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

      id v15 = [obj countByEnumeratingWithState:&v100 objects:v117 count:16];
    }

    while (v15);
  }

  if (v90)
  {
    if (!confstr(65538, v115, 0x400uLL))
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100189E78;
      v86 = std::generic_category();
      exception[1] = 2LL;
      exception[2] = v86;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 48) = 0;
      exception[7] = "Could not determine cache dir";
    }

    v114[0] = sub_100059028(v106);
    v114[1] = v36;
    *(void *)buf = 0LL;
    *(void *)&uint8_t buf[8] = 0LL;
    if (v114[0] | v36) {
      v37 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v114);
    }
    else {
      v37 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC instanceID](self, "instanceID"));
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v37, "UUIDString"));

    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@.%@",  @"diskimage_",  v38,  @"cache"));
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:",  v115,  1LL,  0LL));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 URLByAppendingPathComponent:v39]);
    -[DiskImageParamsXPC setCacheURL:](self, "setCacheURL:", v41);

    int v42 = *__error();
    if (sub_1000B8654())
    {
      uint64_t v96 = 0LL;
      uint64_t v43 = sub_1000B85DC();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v45 = 3LL;
      }
      else {
        uint64_t v45 = 2LL;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 path]);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 64;
      *(_WORD *)&uint8_t buf[8] = 2080;
      *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
      *(_WORD *)&buf[18] = 2114;
      v113 = v47;
      LODWORD(v87) = 28;
      v48 = (char *)_os_log_send_and_compose_impl( v45,  &v96,  0LL,  0LL,  &_mh_execute_header,  v44,  0LL,  "%.*s: On disk cache path: %{public}@",  buf,  v87);

      if (v48)
      {
        fprintf(__stderrp, "%s\n", v48);
        free(v48);
      }
    }

    else
    {
      uint64_t v49 = sub_1000B85DC();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL"));
        char v52 = (void *)objc_claimAutoreleasedReturnValue([v51 path]);
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&uint8_t buf[4] = 64;
        *(_WORD *)&uint8_t buf[8] = 2080;
        *(void *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
        *(_WORD *)&buf[18] = 2114;
        v113 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%.*s: On disk cache path: %{public}@",  buf,  0x1Cu);
      }
    }

    *__error() = v42;
    id v53 = objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL"));
    *(void *)buf = [v53 fileSystemRepresentation];
    sub_10008EB7C((char **)buf, &v96);

    uint64_t v93 = v96;
    v94 = v97;
    if (v97)
    {
      v54 = (unint64_t *)&v97->__shared_owners_;
      do
        unint64_t v55 = __ldxr(v54);
      while (__stxr(v55 + 1, v54));
    }

    v56 = v106;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    size_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 nodes]);
    -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:]( self,  "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:",  &v93,  0,  v56,  1,  (char *)[v58 count] + 1);

    v59 = v94;
    if (v94)
    {
      v60 = (unint64_t *)&v94->__shared_owners_;
      do
        unint64_t v61 = __ldaxr(v60);
      while (__stlxr(v61 - 1, v60));
      if (!v61)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
    }

    *(_OWORD *)buf = v95;
    __int128 v95 = 0uLL;
    *(_DWORD *)&buf[16] = 2;
    sub_10008A204((uint64_t *)&v108, (uint64_t)buf);
    __int16 v62 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      v63 = (unint64_t *)(*(void *)&buf[8] + 8LL);
      do
        unint64_t v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }

    int v65 = (std::__shared_weak_count *)*((void *)&v95 + 1);
    if (*((void *)&v95 + 1))
    {
      v66 = (unint64_t *)(*((void *)&v95 + 1) + 8LL);
      do
        unint64_t v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }

    v68 = v97;
    if (v97)
    {
      v69 = (unint64_t *)&v97->__shared_owners_;
      do
        unint64_t v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
  }

  int v71 = (*((uint64_t (**)(std::__shared_weak_count_vtbl *))v106->~__shared_weak_count + 5))(v106) ^ 1;
  if (v108 != v109) {
    int v71 = 1;
  }
  *(void *)v115 = v106;
  *(void *)&v115[8] = v107;
  if (v107)
  {
    v72 = (unint64_t *)&v107->__shared_owners_;
    do
      unint64_t v73 = __ldxr(v72);
    while (__stxr(v73 + 1, v72));
  }

  int v116 = v71;
  sub_10008A204((uint64_t *)&v108, (uint64_t)v115);
  v74 = *(std::__shared_weak_count **)&v115[8];
  if (*(void *)&v115[8])
  {
    v75 = (unint64_t *)(*(void *)&v115[8] + 8LL);
    do
      unint64_t v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }

  v77 = (std::__shared_weak_count_vtbl *)operator new(0x98uLL);
  if (v88) {
    int v78 = 2;
  }
  else {
    int v78 = 1;
  }
  LODWORD(v96) = v78;
  v114[0] = 0x200000001LL;
  sub_10008DD20((uint64_t)"config_t", v78, (int *)v114, 2LL);
  sub_100059AE0((uint64_t)v77, &v108, &v96);
  *v89 = v77;
  v79 = v105;
  if (v105)
  {
    v80 = (unint64_t *)&v105->__shared_owners_;
    do
      unint64_t v81 = __ldaxr(v80);
    while (__stlxr(v81 - 1, v80));
    if (!v81)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }

  v82 = v107;
  if (v107)
  {
    v83 = (unint64_t *)&v107->__shared_owners_;
    do
      unint64_t v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }

  *(void *)v115 = &v108;
  sub_1000504E4((void ***)v115);
  v6.var0.var0 = (DiskImage *)v111;
  v111 = 0LL;
  if (v6.var0.var0) {
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)(*(uint64_t (**)(unique_ptr<DiskImage, std::default_delete<DiskImage>>))(*(void *)v6.var0.var0 + 16LL))(v6);
  }
  return v6;
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
  if (-[DiskImageParamsXPC isWritableFormat](self, "isWritableFormat") || !v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    id v8 = [v7 lock];

    if ((_DWORD)v8) {
      return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v8,  @"Failed locking the image",  a4);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));

  if (v10)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain", 0LL));
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodes]);

    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)i) fileBackend]);
          id v17 = [v16 lock];

          if ((_DWORD)v17)
          {
            BOOL v18 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v17,  @"Failed locking the shadow file",  a4);

            return v18;
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
  v3 = (objc_class *)objc_opt_class(self, a2);
  unsigned __int8 v4 = NSStringFromClass(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@[%@]", v5, v7));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BackendXPC, v5), @"backend");
  uint64_t v7 = (BackendXPC *)objc_claimAutoreleasedReturnValue(v6);
  backendXPC = self->_backendXPC;
  self->_backendXPC = v7;

  id v10 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(DIShadowChain, v9),  @"shadowChain");
  objc_super v11 = (DIShadowChain *)objc_claimAutoreleasedReturnValue(v10);
  shadowChain = self->_shadowChain;
  self->_shadowChain = v11;

  self->_blockSize = (unint64_t)[v4 decodeIntegerForKey:@"blockSize"];
  id v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v13), @"instanceID");
  id v15 = (NSUUID *)objc_claimAutoreleasedReturnValue(v14);
  instanceID = self->_instanceID;
  self->_instanceID = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  [v7 encodeObject:v4 forKey:@"backend"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  [v7 encodeObject:v5 forKey:@"shadowChain"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[DiskImageParamsXPC blockSize](self, "blockSize"), @"blockSize");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC instanceID](self, "instanceID"));
  [v7 encodeObject:v6 forKey:@"instanceID"];
}

- (NSUUID)instanceID
{
  instanceID = self->_instanceID;
  if (instanceID) {
    return instanceID;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  id v6 = (NSUUID *)objc_claimAutoreleasedReturnValue([v5 instanceID]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nonCacheNodes]);

    if (v9 && [v9 count])
    {
      uint64_t v24 = (uint64_t)&v24;
      uint64_t v10 = 16 * (void)[v9 count] + 16;
      -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", (char *)&v25[-1] - v10);
      unint64_t v11 = 0LL;
      int v12 = (char *)&v25[1] - v10;
      while ((unint64_t)[v9 count] > v11)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v11]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fileBackend]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 instanceID]);

        [v15 getUUIDBytes:v12];
        v12 += 16;
        ++v11;
      }

      __int128 v19 = objc_alloc(&OBJC_CLASS___NSUUID);
      v25[0] = sub_100118C90((char *)&v25[-1] - v10, v10);
      v25[1] = v20;
      __int128 v21 = -[NSUUID initWithUUIDBytes:](v19, "initWithUUIDBytes:", v25);
      id v23 = self->_instanceID;
      p_instanceID = &self->_instanceID;
      *p_instanceID = v21;

      instanceID = *p_instanceID;
      return instanceID;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v16 = self->_instanceID;
  self->_instanceID = v6;
  id v17 = v6;

  BOOL v18 = self->_instanceID;
  return v18;
}

- (BOOL)mountedOnAPFS
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
    BOOL v18 = 0LL;
  }

  sub_100116E98((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    __int128 v21 = v4;
    __int128 v22 = v20;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = (void **)&v21;
  }

  void *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  id v6 = v20;
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

  uint64_t v9 = v18;
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
    BOOL v12 = sub_10008DD9C(v21[5]);
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v22;
  if (v22)
  {
    id v14 = (unint64_t *)&v22->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v12;
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