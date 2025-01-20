@interface TPHObjectiveC
+ (ccec_full_ctx)ccec384Context;
+ (id)digestUsingSha384:(id)a3;
+ (id)fetchKeyPairWithPrivateKeyPersistentRef:(id)a3 error:(id *)a4;
+ (int64_t)aes256BitSize;
+ (unint64_t)ccsha384_diSize;
+ (void)contextFree:(void *)a3;
@end

@implementation TPHObjectiveC

+ (id)fetchKeyPairWithPrivateKeyPersistentRef:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v15[0] = kSecReturnRef;
  v15[1] = kSecClass;
  v16[0] = &__kCFBooleanTrue;
  v16[1] = kSecClassKey;
  v15[2] = kSecValuePersistentRef;
  v16[2] = v5;
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));
  CFTypeRef cf = 0LL;
  OSStatus v7 = SecItemCopyMatching(v6, &cf);
  if (v7 || (CFTypeID v8 = CFGetTypeID(cf), v8 != SecKeyGetTypeID()))
  {
    if (a4)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  0LL));
      v10 = 0LL;
      *a4 = v12;
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v9 = objc_alloc(&OBJC_CLASS____SFECKeyPair);
    v10 = -[_SFECKeyPair initWithSecKey:](v9, "initWithSecKey:", cf);
    CFTypeRef v11 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v11);
    }
  }

  return v10;
}

+ (ccec_full_ctx)ccec384Context
{
  v2 = (ccec_cp *)ccec_cp_384(a1, a2);
  result = (ccec_full_ctx *)malloc((32LL * *(void *)v2) | 0x10);
  result->var0 = v2;
  return result;
}

+ (void)contextFree:(void *)a3
{
}

+ (unint64_t)ccsha384_diSize
{
  return *(void *)ccsha384_di(a1, a2);
}

+ (int64_t)aes256BitSize
{
  return 2LL;
}

+ (id)digestUsingSha384:(id)a3
{
  id v3 = a3;
  uint64_t v5 = ccsha384_di(v3, v4);
  v6 = objc_alloc(&OBJC_CLASS___NSMutableData);
  CFTypeID v8 = -[NSMutableData initWithLength:](v6, "initWithLength:", *(void *)ccsha384_di(v6, v7));
  id v9 = [v3 length];
  id v10 = v3;
  id v11 = [v10 bytes];

  id v12 = v8;
  ccdigest(v5, v9, v11, -[NSMutableData mutableBytes](v12, "mutableBytes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData base64EncodedStringWithOptions:](v12, "base64EncodedStringWithOptions:", 0LL));

  return v13;
}

@end