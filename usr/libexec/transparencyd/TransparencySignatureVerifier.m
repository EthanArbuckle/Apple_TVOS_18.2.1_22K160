@interface TransparencySignatureVerifier
+ (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 trustedKeys:(id)a6 algorithm:(__CFString *)a7 error:(id *)a8;
+ (__CFString)secKeyAlgorithmForProtoAlgorithm:(int)a3;
+ (int)protoAlgorithmForSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)needsRefresh;
- (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 algorithm:(__CFString *)a6 error:(id *)a7;
- (NSDictionary)trustedKeys;
- (TransparencySignatureVerifier)initWithTrustedKeys:(id)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setTrustedKeys:(id)a3;
@end

@implementation TransparencySignatureVerifier

+ (__CFString)secKeyAlgorithmForProtoAlgorithm:(int)a3
{
  if (a3 == 1) {
    return (__CFString *)kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
  }
  if (qword_1002EEE30 != -1) {
    dispatch_once(&qword_1002EEE30, &stru_1002890E8);
  }
  v5 = (os_log_s *)qword_1002EEE38;
  if (os_log_type_enabled((os_log_t)qword_1002EEE38, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Unknown signature algorithm: %d",  (uint8_t *)v6,  8u);
  }

  return 0LL;
}

+ (int)protoAlgorithmForSecKeyAlgorithm:(__CFString *)a3
{
  v3 = a3;
  if ((-[__CFString isEqualToString:]( v3,  "isEqualToString:",  kSecKeyAlgorithmECDSASignatureMessageX962SHA256) & 1) != 0)
  {
    int v4 = 1;
  }

  else
  {
    if (qword_1002EEE30 != -1) {
      dispatch_once(&qword_1002EEE30, &stru_100289108);
    }
    v5 = (os_log_s *)qword_1002EEE38;
    if (os_log_type_enabled((os_log_t)qword_1002EEE38, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Unknown signature algorithm: %@",  (uint8_t *)&v7,  0xCu);
    }

    int v4 = 0;
  }

  return v4;
}

- (TransparencySignatureVerifier)initWithTrustedKeys:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TransparencySignatureVerifier;
  v6 = -[TransparencySignatureVerifier init](&v9, "init");
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trustedKeys, a3);
  }

  return v7;
}

- (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 algorithm:(__CFString *)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencySignatureVerifier trustedKeys](self, "trustedKeys"));
  id v19 = 0LL;
  BOOL v16 = +[TransparencySignatureVerifier verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:]( &OBJC_CLASS___TransparencySignatureVerifier,  "verifyMessage:signature:spkiHash:trustedKeys:algorithm:error:",  v14,  v13,  v12,  v15,  a6,  &v19);

  id v17 = v19;
  if (!v16
    && +[TransparencyError hasUnknownSPKIHashError:]( &OBJC_CLASS___TransparencyError,  "hasUnknownSPKIHashError:",  v17))
  {
    -[TransparencySignatureVerifier setNeedsRefresh:](self, "setNeedsRefresh:", 1LL);
  }

  if (a7 && v17) {
    *a7 = v17;
  }

  return v16;
}

+ (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 trustedKeys:(id)a6 algorithm:(__CFString *)a7 error:(id *)a8
{
  id v13 = (const __CFData *)a3;
  id v14 = (const __CFData *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (a7)
  {
    v18 = (__SecKey *)[v16 objectForKey:v15];
    if (v18)
    {
      CFErrorRef error = 0LL;
      BOOL v19 = SecKeyVerifySignature(v18, a7, v13, v14, &error) == 1;
      CFErrorRef v20 = error;
      if (error)
      {
        if (qword_1002EEE30 != -1) {
          dispatch_once(&qword_1002EEE30, &stru_100289148);
        }
        v21 = (os_log_s *)qword_1002EEE38;
        if (os_log_type_enabled((os_log_t)qword_1002EEE38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFErrorRef v31 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Signature verification failed: %@",  buf,  0xCu);
        }

        if (a8)
        {
          v22 = v20;
LABEL_13:
          *a8 = v22;
        }
      }
    }

    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);
      CFErrorRef v20 = (CFErrorRef)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -9LL,  @"Unable to find trusted key for SPKI hash: %@",  v24));

      if (a8 && v20) {
        *a8 = v20;
      }
      if (qword_1002EEE30 != -1) {
        dispatch_once(&qword_1002EEE30, &stru_100289128);
      }
      v25 = (void *)qword_1002EEE38;
      if (os_log_type_enabled((os_log_t)qword_1002EEE38, OS_LOG_TYPE_ERROR))
      {
        v26 = v25;
        v27 = (__CFError *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);
        *(_DWORD *)buf = 138543362;
        CFErrorRef v31 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unable to find trusted key for SPKI hash: %{public}@",  buf,  0xCu);
      }

      BOOL v19 = 0;
    }
  }

  else
  {
    v23 = (__CFError *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -136LL,  @"Unknown signature algorithm"));
    CFErrorRef v20 = v23;
    BOOL v19 = 0;
    if (a8 && v23)
    {
      v22 = v23;
      CFErrorRef v20 = v22;
      BOOL v19 = 0;
      goto LABEL_13;
    }
  }

  return v19;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setTrustedKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end