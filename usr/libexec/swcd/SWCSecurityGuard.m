@interface SWCSecurityGuard
+ (SWCSecurityGuard)new;
+ (SWCSecurityGuard)sharedSecurityGuard;
- (BOOL)_isSystemTrusted:(__SecTrust *)a3;
- (BOOL)_verifyExtendedValidationOfTrust:(__SecTrust *)a3 error:(id *)a4;
- (BOOL)verifyTrust:(__SecTrust *)a3 allowInstalledRootCertificates:(BOOL)a4 error:(id *)a5;
- (BOOL)verifyTrust:(__SecTrust *)a3 error:(id *)a4;
- (SWCSecurityGuard)init;
- (id)JSONObjectWithSignedJSONData:(id)a3 error:(id *)a4;
- (id)_errorForUntrustedRootCertificateOfTrust:(__SecTrust *)a3;
- (id)_init;
- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 allowingKeychains:(BOOL)a4 error:(id *)a5;
- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 error:(id *)a4;
@end

@implementation SWCSecurityGuard

+ (SWCSecurityGuard)sharedSecurityGuard
{
  if (qword_100037230 != -1) {
    dispatch_once(&qword_100037230, &stru_100031180);
  }
  return (SWCSecurityGuard *)(id)qword_100037228;
}

+ (SWCSecurityGuard)new
{
}

- (SWCSecurityGuard)init
{
}

- (id)JSONObjectWithSignedJSONData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_autoreleasePoolPush();
  id v23 = 0LL;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v23));
  id v8 = v23;
  if (v7)
  {
    v9 = (void *)v7;
  }

  else
  {
    id v22 = 0LL;
    int v10 = SecCMSVerifyCopyDataAndAttributes(v5, 0LL, 0LL, 0LL, &v22, 0LL);
    int v11 = v10;
    if (v10 == -26275)
    {
      v9 = 0LL;
    }

    else
    {
      if (v10)
      {
        v19 = objc_alloc(&OBJC_CLASS___NSError);
        v27[0] = &off_100032938;
        v26[0] = @"Line";
        v26[1] = @"Function";
        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]"));
        v27[1] = v20;
        v27[2] = @"Failed to extract JSON object when assuming signed";
        v26[2] = NSDebugDescriptionErrorKey;
        v26[3] = NSUnderlyingErrorKey;
        v13 = objc_alloc(&OBJC_CLASS___NSError);
        v24[1] = @"Function";
        v25[0] = &off_100032938;
        v24[0] = @"Line";
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]"));
        v25[1] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
        v16 = -[NSError initWithDomain:code:userInfo:]( v13,  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v11,  v15);
        v27[3] = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  4LL));
        v12 = -[NSError initWithDomain:code:userInfo:]( v19,  "initWithDomain:code:userInfo:",  _SWCErrorDomain,  104LL,  v17);

        v9 = 0LL;
        id v8 = (id)v20;
      }

      else
      {
        id v21 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v22,  0LL,  &v21));
        v12 = (NSError *)v21;
      }

      id v8 = v12;
    }
  }

  objc_autoreleasePoolPop(v6);
  if (a4 && !v9) {
    *a4 = v8;
  }

  return v9;
}

- (BOOL)verifyTrust:(__SecTrust *)a3 error:(id *)a4
{
  return -[SWCSecurityGuard verifyTrust:allowInstalledRootCertificates:error:]( self,  "verifyTrust:allowInstalledRootCertificates:error:",  a3,  0LL,  a4);
}

- (BOOL)verifyTrust:(__SecTrust *)a3 allowInstalledRootCertificates:(BOOL)a4 error:(id *)a5
{
  optional<SecTrustResultType> v9 = -[SWCSecurityGuard _evaluateTrust:allowingKeychains:error:]( self,  "_evaluateTrust:allowingKeychains:error:",  a3,  0LL);
  if ((*(void *)&v9 & 0xFF00000000LL) == 0
    || (optional<SecTrustResultType> v10 = v9, v9.var0.var1 == 5)
    && (optional<SecTrustResultType> v10 = -[SWCSecurityGuard _evaluateTrust:allowingKeychains:error:]( self,  "_evaluateTrust:allowingKeychains:error:",  a3,  1LL,  a5),  (*(void *)&v10 & 0xFF00000000LL) == 0))
  {
    v12 = 0LL;
    goto LABEL_14;
  }

  if (v10.var0.var1 == 1)
  {
    if (a4 || -[SWCSecurityGuard _isSystemTrusted:](self, "_isSystemTrusted:", a3))
    {
      v12 = 0LL;
      BOOL v11 = 1;
      goto LABEL_17;
    }

    v12 = (NSError *)objc_claimAutoreleasedReturnValue( -[SWCSecurityGuard _errorForUntrustedRootCertificateOfTrust:]( self,  "_errorForUntrustedRootCertificateOfTrust:",  a3));
    goto LABEL_14;
  }

  if (v10.var0.var1 != 4)
  {
    v13 = objc_alloc(&OBJC_CLASS___NSError);
    v19[0] = &off_100032950;
    v18[0] = @"Line";
    v18[1] = @"Function";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard verifyTrust:allowInstalledRootCertificates:error:]"));
    v19[1] = v14;
    v19[2] = @"Disallowed trust result type.";
    v18[2] = NSDebugDescriptionErrorKey;
    v18[3] = @"TrustResultType";
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
    v19[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
    v12 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 100LL, v16);

LABEL_14:
    BOOL v11 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  BOOL v11 = -[SWCSecurityGuard _verifyExtendedValidationOfTrust:error:]( self,  "_verifyExtendedValidationOfTrust:error:",  a3,  a5);
  v12 = 0LL;
  if (!a5) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v11)
  {
    v12 = v12;
    BOOL v11 = 0;
    *a5 = v12;
  }

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SWCSecurityGuard;
  return -[SWCSecurityGuard init](&v3, "init");
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 error:(id *)a4
{
  CFErrorRef error = 0LL;
  v6 = objc_autoreleasePoolPush();
  BOOL v7 = SecTrustEvaluateWithError(a3, &error);
  SecTrustResultType result = kSecTrustResultInvalid;
  OSStatus TrustResult = SecTrustGetTrustResult(a3, &result);
  if (!TrustResult)
  {
    unsigned __int32 v26 = result & 0xFFFFFF00;
    int v27 = result;
    v28 = &_mh_execute_header;
    goto LABEL_18;
  }

  if (v7)
  {
    optional<SecTrustResultType> v9 = objc_alloc(&OBJC_CLASS___NSError);
    v40[0] = &off_100032968;
    v39[0] = @"Line";
    v39[1] = @"Function";
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _evaluateTrust:error:]"));
    v40[1] = v30;
    v40[2] = @"Failed to get trust result type.";
    v39[2] = NSDebugDescriptionErrorKey;
    v39[3] = NSUnderlyingErrorKey;
    optional<SecTrustResultType> v10 = objc_alloc(&OBJC_CLASS___NSError);
    v37[1] = @"Function";
    v38[0] = &off_100032968;
    v37[0] = @"Line";
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _evaluateTrust:error:]"));
    v38[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  2LL));
    v13 = -[NSError initWithDomain:code:userInfo:]( v10,  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  TrustResult,  v12);
    v40[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  4LL));
    v15 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 100LL, v14);
    CFErrorRef v16 = error;
    CFErrorRef error = v15;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError userInfo](error, "userInfo"));
  id v18 = [v17 mutableCopy];

  if (v18)
  {
    CFDictionaryRef v19 = SecTrustCopyResult(a3);
    if (v19) {
      [v18 setObject:v19 forKeyedSubscript:@"TrustResult"];
    }

    uint64_t v20 = (void *)SecTrustCopyFailureDescription(a3);
    if (v20) {
      [v18 setObject:v20 forKeyedSubscript:@"TrustFailureReason"];
    }

    id v21 = objc_alloc(&OBJC_CLASS___NSError);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError domain](error, "domain"));
    id v23 = -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  v22,  -[__CFError code](error, "code"),  v18);
    CFErrorRef v24 = error;
    CFErrorRef error = v23;
  }

  if (qword_100037240 != -1) {
    dispatch_once(&qword_100037240, &stru_1000311A0);
  }
  v25 = (os_log_s *)qword_100037238;
  if (os_log_type_enabled((os_log_t)qword_100037238, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = a3;
    __int16 v35 = 2112;
    CFErrorRef v36 = error;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error evaluating trust %@: %@", buf, 0x16u);
    if (a4) {
      goto LABEL_14;
    }
LABEL_17:
    unsigned __int32 v26 = 0;
    int v27 = 0;
    v28 = 0LL;
    goto LABEL_18;
  }

  if (!a4) {
    goto LABEL_17;
  }
LABEL_14:
  unsigned __int32 v26 = 0;
  int v27 = 0;
  v28 = 0LL;
  *a4 = error;
LABEL_18:
  objc_autoreleasePoolPop(v6);

  return (optional<SecTrustResultType>)((unint64_t)v28 | v27 | v26);
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 allowingKeychains:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  unsigned __int8 v23 = 0;
  int KeychainsAllowed = SecTrustGetKeychainsAllowed(a3, &v23);
  if (KeychainsAllowed)
  {
    optional<SecTrustResultType> v10 = objc_alloc(&OBJC_CLASS___NSError);
    v33[0] = &off_100032980;
    v32[0] = @"Line";
    v32[1] = @"Function";
    optional<SecTrustResultType> v17 = (optional<SecTrustResultType>)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]"));
    v33[1] = v17;
    v33[2] = @"Failed to get whether keychains are allowed as a source of trust.";
    v32[2] = NSDebugDescriptionErrorKey;
    v32[3] = NSUnderlyingErrorKey;
    BOOL v11 = objc_alloc(&OBJC_CLASS___NSError);
    v30[1] = @"Function";
    v31[0] = &off_100032980;
    v30[0] = @"Line";
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]"));
    v31[1] = v12;
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
    v14 = -[NSError initWithDomain:code:userInfo:]( v11,  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  KeychainsAllowed,  v13);
    v33[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));
    CFErrorRef v16 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1LL, v15);

    v17.var0.var0 = 0;
    goto LABEL_3;
  }

  SecTrustSetKeychainsAllowed(a3, v6);
  id v22 = 0LL;
  optional<SecTrustResultType> v17 = -[SWCSecurityGuard _evaluateTrust:error:](self, "_evaluateTrust:error:", a3, &v22);
  CFErrorRef v16 = (NSError *)v22;
  SecTrustSetKeychainsAllowed(a3, v23);
  LODWORD(v13) = v17.var0.var1 >> 8;
  uint64_t v18 = *(void *)&v17 & 0xFF00000000LL;
  if ((*(void *)&v17 & 0xFF00000000LL) == 0)
  {
LABEL_3:
    if (a5)
    {
      CFErrorRef v16 = v16;
      uint64_t v18 = 0LL;
      *a5 = v16;
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    goto LABEL_13;
  }

  if (qword_100037240 != -1) {
    dispatch_once(&qword_100037240, &stru_1000311A0);
  }
  CFDictionaryRef v19 = (os_log_s *)qword_100037238;
  if (os_log_type_enabled((os_log_t)qword_100037238, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = @"NOT ";
    *(_DWORD *)buf = 138412802;
    v25 = a3;
    if (v6) {
      uint64_t v20 = &stru_100031DB8;
    }
    __int16 v26 = 2114;
    int v27 = v20;
    __int16 v28 = 2048;
    uint64_t var1 = v17.var0.var1;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Trust result for %@ (keychains %{public}@allowed): %llu",  buf,  0x20u);
  }

- (id)_errorForUntrustedRootCertificateOfTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    CertificateAtIndex = 0LL;
LABEL_9:
    id v8 = @"Certificate is not rooted in the system trust store.";
    goto LABEL_10;
  }

  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
  if (!CertificateAtIndex) {
    goto LABEL_9;
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  unsigned int v7 = [v6 isAppleInternal];

  if (!v7) {
    goto LABEL_9;
  }
  optional<SecTrustResultType> v17 = 0LL;
  id v8 = @"Certificate is not rooted in the system trust store.";
  if (!SecCertificateCopyCommonName(CertificateAtIndex, (CFStringRef *)&v17)
    && -[__CFString hasPrefix:](v17, "hasPrefix:", @"Apple Corporate"))
  {
    id v8 = @"Root certificate appears to be issued by an internal Apple authority. Such certificates cannot be used with the public associated domains API. Internal Apple applications should use the internal associated domains API instead.";
  }

LABEL_10:
  optional<SecTrustResultType> v9 = objc_alloc(&OBJC_CLASS___NSError);
  v19[0] = &off_100032998;
  v18[0] = @"Line";
  v18[1] = @"Function";
  optional<SecTrustResultType> v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _errorForUntrustedRootCertificateOfTrust:]"));
  v19[1] = v10;
  v18[2] = @"RootCertificate";
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[__SecCertificate description](CertificateAtIndex, "description"));
  v12 = (void *)v11;
  uint64_t v13 = @"<none>";
  if (v11) {
    uint64_t v13 = (const __CFString *)v11;
  }
  v18[3] = NSDebugDescriptionErrorKey;
  v19[2] = v13;
  v19[3] = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
  v15 = -[NSError initWithDomain:code:userInfo:](v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 103LL, v14);

  return v15;
}

- (BOOL)_verifyExtendedValidationOfTrust:(__SecTrust *)a3 error:(id *)a4
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  unsigned int v7 = [v6 verifyExtendedValidation];

  if (!v7) {
    return 1;
  }
  CFDictionaryRef v8 = SecTrustCopyResult(a3);
  CFDictionaryRef v9 = v8;
  if (v8)
  {
    optional<SecTrustResultType> v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v8,  "objectForKeyedSubscript:",  kSecTrustExtendedValidation));
    uint64_t v11 = v10;
    if (v10) {
      unsigned __int8 v12 = [v10 isEqual:&__kCFBooleanTrue];
    }
    else {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  if (a4 && (v12 & 1) == 0)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSError);
    v18[0] = &off_1000329B0;
    v17[0] = @"Line";
    v17[1] = @"Function";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCSecurityGuard(Private) _verifyExtendedValidationOfTrust:error:]"));
    v18[1] = v14;
    v17[2] = NSDebugDescriptionErrorKey;
    v18[2] = @"Extended validation failed.";
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
    *a4 = -[NSError initWithDomain:code:userInfo:](v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 102LL, v15);

    return 0;
  }

  return v12;
}

- (BOOL)_isSystemTrusted:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    LOBYTE(CertificateAtIndex) = 0;
  }

  else
  {
    SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
    if (CertificateAtIndex)
    {
      SecCertificateRef v6 = CertificateAtIndex;
      uint64_t v7 = SecTrustStoreForDomain(1LL);
      LOBYTE(CertificateAtIndex) = SecTrustStoreContains(v7, v6) != 0;
    }
  }

  return (char)CertificateAtIndex;
}

@end