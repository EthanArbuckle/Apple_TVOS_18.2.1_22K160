@interface PDAppAttestService
- (PDAppAttestService)init;
- (__SecKey)_createNewKey;
- (id)_attestedCredentialDataWithPublicKey:(id)a3;
- (id)_authenticatorDataWithPublicKey:(id)a3;
- (id)_generateCborRepresentationOfCertificats:(id)a3 authenticationData:(id)a4;
- (id)_publicKeyFromKey:(__SecKey *)a3;
- (void)attestChallenge:(id)a3 completion:(id)a4;
@end

@implementation PDAppAttestService

- (PDAppAttestService)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDAppAttestService;
  return -[PDAppAttestService init](&v3, "init");
}

- (void)attestChallenge:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PDBasicError(@"Device check not supported on this device");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (__SecKey)_createNewKey
{
  CFErrorRef error = 0LL;
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, &error);
  if (v2)
  {
    SecAccessControlRef v3 = v2;
    v17[0] = kSecAttrKeyClass;
    v17[1] = kSecAttrAccessControl;
    v18[0] = kSecAttrKeyClassPrivate;
    v18[1] = v2;
    v17[2] = kSecAttrIsPermanent;
    v17[3] = kSecAttrLabel;
    v18[2] = kCFBooleanFalse;
    v18[3] = @"com.apple.wallet.default.contact";
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  4LL));
    v15[0] = kSecAttrTokenID;
    v15[1] = kSecAttrKeyType;
    v16[0] = kSecAttrTokenIDSecureEnclave;
    v16[1] = kSecAttrKeyTypeECSECPrimeRandom;
    v15[2] = kSecAttrKeySizeInBits;
    v15[3] = kSecPrivateKeyAttrs;
    v16[2] = &off_1006906C8;
    v16[3] = v4;
    id v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  4LL));
    SecKeyRef v6 = SecKeyCreateRandomKey(v5, &error);
    SecKeyRef v7 = v6;
    CFErrorRef v8 = error;
    if (error || !v6)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(33LL);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v20 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PDAppAttestService: Error failed to create ephemeral private key %@",  buf,  0xCu);
      }

      if (v7)
      {
        CFRelease(v7);
        SecKeyRef v7 = 0LL;
      }
    }

    CFRelease(v3);
  }

  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(33LL);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFErrorRef v12 = error;
      *(_DWORD *)buf = 138412290;
      CFErrorRef v20 = error;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "PDAppAttestService: Error failed to create access control %@",  buf,  0xCu);
    }

    SecKeyRef v7 = 0LL;
  }

  return v7;
}

- (id)_publicKeyFromKey:(__SecKey *)a3
{
  if (a3)
  {
    SecAccessControlRef v3 = SecKeyCopyPublicKey(a3);
    CFErrorRef error = 0LL;
    CFDataRef v4 = SecKeyCopyExternalRepresentation(v3, &error);
    CFErrorRef v5 = error;
    if (error)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(33LL);
      SecKeyRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v11 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PDAppAttestService: Error failed to get public key %@",  buf,  0xCu);
      }
    }

    CFRelease(v3);
  }

  else
  {
    CFDataRef v4 = 0LL;
  }

  return v4;
}

- (id)_authenticatorDataWithPublicKey:(id)a3
{
  id v4 = a3;
  CFErrorRef v5 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  SecKeyRef v6 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.wallet" dataUsingEncoding:4]);
  SecKeyRef v7 = (void *)objc_claimAutoreleasedReturnValue([v6 SHA256Hash]);

  -[NSMutableData appendData:](v5, "appendData:", v7);
  char v12 = 69;
  -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v12, 1LL);
  int v11 = 0;
  -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v11, 4LL);
  CFErrorRef v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDAppAttestService _attestedCredentialDataWithPublicKey:]( self,  "_attestedCredentialDataWithPublicKey:",  v4));

  -[NSMutableData appendData:](v5, "appendData:", v8);
  id v9 = -[NSMutableData copy](v5, "copy");

  return v9;
}

- (id)_attestedCredentialDataWithPublicKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  CFErrorRef v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"00000000000000000000000000000000", "pk_decodeHexadecimal"));
  -[NSMutableData appendData:](v4, "appendData:", v5);

  SecKeyRef v6 = (void *)objc_claimAutoreleasedReturnValue([v3 SHA256Hash]);
  __int16 v9 = bswap32([v6 length]) >> 16;
  -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v9, 2LL);
  id v7 = -[NSMutableData copy](v4, "copy");

  return v7;
}

- (id)_generateCborRepresentationOfCertificats:(id)a3 authenticationData:(id)a4
{
  return 0LL;
}

@end