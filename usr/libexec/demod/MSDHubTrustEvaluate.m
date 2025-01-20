@interface MSDHubTrustEvaluate
+ (id)getTrustObject;
- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustDAServer:(__SecTrust *)a3;
- (BOOL)trustServer:(__SecTrust *)a3 forRequestType:(BOOL)a4 typeOfCommand:(unint64_t)a5;
- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5;
- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3;
- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3;
- (NSString)hubCertificateIdentifier;
- (id)hashForCertificate:(__SecCertificate *)a3;
- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (void)setHubCertificateIdentifier:(id)a3;
@end

@implementation MSDHubTrustEvaluate

+ (id)getTrustObject
{
  return objc_alloc_init(&OBJC_CLASS___MSDHubTrustEvaluate);
}

- (BOOL)trustServer:(__SecTrust *)a3 forRequestType:(BOOL)a4 typeOfCommand:(unint64_t)a5
{
  BOOL v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  if (!a5)
  {
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100091C3C();
    }

    unsigned __int8 v10 = -[MSDHubTrustEvaluate trustDAServer:](self, "trustDAServer:", a3);
    goto LABEL_13;
  }

  if (!v6)
  {
    BOOL v15 = -[MSDHubTrustEvaluate trustServerWithApplePKI:](self, "trustServerWithApplePKI:", a3);
    if (v15 || -[MSDHubTrustEvaluate trustServerWithAxinoePKI:](self, "trustServerWithAxinoePKI:", a3))
    {
      SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0LL);
      if (CertificateAtIndex)
      {
        SecCertificateRef v17 = CertificateAtIndex;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v9 certificateHash]);
        if (v14) {
          char v18 = v15;
        }
        else {
          char v18 = 1;
        }
        if ((v18 & 1) != 0)
        {
          if (a5 != 3)
          {
            if (a5 == 1
              && !-[MSDHubTrustEvaluate saveHubCertificateIdentifer:applePKI:]( self,  "saveHubCertificateIdentifer:applePKI:",  v17,  v15))
            {
              goto LABEL_43;
            }

- (BOOL)trustDAServer:(__SecTrust *)a3
{
  v4 = CFDataCreate(kCFAllocatorDefault, byte_100124868, dword_100124BF0);
  if (!v4)
  {
    id v15 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100091CF8(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    return 0;
  }

  v5 = v4;
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v4);
  if (!v6)
  {
    id v24 = sub_10003A95C();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100091D68(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    CFRelease(v5);
    return 0;
  }

  SecCertificateRef v7 = v6;
  v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v6, 0LL));
  OSStatus v9 = SecTrustSetAnchorCertificates(a3, v8);
  if (v9)
  {
    OSStatus v33 = v9;
    id v34 = sub_10003A95C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[MSDHubTrustEvaluate trustDAServer:]";
      __int16 v46 = 2048;
      uint64_t v47 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Cannot set demounit anchor certificates: %ld",  buf,  0x16u);
    }

    goto LABEL_25;
  }

  SecTrustResultType result = kSecTrustResultInvalid;
  uint64_t v10 = SecTrustEvaluate(a3, &result);
  if ((_DWORD)v10)
  {
    uint64_t v35 = v10;
    id v36 = sub_10003A95C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100091DD8(v35, v12, v37, v38, v39, v40, v41, v42);
    }
LABEL_25:
    BOOL v13 = 0;
    goto LABEL_10;
  }

  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    BOOL v13 = 0;
    goto LABEL_12;
  }

  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Demounit server certificate is valid.",  buf,  2u);
  }

  BOOL v13 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v5);
  CFRelease(v7);

  return v13;
}

- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3
{
  v5 = CFDataCreate(kCFAllocatorDefault, byte_100124868, dword_100124BF0);
  if (!v5)
  {
    id v13 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100091E3C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    return 0;
  }

  SecCertificateRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    id v22 = sub_10003A95C();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100091EAC(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    CFRelease(v6);
    return 0;
  }

  SecCertificateRef v8 = v7;
  if (!-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v7,  0LL))
  {
    uint64_t v10 = 0LL;
LABEL_26:
    BOOL v11 = 0;
    goto LABEL_8;
  }

  SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0LL);
  if (!CertificateAtIndex)
  {
    id v31 = sub_10003A95C();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100091C74();
    }
    goto LABEL_22;
  }

  if (SecCertificateCopyCommonName(CertificateAtIndex, &commonName))
  {
    id v33 = sub_10003A95C();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100091F80();
    }
LABEL_22:
    uint64_t v10 = 0LL;
LABEL_25:

    goto LABEL_26;
  }

  uint64_t v10 = (__CFString *)commonName;
  if ((-[__CFString hasSuffix:]((id)commonName, "hasSuffix:", @".hubs.iosdm.demounit.net") & 1) == 0)
  {
    id v34 = sub_10003A95C();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100091F1C((uint64_t)v10, v32, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_25;
  }

  BOOL v11 = 1;
LABEL_8:
  CFRelease(v6);
  CFRelease(v8);

  return v11;
}

- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3
{
  v5 = CFDataCreate(kCFAllocatorDefault, byte_100124458, dword_100124864);
  if (!v5)
  {
    id v11 = sub_10003A95C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100091FAC(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    return 0;
  }

  SecCertificateRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    id v20 = sub_10003A95C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10009201C(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    CFRelease(v6);
    return 0;
  }

  SecCertificateRef v8 = v7;
  if (-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v7,  @"hub.iosdm.local"))
  {
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = -[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v8,  @"hub.iosdm.net");
  }

  CFRelease(v6);
  CFRelease(v8);
  return v9;
}

- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5
{
  SecTrustRef trust = 0LL;
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, (CFStringRef)a5);
  if (SSL)
  {
    SecPolicyRef v8 = SSL;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
    if (CertificateCount >= 1)
    {
      CFIndex v11 = CertificateCount;
      for (CFIndex i = 0LL; i != v11; ++i)
      {
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, i);
        CFArrayAppendValue(Mutable, CertificateAtIndex);
      }
    }

    if (SecTrustCreateWithCertificates(Mutable, v8, &trust))
    {
      id v27 = sub_10003A95C();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000920FC(v28, v29, v30, v31, v32, v33, v34, v35);
      }

      BOOL v17 = 0;
      uint64_t v14 = 0LL;
      goto LABEL_24;
    }

    uint64_t v14 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", a4, 0LL));
    OSStatus v15 = SecTrustSetAnchorCertificates(trust, v14);
    if (v15)
    {
      OSStatus v36 = v15;
      id v37 = sub_10003A95C();
      uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]";
        __int16 v53 = 2048;
        uint64_t v54 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s: Cannot set anchor certificates: %ld",  buf,  0x16u);
      }
    }

    else
    {
      SecTrustResultType result = kSecTrustResultInvalid;
      uint64_t v16 = SecTrustEvaluate(trust, &result);
      if ((_DWORD)v16)
      {
        uint64_t v39 = v16;
        id v40 = sub_10003A95C();
        uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_100091DD8(v39, v41, v42, v43, v44, v45, v46, v47);
        }
      }

      else if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
      {
        BOOL v17 = 1;
        goto LABEL_24;
      }
    }

    BOOL v17 = 0;
LABEL_24:
    CFRelease(v8);
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_26;
  }

  id v18 = sub_10003A95C();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10009208C(v19, v20, v21, v22, v23, v24, v25, v26);
  }

  BOOL v17 = 0;
  uint64_t v14 = 0LL;
LABEL_26:
  if (trust) {
    CFRelease(trust);
  }

  return v17;
}

- (id)hashForCertificate:(__SecCertificate *)a3
{
  CFDataRef v3 = SecCertificateCopyData(a3);
  if (v3)
  {
    v4 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
    v5 = v3;
    CC_SHA1(-[__CFData bytes](v5, "bytes"), (CC_LONG)-[__CFData length](v5, "length"), v4);
    SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v4, 20LL));
    free(v4);
  }

  else
  {
    id v8 = sub_10003A95C();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009216C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    SecCertificateRef v6 = 0LL;
  }

  return v6;
}

- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  if (!a4)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v7 = (id)SecCertificateCopyProperties(a3, a2);
    id v25 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v25)
    {
      uint64_t v8 = *(void *)v31;
      uint64_t v23 = *(void *)v31;
      uint64_t v24 = v7;
      do
      {
        for (CFIndex i = 0LL; i != v25; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"label"]);
          unsigned int v12 = [v11 isEqualToString:@"Subject Name"];

          if (v12)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"value"]);
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            id v14 = v13;
            id v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v27;
              while (2)
              {
                for (j = 0LL; j != v16; j = (char *)j + 1)
                {
                  if (*(void *)v27 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
                  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"label"]);
                  unsigned __int8 v21 = [v20 isEqualToString:@"2.5.4.45"];

                  if ((v21 & 1) != 0)
                  {
                    SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"value"]);

                    v4 = 0LL;
                    goto LABEL_26;
                  }
                }

                id v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            uint64_t v8 = v23;
            id v7 = v24;
          }
        }

        id v25 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }

      while (v25);
    }

    goto LABEL_23;
  }

  if (SecCertificateCopyCommonName(a3, &commonName))
  {
LABEL_23:
    v4 = 0LL;
    goto LABEL_24;
  }

  v4 = (__CFString *)commonName;
  id v5 = -[__CFString rangeOfString:]((id)commonName, "rangeOfString:", @".hubs.iosdm.demounit.net");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    SecCertificateRef v6 = 0LL;
    goto LABEL_26;
  }

  SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v4, "substringWithRange:", 0LL, v5));
LABEL_26:

  return v6;
}

- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  if (v5
    && (SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance")),
        unsigned int v7 = [v6 saveHubCertificateIdentifer:v5],
        v6,
        v7))
  {
    -[MSDHubTrustEvaluate setHubCertificateIdentifier:](self, "setHubCertificateIdentifier:", v5);
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  if (v5)
  {
    SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubTrustEvaluate hubCertificateIdentifier](self, "hubCertificateIdentifier"));
    unsigned __int8 v7 = [v6 isEqualToString:v5];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)hubCertificateIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setHubCertificateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end