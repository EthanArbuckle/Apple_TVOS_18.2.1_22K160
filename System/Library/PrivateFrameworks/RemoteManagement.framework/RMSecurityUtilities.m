@interface RMSecurityUtilities
+ (BOOL)checkValidAfterWithCertificate:(__SecCertificate *)a3 interval:(double)a4;
+ (__SecKey)_deserializePrivateKey:(id)a3 privateKeyIsExportable:(BOOL)a4;
+ (id)_serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 privateKeyIsExportable:(BOOL)a5 error:(id *)a6;
+ (id)_serializePrivateKey:(__SecKey *)a3 privateKeyIsExportable:(BOOL)a4;
+ (id)deserializeCertificateChain:(id)a3;
+ (id)serializeBAAIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5;
+ (id)serializeCertificateChain:(id)a3;
+ (id)serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5;
+ (void)_deserializeIdentity:(id)a3 privateKeyIsExportable:(BOOL)a4 completionHandler:(id)a5;
+ (void)deserializeBAAIdentity:(id)a3 completionHandler:(id)a4;
+ (void)deserializeIdentity:(id)a3 completionHandler:(id)a4;
+ (void)generateSelfSignedCertificateAndPrivateKeyWithID:(id)a3 completionHandler:(id)a4;
@end

@implementation RMSecurityUtilities

+ (id)serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5
{
  return [a1 _serializeIdentityWithPrivateKey:a3 certificateChain:a4 privateKeyIsExportable:1 error:a5];
}

+ (id)serializeBAAIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 error:(id *)a5
{
  return [a1 _serializeIdentityWithPrivateKey:a3 certificateChain:a4 privateKeyIsExportable:0 error:a5];
}

+ (id)_serializeIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 privateKeyIsExportable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([a1 _serializePrivateKey:a3 privateKeyIsExportable:v7]);
  v12 = (void *)v11;
  if (v11)
  {
    v17[0] = @"PrivateKey";
    v17[1] = @"Certificates";
    v18[0] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 serializeCertificateChain:v10]);
    v18[1] = v13;
    a6 = (id *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  }

  else if (a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    v15 = v14;
    if (v14) {
      *a6 = v14;
    }

    a6 = 0LL;
  }

  return a6;
}

+ (void)deserializeIdentity:(id)a3 completionHandler:(id)a4
{
}

+ (void)deserializeBAAIdentity:(id)a3 completionHandler:(id)a4
{
}

+ (void)_deserializeIdentity:(id)a3 privateKeyIsExportable:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"PrivateKey"]);
  if (!v10 || (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v10, v11) & 1) == 0))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v14);
      goto LABEL_11;
    }

+ (id)_serializePrivateKey:(__SecKey *)a3 privateKeyIsExportable:(BOOL)a4
{
  if (a4)
  {
    CFErrorRef error = 0LL;
    CFDataRef v4 = SecKeyCopyExternalRepresentation(a3, &error);
    CFDictionaryRef v5 = v4;
    if (v4)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](v4, "base64EncodedStringWithOptions:", 0LL));
    }

    else
    {
      CFErrorRef v8 = error;
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005854C();
      }

      BOOL v6 = 0LL;
    }
  }

  else
  {
    CFDictionaryRef v5 = SecKeyCopyAttributes(a3);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrTokenOID));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
  }

  return v6;
}

+ (__SecKey)_deserializePrivateKey:(id)a3 privateKeyIsExportable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v5,  0LL);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      if (v4)
      {
        v18[0] = kSecAttrKeyType;
        v18[1] = kSecAttrKeyClass;
        v19[0] = kSecAttrKeyTypeECSECPrimeRandom;
        v19[1] = kSecAttrKeyClassPrivate;
        CFErrorRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
        CFErrorRef v15 = 0LL;
        id v9 = SecKeyCreateWithData(v6, v8, &v15);
        if (!v9)
        {
          CFErrorRef v10 = v15;
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_12;
          }
          goto LABEL_13;
        }
      }

      else
      {
        CFErrorRef v15 = 0LL;
        SecAccessControlRef v13 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &v15);
        v16[0] = kSecAttrIsPermanent;
        v16[1] = kSecAttrTokenID;
        v17[0] = &__kCFBooleanFalse;
        v17[1] = kSecAttrTokenIDAppleKeyStore;
        v16[2] = kSecAttrTokenOID;
        v16[3] = kSecAttrAccessControl;
        void v17[2] = v6;
        v17[3] = v13;
        CFErrorRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  4LL));
        id v9 = SecKeyCreateWithData((CFDataRef)+[NSData data](&OBJC_CLASS___NSData, "data"), v8, &v15);
        CFRelease(v13);
        if (!v9)
        {
          CFErrorRef v10 = v15;
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
LABEL_12:
          }
            sub_10005860C();
LABEL_13:
        }
      }

      goto LABEL_15;
    }
  }

  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000585AC();
  }

  id v9 = 0LL;
LABEL_15:

  return v9;
}

+ (id)deserializeCertificateChain:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = objc_alloc(&OBJC_CLASS___NSData);
      id v12 = -[NSData initWithBase64EncodedString:options:]( v11,  "initWithBase64EncodedString:options:",  v10,  0LL,  (void)v19);
      SecAccessControlRef v13 = v12;
      if (!v12) {
        break;
      }
      v14 = v12;
      uint64_t v15 = SecCertificateCreateWithBytes( kCFAllocatorDefault,  -[NSData bytes](v14, "bytes"),  -[NSData length](v14, "length"));
      if (!v15)
      {
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000586CC();
        }
LABEL_15:

        id v16 = 0LL;
        goto LABEL_16;
      }

      [v4 addObject:v15];

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }

    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10005866C();
    }
    goto LABEL_15;
  }

+ (id)serializeCertificateChain:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8LL * (void)v9));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[__CFData base64EncodedStringWithOptions:]( v10,  "base64EncodedStringWithOptions:",  0LL,  (void)v14));
        [v4 addObject:v11];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

+ (void)generateSelfSignedCertificateAndPrivateKeyWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v42[0] = kSecAttrKeyType;
  v42[1] = kSecAttrKeySizeInBits;
  v43[0] = kSecAttrKeyTypeECSECPrimeRandom;
  v43[1] = &off_1000BEBD8;
  id v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
  CFErrorRef error = 0LL;
  uint64_t v8 = SecKeyCreateRandomKey(v7, &error);
  if (!v8)
  {
    CFErrorRef v24 = error;
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10005872C();
    }
    goto LABEL_9;
  }

  uint64_t v9 = v8;
  SecKeyRef v10 = SecKeyCopyPublicKey(v8);
  if (!v10)
  {
    CFRelease(v9);
    CFErrorRef v24 = (CFErrorRef)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10005878C();
    }
LABEL_9:

    (*((void (**)(id, void, void, CFErrorRef))v6 + 2))(v6, 0LL, 0LL, v24);
    goto LABEL_14;
  }

  SecKeyRef v11 = v10;
  id v27 = v6;
  v29 = v7;
  id v30 = v5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SelfSigned-%@", v5));
  v39[0] = kSecOidCountryName;
  v39[1] = @"US";
  SecAccessControlRef v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  v40 = v13;
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  v41[0] = v14;
  v37[0] = kSecOidOrganization;
  v37[1] = @"Apple Inc.";
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v38 = v15;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  v41[1] = v16;
  v35[0] = kSecOidCommonName;
  v35[1] = v12;
  v28 = (__CFError *)v12;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v36 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  v41[2] = v18;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));

  uint64_t v33 = kSecCertificateKeyUsage;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2147483653LL));
  v34 = v20;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));

  SelfSignedCertificate = (void *)SecGenerateSelfSignedCertificate(v19, v21, v11, v9);
  CFRelease(v11);
  if (SelfSignedCertificate)
  {
    v32 = SelfSignedCertificate;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    id v6 = v27;
    (*((void (**)(id, __SecKey *, void *, void))v27 + 2))(v27, v9, v23, 0LL);
  }

  else
  {
    CFRelease(v9);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog securityUtilities](&OBJC_CLASS___RMLog, "securityUtilities"));
    id v6 = v27;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000587EC(v26);
    }

    SelfSignedCertificate = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createInternalError]( &OBJC_CLASS___RMErrorUtilities,  "createInternalError"));
    (*((void (**)(id, void, void, void *))v27 + 2))(v27, 0LL, 0LL, SelfSignedCertificate);
  }

  id v7 = v29;
  id v5 = v30;
  CFErrorRef v24 = v28;

LABEL_14:
}

+ (BOOL)checkValidAfterWithCertificate:(__SecCertificate *)a3 interval:(double)a4
{
  double v5 = SecCertificateNotValidAfter(a3, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  return v5 - v8 >= a4;
}

@end