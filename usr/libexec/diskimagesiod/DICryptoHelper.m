@interface DICryptoHelper
+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5;
+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5;
+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5;
+ (BOOL)validateWithPubKeyHeader:(void *)a3;
+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6;
@end

@implementation DICryptoHelper

+ (id)getAuthValueWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  ptr = (uint64_t *)a3.__ptr_;
  v8 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v24 = *(void *)a3.__ptr_;
  v25 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }

  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:]( &OBJC_CLASS___DICryptoHelper,  "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:",  &v24,  a3.__cntrl_,  *(void *)&a4,  *(void *)&a5,  a6);
  v11 = v25;
  if (v25)
  {
    v12 = (unint64_t *)&v25->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  if (!__p) {
    return 0LL;
  }
  v14 = valloc(*(void *)((char *)__p + 12));
  if (!v14)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v23 = std::bad_alloc::bad_alloc(exception);
  }

  v29[0] = &off_100169C38;
  v30 = v29;
  v27 = v14;
  sub_1000172D0((uint64_t)&v28, (uint64_t)v29);
  v15 = v30;
  if (v30 == v29)
  {
    uint64_t v16 = 4LL;
    v15 = v29;
    goto LABEL_16;
  }

  if (v30)
  {
    uint64_t v16 = 5LL;
LABEL_16:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  uint64_t v18 = sub_100033014(*ptr, (uint64_t)v27, *(void *)((char *)__p + 12), *(void *)((char *)__p + 4));
  if ((v18 & 0x80000000) != 0)
  {
    id v20 =  +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  v18,  @"can't read crypto header",  v6);
    v19 = 0LL;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v27,  *(void *)((char *)__p + 12)));
  }

  sub_100016DE0((uint64_t *)&v27);
  v21 = __p;
  __p = 0LL;
  if (v21) {
    operator delete(v21);
  }
  return v19;
}

+ (unique_ptr<crypto::auth_table_entry,)getAuthEntryWithBackend:(shared_ptr<Backend>)a3 authTableNumEntries:(int)a4 mechanism:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  int cntrl = (int)a3.__cntrl_;
  ptr = (uint64_t *)a3.__ptr_;
  v11 = v6;
  uint64_t v12 = 20LL * SLODWORD(a3.__cntrl_);
  unint64_t v13 = (char *)operator new[](v12);
  bzero(v13, v12);
  uint64_t v14 = sub_100033014(*ptr, (uint64_t)v13, v12, 76LL);
  if ((v14 & 0x80000000) != 0)
  {
    id v18 =  +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  v14,  @"can't read crypto header",  v7);
    goto LABEL_8;
  }

  if (cntrl < 1)
  {
LABEL_8:
    void *v11 = 0LL;
    goto LABEL_9;
  }

  uint64_t v15 = cntrl;
  uint64_t v16 = v13;
  while (1)
  {
    v17 = operator new(0x14uLL);
    sub_10010E920(v17, v16);
    void *v11 = v17;
    if (*v17 == a4) {
      break;
    }
    void *v11 = 0LL;
    operator delete(v17);
    v16 += 20;
    if (!--v15) {
      goto LABEL_8;
    }
  }

+ (BOOL)getPassphraseUsingSaksWithBackendXPC:(id)a3 passPhrase:(char *)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  uint64_t v30 = 0LL;
  v31 = 0LL;
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = v28;
    v9 = v29;
  }

  else
  {
    v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  uint64_t v30 = v10;
  v31 = v9;
  uint64_t v11 = *(unsigned int *)(*(void *)[v8 cryptoHeader] + 72);
  uint64_t v26 = v10;
  v27 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }

  id v25 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[DICryptoHelper getAuthValueWithBackend:authTableNumEntries:mechanism:error:]( &OBJC_CLASS___DICryptoHelper,  "getAuthValueWithBackend:authTableNumEntries:mechanism:error:",  &v26,  v11,  9LL,  &v25));
  id v15 = v25;
  uint64_t v16 = v27;
  if (!v27) {
    goto LABEL_11;
  }
  v17 = (unint64_t *)&v27->__shared_owners_;
  do
    unint64_t v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if (v14) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_11:
    if (v14)
    {
LABEL_12:
      unique_ptr<crypto::auth_table_entry, std::default_delete<crypto::auth_table_entry>> v19 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v14, 4LL);
      BOOL v20 = +[DIKeyRetriever decryptKeyWithData:destKey:destKeySize:error:]( &OBJC_CLASS___DIKeyRetriever,  "decryptKeyWithData:destKey:destKeySize:error:",  v19,  a4,  88LL,  a5);

      goto LABEL_13;
    }
  }

  if (v15)
  {
    BOOL v20 = 0;
    if (a5) {
      *a5 = v15;
    }
  }

  else
  {
    BOOL v20 = 1;
  }

+ (BOOL)validateWithPubKeyHeader:(void *)a3
{
  return *(_DWORD *)a3 <= 0x20u && *((_DWORD *)a3 + 12) < 0x201u;
}

+ (BOOL)createPublicKeyHeaderWithBackendXPC:(id)a3 publicKeyHeader:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = *(unsigned int *)(*(void *)[v7 cryptoHeader] + 72);
  uint64_t v31 = 0LL;
  v32 = 0LL;
  if (v7)
  {
    [v7 getCryptoHeaderBackend];
    uint64_t v10 = v33[0];
    v9 = (std::__shared_weak_count *)v33[1];
  }

  else
  {
    v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  uint64_t v31 = v10;
  v32 = v9;
  uint64_t v28 = v10;
  v29 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      unint64_t v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }

  +[DICryptoHelper getAuthEntryWithBackend:authTableNumEntries:mechanism:error:]( &OBJC_CLASS___DICryptoHelper,  "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:",  &v28,  v8,  2LL,  a5);
  unint64_t v13 = v29;
  if (v29)
  {
    uint64_t v14 = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  if (!__p)
  {
    BOOL v19 = 0;
    goto LABEL_25;
  }

  uint64_t v16 = valloc(*(void *)((char *)__p + 12));
  if (!v16)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v27 = std::bad_alloc::bad_alloc(exception);
  }

  v33[0] = &off_100169C38;
  v34 = v33;
  uint64_t v35 = (uint64_t)v16;
  sub_1000172D0((uint64_t)&v36, (uint64_t)v33);
  v17 = v34;
  if (v34 == v33)
  {
    uint64_t v18 = 4LL;
    v17 = v33;
  }

  else
  {
    if (!v34) {
      goto LABEL_20;
    }
    uint64_t v18 = 5LL;
  }

  (*(void (**)(void *))(*v17 + 8 * v18))(v17);
LABEL_20:
  uint64_t v20 = sub_100033014(v31, v35, 564LL, *(void *)((char *)__p + 4));
  if ((_DWORD)v20 == 564)
  {
    sub_10010D8C0(v33, v35, v20);
    sub_1000337D0((uint64_t)a4, (uint64_t)v33);
    BOOL v19 = 1;
  }

  else
  {
    BOOL v19 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  v20,  @"Error while creating public key header",  a5,  v28);
  }

  sub_100016DE0(&v35);
  v21 = __p;
  __p = 0LL;
  if (v21) {
    operator delete(v21);
  }
LABEL_25:
  v22 = v32;
  if (v32)
  {
    unint64_t v23 = (unint64_t *)&v32->__shared_owners_;
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  return v19;
}

+ (BOOL)getPrivateKeyWithHeader:(void *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)a3 + 4,  *(unsigned int *)a3));
  v12[0] = kSecClass;
  v12[1] = kSecAttrKeyClass;
  v13[0] = kSecClassKey;
  v13[1] = kSecAttrKeyClassPrivate;
  v12[2] = kSecAttrApplicationLabel;
  v12[3] = kSecReturnRef;
  v13[2] = v7;
  v13[3] = &__kCFBooleanTrue;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  4LL));
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));

  if (SecItemCopyMatching(v9, (CFTypeRef *)a4)) {
    BOOL v10 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"Couldn't find item in keychain",  a5);
  }
  else {
    BOOL v10 = 1;
  }

  return v10;
}

+ (BOOL)getPublicKeyWithCertificate:(id)a3 key:(__SecKey *)a4 error:(id *)a5
{
  id v7 = (const __CFData *)a3;
  LOBYTE(v8) = 1;
  if (v7 && a4)
  {
    v9 = SecCertificateCreateWithData(kCFAllocatorDefault, v7);
    BOOL v10 = v9;
    if (v9)
    {
      *a4 = SecCertificateCopyKey(v9);
      CFRelease(v10);
      if (*a4)
      {
        LOBYTE(v8) = 1;
      }

      else
      {
        id v11 =  +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"public key has an encoding issue or uses an unsupported algorithm",  a5);
        LOBYTE(v8) = 0;
      }
    }

    else
    {
      BOOL v8 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  @"not a valid DER-encoded X.509 certificate",  a5);
    }
  }

  return v8;
}

@end