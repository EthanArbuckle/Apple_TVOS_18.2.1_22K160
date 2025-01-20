@interface AcmeCertRequest
- (AcmeCertRequest)initWithSubject:(id)a3 parameters:(id)a4;
- (BOOL)deviceAttestationSupported;
- (BOOL)logAcmeCSR;
- (BOOL)permitLocalIssuer;
- (BOOL)requireAttestation;
- (BOOL)valueForBooleanDefault:(id)a3;
- (NSArray)attestationCRChain;
- (NSArray)attestationChain;
- (NSArray)attestationOids;
- (NSArray)authorizations;
- (NSArray)subject;
- (NSData)attestation;
- (NSData)csr;
- (NSDictionary)keyParams;
- (NSDictionary)parameters;
- (NSString)account;
- (NSString)acmeNewAccountURL;
- (NSString)acmeNewNonceURL;
- (NSString)acmeNewOrderURL;
- (NSString)authorizationURL;
- (NSString)certificateURL;
- (NSString)challengeURL;
- (NSString)finalizeOrderURL;
- (NSString)location;
- (NSString)nextMessageURL;
- (NSString)nonce;
- (NSString)orderURL;
- (NSString)timestamp;
- (NSString)token;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpc_queue;
- (OS_xpc_object)connection;
- (SecJWSEncoder)encoder;
- (__SecCertificate)certificate;
- (__SecIdentity)identity;
- (__SecIdentity)identityWithError:(id *)a3;
- (__SecKey)attestationCRKey;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (id)acmeRequest;
- (id)attestationChainPEMRepresentation;
- (id)attestationObjectWithCertificates:(id)a3;
- (id)createCSR;
- (id)createCertificate;
- (id)createKeyPair;
- (id)executeRequest;
- (id)hardwareAttestationWithError:(id *)a3;
- (id)pollForStatus:(id)a3 until:(id)a4;
- (id)processReply:(id)a3;
- (id)requestAttestationChainWithError:(id *)a3;
- (id)sanitizeParameters;
- (id)sanitizeSubject;
- (id)sendRequestToXPCService:(id)a3 response:(id *)a4;
- (id)serialNumber;
- (int)errorStatusWithHTTPErrorCode:(int)a3;
- (int64_t)state;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setAcmeNewAccountURL:(id)a3;
- (void)setAcmeNewNonceURL:(id)a3;
- (void)setAcmeNewOrderURL:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setAttestationCRChain:(id)a3;
- (void)setAttestationCRKey:(__SecKey *)a3;
- (void)setAttestationChain:(id)a3;
- (void)setAttestationOids:(id)a3;
- (void)setAuthorizationURL:(id)a3;
- (void)setAuthorizations:(id)a3;
- (void)setCertificate:(__SecCertificate *)a3;
- (void)setCertificateURL:(id)a3;
- (void)setChallengeURL:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCsr:(id)a3;
- (void)setEncoder:(id)a3;
- (void)setFinalizeOrderURL:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setKeyParams:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLogAcmeCSR:(BOOL)a3;
- (void)setNextMessageURL:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOrderURL:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPermitLocalIssuer:(BOOL)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
- (void)setQueue:(id)a3;
- (void)setRequireAttestation:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSubject:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToken:(id)a3;
- (void)setXpc_queue:(id)a3;
@end

@implementation AcmeCertRequest

- (AcmeCertRequest)initWithSubject:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AcmeCertRequest;
  v8 = -[AcmeCertRequest init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[AcmeCertRequest setSubject:](v8, "setSubject:", v6);
    -[AcmeCertRequest setParameters:](v9, "setParameters:", v7);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.certrequest", 0LL);
    -[AcmeCertRequest setQueue:](v9, "setQueue:", v10);
  }

  return v9;
}

- (void)dealloc
{
  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0LL;
    CFRelease(privateKey);
  }

  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0LL;
    CFRelease(publicKey);
  }

  certificate = self->_certificate;
  if (certificate)
  {
    self->_certificate = 0LL;
    CFRelease(certificate);
  }

  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0LL;
    CFRelease(identity);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AcmeCertRequest;
  -[AcmeCertRequest dealloc](&v7, sel_dealloc);
}

- (id)serialNumber
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0LL;
  v9[0] = bswap64(dispatch_time(0LL, 0LL));
  uint64_t v3 = 8LL;
  while (!*((_BYTE *)v9 + v2))
  {
    ++v2;
    if (!--v3)
    {
      uint64_t v2 = 8LL;
      break;
    }
  }

  [MEMORY[0x189603FB8] dataWithCapacity:0];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  id v6 = (char *)v9 + v2;
  if (*v6 < 0)
  {
    char v8 = 0;
    [v4 appendBytes:&v8 length:1];
  }

  [v5 appendBytes:v6 length:v3];
  return v5;
}

- (id)sanitizeSubject
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  dispatch_queue_t v10 = __Block_byref_object_copy__13053;
  v11 = __Block_byref_object_dispose__13054;
  id v12 = 0LL;
  -[AcmeCertRequest queue](self, "queue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__AcmeCertRequest_sanitizeSubject__block_invoke;
  v6[3] = &unk_1896764A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)sanitizeParameters
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = __Block_byref_object_copy__13053;
  v14 = __Block_byref_object_dispose__13054;
  id v15 = 0LL;
  -[AcmeCertRequest queue](self, "queue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  void v9[2] = __37__AcmeCertRequest_sanitizeParameters__block_invoke;
  v9[3] = &unk_1896764A8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  id v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = -[AcmeCertRequest sanitizeSubject](self, "sanitizeSubject");
    id v6 = (void *)v11[5];
    v11[5] = v5;

    id v4 = (void *)v11[5];
  }

  id v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)createKeyPair
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  -[AcmeCertRequest queue](self, "queue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32__AcmeCertRequest_createKeyPair__block_invoke;
  v6[3] = &unk_1896764A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)createCSR
{
  uint64_t v7 = 0LL;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__13053;
  v11 = __Block_byref_object_dispose__13054;
  id v12 = 0LL;
  -[AcmeCertRequest queue](self, "queue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __28__AcmeCertRequest_createCSR__block_invoke;
  v6[3] = &unk_1896764A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)deviceAttestationSupported
{
  if (deviceAttestationSupported_onceToken != -1) {
    dispatch_once(&deviceAttestationSupported_onceToken, &__block_literal_global_13067);
  }
  return deviceAttestationSupported_appAttestSupported;
}

- (id)requestAttestationChainWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = __Block_byref_object_copy__13053;
  v52 = __Block_byref_object_dispose__13054;
  id v53 = 0LL;
  if (!-[AcmeCertRequest deviceAttestationSupported](self, "deviceAttestationSupported"))
  {
    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-67849 userInfo:0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v26 = (id)v49[5];
    goto LABEL_58;
  }

  CFAbsoluteTimeGetCurrent();
  if (requestAttestationChainWithError__onceToken != -1) {
    dispatch_once(&requestAttestationChainWithError__onceToken, &__block_literal_global_108);
  }
  -[NSString dataUsingEncoding:](self->_token, "dataUsingEncoding:", 4LL);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionaryWithCapacity:4];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:&unk_18969C1B0 forKeyedSubscript:@"Validity"];
  [v4 setObject:self->_attestationOids forKeyedSubscript:@"OIDSToInclude"];
  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"UseXPC"];
  v37 = v4;
  if (v36)
  {
    __int128 md = 0u;
    __int128 v57 = 0u;
    id v5 = v36;
    CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), (unsigned __int8 *)&md);
    [MEMORY[0x189603F48] dataWithBytes:&md length:32];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 setObject:v6 forKeyedSubscript:@"nonce"];
  }

  attestation = self->_attestation;
  if (attestation) {
    [v37 setObject:attestation forKeyedSubscript:@"ClientAttestationData"];
  }
  attestationCRKey = self->_attestationCRKey;
  if (!attestationCRKey) {
    goto LABEL_13;
  }
  uint64_t v9 = SecKeyCopyPublicKey(attestationCRKey);
  uint64_t v10 = v9;
  if (!v9)
  {
    secLogObjForScope("SecError");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(md) = 0;
      _os_log_impl( &dword_1804F4000,  v27,  OS_LOG_TYPE_DEFAULT,  "Failed to obtain public key for attestation key, skipping attestation",  (uint8_t *)&md,  2u);
    }

    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-67811 userInfo:0];
      id v26 = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }

    goto LABEL_56;
  }

  *(void *)&__int128 md = 0LL;
  CFDataRef v11 = SecKeyCopyExternalRepresentation(v9, (CFErrorRef *)&md);
  CFRelease(v10);
  if ((void)md || !v11)
  {
    secLogObjForScope("SecError");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1804F4000,  v30,  OS_LOG_TYPE_DEFAULT,  "Failed to copy public key data for co-residency, skipping attestation",  buf,  2u);
    }

    v31 = (const void *)md;
    if (a3)
    {
      *a3 = (id)md;
    }

    else if ((void)md)
    {
      *(void *)&__int128 md = 0LL;
      CFRelease(v31);
    }

LABEL_56:
    id v26 = 0LL;
    goto LABEL_57;
  }

  [v37 setObject:v11 forKeyedSubscript:@"ClientAttestationPublicKey"];

LABEL_13:
  if (self->_attestationCRChain)
  {
    [MEMORY[0x189603FB8] data];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    v13 = self->_attestationCRChain;
    uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v44,  v60,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v13);
          }
          CFDataRef v17 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v44 + 1) + 8 * i));
          [v12 appendData:v17];
        }

        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v44,  v60,  16LL);
      }

      while (v14);
    }

    [v37 setObject:v12 forKeyedSubscript:@"ClientDirectAttestationCertificate"];
  }

  v39 = (void *)[v37 copy];
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  *(void *)&__int128 md = 0LL;
  *((void *)&md + 1) = &md;
  *(void *)&__int128 v57 = 0x3032000000LL;
  int v19 = 2;
  *((void *)&v57 + 1) = __Block_byref_object_copy__13053;
  v58 = __Block_byref_object_dispose__13054;
  id v59 = 0LL;
  uint64_t v20 = MEMORY[0x1895F87A8];
  do
  {
    v21 = (void (*)(__SecKey *, void *, void *))requestAttestationChainWithError__soft_AppAttest_DeviceAttestation_AttestKey;
    privateKey = self->_privateKey;
    v40[0] = v20;
    v40[1] = 3221225472LL;
    v40[2] = __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_112;
    v40[3] = &unk_1896765D0;
    p___int128 md = &md;
    v43 = &v48;
    v23 = v18;
    v41 = v23;
    v21(privateKey, v39, v40);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    if (v49[5])
    {
      secLogObjForScope("acme");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_48:

        v25 = (os_log_s *)v41;
        goto LABEL_49;
      }

      *(_WORD *)buf = 0;
      v29 = "Successfully retrieved attestation certificate";
LABEL_47:
      _os_log_impl(&dword_1804F4000, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
      goto LABEL_48;
    }

    if ([*(id *)(*((void *)&md + 1) + 40) code] != -67671)
    {
      secLogObjForScope("acme");
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [*(id *)(*((void *)&md + 1) + 40) code];
        *(_DWORD *)buf = 134217984;
        uint64_t v55 = v33;
        _os_log_impl( &dword_1804F4000,  v32,  OS_LOG_TYPE_DEFAULT,  "Attempt to fetch attestation certificate failed (error %lld)",  buf,  0xCu);
      }

      secLogObjForScope("SecError");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      *(_WORD *)buf = 0;
      v29 = "Failed to fetch attestation certificate, not retrying";
      goto LABEL_47;
    }

    secLogObjForScope("SecError");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = v19;
      _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "Failed to fetch attestation certificate, %u retries left",  buf,  8u);
    }

    --v19;
  }

  while (v19 != -1);
  secLogObjForScope("SecError");
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "Out of retries retrieving attestation certificate",  buf,  2u);
  }

- (id)attestationObjectWithCertificates:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x186DFF9D0]();
  id v6 = objc_alloc_init(&OBJC_CLASS___SecCBORArray);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count] == 2 && objc_msgSend(v4, "count"))
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:v7];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          break;
        }
        CFTypeID v10 = CFGetTypeID(v9);
        if (v10 != SecCertificateGetTypeID()) {
          goto LABEL_10;
        }
        CFDataRef v11 = SecCertificateCopyData((SecCertificateRef)v9);

        uint64_t v9 = v11;
        if (v11) {
          break;
        }
      }

- (id)hardwareAttestationWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v22 = 0LL;
  attestation = self->_attestation;
  if (attestation)
  {
    self->_attestation = 0LL;
  }

  attestationCRKey = self->_attestationCRKey;
  if (attestationCRKey && (privateKey = self->_privateKey) != 0LL)
  {
    SecKeyCreateAttestation((uint64_t)attestationCRKey, (uint64_t)privateKey, (__CFString **)&v22);
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_attestation;
    self->_attestation = v8;

    id v10 = v22;
    BOOL v11 = v22 != 0LL;
  }

  else
  {
    secLogObjForScope("SecError");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_attestationCRKey) {
        v13 = @"_privateKey";
      }
      else {
        v13 = @"_attestationCRKey";
      }
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEFAULT, "missing %@ for attestation", buf, 0xCu);
    }

    id v14 = -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", @"acmeLocalIssuer");
    BOOL v11 = 0;
    id v10 = 0LL;
    if (!self->_permitLocalIssuer && v14)
    {
      CFTypeID v15 = CFGetTypeID(v14);
      if (v15 == CFBooleanGetTypeID() && *MEMORY[0x189604DE8]) {
        CFEqual(v14, (CFTypeRef)*MEMORY[0x189604DE8]);
      }
      id v10 = 0LL;
      BOOL v11 = 0;
    }
  }

  if (!self->_attestation && !v11)
  {
    [NSString stringWithFormat:@"failed to create attestation"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataRef v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *MEMORY[0x189607670];
    uint64_t v23 = *MEMORY[0x1896075E0];
    v24 = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:v18 code:-50 userInfo:v19];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    id v22 = v20;
    id v10 = v22;
  }

  if (a3)
  {
    *a3 = v10;
  }

  else if (v10)
  {
    id v22 = 0LL;
    CFRelease(v10);
  }

  return self->_attestation;
}

- (id)createCertificate
{
  v12[1] = *MEMORY[0x1895F89C0];
  SelfSignedCertificateWithError = (__SecCertificate *)SecGenerateSelfSignedCertificateWithError( (const __CFArray *)self->_subject,  (const __CFDictionary *)self->_parameters,  v2,  self->_privateKey,  0LL);
  id v5 = 0LL;
  self->_certificate = SelfSignedCertificateWithError;
  if (!SelfSignedCertificateWithError)
  {
    [NSString stringWithFormat:@"failed to create certificate (bad input values)"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x189607670];
    uint64_t v11 = *MEMORY[0x1896075E0];
    v12[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:v8 code:-67838 userInfo:v9];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)attestationChainPEMRepresentation
{
  if (self->_attestationChain)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
    NSUInteger v4 = -[NSArray count](self->_attestationChain, "count");
    if (v4)
    {
      NSUInteger v5 = v4;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        id v7 = -[NSArray objectAtIndex:](self->_attestationChain, "objectAtIndex:", i);
        if (v7)
        {
          CFStringRef v8 = SecCertificateCopyPEMRepresentation((uint64_t)v7);
          if (v8)
          {
            CFStringRef v9 = v8;
            [v3 appendString:v8];
            CFRelease(v9);
          }
        }
      }
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (int)errorStatusWithHTTPErrorCode:(int)a3
{
  if (a3 > 399)
  {
    if (((1 << (a3 + 112)) & 0x2021A) == 0)
    {
      if (a3 == 400) {
        return -67847;
      }
LABEL_11:
      return a3;
    }

    return -67585;
  }

  int result = 0;
  if ((a3 - 200) >= 2 && a3 != 100)
  {
    if (a3 != 204) {
      return a3;
    }
    return -67585;
  }

  return result;
}

- (id)sendRequestToXPCService:(id)a3 response:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke;
  block[3] = &unk_189676638;
  block[4] = self;
  id v7 = a3;
  dispatch_sync((dispatch_queue_t)queue, block);
  int64_t state = self->_state;
  CFStringRef v9 = "POST";
  if (state == 1) {
    CFStringRef v9 = "GET";
  }
  if (state == 2) {
    id v10 = "HEAD";
  }
  else {
    id v10 = v9;
  }
  xpc_object_t v11 = xpc_string_create(v10);
  id v12 = -[NSString UTF8String](self->_nextMessageURL, "UTF8String");
  if (!v12) {
    id v12 = (const char *)&unk_18065A197;
  }
  xpc_object_t v13 = xpc_string_create(v12);
  int64_t v14 = self->_state;
  id v15 = v7;
  v16 = (const void *)[v15 bytes];
  size_t v17 = [v15 length];

  xpc_object_t v18 = xpc_data_create(v16, v17);
  xpc_object_t v50 = v11;
  xpc_object_t v51 = v18;
  int64_t v48 = v14;
  xpc_object_t v49 = v13;
  xpc_create_with_format();
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(self->_connection, v19);
  uint64_t v24 = MEMORY[0x186E0087C](v20, v21, v22, v23);
  if (v24 == MEMORY[0x1895F9268])
  {
    secLogObjForScope("SecError");
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      string = xpc_dictionary_get_string(v20, (const char *)*MEMORY[0x1895F91B0]);
      *(_DWORD *)buf = 136315138;
      v63 = string;
      uint64_t v27 = "message error: %s";
      goto LABEL_15;
    }

- (id)pollForStatus:(id)a3 until:(id)a4
{
  NSUInteger v4 = dispatch_semaphore_create(0LL);
  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  dispatch_semaphore_wait(v4, v5);

  return 0LL;
}

- (id)acmeRequest
{
  v64[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_state)
  {
    case 3LL:
      if (!self->_encoder)
      {
        id v15 = objc_alloc_init(&OBJC_CLASS___SecJWSEncoder);
        encoder = self->_encoder;
        self->_encoder = v15;
      }

      [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"termsOfServiceAgreed"];
      size_t v17 = self->_encoder;
      nonce = self->_nonce;
      acmeNewAccountURL = self->_acmeNewAccountURL;
      id v59 = 0LL;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:]( v17,  "encodedJWSWithPayload:kid:nonce:url:error:",  v3,  0LL,  nonce,  acmeNewAccountURL,  &v59);
      CFStringRef v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef v9 = v59;
      goto LABEL_13;
    case 4LL:
      uint64_t v20 = -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", @"clientIdentifier");
      if (v20) {
        uint64_t v21 = (__CFString *)v20;
      }
      else {
        uint64_t v21 = @"TEST";
      }
      v62[0] = @"type";
      v62[1] = @"value";
      v63[0] = @"permanent-identifier";
      v63[1] = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:v63 forKeys:v62 count:2];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v22;
      [MEMORY[0x189603F18] arrayWithObjects:v64 count:1];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v23 forKeyedSubscript:@"identifiers"];

      uint64_t v24 = self->_encoder;
      account = self->_account;
      id v26 = self->_nonce;
      nextMessageURL = self->_nextMessageURL;
      id v58 = 0LL;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:]( v24,  "encodedJWSWithPayload:kid:nonce:url:error:",  v3,  account,  v26,  nextMessageURL,  &v58);
      CFStringRef v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v28 = v58;

      goto LABEL_14;
    case 5LL:
      v29 = self->_encoder;
      v30 = self->_account;
      id v31 = self->_nonce;
      v32 = self->_nextMessageURL;
      xpc_object_t v57 = 0LL;
      -[SecJWSEncoder encodedJWSWithPayload:kid:nonce:url:error:]( v29,  "encodedJWSWithPayload:kid:nonce:url:error:",  0LL,  v30,  v31,  v32,  &v57);
      CFStringRef v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef v9 = v57;
      goto LABEL_13;
    case 6LL:
      if (!self->_attestationOids)
      {
        id v36 = 0LL;
        goto LABEL_35;
      }

      if (!self->_attestationCRKey
        || (id v56 = 0LL,
            -[AcmeCertRequest hardwareAttestationWithError:](self, "hardwareAttestationWithError:", &v56),
            v35 = (NSData *)objc_claimAutoreleasedReturnValue(),
            id v36 = v56,
            attestation = self->_attestation,
            self->_attestation = v35,
            attestation,
            !v36))
      {
        id v55 = 0LL;
        -[AcmeCertRequest requestAttestationChainWithError:](self, "requestAttestationChainWithError:", &v55);
        v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
        id v36 = v55;
        attestationChain = self->_attestationChain;
        self->_attestationChain = v38;

        if (!v36)
        {
          secLogObjForScope("acme");
          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            NSUInteger v45 = -[NSArray count](self->_attestationChain, "count");
            *(_DWORD *)buf = 134217984;
            NSUInteger v61 = v45;
            _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "attestation request succeeded; got %llu certificates",
              buf,
              0xCu);
          }

          goto LABEL_31;
        }
      }

      secLogObjForScope("acme");
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        NSUInteger v61 = (NSUInteger)v36;
        _os_log_impl(&dword_1804F4000, v40, OS_LOG_TYPE_DEFAULT, "attestation request failed with error %@", buf, 0xCu);
      }

      [v36 localizedDescription];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v41 forKeyedSubscript:@"error"];

      BOOL requireAttestation = self->_requireAttestation;
      secLogObjForScope("acme");
      uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if (!requireAttestation)
      {
        if (v44)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "attestation not explicitly required, ignoring error",  buf,  2u);
        }

        uint64_t v43 = (os_log_s *)v36;
LABEL_31:
        id v36 = 0LL;
        goto LABEL_32;
      }

      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "attestation explicitly required, cannot continue with ACME",  buf,  2u);
      }

- (id)processReply:(id)a3
{
  v110[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_time_t v5 = v4;
  id v6 = 0LL;
  id v7 = 0LL;
  switch(self->_state)
  {
    case 1LL:
      [v4 objectForKey:@"newAccount"];
      CFStringRef v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewAccountURL = self->_acmeNewAccountURL;
      self->_acmeNewAccountURL = v8;

      [v5 objectForKey:@"newNonce"];
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewNonceURL = self->_acmeNewNonceURL;
      self->_acmeNewNonceURL = v10;

      [v5 objectForKey:@"newOrder"];
      id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      acmeNewOrderURL = self->_acmeNewOrderURL;
      self->_acmeNewOrderURL = v12;

      if (self->_acmeNewAccountURL)
      {
        int64_t v14 = self->_acmeNewNonceURL;
        if (v14)
        {
          if (self->_acmeNewOrderURL)
          {
            objc_storeStrong((id *)&self->_nextMessageURL, v14);
            id v6 = 0LL;
            id v7 = 0LL;
            int64_t v15 = 2LL;
            goto LABEL_9;
          }
        }
      }

      uint64_t v64 = (void *)MEMORY[0x189607870];
      uint64_t v65 = *MEMORY[0x189607670];
      id v6 = @"failed to get directory info";
      uint64_t v109 = *MEMORY[0x1896075E0];
      v110[0] = @"failed to get directory info";
      [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:&v109 count:1];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = -67683LL;
      id v19 = v64;
      uint64_t v20 = v65;
      goto LABEL_48;
    case 2LL:
      [v4 objectForKey:@"Replay-Nonce"];
      uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      nonce = self->_nonce;
      self->_nonce = v22;

      if (self->_nonce)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewAccountURL);
        id v6 = 0LL;
        id v7 = 0LL;
        int64_t v15 = 3LL;
LABEL_9:
        self->_int64_t state = v15;
        goto LABEL_66;
      }

      v72 = (void *)MEMORY[0x189607870];
      uint64_t v73 = *MEMORY[0x189607670];
      id v6 = @"failed to get initial nonce";
      uint64_t v107 = *MEMORY[0x1896075E0];
      v108 = @"failed to get initial nonce";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v72;
      uint64_t v20 = v73;
      uint64_t v21 = -67673LL;
LABEL_48:
      [v19 errorWithDomain:v20 code:v21 userInfo:v18];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    case 3LL:
      [v4 objectForKey:@"orders"];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 objectForKey:@"status"];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      int v25 = [v24 isEqualToString:@"valid"];
      objc_storeStrong((id *)&self->_account, self->_location);
      if (v25 && v18)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewOrderURL);
        id v6 = 0LL;
        id v7 = 0LL;
        self->_int64_t state = 4LL;
      }

      else
      {
        v66 = (void *)MEMORY[0x189607870];
        uint64_t v67 = *MEMORY[0x189607670];
        uint64_t v105 = *MEMORY[0x1896075E0];
        id v6 = @"failed to establish account";
        v106 = @"failed to establish account";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        [v66 errorWithDomain:v67 code:-67673 userInfo:v68];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_65;
    case 4LL:
      [v4 objectForKey:@"status"];
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      char v87 = [v89 isEqualToString:@"pending"];
      [v5 objectForKey:@"authorizations"];
      id v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
      authorizations = self->_authorizations;
      self->_authorizations = v26;

      -[NSArray objectAtIndex:](self->_authorizations, "objectAtIndex:", 0LL);
      id v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      authorizationURL = self->_authorizationURL;
      self->_authorizationURL = v28;

      [v5 objectForKey:@"finalize"];
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      finalizeOrderURL = self->_finalizeOrderURL;
      self->_finalizeOrderURL = v30;

      objc_storeStrong((id *)&self->_orderURL, self->_location);
      [v5 objectForKey:@"identifiers"];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = [v32 count];
      if (v33)
      {
        unint64_t v34 = v33;
        BOOL v35 = 0;
        for (unint64_t i = 0LL; i != v34; v35 = i >= v34)
        {
          [v32 objectAtIndex:i];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          [v37 objectForKey:@"type"];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          int v39 = [v38 isEqualToString:@"permanent-identifier"];

          if (v39) {
            break;
          }
          ++i;
        }
      }

      else
      {
        BOOL v35 = 1;
      }

      v74 = self->_authorizationURL;
      if (v74 && !v35 && self->_finalizeOrderURL != 0LL && (v87 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, v74);
        id v6 = 0LL;
        id v7 = 0LL;
        self->_int64_t state = 5LL;
      }

      else
      {
        if (v35) {
          id v6 = @"'permanent-identifier' type not supported by this server";
        }
        else {
          id v6 = @"failed to submit order";
        }
        v75 = (void *)MEMORY[0x189607870];
        uint64_t v76 = *MEMORY[0x189607670];
        uint64_t v103 = *MEMORY[0x1896075E0];
        v104 = v6;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        [v75 errorWithDomain:v76 code:-67673 userInfo:v77];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_66;
    case 5LL:
      [v4 objectForKey:@"status"];
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      char v88 = [v90 isEqualToString:@"pending"];
      [v5 objectForKey:@"challenges"];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v40 count];
      if (!v41) {
        goto LABEL_68;
      }
      uint64_t v42 = v41;
      uint64_t v43 = 0LL;
      break;
    case 6LL:
      [v4 objectForKey:@"status"];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v18 isEqualToString:@"invalid"])
      {
        xpc_object_t v50 = (void *)MEMORY[0x189607870];
        uint64_t v51 = *MEMORY[0x189607670];
        id v6 = @"failed to successfully respond to challenge";
        uint64_t v99 = *MEMORY[0x1896075E0];
        v100 = @"failed to successfully respond to challenge";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        [v50 errorWithDomain:v51 code:-67673 userInfo:v52];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          goto LABEL_65;
        }
      }

      else if ([v18 isEqualToString:@"valid"])
      {
        id v6 = 0LL;
      }

      else
      {
        -[AcmeCertRequest pollForStatus:until:](self, "pollForStatus:until:", self->_orderURL, @"ready");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        id v6 = 0LL;
        if (v7) {
          goto LABEL_65;
        }
      }

      objc_storeStrong((id *)&self->_nextMessageURL, self->_finalizeOrderURL);
      id v7 = 0LL;
      int64_t v63 = 7LL;
      goto LABEL_64;
    case 7LL:
      [v4 objectForKey:@"status"];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v18 isEqualToString:@"invalid"])
      {
        id v53 = (void *)MEMORY[0x189607870];
        uint64_t v54 = *MEMORY[0x189607670];
        id v6 = @"failed to finalize order";
        uint64_t v97 = *MEMORY[0x1896075E0];
        v98 = @"failed to finalize order";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        id v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v53 errorWithDomain:v54 code:-67673 userInfo:v55];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          goto LABEL_65;
        }
      }

      else if ([v18 isEqualToString:@"valid"])
      {
        id v6 = 0LL;
      }

      else
      {
        -[AcmeCertRequest pollForStatus:until:](self, "pollForStatus:until:", self->_orderURL, @"valid");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        id v6 = 0LL;
        if (v7) {
          goto LABEL_65;
        }
      }

      objc_storeStrong((id *)&self->_nextMessageURL, self->_orderURL);
      id v7 = 0LL;
      int64_t v63 = 8LL;
      goto LABEL_64;
    case 8LL:
      [v4 objectForKey:@"certificate"];
      id v56 = (NSString *)objc_claimAutoreleasedReturnValue();
      certificateURL = self->_certificateURL;
      self->_certificateURL = v56;

      [v5 objectForKey:@"status"];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      char v58 = [v18 isEqualToString:@"valid"];
      id v59 = self->_certificateURL;
      if (v59 && (v58 & 1) != 0)
      {
        id v6 = 0LL;
      }

      else
      {
        [NSString stringWithFormat:@"order status is \"%@\", not yet \"valid\"", v18];
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x189607870];
        uint64_t v70 = *MEMORY[0x189607670];
        uint64_t v95 = *MEMORY[0x1896075E0];
        v96 = v6;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        [v69 errorWithDomain:v70 code:-67673 userInfo:v71];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          goto LABEL_65;
        }
        id v59 = self->_certificateURL;
      }

      objc_storeStrong((id *)&self->_nextMessageURL, v59);
      id v7 = 0LL;
      int64_t v63 = 9LL;
      goto LABEL_64;
    case 9LL:
      [v4 objectForKey:@"certificate"];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"Got certificate: %@", v18);
      NSUInteger v61 = (__SecCertificate *)SecCertificateCreateWithPEM(v60, (CFDataRef)v18);
      self->_certificate = v61;
      if (v61)
      {
        id v6 = 0LL;
      }

      else
      {
        v78 = (void *)MEMORY[0x189607870];
        uint64_t v79 = *MEMORY[0x189607670];
        id v6 = @"failed to obtain certificate";
        uint64_t v93 = *MEMORY[0x1896075E0];
        v94 = @"failed to obtain certificate";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        [v78 errorWithDomain:v79 code:-67673 userInfo:v80];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7) {
          goto LABEL_65;
        }
      }

      nextMessageURL = self->_nextMessageURL;
      self->_nextMessageURL = 0LL;

      id v7 = 0LL;
      int64_t v63 = 10LL;
LABEL_64:
      self->_int64_t state = v63;
LABEL_65:

      goto LABEL_66;
    case 0xALL:
      goto LABEL_66;
    default:
      v16 = (void *)MEMORY[0x189607870];
      uint64_t v17 = *MEMORY[0x189607670];
      id v6 = @"unknown or uninitialized ACME state";
      uint64_t v91 = *MEMORY[0x1896075E0];
      v92 = @"unknown or uninitialized ACME state";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      xpc_object_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v19 = v16;
      uint64_t v20 = v17;
      uint64_t v21 = -909LL;
      goto LABEL_48;
  }

  while (1)
  {
    [v40 objectAtIndex:v43];
    BOOL v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 objectForKey:@"type"];
    NSUInteger v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 objectForKey:@"url"];
    __int128 v46 = (NSString *)objc_claimAutoreleasedReturnValue();
    challengeURL = self->_challengeURL;
    self->_challengeURL = v46;

    [v44 objectForKey:@"token"];
    int64_t v48 = (NSString *)objc_claimAutoreleasedReturnValue();
    token = self->_token;
    self->_token = v48;

    if ([v45 isEqualToString:@"device-attest-01"])
    {
      if (self->_challengeURL && self->_token) {
        break;
      }
    }

    if (v42 == ++v43) {
      goto LABEL_68;
    }
  }

LABEL_68:
  v82 = self->_challengeURL;
  if (!v82) {
    goto LABEL_73;
  }
  char v83 = v88;
  if (!self->_token) {
    char v83 = 0;
  }
  if ((v83 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_nextMessageURL, v82);
    id v6 = 0LL;
    id v7 = 0LL;
    self->_int64_t state = 6LL;
  }

  else
  {
LABEL_73:
    v84 = (void *)MEMORY[0x189607870];
    uint64_t v85 = *MEMORY[0x189607670];
    id v6 = @"failed to request authorization";
    uint64_t v101 = *MEMORY[0x1896075E0];
    v102 = @"failed to request authorization";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    [v84 errorWithDomain:v85 code:-67673 userInfo:v86];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_66:
  return v7;
}

- (BOOL)valueForBooleanDefault:(id)a3
{
  uint64_t v3 = (const __CFBoolean *)CFPreferencesCopyValue( (CFStringRef)a3,  @"com.apple.security",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID()) {
      int Value = CFBooleanGetValue(v4);
    }
    else {
      int Value = 0;
    }
    CFRelease(v4);
  }

  else
  {
    int Value = 0;
  }

  return Value != 0;
}

- (id)executeRequest
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  int64_t state = self->_state;
  if (state > 0)
  {
    id v4 = 0LL;
    goto LABEL_3;
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__AcmeCertRequest_executeRequest__block_invoke;
  block[3] = &unk_189676638;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  -[AcmeCertRequest createKeyPair](self, "createKeyPair");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_11;
  }
  -[AcmeCertRequest createCSR](self, "createCSR");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_11;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", @"acmeDirectory");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 absoluteString];
  xpc_object_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  nextMessageURL = self->_nextMessageURL;
  self->_nextMessageURL = v18;

  if (self->_nextMessageURL)
  {
    id v4 = 0LL;
    int64_t v20 = 1LL;
  }

  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", @"acmeServerURL");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 absoluteString];
    uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = self->_nextMessageURL;
    self->_nextMessageURL = v22;

    uint64_t v24 = self->_nextMessageURL;
    self->_int64_t state = 1LL;
    if (v24)
    {
      id v4 = 0LL;
      goto LABEL_31;
    }

    -[AcmeCertRequest createCertificate](self, "createCertificate");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v20 = 10LL;
  }

  self->_int64_t state = v20;
LABEL_31:
  int64_t state = self->_state;
LABEL_3:
  if (state <= 9)
  {
    CFTypeID v5 = (const void *)*MEMORY[0x189604DE8];

    id v6 = 0LL;
    while (1)
    {

      -[AcmeCertRequest acmeRequest](self, "acmeRequest");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = 0LL;
      -[AcmeCertRequest sendRequestToXPCService:response:](self, "sendRequestToXPCService:response:", v7, &v25);
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = v25;

      if (v4) {
        break;
      }
      uint64_t v8 = -[AcmeCertRequest processReply:](self, "processReply:", v6);
      if (v8)
      {
        id v4 = (void *)v8;
        break;
      }

      if (self->_state >= 10)
      {
        id v4 = 0LL;
        goto LABEL_25;
      }
    }

    secLogObjForScope("SecError");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = self->_state;
      *(_DWORD *)buf = 134218242;
      int64_t v28 = v11;
      __int16 v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_1804F4000, v10, OS_LOG_TYPE_DEFAULT, "ACME request flow failed at step %lld: %@", buf, 0x16u);
    }

    id v12 = -[NSDictionary objectForKey:](self->_parameters, "objectForKey:", @"acmeLocalIssuer");
    xpc_object_t v13 = v12;
    if (v12)
    {
      CFRetain(v12);
      if (!self->_permitLocalIssuer)
      {
        CFTypeID v14 = CFGetTypeID(v13);
        if (v14 != CFBooleanGetTypeID() || !v5 || !CFEqual(v13, v5)) {
          goto LABEL_23;
        }
      }
    }

    else if (!self->_permitLocalIssuer)
    {
      goto LABEL_24;
    }

    uint64_t v15 = -[AcmeCertRequest createCertificate](self, "createCertificate");

    id v4 = (void *)v15;
    if (v13) {
LABEL_23:
    }
      CFRelease(v13);
LABEL_24:
    self->_int64_t state = 10LL;
    goto LABEL_25;
  }

- (__SecIdentity)identityWithError:(id *)a3
{
  v27[1] = *MEMORY[0x1895F89C0];
  self->_identity = 0LL;
  uint64_t v5 = -[AcmeCertRequest executeRequest](self, "executeRequest");
  if (v5)
  {
    id v6 = (void *)v5;
    if (self->_identity) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }

  certificate = self->_certificate;
  if (!certificate || (privateKey = self->_privateKey) == 0LL)
  {
    if (!self->_identity) {
      goto LABEL_7;
    }
LABEL_11:
    id v6 = 0LL;
    goto LABEL_12;
  }

  CFStringRef v9 = (__SecIdentity *)SecIdentityCreate(*MEMORY[0x189604DB0], certificate, privateKey);
  self->_identity = v9;
  if (v9) {
    goto LABEL_11;
  }
LABEL_7:
  [NSString stringWithFormat:@"failed to create identity (check input values)"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v11 = (void *)MEMORY[0x189607870];
  uint64_t v12 = *MEMORY[0x189607670];
  uint64_t v26 = *MEMORY[0x1896075E0];
  v27[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 errorWithDomain:v12 code:-67838 userInfo:v13];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  CFTypeID v14 = self->_privateKey;
  if (v14)
  {
    v24[0] = @"class";
    v24[1] = @"v_Ref";
    v25[0] = @"keys";
    v25[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
    uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    SecItemDelete(v15);
  }

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (BOOL)logAcmeCSR
{
  return self->_logAcmeCSR;
}

- (void)setLogAcmeCSR:(BOOL)a3
{
  self->_logAcmeCSR = a3;
}

- (BOOL)permitLocalIssuer
{
  return self->_permitLocalIssuer;
}

- (void)setPermitLocalIssuer:(BOOL)a3
{
  self->_permitLocalIssuer = a3;
}

- (BOOL)requireAttestation
{
  return self->_requireAttestation;
}

- (void)setRequireAttestation:(BOOL)a3
{
  self->_BOOL requireAttestation = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSArray)subject
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)keyParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setKeyParams:(id)a3
{
}

- (NSArray)attestationOids
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAttestationOids:(id)a3
{
}

- (NSArray)attestationChain
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAttestationChain:(id)a3
{
}

- (__SecKey)attestationCRKey
{
  return self->_attestationCRKey;
}

- (void)setAttestationCRKey:(__SecKey *)a3
{
  self->_attestationCRKey = a3;
}

- (NSArray)attestationCRChain
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAttestationCRChain:(id)a3
{
}

- (NSData)attestation
{
  return (NSData *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAttestation:(id)a3
{
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCsr:(id)a3
{
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setLocation:(id)a3
{
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setToken:(id)a3
{
}

- (NSString)timestamp
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSArray)authorizations
{
  return (NSArray *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setAuthorizations:(id)a3
{
}

- (NSString)authorizationURL
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setAuthorizationURL:(id)a3
{
}

- (NSString)challengeURL
{
  return (NSString *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setChallengeURL:(id)a3
{
}

- (NSString)finalizeOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setFinalizeOrderURL:(id)a3
{
}

- (NSString)orderURL
{
  return (NSString *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setOrderURL:(id)a3
{
}

- (NSString)certificateURL
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setCertificateURL:(id)a3
{
}

- (NSString)nextMessageURL
{
  return (NSString *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setNextMessageURL:(id)a3
{
}

- (NSString)acmeNewAccountURL
{
  return (NSString *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setAcmeNewAccountURL:(id)a3
{
}

- (NSString)acmeNewNonceURL
{
  return (NSString *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setAcmeNewNonceURL:(id)a3
{
}

- (NSString)acmeNewOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setAcmeNewOrderURL:(id)a3
{
}

- (OS_dispatch_queue)xpc_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setXpc_queue:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (SecJWSEncoder)encoder
{
  return (SecJWSEncoder *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setEncoder:(id)a3
{
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (void).cxx_destruct
{
}

void __33__AcmeCertRequest_executeRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 264);
  if (v3)
  {
    *(void *)(v2 + 264) = 0LL;
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  id v4 = *(const void **)(v2 + 272);
  if (v4)
  {
    *(void *)(v2 + 272) = 0LL;
    CFRelease(v4);
  }

  id v10 = objc_alloc_init(MEMORY[0x189607848]);
  [MEMORY[0x189603F90] localeWithLocaleIdentifier:@"en_US_POSIX"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setLocale:v5];

  [v10 setDateFormat:@"yyyy-MM-dd-HH-mm-ss-SSSS"];
  [MEMORY[0x189603F50] now];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v10 stringFromDate:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  CFStringRef v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  *(_BYTE *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 32) valueForBooleanDefault:@"LogAcmeCSR"];
  *(_BYTE *)(*(void *)(a1 + 32) + 9) = [*(id *)(a1 + 32) valueForBooleanDefault:@"PermitLocalIssuer"];
  *(_BYTE *)(*(void *)(a1 + 32) + 10) = [*(id *)(a1 + 32) valueForBooleanDefault:@"RequireAttestation"];
}

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 224))
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.security.XPCAcmeService", 0LL);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 224);
    *(void *)(v4 + 224) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (!*(void *)(v2 + 232))
  {
    xpc_connection_t v6 = xpc_connection_create("com.apple.security.XPCAcmeService", *(dispatch_queue_t *)(v2 + 224));
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 232);
    *(void *)(v7 + 232) = v6;

    xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 232LL), &__block_literal_global_140);
    xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 232LL));
  }

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  uint64_t v3 = MEMORY[0x186E0087C]();
  uint64_t v4 = MEMORY[0x1895F9268];
  secLogObjForScope("SecError");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1895F91B0]);
      int v9 = 136315138;
      id v10 = string;
      uint64_t v7 = "connection error: %s";
      goto LABEL_6;
    }
  }

  else if (v6)
  {
    int v9 = 134217984;
    id v10 = (const char *)v2;
    uint64_t v7 = "unexpected connection event %p";
LABEL_6:
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
  }
}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_112( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = v5;
  }

  else
  {
    if (!v13 || [v13 count] != 2)
    {
      uint64_t v11 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-67671 userInfo:0];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v10 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
      goto LABEL_8;
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v9 = v13;
  }

  id v10 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
LABEL_8:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke()
{
}

uint64_t __45__AcmeCertRequest_deviceAttestationSupported__block_invoke()
{
  v1 = 0LL;
  _getAppAttestInternalSymbol(&v1, "AppAttest_DeviceAttestation_IsSupported");
  uint64_t result = v1();
  deviceAttestationSupported_appAttestSupported = result;
  return result;
}

void __28__AcmeCertRequest_createCSR__block_invoke(uint64_t a1)
{
  CFDataRef CertificateRequest = SecGenerateCertificateRequest( *(const __CFArray **)(*(void *)(a1 + 32) + 32LL),  *(const __CFDictionary **)(*(void *)(a1 + 32) + 40LL),  *(void **)(*(void *)(a1 + 32) + 248LL),  *(__SecKey **)(*(void *)(a1 + 32) + 256LL));
  uint64_t v3 = *(void *)(a1 + 32);
  CFDataRef v10 = CertificateRequest;
  if (*(_BYTE *)(v3 + 8))
  {
    [NSString stringWithFormat:@"/tmp/AcmeCsr_%@", *(void *)(v3 + 136)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFData writeToFile:atomically:](v10, "writeToFile:atomically:", v4, 1LL);

    CFDataRef v5 = v10;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  else
  {
    CFDataRef v5 = CertificateRequest;
  }

  objc_storeStrong((id *)(v3 + 96), v5);
  CFDataRef v6 = v10;
  if (!v10)
  {
    uint64_t v7 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-67838 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    CFDataRef v6 = 0LL;
  }
}

void __32__AcmeCertRequest_createKeyPair__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 256);
  if (v3)
  {
    *(void *)(v2 + 256) = 0LL;
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = *(const void **)(v2 + 248);
  if (v4)
  {
    *(void *)(v2 + 248) = 0LL;
    CFRelease(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 256LL) = SecKeyCreateRandomKey( *(CFDictionaryRef *)(v2 + 48),  (CFErrorRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  CFDataRef v5 = *(__SecKey **)(*(void *)(a1 + 32) + 256LL);
  if (!v5
    || (*(void *)(*(void *)(a1 + 32) + 248LL) = SecKeyCopyPublicKey(v5),
        uint64_t v6 = *(void *)(a1 + 32),
        !*(void *)(v6 + 256))
    || !*(void *)(v6 + 248))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-26275 userInfo:0];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v7;
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(const void **)(v8 + 256);
    if (v9)
    {
      *(void *)(v8 + 256) = 0LL;
      CFRelease(v9);
      uint64_t v8 = *(void *)(a1 + 32);
    }

    CFDataRef v10 = *(const void **)(v8 + 248);
    if (v10)
    {
      *(void *)(v8 + 248) = 0LL;
      CFRelease(v10);
    }
  }

void __37__AcmeCertRequest_sanitizeParameters__block_invoke(uint64_t a1)
{
  v86[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) parameters];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setDictionary:v4];

  CFDataRef v5 = (const void *)[v2 objectForKey:@"hardwareBound"];
  uint64_t v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFBooleanGetTypeID())
    {
      uint64_t v11 = "kSecUseHardwareBoundKey";
      goto LABEL_86;
    }

    if (*MEMORY[0x189604DE8] && CFEqual(v6, (CFTypeRef)*MEMORY[0x189604DE8])) {
      [v3 setObject:@"com.apple.setoken" forKeyedSubscript:@"tkid"];
    }
  }

  uint64_t v8 = [v2 objectForKey:@"type"];
  if (v8)
  {
    id v9 = (void *)v8;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = "kSecAttrKeyType";
    }
    [v3 setObject:v9 forKeyedSubscript:@"type"];

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_86;
    }
  }

  else
  {
    uint64_t v12 = (const void *)*MEMORY[0x189604DE8];
    if (v6 && v12) {
      BOOL v13 = CFEqual(v6, v12) != 0;
    }
    else {
      BOOL v13 = v6 == v12;
    }
    if (v13) {
      CFTypeID v14 = @"73";
    }
    else {
      CFTypeID v14 = @"42";
    }
    uint64_t v15 = v14;
    [v3 setObject:v15 forKeyedSubscript:@"type"];
  }

  uint64_t v16 = [v2 objectForKey:@"bsiz"];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();
    if ((v18 & 1) != 0) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = "kSecAttrKeySizeInBits";
    }
    [v3 setObject:v17 forKeyedSubscript:@"bsiz"];

    if ((v18 & 1) == 0) {
      goto LABEL_86;
    }
    goto LABEL_36;
  }

  [v2 objectForKey:@"type"];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = (const void *)*MEMORY[0x189604DE8];
  if (!v6 || !v20)
  {
    if (v6 != v20) {
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v21 = &unk_18969C168;
    goto LABEL_35;
  }

  if (CFEqual(v6, v20)) {
    goto LABEL_34;
  }
LABEL_32:
  if (([v19 isEqualToString:@"42"] & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v21 = &unk_18969C180;
LABEL_35:

  [v3 setObject:v21 forKeyedSubscript:@"bsiz"];
LABEL_36:
  uint64_t v22 = [v2 objectForKey:@"private"];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v3 setObject:v23 forKeyedSubscript:@"private"];

      uint64_t v11 = "kSecPrivateKeyAttrs";
      goto LABEL_86;
    }

    if (!v6 || (CFTypeID v24 = CFGetTypeID(v6), v24 != CFBooleanGetTypeID()))
    {
      [v3 setObject:v23 forKeyedSubscript:@"private"];
      [v23 objectForKey:@"labl"];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25) {
        [v3 setObject:v25 forKeyedSubscript:@"labl"];
      }
      [v23 objectForKey:@"atag"];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26) {
        [v3 setObject:v26 forKeyedSubscript:@"atag"];
      }
      uint64_t v27 = [v23 objectForKey:@"perm"];
      if (v27) {
        [v3 setObject:v27 forKeyedSubscript:@"perm"];
      }
      uint64_t v28 = [v23 objectForKey:@"extr"];
      if (v28) {
        [v3 setObject:v28 forKeyedSubscript:@"extr"];
      }
      uint64_t v29 = [v23 objectForKey:@"sens"];
      if (v29) {
        [v3 setObject:v29 forKeyedSubscript:@"sens"];
      }
      uint64_t v30 = [v23 objectForKey:@"nleg"];
      if (v30) {
        [v3 setObject:v30 forKeyedSubscript:@"nleg"];
      }
      uint64_t v31 = [v23 objectForKey:@"accc"];
      if (v31) {
        [v3 setObject:v31 forKeyedSubscript:@"accc"];
      }
    }

    [v3 setObject:v23 forKeyedSubscript:@"private"];
  }

  [v2 objectForKey:@"labl"];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_opt_class();
    char v33 = objc_opt_isKindOfClass();
    [v3 setObject:v32 forKeyedSubscript:@"labl"];
    if ((v33 & 1) == 0)
    {

      uint64_t v11 = "kSecAttrLabel";
      goto LABEL_86;
    }
  }

  [v2 objectForKey:@"atag"];
  unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();
    [v3 setObject:v34 forKeyedSubscript:@"atag"];
    if ((v35 & 1) == 0)
    {

      uint64_t v11 = "kSecAttrApplicationTag";
      goto LABEL_86;
    }
  }

  id v36 = (const void *)[v2 objectForKey:@"perm"];
  if (v36)
  {
    v37 = v36;
    CFTypeID v38 = CFGetTypeID(v36);
    CFTypeID TypeID = CFBooleanGetTypeID();
    [v3 setObject:v37 forKeyedSubscript:@"perm"];
    if (v38 != TypeID)
    {
      uint64_t v11 = "kSecAttrIsPermanent";
      goto LABEL_86;
    }
  }

  v40 = (const void *)[v2 objectForKey:@"extr"];
  if (v40)
  {
    uint64_t v41 = v40;
    CFTypeID v42 = CFGetTypeID(v40);
    CFTypeID v43 = CFBooleanGetTypeID();
    [v3 setObject:v41 forKeyedSubscript:@"extr"];
    if (v42 != v43)
    {
      uint64_t v11 = "kSecAttrIsExtractable";
      goto LABEL_86;
    }
  }

  BOOL v44 = (const void *)[v2 objectForKey:@"sens"];
  if (v44)
  {
    NSUInteger v45 = v44;
    CFTypeID v46 = CFGetTypeID(v44);
    CFTypeID v47 = CFBooleanGetTypeID();
    [v3 setObject:v45 forKeyedSubscript:@"sens"];
    if (v46 != v47)
    {
      uint64_t v11 = "kSecAttrIsSensitive";
      goto LABEL_86;
    }
  }

  int64_t v48 = (const void *)[v2 objectForKey:@"nleg"];
  if (v48)
  {
    xpc_object_t v49 = v48;
    CFTypeID v50 = CFGetTypeID(v48);
    CFTypeID v51 = CFBooleanGetTypeID();
    [v3 setObject:v49 forKeyedSubscript:@"nleg"];
    if (v50 != v51)
    {
      uint64_t v11 = "kSecUseDataProtectionKeychain";
      goto LABEL_86;
    }
  }

  v52 = (const void *)[v2 objectForKey:@"accc"];
  if (v52)
  {
    id v53 = v52;
    CFTypeID v54 = CFGetTypeID(v52);
    CFTypeID v55 = SecAccessControlGetTypeID();
    [v3 setObject:v53 forKeyedSubscript:@"accc"];
    if (v54 != v55)
    {
      uint64_t v11 = "kSecAttrAccessControl";
      goto LABEL_86;
    }
  }

  [v2 objectForKey:@"clientIdentifier"];
  id v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v11 = "kSecClientIdentifier";
    goto LABEL_86;
  }

  [v2 objectForKey:@"certificateLifetime"];
  xpc_object_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateLifetime";
      goto LABEL_86;
    }
  }

  [v2 objectForKey:@"certificateSerial"];
  char v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateSerialNumber";
      goto LABEL_86;
    }
  }

  else
  {
    [*(id *)(a1 + 32) serialNumber];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v66 forKeyedSubscript:@"certificateSerial"];
  }

  uint64_t v67 = [v2 objectForKey:@"keyUsage"];
  if (v67)
  {
    v68 = (void *)v67;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateKeyUsage";
      goto LABEL_86;
    }
  }

  else
  {
    v68 = &unk_18969C198;
    [v2 setObject:&unk_18969C198 forKeyedSubscript:@"keyUsage"];
  }

  uint64_t v69 = [v2 objectForKey:@"certificateEKUs"];
  if (v69)
  {
    uint64_t v70 = (void *)v69;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateExtendedKeyUsage";
      goto LABEL_86;
    }
  }

  else
  {
    v86[0] = @"1.3.6.1.5.5.7.3.2";
    [MEMORY[0x189603F18] arrayWithObjects:v86 count:1];
    uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v70 forKeyedSubscript:@"certificateEKUs"];
  }

  uint64_t v71 = [v2 objectForKey:kSecCMSSignHashAlgorithm];
  if (v71)
  {
    id v72 = (id)v71;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCMSSignHashAlgorithm";
      goto LABEL_86;
    }
  }

  else
  {
    id v72 = (id)kSecCMSHashingAlgorithmSHA256;
    [v2 setObject:v72 forKeyedSubscript:kSecCMSSignHashAlgorithm];
  }

  [v2 objectForKey:@"subjectAltName"];
  uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v11 = "kSecSubjectAltName";
  }

  else
  {

    [v2 objectForKey:@"acmeDirectory"];
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      uint64_t v11 = "kSecACMEDirectoryURL";
    }

    else
    {

      v75 = (const void *)[v2 objectForKey:@"attestationIdentity"];
      if (v75 && (CFTypeID v76 = CFGetTypeID(v75), v76 != SecIdentityGetTypeID()))
      {
        uint64_t v11 = "kSecAttestationIdentity";
      }

      else
      {
        [v2 objectForKey:@"attestationOids"];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          objc_opt_class();
          char v78 = objc_opt_isKindOfClass();
          if ((v78 & 1) != 0) {
            uint64_t v11 = 0LL;
          }
          else {
            uint64_t v11 = "kSecAttestationOids";
          }
        }

        else
        {
          uint64_t v11 = 0LL;
          char v78 = 1;
        }

        [*(id *)(a1 + 32) setAttestationOids:v77];

        if ((v78 & 1) != 0)
        {
          uint64_t v79 = (const void *)[v2 objectForKey:@"attestationKey"];
          v80 = v79;
          if (v79 && (CFTypeID v81 = CFGetTypeID(v79), v81 != SecKeyGetTypeID()))
          {
            [*(id *)(a1 + 32) setAttestationCRKey:v80];
            uint64_t v11 = "kSecAttestationKey";
          }

          else
          {
            [*(id *)(a1 + 32) setAttestationCRKey:v80];
            [v2 objectForKey:@"attestationChain"];
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
            {
              objc_opt_class();
              char v83 = objc_opt_isKindOfClass();
              if ((v83 & 1) != 0) {
                uint64_t v11 = 0LL;
              }
              else {
                uint64_t v11 = "kSecAttestationChain";
              }
            }

            else
            {
              uint64_t v11 = 0LL;
              char v83 = 1;
            }

            [*(id *)(a1 + 32) setAttestationCRChain:v82];

            if ((v83 & 1) != 0)
            {
              [*(id *)(a1 + 32) setParameters:v2];
              [*(id *)(a1 + 32) setKeyParams:v3];
              goto LABEL_87;
            }
          }
        }
      }
    }
  }

void __34__AcmeCertRequest_sanitizeSubject__block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32LL);
  if (!v2)
  {
    unint64_t v3 = 0LL;
LABEL_6:
    uint64_t v4 = "unknown";
    goto LABEL_7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v3 = 0LL;
    LODWORD(v2) = 0;
    goto LABEL_6;
  }

  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  uint64_t v4 = 0LL;
  LODWORD(v2) = 1;
LABEL_7:
  [MEMORY[0x189603FA8] arrayWithCapacity:0];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (_DWORD)v2)
  {
    unint64_t v5 = 1LL;
    while (1)
    {
      [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndex:v5 - 1];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        [v12 UTF8String];

        CFTypeID v7 = 0LL;
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        uint64_t v8 = (__CFString *) objc_claimAutoreleasedReturnValue();
        uint64_t v4 = (const char *)-[__CFString UTF8String](v8, "UTF8String");
        goto LABEL_23;
      }

      [v6 objectAtIndex:0];
      CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7) {
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      [v7 objectAtIndex:0];
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [v7 objectAtIndex:1];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v26 = v9;
        [MEMORY[0x189607810] characterSetWithCharactersInString:@".0123456789"];
        CFDataRef v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 invertedSet];
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (-[__CFString rangeOfCharacterFromSet:](v8, "rangeOfCharacterFromSet:", v11) == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_30;
        }
        if (-[__CFString isEqualToString:](v8, "isEqualToString:", @"EMAIL"))
        {

          uint64_t v8 = @"1.2.840.113549.1.9.1";
LABEL_30:
          id v9 = v26;

LABEL_31:
          v30[0] = v8;
          v30[1] = v9;
          [MEMORY[0x189603F18] arrayWithObjects:v30 count:2];
          BOOL v13 = v9;
          CFTypeID v14 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v14;
          [MEMORY[0x189603F18] arrayWithObjects:v31 count:1];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

          id v9 = v13;
          [v27 addObject:v15];

          uint64_t v4 = 0LL;
          goto LABEL_32;
        }

        if ([&unk_18969C078 containsObject:v8]) {
          goto LABEL_30;
        }
        id v16 = [NSString stringWithFormat:@"index %lu \"%@\"", v5 - 1, v8];
        uint64_t v4 = (const char *)[v16 UTF8String];

        id v9 = v26;
      }

      else
      {
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        uint64_t v4 = (const char *)[v11 UTF8String];
      }

      if (!v4) {
        goto LABEL_31;
      }
LABEL_32:

LABEL_23:
      LOBYTE(v2) = v4 == 0LL;
      if (v5 < v3)
      {
        ++v5;
        if (!v4) {
          continue;
        }
      }

      break;
    }
  }

  if ((v2 & 1) != 0)
  {
    uint64_t v17 = *(void **)(a1 + 32);
    char v18 = v27;
    [v17 setSubject:v27];
  }

  else
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"SecRequestClientIdentity: subject array has missing value or wrong type for %s key",  v4);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x189607670];
    uint64_t v28 = *MEMORY[0x1896075E0];
    uint64_t v29 = v19;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v20 errorWithDomain:v21 code:-50 userInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    char v18 = v27;
  }
}

@end