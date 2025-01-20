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
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BackendXPC;
  v5 = -[BackendXPC init](&v11, "init");
  if (v5)
  {
    sub_1000B72E4(v4, &__p);
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
  id v4 = v18;
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
  v3 = objc_alloc(&OBJC_CLASS___NSUUID);
  -[BackendXPC backend](self, "backend");
  v12[0] = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 160LL))(v10);
  v12[1] = v4;
  id v5 = -[NSUUID initWithUUIDBytes:](v3, "initWithUUIDBytes:", v12);
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

  return v5;
}

- (BOOL)tryCreatingCryptoHeader
{
  if (v9 && (unint64_t)(*(uint64_t (**)())(*(void *)v9 + 40LL))() >= 0x4C)
  {
    uint64_t v4 = (header *)operator new(0x4CuLL);
    sub_100115288(v4);
    value = self->_cryptoHeader.__ptr_.__value_;
    self->_cryptoHeader.__ptr_.__value_ = v4;
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
  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (void)replaceWithBackendXPC:(id)a3
{
  id v4 = a3;
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    uint64_t v9 = std::generic_category();
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
  sub_1000198A4((uint64_t)&self->_backend, &v10);
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
  uint64_t v11 = *(void *)a7.__ptr_;
  v12 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
  if (a4) {
    return (keys *)sub_1001170E8(retstr, v11, v12, a4);
  }
  unsigned int var0 = a6->var0.var0.var0;
  __int128 v15 = *(_OWORD *)a6->var0.var1.var0;
  __int128 v16 = *(_OWORD *)&a6->var0.var1.var0[16];
  __int128 v17 = *(_OWORD *)&a6->var1.var0;
  memcpy(v18, &a6->var4.var1, sizeof(v18));
  return (keys *)sub_100116DA8(retstr, v11, v12, a5, &var0);
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
        unsigned __int8 v12 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v11,  a6);
        goto LABEL_12;
      }
    }
  }

  else if (v7)
  {
    unsigned __int8 v12 = +[DIError failWithOSStatus:description:error:]( &OBJC_CLASS___DIError,  "failWithOSStatus:description:error:",  22LL,  @"Certificate cannot be empty",  a6);
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
  v43 = a4;
  id v12 = a5;
  -[BackendXPC getCryptoHeaderBackend](self, "getCryptoHeaderBackend");
  if (!v41)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    v28 = std::generic_category();
    exception[1] = 4294967291LL;
    exception[2] = v28;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Failed opening the crypto header backend";
  }

  uint64_t v39 = 0LL;
  uint64_t v40 = 0LL;
  if (!v9)
  {
    v49[0] = 0;
    v52[512] = 0;
    v38 = 0LL;
    if (a4)
    {
      sub_1001170E8(&v29, v41, -[BackendXPC cryptoHeader](self, "cryptoHeader"), a4);
      sub_100061C10(&v36);
      uint64_t v14 = v36;
      uint64_t v15 = v37;
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      uint64_t v39 = v14;
      uint64_t v40 = v15;
      if (__p)
      {
        v35 = __p;
        operator delete(__p);
      }

      __int128 v16 = v33;
      v33 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      if (v31)
      {
        v32 = v31;
        operator delete(v31);
      }

      if (v29)
      {
        v30 = v29;
        operator delete(v29);
      }

      goto LABEL_25;
    }

    if (-[BackendXPC getPrivateKeyWithHeader:privateKey:error:]( self,  "getPrivateKeyWithHeader:privateKey:error:",  v49,  &v38,  a6))
    {
      __int128 v17 = v38;
      uint64_t v18 = v41;
      v19 = -[BackendXPC cryptoHeader](self, "cryptoHeader");
      int v44 = *(_DWORD *)v49;
      __int128 v45 = *(_OWORD *)&v49[4];
      __int128 v46 = v50;
      __int128 v47 = v51;
      memcpy(v48, v52, sizeof(v48));
      sub_100116DA8(&v29, v18, v19, v38, &v44);
      sub_100061C10(&v36);
      uint64_t v14 = v36;
      uint64_t v15 = v37;
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      uint64_t v39 = v14;
      uint64_t v40 = v15;
      if (__p)
      {
        v35 = __p;
        operator delete(__p);
      }

      v20 = v33;
      v33 = 0LL;
      if (v20) {
        operator delete(v20);
      }
      if (v31)
      {
        v32 = v31;
        operator delete(v31);
      }

      if (v29)
      {
        v30 = v29;
        operator delete(v29);
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
  id v7 = a3;
  if (stat((const char *)[v7 fileSystemRepresentation], &v23))
  {
    id v8 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  *__error(),  @"stat failed",  a5);
    id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    int v10 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v22 = 0LL;
      uint64_t v11 = sub_1000BE278();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v13 = 3LL;
      }
      else {
        uint64_t v13 = 2LL;
      }
      int v25 = 56;
      __int16 v26 = 2080;
      *(_DWORD *)buf = 68159746;
      v27 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
      __int16 v28 = 1024;
      dev_t st_dev = v23.st_dev;
      __int16 v30 = 2048;
      __darwin_ino64_t st_ino = v23.st_ino;
      __int16 v32 = 1024;
      int st_mode = v23.st_mode;
      __int16 v34 = 1024;
      uid_t st_uid = v23.st_uid;
      __int16 v36 = 1024;
      gid_t st_gid = v23.st_gid;
      __int16 v38 = 2048;
      off_t st_size = v23.st_size;
      __int16 v40 = 2048;
      blkcnt_t st_blocks = v23.st_blocks;
      LODWORD(v20) = 72;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl( v13,  &v22,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)",  (int)buf,  v20,  v21);

      if (v14)
      {
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }

    else
    {
      uint64_t v15 = sub_1000BE278();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 56;
        __int16 v26 = 2080;
        *(_DWORD *)buf = 68159746;
        v27 = "+[BackendXPC newFileBackendWithURL:fileOpenFlags:error:]";
        __int16 v28 = 1024;
        dev_t st_dev = v23.st_dev;
        __int16 v30 = 2048;
        __darwin_ino64_t st_ino = v23.st_ino;
        __int16 v32 = 1024;
        int st_mode = v23.st_mode;
        __int16 v34 = 1024;
        uid_t st_uid = v23.st_uid;
        __int16 v36 = 1024;
        gid_t st_gid = v23.st_gid;
        __int16 v38 = 2048;
        off_t st_size = v23.st_size;
        __int16 v40 = 2048;
        blkcnt_t st_blocks = v23.st_blocks;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%.*s: Image file stat: dev(0x%x), inode(%lld), mode(%o), uid(%d), gid(%d), size(%lld), blocks(%lld)",  buf,  0x48u);
      }
    }

    *__error() = v10;
    if ((v23.st_mode & 0xF000) == 0x4000) {
      __int128 v17 = &off_1001706B0;
    }
    else {
      __int128 v17 = &off_100170570;
    }
    id v9 = [objc_alloc(*v17) initWithURL:v7 fileOpenFlags:v6];
  }

  uint64_t v18 = v9;

  return v18;
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