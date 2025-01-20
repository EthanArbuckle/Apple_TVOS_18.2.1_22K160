@interface CCDKeychain
+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12;
+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9;
+ (id)dataFromString:(id)a3;
@end

@implementation CCDKeychain

+ (id)dataFromString:(id)a3
{
  return [a3 dataUsingEncoding:4];
}

+ (id)dataFromService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  id v21 = 0LL;
  v9 = +[CCDKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:]( &OBJC_CLASS___CCDKeychain,  "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:",  a3,  a4,  a5,  a6,  a7,  a8,  &v21);
  id v10 = v21;
  if (v10)
  {
    v13 = v10;
    if (v9) {
      CFRelease(v9);
    }
    goto LABEL_4;
  }

  CFDictionaryAddValue(v9, kSecReturnData, kCFBooleanTrue);
  *(void *)buf = 0LL;
  uint64_t v16 = SecItemCopyMatching(v9, (CFTypeRef *)buf);
  CFRelease(v9);
  if ((_DWORD)v16) {
    BOOL v17 = (_DWORD)v16 == -25300;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v16));
    uint64_t v18 = DEPErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE_%@");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DEPErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DEPErrorWithDomain:code:descriptionArray:errorType:",  @"CCDKeychainErrorDomain",  6000LL,  v19,  DEPErrorTypeFatal));

    if (!v13) {
      return 0LL;
    }
LABEL_4:
    if (a9)
    {
      id v10 = v13;
      *a9 = v10;
    }

    v14 = *(os_log_s **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Cannot retrieve item from keychain. Error: %{public}@",  buf,  0xCu);
    }

    return 0LL;
  }

  return *(id *)buf;
}

+ (BOOL)setData:(id)a3 forService:(id)a4 account:(id)a5 label:(id)a6 description:(id)a7 access:(void *)a8 group:(id)a9 useSystemKeychain:(BOOL)a10 sysBound:(BOOL)a11 outError:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  v43 = v19;
  if ([v17 length])
  {
    value = v17;
    id v44 = 0LL;
    v23 = +[CCDKeychain _newQueryWithService:account:label:description:group:useSystemKeychain:outError:]( &OBJC_CLASS___CCDKeychain,  "_newQueryWithService:account:label:description:group:useSystemKeychain:outError:",  v18,  v19,  v20,  v21,  v22,  a10,  &v44);
    id v24 = v44;
    if (v24)
    {
      v27 = v24;
      if (v23) {
        CFRelease(v23);
      }
      id v17 = value;
      goto LABEL_7;
    }

    id v41 = v18;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[CCDKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:]( &OBJC_CLASS___CCDKeychain,  "dataFromService:account:label:description:group:useSystemKeychain:outError:",  v18,  v19,  v20,  v21,  v22,  a10,  0LL));
    v34 = v33;
    if (v33)
    {
      if ([v33 isEqualToData:value])
      {
        CFRelease(v23);
        v27 = 0LL;
        id v17 = value;
        goto LABEL_21;
      }

      v47[0] = kSecValueData;
      v47[1] = kSecAttrAccessible;
      v48[0] = value;
      v48[1] = a8;
      v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
      uint64_t v35 = SecItemUpdate(v23, v36);
    }

    else
    {
      CFDictionaryAddValue(v23, kSecValueData, value);
      CFDictionaryAddValue(v23, kSecAttrAccessible, a8);
      CFDictionaryAddValue(v23, kSecAttrSysBound, &__kCFBooleanTrue);
      uint64_t v35 = SecItemAdd(v23, 0LL);
    }

    CFRelease(v23);
    if ((_DWORD)v35)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v35));
      uint64_t v37 = DEPErrorArray(@"KEYCHAIN_ERROR_CODE_P_CODE_%@");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DEPErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DEPErrorWithDomain:code:descriptionArray:errorType:",  @"CCDKeychainErrorDomain",  6000LL,  v38,  DEPErrorTypeFatal,  v40,  0LL));
    }

    else
    {
      v27 = 0LL;
    }

    id v17 = value;
LABEL_21:

    id v18 = v41;
    if (!v27) {
      goto LABEL_22;
    }
    goto LABEL_7;
  }

  uint64_t v28 = DEPErrorArray(@"KEYCHAIN_ERROR_EMPTY_DATA");
  id v29 = v18;
  v30 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError DEPErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DEPErrorWithDomain:code:descriptionArray:errorType:",  @"CCDKeychainErrorDomain",  6001LL,  v30,  DEPErrorTypeFatal,  0LL));

  id v18 = v29;
  if (!v27)
  {
LABEL_22:
    BOOL v32 = 1;
    goto LABEL_23;
  }

+ (__CFDictionary)_newQueryWithService:(id)a3 account:(id)a4 label:(id)a5 description:(id)a6 group:(id)a7 useSystemKeychain:(BOOL)a8 outError:(id *)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 length])
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrService, v14);
    if ([v15 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrAccount, v15);
    }
    if ([v16 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrLabel, v16);
    }
    if ([v17 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrDescription, v17);
    }
    if ([v18 length]) {
      CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, v18);
    }
    if (v9) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, &__kCFBooleanTrue);
    }
  }

  else
  {
    if (a9)
    {
      uint64_t v20 = DEPErrorArray(@"KEYCHAIN_ERROR_CANNOT_CREATE_QUERY");
      id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *a9 = (id)objc_claimAutoreleasedReturnValue( +[NSError DEPErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "DEPErrorWithDomain:code:descriptionArray:errorType:",  @"CCDKeychainErrorDomain",  6002LL,  v21,  DEPErrorTypeFatal,  0LL));
    }

    Mutable = 0LL;
  }

  return Mutable;
}

@end