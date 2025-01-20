@interface MSDSessionBaseTrustEvaluate
- (BOOL)applePKI;
- (BOOL)isDone;
- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5;
- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3;
- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3;
- (__SecCertificate)leafCertificate;
- (id)hashForCertificate:(__SecCertificate *)a3;
- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (void)setApplePKI:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLeafCertificate:(__SecCertificate *)a3;
@end

@implementation MSDSessionBaseTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  -[MSDSessionBaseTrustEvaluate setApplePKI:](self, "setApplePKI:", 1LL);
  if (v4)
  {
    int v25 = 0;
    BOOL v8 = 0;
    if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v25)) {
      BOOL v8 = v25 == 4 || v25 == 1;
    }
    v10 = 0LL;
    goto LABEL_20;
  }

  if (!-[MSDSessionBaseTrustEvaluate trustServerWithApplePKI:](self, "trustServerWithApplePKI:", a3))
  {
    -[MSDSessionBaseTrustEvaluate setApplePKI:](self, "setApplePKI:", 0LL);
    if (!-[MSDSessionBaseTrustEvaluate trustServerWithAxinoePKI:](self, "trustServerWithAxinoePKI:", a3))
    {
      id v20 = sub_10003A95C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10009B018();
      }
      goto LABEL_27;
    }
  }

  -[MSDSessionBaseTrustEvaluate setLeafCertificate:]( self,  "setLeafCertificate:",  SecTrustGetCertificateAtIndex(a3, 0LL));
  if (!-[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"))
  {
    id v18 = sub_10003A95C();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100091C74();
    }
LABEL_27:

    v10 = 0LL;
LABEL_33:
    BOOL v8 = 0;
    goto LABEL_20;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 certificateHash]);
  v10 = (void *)v11;
  if (self->_applePKI || !v11)
  {
    -[MSDSessionBaseTrustEvaluate setIsDone:](self, "setIsDone:", 0LL);
    BOOL v8 = 0;
    goto LABEL_22;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSessionBaseTrustEvaluate hashForCertificate:]( self,  "hashForCertificate:",  self->_leafCertificate));
  unsigned __int8 v13 = [v10 isEqualToData:v12];

  id v14 = sub_10003A95C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v10 hexStringRepresentation]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[MSDSessionBaseTrustEvaluate hashForCertificate:]( self,  "hashForCertificate:",  self->_leafCertificate));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 hexStringRepresentation]);
      int v25 = 138543618;
      v26 = v21;
      __int16 v27 = 2114;
      v28 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@",  (uint8_t *)&v25,  0x16u);
    }

    goto LABEL_32;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Migrating certificate pinning.",  (uint8_t *)&v25,  2u);
  }

  if (!-[MSDSessionBaseTrustEvaluate saveHubCertificateIdentifer:applePKI:]( self,  "saveHubCertificateIdentifer:applePKI:",  -[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"),  -[MSDSessionBaseTrustEvaluate applePKI](self, "applePKI")))
  {
    id v24 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10009AFEC();
    }
LABEL_32:

    goto LABEL_33;
  }

  BOOL v8 = 1;
LABEL_20:
  -[MSDSessionBaseTrustEvaluate setIsDone:](self, "setIsDone:", 1LL);
LABEL_22:

  return v8;
}

- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3
{
  v5 = CFDataCreate(kCFAllocatorDefault, byte_100124868, dword_100124BF0);
  if (!v5)
  {
    id v13 = sub_10003A95C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009B050(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    return 0;
  }

  v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    id v22 = sub_10003A95C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10009B0C0(v23, v24, v25, v26, v27, v28, v29, v30);
    }

    CFRelease(v6);
    return 0;
  }

  SecCertificateRef v8 = v7;
  if (!-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v7,  0LL))
  {
    v10 = 0LL;
LABEL_26:
    BOOL v11 = 0;
    goto LABEL_8;
  }

  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0LL);
  if (!CertificateAtIndex)
  {
    id v31 = sub_10003A95C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100091C74();
    }
    goto LABEL_22;
  }

  if (SecCertificateCopyCommonName(CertificateAtIndex, &commonName))
  {
    id v33 = sub_10003A95C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10009B130();
    }
LABEL_22:
    v10 = 0LL;
LABEL_25:

    goto LABEL_26;
  }

  v10 = (__CFString *)commonName;
  if ((-[__CFString hasSuffix:]((id)commonName, "hasSuffix:", @".hubs.iosdm.demounit.net") & 1) == 0)
  {
    id v34 = sub_10003A95C();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
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
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009B15C(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    return 0;
  }

  v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    id v20 = sub_10003A95C();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10009B1CC(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    CFRelease(v6);
    return 0;
  }

  SecCertificateRef v8 = v7;
  if (-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v7,  @"hub.iosdm.local"))
  {
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = -[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]( self,  "trustServer:withRootCA:withHostName:",  a3,  v8,  @"hub.iosdm.net");
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
        sub_10009B2AC(v28, v29, v30, v31, v32, v33, v34, v35);
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
        v52 = "-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]";
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
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
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
    sub_10009B23C(v19, v20, v21, v22, v23, v24, v25, v26);
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
    BOOL v4 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
    v5 = v3;
    CC_SHA1(-[__CFData bytes](v5, "bytes"), (CC_LONG)-[__CFData length](v5, "length"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v4, 20LL));
    free(v4);
  }

  else
  {
    id v8 = sub_10003A95C();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10009B31C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v6 = 0LL;
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
                    v6 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"value"]);

                    BOOL v4 = 0LL;
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
    BOOL v4 = 0LL;
    goto LABEL_24;
  }

  BOOL v4 = (__CFString *)commonName;
  id v5 = -[__CFString rangeOfString:]((id)commonName, "rangeOfString:", @".hubs.iosdm.demounit.net");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    v6 = 0LL;
    goto LABEL_26;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v4, "substringWithRange:", 0LL, v5));
LABEL_26:

  return v6;
}

- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, a4));
  BOOL v7 = 0;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    unsigned __int8 v6 = [v5 saveHubCertificateIdentifer:v4];

    if ((v6 & 1) != 0) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)applePKI
{
  return self->_applePKI;
}

- (void)setApplePKI:(BOOL)a3
{
  self->_applePKI = a3;
}

- (__SecCertificate)leafCertificate
{
  return self->_leafCertificate;
}

- (void)setLeafCertificate:(__SecCertificate *)a3
{
  self->_leafCertificate = a3;
}

@end