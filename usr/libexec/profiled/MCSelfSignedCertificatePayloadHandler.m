@interface MCSelfSignedCertificatePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_createKeyPairType:(id)a3 size:(unint64_t)a4 hardwareBound:(BOOL)a5 outPublicKey:(__SecKey *)a6 outPrivateKey:(__SecKey *)a7;
- (id)generateSelfSignedCertificatePublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4 keyUsage:(unsigned int)a5 extendedKeyUsage:(id)a6 lifetime:(unint64_t)a7 outCert:(__SecCertificate *)a8;
- (void)dealloc;
@end

@implementation MCSelfSignedCertificatePayloadHandler

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCSelfSignedCertificatePayloadHandler;
  -[MCSelfSignedCertificatePayloadHandler dealloc](&v4, "dealloc");
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v28 = 0LL;
  v10 = -[MCSelfSignedCertificatePayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:]( self,  "copyIdentityImmediatelyWithInteractionClient:outError:",  v8,  &v28);
  id v11 = v28;
  if (!v11)
  {
    v27 = a6;
    v12 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Storing self-signed identity with accessibility %@",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
    uint64_t v15 = kMCAppleIdentitiesKeychainGroup;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 profile]);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v10,  v14,  v15,  [v17 isInstalledForSystem],  v12));

    CFRelease(v10);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v18,  v19);

      if (v8)
      {
        id v11 = 0LL;
        if (([v8 didUpdateStatus:0] & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          id v11 = (id)objc_claimAutoreleasedReturnValue([v20 userCancelledError]);
        }
      }

      else
      {
        id v11 = 0LL;
      }

      [v9 setCertificatePersistentID:v18];
      v24 = (void *)objc_claimAutoreleasedReturnValue([v9 UUID]);
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v18,  v24);

      v25 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Successfully installed certificate.",  buf,  2u);
      }
    }

    else
    {
      uint64_t v21 = MCCertificateErrorDomain;
      uint64_t v22 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE");
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v21,  9002LL,  v23,  MCErrorTypeFatal,  0LL));
    }

    a6 = v27;
  }

  if (a6 && v11) {
    *a6 = [v11 MCCopyAsPrimaryError];
  }

  return v11 == 0LL;
}

- (id)_createKeyPairType:(id)a3 size:(unint64_t)a4 hardwareBound:(BOOL)a5 outPublicKey:(__SecKey *)a6 outPrivateKey:(__SecKey *)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  CFErrorRef error = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  if ([v11 isEqualToString:kMCSSCKeyTypeRSA])
  {
    v13 = &kSecAttrKeyTypeRSA;
  }

  else
  {
    v13 = &kSecAttrKeyTypeECSECPrimeRandom;
  }

  [v12 setObject:*v13 forKeyedSubscript:kSecAttrKeyType];
LABEL_6:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  [v12 setObject:v14 forKeyedSubscript:kSecAttrKeySizeInBits];

  if (v9) {
    [v12 setObject:kSecAttrTokenIDSecureEnclave forKeyedSubscript:kSecAttrTokenID];
  }
  uint64_t v15 = SecKeyCreateRandomKey((CFDictionaryRef)v12, &error);
  v16 = v15;
  if (error)
  {
    v17 = 0LL;
  }

  else
  {
    v17 = SecKeyCopyPublicKey(v15);
    if (!v17)
    {
      uint64_t v18 = MCSelfSignedCertificateErrorDomain;
      uint64_t v19 = MCErrorArray(@"SSC_ERROR_CANNOT_GET_PUBLIC_KEY");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      CFErrorRef error = (CFErrorRef)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v18,  59001LL,  v20,  MCErrorTypeFatal,  0LL));
    }

    if (!error)
    {
      if (a6)
      {
        *a6 = v17;
      }

      else if (v17)
      {
        CFRelease(v17);
      }

      if (a7)
      {
        *a7 = v16;
        goto LABEL_18;
      }

      if (!v16) {
        goto LABEL_18;
      }
      uint64_t v21 = v16;
      goto LABEL_17;
    }
  }

  if (v16) {
    CFRelease(v16);
  }
  if (v17)
  {
    uint64_t v21 = v17;
LABEL_17:
    CFRelease(v21);
  }

- (id)generateSelfSignedCertificatePublicKey:(__SecKey *)a3 privateKey:(__SecKey *)a4 keyUsage:(unsigned int)a5 extendedKeyUsage:(id)a6 lifetime:(unint64_t)a7 outCert:(__SecCertificate *)a8
{
  uint64_t v9 = kSecOidCommonName;
  v37[0] = kSecOidCommonName;
  id v32 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v37[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v38 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  v39[0] = v13;
  v35[0] = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 profile]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  v35[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 2LL));
  v36 = v17;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  v39[1] = v18;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a5));
  [v20 setObject:v21 forKeyedSubscript:kSecCertificateKeyUsage];

  CFErrorRef v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a7));
  [v20 setObject:v22 forKeyedSubscript:kSecCertificateLifetime];

  [v20 setObject:v32 forKeyedSubscript:kSecCertificateExtendedKeyUsage];
  SelfSignedCertificate = (__SecCertificate *)SecGenerateSelfSignedCertificate(v19, v20, a3, a4);
  if (SelfSignedCertificate)
  {
    if (a8)
    {
      v24 = 0LL;
      *a8 = SelfSignedCertificate;
    }

    else
    {
      CFRelease(SelfSignedCertificate);
      v24 = 0LL;
    }
  }

  else
  {
    uint64_t v25 = MCSelfSignedCertificateErrorDomain;
    uint64_t v26 = MCErrorArray(@"SSC_ERROR_CANNOT_GENERATE_CERTIFICATE");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v25,  59002LL,  v27,  MCErrorTypeFatal,  0LL));
  }

  return v24;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  identity = self->_identity;
  if (!identity)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    CFTypeRef v44 = 0LL;
    CFTypeRef cf = 0LL;
    CFTypeRef v43 = 0LL;
    if (v6)
    {
      uint64_t v11 = MCLocalizedString(@"PROGRESS_GENERATING_KEY", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      unsigned __int8 v13 = [v6 didUpdateStatus:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_12;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 keyType]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MCSelfSignedCertificatePayloadHandler _createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:]( self,  "_createKeyPairType:size:hardwareBound:outPublicKey:outPrivateKey:",  v14,  [v10 keySize],  objc_msgSend(v10, "isHardwareBound"),  &v44,  &v43));

    if (v15)
    {
      uint64_t v17 = MCSelfSignedCertificateErrorDomain;
      uint64_t v18 = MCErrorArray(@"SSC_ERROR_CANNOT_GENERATE_KEY_PAIR");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = MCErrorTypeFatal;
      uint64_t v21 = v17;
      uint64_t v22 = 59000LL;
LABEL_11:
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v21,  v22,  v19,  v15,  v20,  0LL));

      goto LABEL_13;
    }

    if (v6
      && (uint64_t v23 = MCLocalizedString(@"PROGRESS_GENERATING_CERTIFICATE", v16),
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23),
          unsigned __int8 v25 = [v6 didUpdateStatus:v24],
          v24,
          (v25 & 1) == 0))
    {
LABEL_12:
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v33 userCancelledError]);
    }

    else
    {
      CFTypeRef v27 = v43;
      CFTypeRef v26 = v44;
      id v28 = [v10 keyUsage];
      v29 = (void *)objc_claimAutoreleasedReturnValue([v10 extendedKeyUsage]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MCSelfSignedCertificatePayloadHandler generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:]( self,  "generateSelfSignedCertificatePublicKey:privateKey:keyUsage:extendedKeyUsage:lifetime:outCert:",  v26,  v27,  v28,  v29,  [v10 lifetime],  &cf));

      if (v15)
      {
        uint64_t v30 = MCSelfSignedCertificateErrorDomain;
        uint64_t v31 = MCErrorArray(@"SSC_ERROR_CANNOT_GENERATE_CERTIFICATE");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v31);
        uint64_t v20 = MCErrorTypeFatal;
        uint64_t v21 = v30;
        uint64_t v22 = 59002LL;
        goto LABEL_11;
      }

      v39 = (__SecIdentity *)SecIdentityCreate(kCFAllocatorDefault, cf, v43);
      self->_identity = v39;
      if (v39)
      {
        id v32 = 0LL;
      }

      else
      {
        uint64_t v40 = MCSelfSignedCertificateErrorDomain;
        uint64_t v41 = MCErrorArray(@"SSC_ERROR_CANNOT_CREATE_IDENTITY");
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v40,  59003LL,  v42,  MCErrorTypeFatal,  0LL));
      }
    }

@end