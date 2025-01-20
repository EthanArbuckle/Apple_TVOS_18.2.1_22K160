@interface DAStrongDeviceIdentity
- (NSData)certData;
- (__SecKey)deviceIdentityKey;
- (id)SHA256ForData:(id)a3;
- (id)SHA256ForFileHandle:(id)a3;
- (id)deviceIdentityCert;
- (id)deviceIdentityPublicKeyDigest;
- (id)requestAttestationBlobWithOptions:(id)a3 error:(id *)a4;
- (id)signDigest:(id)a3 error:(id *)a4;
- (id)signFile:(id)a3 error:(id *)a4;
- (id)signPayload:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)generateAuthInfoWithNonce:(id)a3 completion:(id)a4;
- (void)purgeSecurityKey;
- (void)setCertData:(id)a3;
- (void)setDeviceIdentityKey:(__SecKey *)a3;
@end

@implementation DAStrongDeviceIdentity

- (void)purgeSecurityKey
{
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    CFRelease(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"));
    -[DAStrongDeviceIdentity setDeviceIdentityKey:](self, "setDeviceIdentityKey:", 0LL);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DAStrongDeviceIdentity;
  -[DAStrongDeviceIdentity dealloc](&v3, "dealloc");
}

- (void)generateAuthInfoWithNonce:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = kMAOptionsBAASCRTAttestation;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  &__kCFBooleanTrue,  v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjects:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjects:",  kMAOptionsBAAOIDDeviceIdentifiers,  kMAOptionsBAAOIDHardwareProperties,  kMAOptionsBAAOIDKeyUsageProperties,  kMAOptionsBAAOIDDeviceOSInformation,  kMAOptionsBAAOIDUCRTDeviceIdentifiers,  0LL));
  v11 = v10;
  if (v6)
  {
    [v10 addObject:kMAOptionsBAAOIDNonce];
    [v9 setObject:v6 forKeyedSubscript:kMAOptionsBAANonce];
  }

  [v9 setObject:v11 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];
  id v14 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[DAStrongDeviceIdentity requestAttestationBlobWithOptions:error:]( self,  "requestAttestationBlobWithOptions:error:",  v9,  &v14));
  id v13 = v14;
  -[DAStrongDeviceIdentity setCertData:](self, "setCertData:", 0LL);
  (*((void (**)(id, void *, void, void, void, id))v8 + 2))(v8, v12, 0LL, 0LL, 0LL, v13);
}

- (id)signPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForData:](self, "SHA256ForData:", v6));
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity signDigest:error:](self, "signDigest:error:", v7, a4));
      v9 = 0LL;
    }

    else
    {
      uint64_t v12 = DiagnosticLogHandleForCategory(1LL);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100018EB4();
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  1LL,  0LL));
      id v8 = 0LL;
    }

    if (v9) {
LABEL_12:
    }
      +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 1LL, v9);
  }

  else
  {
    uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100018E88();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  0LL,  0LL));
    id v8 = 0LL;
    if (v9) {
      goto LABEL_12;
    }
  }

  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (id)signFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingAtPath:",  v7));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForFileHandle:](self, "SHA256ForFileHandle:", v8));
      if (v9)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity signDigest:error:](self, "signDigest:error:", v9, a4));
      }

      else
      {
        uint64_t v16 = DiagnosticLogHandleForCategory(1LL);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100018F98();
        }

        uint64_t v10 = 0LL;
        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  3LL,  0LL));
        }
      }

      id v13 = 0LL;
    }

    else
    {
      uint64_t v14 = DiagnosticLogHandleForCategory(1LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100018F0C(v6, v15);
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  2LL,  0LL));
      uint64_t v10 = 0LL;
    }

    if (a4) {
LABEL_18:
    }
      *a4 = v13;
  }

  else
  {
    uint64_t v11 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100018EE0();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  0LL,  0LL));
    uint64_t v10 = 0LL;
    if (a4) {
      goto LABEL_18;
    }
  }

  return v10;
}

- (id)SHA256ForData:(id)a3
{
  id v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length", 0, 0, 0, 0);
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFD)
  {
    v5 = 0LL;
  }

  else
  {
    CC_SHA256([v3 bytes], (CC_LONG)v4, (unsigned __int8 *)&v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v7, 32LL));
  }

  return v5;
}

- (id)SHA256ForFileHandle:(id)a3
{
  id v3 = a3;
  id v4 = [v3 offsetInFile];
  [v3 seekToFileOffset:0];
  CC_SHA256_Init(&c);
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 readDataOfLength:0x10000]);
    id v6 = [v5 length];
    id v7 = v5;
    CC_SHA256_Update(&c, [v7 bytes], (CC_LONG)v6);
  }

  while (v6);
  [v3 seekToFileOffset:v4];
  memset(v10, 0, sizeof(v10));
  CC_SHA256_Final((unsigned __int8 *)v10, &c);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v10, 32LL));

  return v8;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  CFErrorRef error = 0LL;
  id v6 = (const __CFData *)a3;
  CFDataRef v7 = SecKeyCreateSignature( -[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"),  kSecKeyAlgorithmECDSASignatureDigestX962SHA256,  v6,  &error);

  if (!v7)
  {
    CFErrorRef v8 = error;
    v9 = error;
    uint64_t v10 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFError description](v9, "description"));
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to create signature with underlying CFErrorRef error = (%@).",  buf,  0xCu);
      }

      NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
      v18 = v9;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      if (!a4) {
        goto LABEL_7;
      }
    }

    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to create signature.", buf, 2u);
      }

      uint64_t v14 = 0LL;
      if (!a4) {
        goto LABEL_7;
      }
    }

    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  4LL,  v14));
LABEL_7:
  }

  return v7;
}

- (id)requestAttestationBlobWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[DAStrongDeviceIdentity purgeSecurityKey](self, "purgeSecurityKey");
  id v17 = 0LL;
  uint64_t v7 = DeviceIdentityCopyAttestationDictionary( -[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"),  v6,  &v17);
  CFErrorRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = v17;
  if (!v8
    || (id v16 = 0LL,
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v8,  100LL,  0LL,  &v16)),  v11 = v16,  v9,  v9 = v11,  !v10))
  {
    if (v9)
    {
      if (a4)
      {
        NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
        id v19 = v9;
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  5LL,  v12));
      }
    }

    else if (a4)
    {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Diagnostics.StrongDeviceIdentityError",  5LL,  0LL));
    }

    uint64_t v13 = DiagnosticLogHandleForCategory(1LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100018FC4((uint64_t)v9, v14);
    }

    +[DSAnalytics sendAnalyticsWithEvent:error:](&OBJC_CLASS___DSAnalytics, "sendAnalyticsWithEvent:error:", 0LL, v9);
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (id)deviceIdentityPublicKeyDigest
{
  CFErrorRef error = 0LL;
  id v3 = SecKeyCopyPublicKey(-[DAStrongDeviceIdentity deviceIdentityKey](self, "deviceIdentityKey"));
  CFDataRef v4 = SecKeyCopyExternalRepresentation(v3, &error);
  CFRelease(v3);
  if (error)
  {
    uint64_t v5 = DiagnosticLogHandleForCategory(1LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100019038((uint64_t *)&error, v6, v7);
    }

    CFErrorRef v8 = 0LL;
  }

  else
  {
    CFErrorRef v8 = (void *)objc_claimAutoreleasedReturnValue(-[DAStrongDeviceIdentity SHA256ForData:](self, "SHA256ForData:", v4));
  }

  return v8;
}

- (id)deviceIdentityCert
{
  return -[DAStrongDeviceIdentity certData](self, "certData");
}

- (__SecKey)deviceIdentityKey
{
  return self->_deviceIdentityKey;
}

- (void)setDeviceIdentityKey:(__SecKey *)a3
{
  self->_deviceIdentityKey = a3;
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end