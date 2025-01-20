@interface MCNewPlainCertificatePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4;
- (__SecIdentity)_copyContentsOfPKCS12DataWithPasscode:(id)a3 outError:(id *)a4;
- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4;
- (id)_cannotStoreCertificateError;
- (id)_cannotStoreRootCertificateError;
- (id)_invalidPasscodeError;
- (id)_malformedCertificateError;
- (id)_storeCertificate:(__SecCertificate *)a3 allowSSLTrust:(BOOL)a4 outError:(id *)a5;
- (id)_tooManyCertificatesError;
- (id)userInputFields;
- (int)_grantPartialNonSSLTrustPolicyForCertificate:(__SecCertificate *)a3;
- (void)_revertFullSSLTrustIfNeeded;
- (void)dealloc;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewPlainCertificatePayloadHandler

- (id)userInputFields
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ([v2 dataEncoding] == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 password]);
    id v5 = [v4 length];

    if (!v5)
    {
      uint64_t v7 = MCLocalizedString(@"PASSWORD_PROMPT_TITLE", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
      uint64_t v10 = MCLocalizedFormat(@"IDENTITY_PASSWORD_PROMPT_DESCRIPTION");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:]( &OBJC_CLASS___MCNewPayloadHandler,  "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderVal ue:minimumLength:fieldType:flags:",  @"certificatePassword",  v8,  v11,  0LL,  0LL,  0LL,  0LL,  0LL,  3LL));
      [v3 addObject:v12];
    }
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v3;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCNewPlainCertificatePayloadHandler;
  -[MCNewPlainCertificatePayloadHandler dealloc](&v4, "dealloc");
}

- (__SecIdentity)_copyContentsOfPKCS12DataWithPasscode:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  CFArrayRef theArray = 0LL;
  if (v6)
  {
    CFStringRef v16 = kSecImportExportPassphrase;
    id v17 = v6;
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    if (SecPKCS12Import((CFDataRef)[v7 certificateData], v8, &theArray))
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
    }

    else
    {
      if (CFArrayGetCount(theArray) == 1)
      {
        uint64_t v10 = 0LL;
        goto LABEL_10;
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _tooManyCertificatesError](self, "_tooManyCertificatesError"));
    }

    uint64_t v10 = (void *)v9;
LABEL_10:

    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
  if (!a4) {
    goto LABEL_13;
  }
LABEL_11:
  if (v10)
  {
    v11 = 0LL;
    *a4 = v10;
    goto LABEL_17;
  }

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if ([v7 dataEncoding] == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 password]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v6,  @"certificatePassword",  v8));

    id v14 = 0LL;
    uint64_t v10 = -[MCNewPlainCertificatePayloadHandler _copyContentsOfPKCS12DataWithPasscode:outError:]( self,  "_copyContentsOfPKCS12DataWithPasscode:outError:",  v9,  &v14);
    id v11 = v14;
    if (v10) {
      CFRelease(v10);
    }

    BOOL v12 = v11 == 0LL;
    if (a4 && v11) {
      *a4 = v11;
    }
  }

  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)_storeCertificate:(__SecCertificate *)a3 allowSSLTrust:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v9 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
  uint64_t v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Storing certificate, storing with accessibility %@",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  uint64_t v12 = kMCAppleCertificatesKeychainGroup;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 profile]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  a3,  v11,  v12,  [v14 isInstalledForSystem],  v9));

  v57 = v8;
  if (!v15)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError]( self,  "_cannotStoreCertificateError"));
    goto LABEL_10;
  }

  CFStringRef v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v15,  v16);

  [v8 setCertificatePersistentID:v15];
  id v17 = a3;
  if (([v8 isFullyTrustedRootCert] & 1) == 0
    && SecCertificateIsSelfSignedCA(a3))
  {
    if (v6)
    {
      uint64_t v18 = SecTrustStoreForDomain(2LL);
      if (SecTrustStoreSetTrustSettings(v18, a3, 0LL))
      {
LABEL_8:
        v19 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewPlainCertificatePayloadHandler _cannotStoreRootCertificateError]( self,  "_cannotStoreRootCertificateError"));
LABEL_10:
        id v20 = v19;
        if (!v19) {
          goto LABEL_54;
        }
        if (a5)
        {
          id v20 = v19;
          id v21 = 0LL;
          *a5 = v20;
        }

        else
        {
          id v21 = 0LL;
        }

        goto LABEL_55;
      }
    }

    else if (-[MCNewPlainCertificatePayloadHandler _grantPartialNonSSLTrustPolicyForCertificate:]( self,  "_grantPartialNonSSLTrustPolicyForCertificate:",  a3))
    {
      goto LABEL_8;
    }
  }

  v22 = (void *)SecCertificateCopyRFC822Names(a3);
  if (!v22) {
    goto LABEL_54;
  }
  v55 = v15;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v23 = v22;
  id v24 = [v23 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (!v24) {
    goto LABEL_53;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v64;
  id v58 = v23;
  do
  {
    v27 = 0LL;
    do
    {
      if (*(void *)v64 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)v27);
      id v29 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:]( &OBJC_CLASS___MFMessageKeychainManager,  "copySMIMEEncryptionPolicyForAddress:",  v28);
      if (v29)
      {
        v30 = v29;
        SecTrustRef trust = 0LL;
        if (SecTrustCreateWithCertificates(v17, v29, &trust))
        {
          v31 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Cannot create certificate trust for S/MIME processing.",  buf,  2u);
          }

          goto LABEL_39;
        }

        if (SecTrustGetCertificateCount(trust) < 1) {
          goto LABEL_38;
        }
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, 0LL);
        uint64_t SHA1Digest = SecCertificateGetSHA1Digest(CertificateAtIndex);
        v35 = (void *)objc_claimAutoreleasedReturnValue(SHA1Digest);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 MCHexString]);
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"S/MIME: %@ - %@",  v28,  v36));

        v67[0] = kSecClass;
        v67[1] = kSecAttrGeneric;
        v68[1] = v35;
        v68[2] = @"com.apple.certui";
        v67[2] = kSecAttrService;
        v67[3] = kSecAttrAccount;
        v67[4] = kSecReturnData;
        v68[0] = kSecClassGenericPassword;
        v68[3] = v37;
        v68[4] = &__kCFBooleanTrue;
        v38 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  5LL));
        CFTypeRef result = 0LL;
        OSStatus v39 = SecItemCopyMatching(v38, &result);
        v40 = (void *)result;
        if (v39 == -25300) {
          goto LABEL_37;
        }
        OSStatus v41 = v39;
        if (v39)
        {
          os_log_t v48 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR)) {
            goto LABEL_37;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v71) = v41;
          v45 = v48;
          os_log_type_t v46 = OS_LOG_TYPE_ERROR;
          v47 = "Could not query keychain for existing S/MIME certificate. Status: %d";
LABEL_35:
          uint32_t v49 = 8;
        }

        else
        {
          SecTrustSetExceptions(trust, (CFDataRef)result);
          SecTrustResultType v60 = kSecTrustResultInvalid;
          SecTrustEvaluateWithError(trust, 0LL);
          OSStatus TrustResult = SecTrustGetTrustResult(trust, &v60);
          if (TrustResult)
          {
            OSStatus v43 = TrustResult;
            os_log_t v44 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v71) = v43;
              v45 = v44;
              os_log_type_t v46 = OS_LOG_TYPE_ERROR;
              v47 = "Could not evaluate S/MIME certificate trust. Status: %d";
              goto LABEL_35;
            }

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
  if ([v11 dataEncoding] != 1)
  {
    if ([v11 dataEncoding])
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
      id v20 = 0LL;
LABEL_16:
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v20,  v12);

      goto LABEL_17;
    }

    v34 = a6;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateData]);
    id v23 = +[MCCrypto copyCertificateRefFromPKCS1Data:](&OBJC_CLASS___MCCrypto, "copyCertificateRefFromPKCS1Data:", v22);

    if (v23
      || (id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 certificateData]),
          id v23 = +[MCCrypto copyCertificateRefFromPEMData:]( &OBJC_CLASS___MCCrypto,  "copyCertificateRefFromPEMData:",  v24),  v24,  v23))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);
      unsigned int v26 = [v25 BOOLValue];

      v27 = (void *)objc_claimAutoreleasedReturnValue([v11 profile]);
      unsigned int v28 = [v27 containsPayloadOfClass:objc_opt_class(MCMDMPayload)];

      if (v10) {
        int v29 = v26;
      }
      else {
        int v29 = 1;
      }
      id v35 = 0LL;
      id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MCNewPlainCertificatePayloadHandler _storeCertificate:allowSSLTrust:outError:]( self,  "_storeCertificate:allowSSLTrust:outError:",  v23,  v29 | v28,  &v35));
      id v14 = v35;
      CFRelease(v23);
      if (v20)
      {
        [v11 setCertificatePersistentID:v20];
        a6 = v34;
        goto LABEL_16;
      }

      uint64_t v31 = objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError](self, "_cannotStoreCertificateError"));

      id v14 = (id)v31;
    }

    else
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _malformedCertificateError](self, "_malformedCertificateError"));
    }

    a6 = v34;
    goto LABEL_17;
  }

  id v36 = 0LL;
  v13 = -[MCNewPlainCertificatePayloadHandler copyIdentityImmediatelyWithInteractionClient:outError:]( self,  "copyIdentityImmediatelyWithInteractionClient:outError:",  v10,  &v36);
  id v14 = v36;
  if (!v14)
  {
    id v32 = v9;
    v33 = a6;
    v15 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
    CFStringRef v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Storing identity, storing with accessibility %@",  buf,  0xCu);
    }

    uint64_t v17 = kMCAppleIdentitiesKeychainGroup;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 profile]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v13,  v12,  v17,  [v19 isInstalledForSystem],  -[MCNewCertificatePayloadHandler accessibility](self, "accessibility")));

    if (!v20)
    {
      CFRelease(v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue( -[MCNewPlainCertificatePayloadHandler _cannotStoreCertificateError]( self,  "_cannotStoreCertificateError"));
      id v9 = v32;
      a6 = v33;
      goto LABEL_17;
    }

    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:]( self,  "_touchDependencyBetweenPersistentID:andUUID:",  v20,  v12);
    [v11 setCertificatePersistentID:v20];
    *(void *)buf = 0LL;
    SecIdentityCopyCertificate(v13, (SecCertificateRef *)buf);
    id v21 = (__CFString *)SecCertificateCopySubjectSummary(*(SecCertificateRef *)buf);
    CFRelease(v13);
    CFRelease(*(CFTypeRef *)buf);
    [v11 setDisplayName:v21];

    id v14 = 0LL;
    id v9 = v32;
    a6 = v33;
    goto LABEL_16;
  }

- (void)setAside
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler setAside](&v3, "setAside");
}

- (void)unsetAside
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);
  if ([v4 shouldHaveFullSSLTrust] && objc_msgSend(v3, "isRoot"))
  {
    id v5 = [v3 copyCertificate];
    if (v5)
    {
      BOOL v6 = v5;
      uint64_t v7 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "On payload unset aside: restoring full SSL trust policy of root cert.",  buf,  2u);
      }

      uint64_t v8 = SecTrustStoreForDomain(2LL);
      int v9 = SecTrustStoreSetTrustSettings(v8, v6, 0LL);
      if (v9)
      {
        int v10 = v9;
        id v11 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v15 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to restore full SSL trust trust policy for certificate: %ld",  buf,  0xCu);
        }
      }

      CFRelease(v6);
    }
  }

  else
  {
    uint64_t v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Root cert was not installed with full trust from payload.",  buf,  2u);
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler unsetAside](&v13, "unsetAside");
}

- (void)remove
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCNewPlainCertificatePayloadHandler _revertFullSSLTrustIfNeeded](self, "_revertFullSSLTrustIfNeeded");
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCNewPlainCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler remove](&v5, "remove");
}

- (void)_revertFullSSLTrustIfNeeded
{
  v2 = self;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 profile]);
  if (![v4 shouldHaveFullSSLTrust])
  {
    BOOL v6 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO)) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v32 = "Root cert was not installed with full trust from payload.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v32, buf, 2u);
    goto LABEL_41;
  }

  unsigned int v5 = [v3 isFullyTrustedRootCert];
  BOOL v6 = _MCLogObjects[0];
  BOOL v7 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_41;
    }
    *(_WORD *)buf = 0;
    id v32 = "Root cert is not fully trusted root cert, skipping partial trust restore.";
    goto LABEL_32;
  }

  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Removing fully-trusted root cert payload.",  buf,  2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyManager sharedManager](&OBJC_CLASS___MCDependencyManager, "sharedManager"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 persistentResourceID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 dependentsOfParent:v10 inDomain:kMCDMCertificateToPayloadUUIDDependencyKey]);
  id v12 = [v11 mutableCopy];

  [v12 removeObject:v8];
  if ([v12 count])
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](&OBJC_CLASS___MCManifest, "sharedManifest"));
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allInstalledProfileIdentifiers]);
    id v45 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v45)
    {
      uint64_t v16 = *(void *)v51;
      v38 = v8;
      OSStatus v39 = v4;
      OSStatus v43 = v13;
      id v44 = v12;
      uint64_t v36 = *(void *)v51;
      v37 = v2;
      OSStatus v41 = v15;
      v42 = v14;
      do
      {
        for (i = 0LL; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v15);
          }
          uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v18, "isEqual:", v13, v36, v37) & 1) == 0)
          {
            v40 = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue([v14 installedProfileWithIdentifier:v18]);
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            id v20 = v12;
            id v21 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v47;
              while (2)
              {
                for (j = 0LL; j != v22; j = (char *)j + 1)
                {
                  if (*(void *)v47 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)j);
                  uint64_t v26 = objc_claimAutoreleasedReturnValue([v19 payloadWithUUID:v25]);
                  if (v26)
                  {
                    v27 = (void *)v26;
                    unsigned int v28 = [v19 shouldHaveFullSSLTrust];

                    if (v28)
                    {
                      v33 = _MCLogObjects[0];
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543618;
                        uint64_t v55 = v25;
                        __int16 v56 = 2114;
                        v57 = v40;
                        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Payload %{public}@ from profile %{public}@ has installed this root cert with full trust.",  buf,  0x16u);
                      }

                      v34 = _MCLogObjects[0];
                      uint64_t v8 = v38;
                      unsigned __int8 v4 = v39;
                      objc_super v13 = v43;
                      id v12 = v44;
                      id v14 = v42;
                      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Root cert was installed with full trust, but other certs may have a full-trust dependency. Ski pping restore of partial trust.",  buf,  2u);
                      }

                      goto LABEL_37;
                    }
                  }
                }

                id v22 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }

            objc_super v13 = v43;
            id v12 = v44;
            uint64_t v16 = v36;
            v2 = v37;
            uint64_t v15 = v41;
            id v14 = v42;
          }
        }

        uint64_t v8 = v38;
        unsigned __int8 v4 = v39;
        id v45 = [v15 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }

      while (v45);
    }

    int v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Root cert was installed with full trust, and no other certs have a full-trust dependency. Attempting to restore partial trust.",  buf,  2u);
    }

    id v30 = [v3 copyCertificate];
    if (v30)
    {
      uint64_t v31 = v30;
      -[MCNewPlainCertificatePayloadHandler _grantPartialNonSSLTrustPolicyForCertificate:]( v2,  "_grantPartialNonSSLTrustPolicyForCertificate:",  v30);
      CFRelease(v31);
    }

- (int)_grantPartialNonSSLTrustPolicyForCertificate:(__SecCertificate *)a3
{
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, 0LL);
  unsigned int v5 = _MCLogObjects[0];
  if (SSL)
  {
    SecPolicyRef v6 = SSL;
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Setting partial trust policy for root cert.",  (uint8_t *)&v14,  2u);
    }

    v18[0] = @"kSecTrustSettingsPolicy";
    v18[1] = @"kSecTrustSettingsResult";
    v19[0] = v6;
    v19[1] = &off_1000CBF80;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
    v20[0] = v7;
    uint64_t v16 = @"kSecTrustSettingsResult";
    uint64_t v17 = &off_1000CBF98;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    v20[1] = v8;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));

    uint64_t v10 = SecTrustStoreForDomain(2LL);
    int v11 = SecTrustStoreSetTrustSettings(v10, a3, v9);
    if (v11)
    {
      id v12 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        int v14 = 134217984;
        uint64_t v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Failed to set partial trust policy for certificate: %ld",  (uint8_t *)&v14,  0xCu);
      }
    }

    CFRelease(v6);
  }

  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to create partial trust policy for certificate.",  (uint8_t *)&v14,  2u);
    }

    int v11 = -50;
  }

  CFRelease(a3);
  return v11;
}

- (id)_invalidPasscodeError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_WRONG_PASSWORD_P_FILE");
  SecPolicyRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9000LL,  v6,  MCErrorTypeNeedsRetry,  v4,  0LL));

  return v7;
}

- (id)_tooManyCertificatesError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_TOO_MANY_CERTIFICATES_P_FILE");
  SecPolicyRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9001LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_cannotStoreCertificateError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE_P_FILE");
  SecPolicyRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9002LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_cannotStoreRootCertificateError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE_ROOT_P_FILE");
  SecPolicyRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9004LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_malformedCertificateError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 certificateFileName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_MALFORMED_P_FILE");
  SecPolicyRef v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9005LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  identity = self->_identity;
  if (!identity)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3));
    if ([v8 dataEncoding] == 1)
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 password]);
      int v11 = (void *)objc_claimAutoreleasedReturnValue( +[MCNewPayloadHandler prioritizeUserInput:key:overField:]( &OBJC_CLASS___MCNewPayloadHandler,  "prioritizeUserInput:key:overField:",  v9,  @"certificatePassword",  v10));

      if (v11)
      {
        id v23 = 0LL;
        id v12 = -[MCNewPlainCertificatePayloadHandler _copyContentsOfPKCS12DataWithPasscode:outError:]( self,  "_copyContentsOfPKCS12DataWithPasscode:outError:",  v11,  &v23);
        id v13 = v23;
        self->_identity = v12;
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPlainCertificatePayloadHandler _invalidPasscodeError](self, "_invalidPasscodeError"));
      }

      if (!v13)
      {
LABEL_13:
        id v21 = self->_identity;
        if (v21)
        {
          CFRetain(v21);
          SecPolicyRef v6 = self->_identity;
LABEL_16:

          return v6;
        }

@end