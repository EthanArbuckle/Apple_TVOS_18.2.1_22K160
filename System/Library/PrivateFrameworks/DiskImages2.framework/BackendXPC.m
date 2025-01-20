@interface BackendXPC
+ (BOOL)supportsSecureCoding;
+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5;
- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
- (BOOL)isUnlocked;
- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6;
- (BOOL)tryCreatingCryptoHeader;
- (BackendXPC)initWithCoder:(id)a3;
- (NSUUID)instanceID;
- (id).cxx_construct;
- (id)description;
- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6;
- (id)newWithCryptoFormat:(const void *)a3;
- (int)lock;
- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6;
- (shared_ptr<Backend>)backend;
- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6;
- (void)cryptoHeader;
- (void)encodeWithCoder:(id)a3;
- (void)replaceWithBackendXPC:(id)a3;
- (void)setBackend:(shared_ptr<Backend>)a3;
@end

@implementation BackendXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BackendXPC)initWithCoder:(id)a3
{
  v4 = (crypto::header_serializer *)a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BackendXPC;
  v5 = -[BackendXPC init](&v11, sel_init);
  if (v5)
  {
    crypto::header_serializer::decode(v4, (crypto::header **)&__p);
    v6 = (header *)__p;
    __p = 0LL;
    value = v5->_cryptoHeader.__ptr_.__value_;
    v5->_cryptoHeader.__ptr_.__value_ = v6;
    if (value)
    {
      operator delete(value);
      v8 = __p;
      __p = 0LL;
      if (v8) {
        operator delete(v8);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  value = self->_cryptoHeader.__ptr_.__value_;
  if (value) {
    [v5 encodeBytes:value length:76 forKey:@"crypto_header"];
  }
}

- (int)lock
{
  if (lpsrc
  {
    v19 = v2;
    v20 = v18;
    p_lpsrc = &lpsrc;
  }

  else
  {
    p_lpsrc = (void **)&v19;
  }

  *p_lpsrc = 0LL;
  p_lpsrc[1] = 0LL;
  v4 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  v7 = v16;
  if (v16)
  {
    v8 = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  if (v19) {
    int v10 = (**v19)(v19);
  }
  else {
    int v10 = 0;
  }
  objc_super v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return v10;
}

- (NSUUID)instanceID
{
  v12[2] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(MEMORY[0x189607AB8]);
  -[BackendXPC backend](self, "backend");
  v12[0] = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 160LL))(v10);
  v12[1] = v4;
  id v5 = (void *)[v3 initWithUUIDBytes:v12];
  unint64_t v6 = v11;
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

  return (NSUUID *)v5;
}

- (BOOL)tryCreatingCryptoHeader
{
  if (v9 && (unint64_t)(*(uint64_t (**)())(*(void *)v9 + 40LL))() >= 0x4C)
  {
    uint64_t v4 = (crypto::header *)operator new(0x4CuLL);
    crypto::header::header(v4, v9);
    value = self->_cryptoHeader.__ptr_.__value_;
    self->_cryptoHeader.__ptr_.__value_ = (header *)v4;
    if (value) {
      operator delete(value);
    }
    BOOL v3 = 1;
  }

  else
  {
    BOOL v3 = 0;
  }

  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v3;
}

- (void)cryptoHeader
{
  return &self->_cryptoHeader;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4 = a3;
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = off_18A1E43B0;
    unint64_t v9 = std::generic_category();
    exception[1] = 22LL;
    exception[2] = v9;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Unexpected backend replace request";
  }

  if (v4) {
    [v4 backend];
  }
  else {
    __int128 v10 = 0uLL;
  }
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)&self->_backend, &v10);
  id v5 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1))
  {
    unint64_t v6 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (id)newWithCryptoFormat:(const void *)a3
{
  return -[CryptoBackendXPC initWithFormat:baseBackendXPC:]( objc_alloc(&OBJC_CLASS___CryptoBackendXPC),  "initWithFormat:baseBackendXPC:",  a3,  self);
}

- (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  BOOL v8 = +[DICryptoHelper createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:]( &OBJC_CLASS___DICryptoHelper,  "createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:",  self,  a3);
  if (v8) {
    LOBYTE(v8) = +[DICryptoHelper getPrivateKeyWithHeader:privateKey:error:]( &OBJC_CLASS___DICryptoHelper,  "getPrivateKeyWithHeader:privateKey:error:",  a3,  a4,  a5);
  }
  return v8;
}

- (keys)generateNewImageKeysWithPassphrase:(SEL)a3 privateKey:(const char *)a4 pubKeyHeader:(__SecKey *)a5 header_backend:(public_key_header *)a6
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v11 = *(void *)a7.__ptr_;
  v12 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
  if (a4) {
    return (keys *)crypto::keys::keys(retstr, v11, v12, a4);
  }
  unsigned int var0 = a6->var0.var0.var0;
  __int128 v15 = *(_OWORD *)a6->var0.var1.var0;
  __int128 v16 = *(_OWORD *)&a6->var0.var1.var0[16];
  __int128 v17 = *(_OWORD *)&a6->var1.var0;
  memcpy(v18, &a6->var4.var1, sizeof(v18));
  return (keys *)crypto::keys::keys(retstr, v11, v12, a5, &var0);
}

- (BOOL)newUnlockBackendXPCValidateArgsWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  unint64_t v9 = (unint64_t)a4;
  __int128 v10 = (void *)v9;
  if ((unint64_t)a3 | v9)
  {
    if (!v9)
    {
      if (!a3 || !*a3)
      {
        uint64_t v11 = @"Passphrase cannot be empty";
        goto LABEL_11;
      }

      if (strnlen(a3, 0x101uLL) >= 0x101)
      {
        uint64_t v11 = @"Passphrase is too long";
LABEL_11:
        BOOL v12 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v11,  a6);
        goto LABEL_12;
      }
    }
  }

  else if (v7)
  {
    BOOL v12 = +[DIError failWithOSStatus:description:error:]( &OBJC_CLASS___DIError,  "failWithOSStatus:description:error:",  22LL,  @"Certificate cannot be empty",  a6);
LABEL_12:
    BOOL v13 = v12;
    goto LABEL_13;
  }

  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (shared_ptr<crypto::format>)makeCryptoFormatWithIsNewImage:(BOOL)a3 pass:(const char *)a4 certificate:(id)a5 error:(id *)a6
{
  BOOL v9 = a3;
  uint64_t v11 = v6;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  v44 = a4;
  id v12 = a5;
  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (!v42)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = off_18A1E43B0;
    v29 = std::generic_category();
    exception[1] = 4294967291LL;
    exception[2] = v29;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Failed opening the crypto header backend";
  }

  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  if (!v9)
  {
    v50[0] = 0;
    v53[512] = 0;
    v39 = 0LL;
    if (a4)
    {
      crypto::keys::keys(&v30, v42, -[BackendXPC cryptoHeader](self, "cryptoHeader"), a4);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v37);
      uint64_t v15 = v37;
      uint64_t v16 = v38;
      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      uint64_t v40 = v15;
      uint64_t v41 = v16;
      if (__p)
      {
        v36 = __p;
        operator delete(__p);
      }

      __int128 v17 = v34;
      v34 = 0LL;
      if (v17) {
        operator delete(v17);
      }
      if (v32)
      {
        v33 = v32;
        operator delete(v32);
      }

      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }

      goto LABEL_25;
    }

    if (-[BackendXPC getPrivateKeyWithHeader:privateKey:error:]( self,  "getPrivateKeyWithHeader:privateKey:error:",  v50,  &v39,  a6))
    {
      v18 = v39;
      uint64_t v19 = v42;
      v20 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
      int v45 = *(_DWORD *)v50;
      __int128 v46 = *(_OWORD *)&v50[4];
      __int128 v47 = v51;
      __int128 v48 = v52;
      memcpy(v49, v53, sizeof(v49));
      crypto::keys::keys(&v30, v19, v20, v39, &v45);
      std::allocate_shared[abi:ne180100]<crypto::format,std::allocator<crypto::format>,crypto::keys,void>(&v37);
      uint64_t v15 = v37;
      uint64_t v16 = v38;
      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      uint64_t v40 = v15;
      uint64_t v41 = v16;
      if (__p)
      {
        v36 = __p;
        operator delete(__p);
      }

      v21 = v34;
      v34 = 0LL;
      if (v21) {
        operator delete(v21);
      }
      if (v32)
      {
        v33 = v32;
        operator delete(v32);
      }

      if (v30)
      {
        v31 = v30;
        operator delete(v30);
      }

      goto LABEL_25;
    }

- (id)newUnlockedBackendXPCWithPassphrase:(const char *)a3 certificate:(id)a4 isNewImage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  if (-[BackendXPC newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:]( self,  "newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:",  a3,  v10,  v7,  a6))
  {
    -[BackendXPC makeCryptoFormatWithIsNewImage:pass:certificate:error:]( self,  "makeCryptoFormatWithIsNewImage:pass:certificate:error:",  v7,  a3,  v10,  a6);
    if (v16) {
      id v11 = -[BackendXPC newWithCryptoFormat:](self, "newWithCryptoFormat:", &v16);
    }
    else {
      id v11 = 0LL;
    }
    id v12 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)isUnlocked
{
  return 0;
}

+ (id)newFileBackendWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (stat((const char *)[v7 fileSystemRepresentation], &v16))
  {
    uint64_t v8 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  *__error(),  @"stat failed",  a5);
  }

  else
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      int v18 = 56;
      __int16 v19 = 2080;
      *(_DWORD *)buf = 68159746;
      v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
      __int16 v21 = 1024;
      dev_t st_dev = v16.st_dev;
      __int16 v23 = 2048;
      __darwin_ino64_t st_ino = v16.st_ino;
      __int16 v25 = 1024;
      int st_mode = v16.st_mode;
      __int16 v27 = 1024;
      uid_t st_uid = v16.st_uid;
      __int16 v29 = 1024;
      gid_t st_gid = v16.st_gid;
      __int16 v31 = 2048;
      off_t st_size = v16.st_size;
      __int16 v33 = 2048;
      blkcnt_t st_blocks = v16.st_blocks;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      getDIOSLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 56;
        __int16 v19 = 2080;
        *(_DWORD *)buf = 68159746;
        v20 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
        __int16 v21 = 1024;
        dev_t st_dev = v16.st_dev;
        __int16 v23 = 2048;
        __darwin_ino64_t st_ino = v16.st_ino;
        __int16 v25 = 1024;
        int st_mode = v16.st_mode;
        __int16 v27 = 1024;
        uid_t st_uid = v16.st_uid;
        __int16 v29 = 1024;
        gid_t st_gid = v16.st_gid;
        __int16 v31 = 2048;
        off_t st_size = v16.st_size;
        __int16 v33 = 2048;
        blkcnt_t st_blocks = v16.st_blocks;
        _os_log_impl( &dword_188046000,  v12,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)",  buf,  0x48u);
      }
    }

    *__error() = v9;
    if ((v16.st_mode & 0xF000) == 0x4000) {
      BOOL v13 = &off_18A1C7920;
    }
    else {
      BOOL v13 = &off_18A1C77D8;
    }
    uint64_t v8 = [objc_alloc(*v13) initWithURL:v7 fileOpenFlags:v6];
  }

  unint64_t v14 = (void *)v8;

  return v14;
}

- (shared_ptr<Backend>)backend
{
  cntrl = self->_backend.__cntrl_;
  objc_class *v2 = self->_backend.__ptr_;
  v2[1] = (Backend *)cntrl;
  if (cntrl)
  {
    id v4 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Backend *)self;
  return result;
}

- (void)setBackend:(shared_ptr<Backend>)a3
{
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](&self->_backend.__ptr_, (uint64_t *)a3.__ptr_);
}

- (void).cxx_destruct
{
  value = self->_cryptoHeader.__ptr_.__value_;
  self->_cryptoHeader.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end