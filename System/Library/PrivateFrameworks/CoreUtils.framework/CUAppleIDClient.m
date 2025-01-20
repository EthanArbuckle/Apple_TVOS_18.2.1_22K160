@interface CUAppleIDClient
- (BOOL)_validatePeerHashes:(id)a3;
- (BOOL)validatePeerWithFlags:(unsigned int)a3 error:(id *)a4;
- (BOOL)verifyBytes:(const void *)a3 verifyLength:(unint64_t)a4 signatureBytes:(const void *)a5 signatureLength:(unint64_t)a6 error:(id *)a7;
- (BOOL)verifyData:(id)a3 signature:(id)a4 error:(id *)a5;
- (CUAppleIDClient)myInfoClient;
- (NSArray)peerAppleIDs;
- (NSData)myCertificateData;
- (NSData)mySecretKeyData;
- (NSData)peerCertificateData;
- (NSData)peerValidationData;
- (NSString)myAppleID;
- (NSString)mySecretKeyType;
- (NSString)peerAppleID;
- (__SecCertificate)_getMyCertificateAndReturnError:(id *)a3;
- (__SecCertificate)_getPeerCertificateAndReturnError:(id *)a3;
- (__SecIdentity)_getMyIdentityAndReturnError:(id *)a3;
- (__SecKey)_getMySecretKeyAndReturnError:(id *)a3;
- (__SecKey)_getPeerPublicKeyAndReturnError:(id *)a3;
- (id)copyMyAppleIDAndReturnError:(id *)a3;
- (id)copyMyCertificateDataAndReturnError:(id *)a3;
- (id)copyMyValidationDataAndReturnError:(id *)a3;
- (id)signBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)signData:(id)a3 error:(id *)a4;
- (int)securityLevel;
- (void)dealloc;
- (void)setMyAppleID:(id)a3;
- (void)setMyCertificateData:(id)a3;
- (void)setMyInfoClient:(id)a3;
- (void)setMySecretKeyData:(id)a3;
- (void)setMySecretKeyType:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerAppleIDs:(id)a3;
- (void)setPeerCertificateData:(id)a3;
- (void)setPeerValidationData:(id)a3;
@end

@implementation CUAppleIDClient

- (void)dealloc
{
  myCertificate = self->_myCertificate;
  if (myCertificate)
  {
    CFRelease(myCertificate);
    self->_myCertificate = 0LL;
  }

  myIdentity = self->_myIdentity;
  if (myIdentity)
  {
    CFRelease(myIdentity);
    self->_myIdentity = 0LL;
  }

  mySecretKey = self->_mySecretKey;
  if (mySecretKey)
  {
    CFRelease(mySecretKey);
    self->_mySecretKey = 0LL;
  }

  peerCertificate = self->_peerCertificate;
  if (peerCertificate)
  {
    CFRelease(peerCertificate);
    self->_peerCertificate = 0LL;
  }

  peerPublicKey = self->_peerPublicKey;
  if (peerPublicKey)
  {
    CFRelease(peerPublicKey);
    self->_peerPublicKey = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CUAppleIDClient;
  -[CUAppleIDClient dealloc](&v8, sel_dealloc);
}

- (void)setPeerAppleID:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  objc_storeStrong((id *)&self->_peerAppleID, a3);
  if (v5)
  {
    v8[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v8 count:1];
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = v6;
  }

  else
  {
    peerAppleIDs = self->_peerAppleIDs;
    self->_peerAppleIDs = 0LL;
  }
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  return -[CUAppleIDClient signBytes:length:error:](self, "signBytes:length:error:", v7, v8, a4);
}

- (id)signBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  CC_LONG v9 = a4;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient signBytes:length:error:]",  0x1Eu,  (uint64_t)"Sign %zu bytes\n",  (uint64_t)a5,  v5,  v6,  v7,  v9);
  }

  id v34 = 0LL;
  id v12 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", &v34);
  id v13 = v34;
  id v18 = v13;
  if (!v12) {
    goto LABEL_22;
  }
  id v33 = v13;
  v19 = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", &v33);
  id v20 = v33;

  if (!v19)
  {
    id v18 = v20;
    goto LABEL_22;
  }

  id v32 = v20;
  v21 = -[CUAppleIDClient _getMySecretKeyAndReturnError:](self, "_getMySecretKeyAndReturnError:", &v32);
  id v18 = v32;

  if (!v21) {
    goto LABEL_22;
  }
  size_t BlockSize = SecKeyGetBlockSize(v21);
  size_t sigLen = BlockSize;
  if (BlockSize)
  {
    v23 = (uint8_t *)malloc(BlockSize);
    if (v23)
    {
      v24 = v23;
      v37 = _kCryptoHashDescriptor_SHA512;
      CC_SHA512_Init(&v38);
      CC_SHA512_Update(&v38, a3, v9);
      CC_SHA512_Final(md, &v38);
      uint64_t v25 = SecKeyRawSign(v21, 1u, md, 0x40uLL, v24, &sigLen);
      if (!(_DWORD)v25)
      {
        id v26 = objc_alloc(MEMORY[0x189603F48]);
        uint64_t v27 = [v26 initWithBytesNoCopy:v24 length:sigLen];
        if (v27)
        {
          v28 = (void *)v27;

          id v18 = 0LL;
          goto LABEL_13;
        }

        uint64_t v25 = 4294960568LL;
      }

      uint64_t v31 = NSErrorWithOSStatusF((const char *)v25);

      free(v24);
      goto LABEL_21;
    }

    uint64_t v30 = 4294960568LL;
  }

  else
  {
    uint64_t v30 = 4294960553LL;
  }

  uint64_t v31 = NSErrorWithOSStatusF((const char *)v30);

LABEL_21:
  id v18 = (id)v31;
LABEL_22:
  if (v18
    && gLogCategory_CUAppleIDClient <= 60
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x3Cu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient signBytes:length:error:]",  0x3Cu,  (uint64_t)"### Sign failed (%zu bytes): %{error}\n",  v14,  v15,  v16,  v17,  v9);
  }

  if (a5)
  {
    id v18 = v18;
    v28 = 0LL;
    *a5 = v18;
  }

  else
  {
    v28 = 0LL;
  }

- (BOOL)validatePeerWithFlags:(unsigned int)a3 error:(id *)a4
{
  char v9 = a3;
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient validatePeerWithFlags:error:]",  0x1Eu,  (uint64_t)"Validate peer\n",  v4,  v5,  v6,  v7,  (char)v28);
  }

  if (self->_peerValidated) {
    return 1;
  }
  if (self->_peerSignatureVerified)
  {
    id v12 = self->_peerValidationData;
    if (!v12)
    {
      if (a4)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_52;
    }

    uint64_t v37 = 0LL;
    CC_SHA512_CTX v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    id v42 = 0LL;
    uint64_t v33 = 0LL;
    id v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    int v36 = 1;
    dispatch_queue_t v13 = dispatch_queue_create("SFAppleIDQueue", 0LL);
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke;
    v29[3] = &unk_189F30590;
    uint64_t v31 = &v37;
    id v32 = &v33;
    uint64_t v15 = v14;
    uint64_t v30 = v15;
    ((void (*)(void *, void *, void *))softLinkSFAppleIDParseValidationRecordData[0])(v12, v13, v29);
    dispatch_time_t v16 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait(v15, v16))
    {
      if (a4)
      {
        uint64_t v17 = 4294960574LL;
LABEL_21:
        NSErrorWithOSStatusF((const char *)v17);
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);

LABEL_52:
        return v11;
      }

      goto LABEL_23;
    }

    unsigned int v18 = *((_DWORD *)v34 + 6);
    if (v18 || (v19 = (void *)v38[5]) == 0LL)
    {
      if (a4)
      {
        if (v18) {
          uint64_t v17 = v18;
        }
        else {
          uint64_t v17 = 4294960596LL;
        }
        goto LABEL_21;
      }

- (BOOL)_validatePeerHashes:(id)a3
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  v73 = (const __CFDictionary *)a3;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  obj = self->_peerAppleIDs;
  uint64_t v72 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v89,  v97,  16LL);
  if (v72)
  {
    uint64_t v71 = *(void *)v90;
LABEL_3:
    uint64_t v4 = 0LL;
    while (1)
    {
      if (*(void *)v90 != v71) {
        objc_enumerationMutation(obj);
      }
      v74 = *(void **)(*((void *)&v89 + 1) + 8 * v4);
      uint64_t v75 = v4;
      id v76 = [v74 lowercaseString];
      uint64_t v5 = (const char *)[v76 UTF8String];
      CC_LONG v6 = strlen(v5);
      CC_SHA256(v5, v6, md);
      BOOL v11 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:32];
      if (gLogCategory_CUAppleIDClient <= 30
        && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
      {
        LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]",  0x1Eu,  (uint64_t)"Validating peer hash: %@\n",  v7,  v8,  v9,  v10,  (char)v11);
      }

      CFTypeID TypeID = CFArrayGetTypeID();
      CFDictionaryGetTypedValue(v73, @"ValidatedEmailHashes", TypeID, 0LL);
      dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v85 objects:v95 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v86;
        while (2)
        {
          for (uint64_t i = 0LL; i != v16; ++i)
          {
            if (*(void *)v86 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              NSDataWithHex((char *)[v19 UTF8String], -1, 22, 0, 0);
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (gLogCategory_CUAppleIDClient <= 30
                && (gLogCategory_CUAppleIDClient != -1
                 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
              {
                LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]",  0x1Eu,  (uint64_t)"Attempting match against: %@\n",  v20,  v21,  v22,  v23,  (char)v24);
              }

              char v25 = [v24 isEqual:v11];

              if ((v25 & 1) != 0)
              {
                LODWORD(v35) = 1;
                id v36 = v14;
                goto LABEL_69;
              }
            }
          }

          uint64_t v16 = [v14 countByEnumeratingWithState:&v85 objects:v95 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      if (strchr(v5, 64))
      {
        id v26 = v74;
        CUNormalizeEmailAddress(v74, 1);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v27 isEqual:v76] & 1) == 0)
        {
          v68 = v27;
          id v69 = v27;
          v28 = (const char *)[v69 UTF8String];
          CC_LONG v29 = strlen(v28);
          CC_SHA256(v28, v29, md);
          uint64_t v30 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:32];

          if (gLogCategory_CUAppleIDClient <= 30
            && (gLogCategory_CUAppleIDClient != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
          {
            LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]",  0x1Eu,  (uint64_t)"Validating normalized peer hash: %@\n",  v31,  v32,  v33,  v34,  v30);
          }

          __int128 v83 = 0u;
          __int128 v84 = 0u;
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          id v37 = v14;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v82;
LABEL_33:
            uint64_t v41 = 0LL;
            while (1)
            {
              if (*(void *)v82 != v40) {
                objc_enumerationMutation(v37);
              }
              id v42 = *(void **)(*((void *)&v81 + 1) + 8 * v41);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                NSDataWithHex((char *)[v42 UTF8String], -1, 22, 0, 0);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (gLogCategory_CUAppleIDClient <= 30
                  && (gLogCategory_CUAppleIDClient != -1
                   || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
                {
                  LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient _validatePeerHashes:]",  0x1Eu,  (uint64_t)"Attempting match against: %@\n",  v43,  v44,  v45,  v46,  (char)v47);
                }

                char v48 = [v47 isEqual:v30];

                if ((v48 & 1) != 0) {
                  break;
                }
              }

              if (v39 == ++v41)
              {
                uint64_t v39 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
                if (v39) {
                  goto LABEL_33;
                }
                goto LABEL_44;
              }
            }

- (BOOL)verifyData:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  return -[CUAppleIDClient verifyBytes:verifyLength:signatureBytes:signatureLength:error:]( self,  "verifyBytes:verifyLength:signatureBytes:signatureLength:error:",  v11,  v12,  v14,  v15,  a5);
}

- (BOOL)verifyBytes:(const void *)a3 verifyLength:(unint64_t)a4 signatureBytes:(const void *)a5 signatureLength:(unint64_t)a6 error:(id *)a7
{
  CC_LONG v11 = a4;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (gLogCategory_CUAppleIDClient <= 30
    && (gLogCategory_CUAppleIDClient != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUAppleIDClient, 0x1Eu)))
  {
    LogPrintF( (uint64_t)&gLogCategory_CUAppleIDClient,  (uint64_t)"-[CUAppleIDClient verifyBytes:verifyLength:signatureBytes:signatureLength:error:]",  0x1Eu,  (uint64_t)"Verify signature (%zu bytes data, %zu bytes signature)\n",  (uint64_t)a5,  a6,  (uint64_t)a7,  v7,  v11);
  }

  uint64_t v14 = -[CUAppleIDClient _getPeerPublicKeyAndReturnError:](self, "_getPeerPublicKeyAndReturnError:", a7);
  if (!v14) {
    return 0;
  }
  uint64_t v15 = v14;
  uint64_t v20 = _kCryptoHashDescriptor_SHA512;
  CC_SHA512_Init(&v21);
  CC_SHA512_Update(&v21, a3, v11);
  CC_SHA512_Final(md, &v21);
  uint64_t v16 = (const char *)SecKeyRawVerify(v15, 1u, md, 0x40uLL, (const uint8_t *)a5, a6);
  BOOL v17 = (_DWORD)v16 == 0;
  if ((_DWORD)v16)
  {
    if (a7)
    {
      NSErrorWithOSStatusF(v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    self->_peerSignatureVerified = 1;
  }

  return v17;
}

- (id)copyMyAppleIDAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient copyMyAppleIDAndReturnError:](myInfoClient, "copyMyAppleIDAndReturnError:", a3);
  }
  myAppleID = self->_myAppleID;
  if (myAppleID) {
    return myAppleID;
  }
  if (AppleAccountLibrary_sOnce != -1) {
    dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_149);
  }
  id v8 = objc_alloc_init((Class)getACAccountStoreClass[0]());
  objc_msgSend(v8, "aa_primaryAppleAccount");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 username];
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  CC_LONG v11 = self->_myAppleID;
  self->_myAppleID = v10;

  uint64_t v12 = self->_myAppleID;
  if (a3)
  {
    if (!v12)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = self->_myAppleID;
    }
  }

  id v13 = (void *)-[NSString copy](v12, "copy");

  return v13;
}

- (__SecCertificate)_getMyCertificateAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient _getMyCertificateAndReturnError:](myInfoClient, "_getMyCertificateAndReturnError:", a3);
  }
  p_myCertificate = &self->_myCertificate;
  result = self->_myCertificate;
  if (!result)
  {
    myCertificateData = self->_myCertificateData;
    if (!myCertificateData)
    {
      result = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", a3);
      if (!result) {
        return result;
      }
      uint64_t v9 = SecIdentityCopyCertificate(result, p_myCertificate);
      if ((_DWORD)v9)
      {
        if (!a3) {
          return *p_myCertificate;
        }
      }

      else
      {
        if (!a3 || *p_myCertificate) {
          return *p_myCertificate;
        }
        uint64_t v9 = 4294960596LL;
      }

- (id)copyMyCertificateDataAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient copyMyCertificateDataAndReturnError:]( myInfoClient,  "copyMyCertificateDataAndReturnError:",  a3);
  }
  myCertificateData = self->_myCertificateData;
  if (myCertificateData) {
    return myCertificateData;
  }
  id result = -[CUAppleIDClient _getMyCertificateAndReturnError:](self, "_getMyCertificateAndReturnError:", a3);
  if (result)
  {
    id v8 = (NSData *)SecCertificateCopyData((SecCertificateRef)result);
    uint64_t v9 = self->_myCertificateData;
    self->_myCertificateData = v8;

    id v10 = self->_myCertificateData;
    if (a3)
    {
      if (!v10)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = self->_myCertificateData;
      }
    }

    return (id)-[NSData copy](v10, "copy");
  }

  return result;
}

- (__SecIdentity)_getMyIdentityAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient _getMyIdentityAndReturnError:](myInfoClient, "_getMyIdentityAndReturnError:", a3);
  }
  myIdentity = self->_myIdentity;
  if (!myIdentity)
  {
    if (self->_mySecretKey || self->_mySecretKeyData)
    {
      if (-[CUAppleIDClient _getMyCertificateAndReturnError:](self, "_getMyCertificateAndReturnError:", a3)
        && -[CUAppleIDClient _getMySecretKeyAndReturnError:](self, "_getMySecretKeyAndReturnError:", a3))
      {
        id v8 = (__SecIdentity *)SecIdentityCreate();
        myIdentity = v8;
        self->_myIdentity = v8;
        if (a3)
        {
          if (!v8)
          {
            NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
            return self->_myIdentity;
          }
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      id v9 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", a3);
      id v10 = v9;
      if (v9)
      {
        id v14 = 0LL;
        CC_LONG v11 = (__SecIdentity *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLink_AppleIDCopySecIdentityForAppleIDAccount[0])( (uint64_t)v9,  0LL,  (uint64_t)&v14);
        self->_myIdentity = v11;
        id v12 = v14;
        if (a3 && !v11)
        {
          if (v14)
          {
            *a3 = v14;
          }

          else
          {
            id v13 = NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
            *a3 = v13;
          }
        }

        myIdentity = self->_myIdentity;
      }

      else
      {
        myIdentity = 0LL;
      }
    }
  }

  return myIdentity;
}

- (__SecKey)_getMySecretKeyAndReturnError:(id *)a3
{
  v21[2] = *MEMORY[0x1895F89C0];
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient _getMySecretKeyAndReturnError:](myInfoClient, "_getMySecretKeyAndReturnError:", a3);
  }
  p_mySecretKey = &self->_mySecretKey;
  mySecretKey = self->_mySecretKey;
  if (!mySecretKey)
  {
    if (self->_mySecretKeyData)
    {
      id v9 = self->_mySecretKeyType;
      id v10 = v9;
      if (v9)
      {
        uint64_t v11 = *MEMORY[0x18960B970];
        uint64_t v12 = *MEMORY[0x18960B998];
        v20[0] = *MEMORY[0x18960B968];
        v20[1] = v12;
        v21[0] = v11;
        v21[1] = v9;
        [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
        id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        id v19 = 0LL;
        id v14 = SecKeyCreateWithData((CFDataRef)self->_mySecretKeyData, v13, (CFErrorRef *)&v19);
        self->_mySecretKey = v14;
        id v15 = v19;
        if (a3 && !v14)
        {
          if (v19)
          {
            *a3 = v19;
          }

          else
          {
            id v18 = NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
            *a3 = v18;
          }
        }

        mySecretKey = *p_mySecretKey;
      }

      else if (a3)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
        mySecretKey = 0LL;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        mySecretKey = 0LL;
      }

      return mySecretKey;
    }

    uint64_t v16 = -[CUAppleIDClient _getMyIdentityAndReturnError:](self, "_getMyIdentityAndReturnError:", a3);
    if (v16)
    {
      uint64_t v17 = SecIdentityCopyPrivateKey(v16, &self->_mySecretKey);
      if ((_DWORD)v17)
      {
        if (!a3) {
          return *p_mySecretKey;
        }
      }

      else
      {
        if (!a3 || *p_mySecretKey) {
          return *p_mySecretKey;
        }
        uint64_t v17 = 4294960596LL;
      }

      NSErrorWithOSStatusF((const char *)v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return *p_mySecretKey;
    }

    return 0LL;
  }

  return mySecretKey;
}

- (id)copyMyValidationDataAndReturnError:(id *)a3
{
  myInfoClient = self->_myInfoClient;
  if (myInfoClient) {
    return -[CUAppleIDClient copyMyValidationDataAndReturnError:]( myInfoClient,  "copyMyValidationDataAndReturnError:",  a3);
  }
  myValidationData = self->_myValidationData;
  if (myValidationData) {
    return myValidationData;
  }
  id v8 = -[CUAppleIDClient copyMyAppleIDAndReturnError:](self, "copyMyAppleIDAndReturnError:", a3);
  if (v8)
  {
    id v18 = 0LL;
    uint64_t v9 = getkAppleIDValidatedItemsRecordDataCertificateType[0]();
    id v10 = (const __CFDictionary *)softLink_AppleIDAuthenticationCopyCertificateInfo((uint64_t)v8, v9, 0LL, (uint64_t)&v18);
    id v11 = v18;
    if (v10)
    {
      CFTypeID TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v10, @"AppleIDAccountValidationRecordData", TypeID, 0LL);
      id v13 = (NSData *)objc_claimAutoreleasedReturnValue();
      id v14 = self->_myValidationData;
      self->_myValidationData = v13;

      id v15 = self->_myValidationData;
      if (a3)
      {
        if (!v15)
        {
          NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          id v15 = self->_myValidationData;
        }
      }

      uint64_t v16 = (void *)-[NSData copy](v15, "copy");
      goto LABEL_17;
    }

    if (a3)
    {
      if (v18)
      {
        uint64_t v16 = 0LL;
        *a3 = v18;
LABEL_17:

        goto LABEL_18;
      }

      id v17 = NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
      *a3 = v17;
    }

    uint64_t v16 = 0LL;
    goto LABEL_17;
  }

  uint64_t v16 = 0LL;
LABEL_18:

  return v16;
}

- (__SecCertificate)_getPeerCertificateAndReturnError:(id *)a3
{
  peerCertificate = self->_peerCertificate;
  if (!peerCertificate)
  {
    CC_LONG v6 = self->_peerCertificateData;
    if (v6)
    {
      uint64_t v7 = SecCertificateCreateWithData(0LL, (CFDataRef)v6);
      peerCertificate = v7;
      self->_peerCertificate = v7;
      if (a3 && !v7)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        peerCertificate = self->_peerCertificate;
      }
    }

    else if (a3)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
      peerCertificate = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      peerCertificate = 0LL;
    }
  }

  return peerCertificate;
}

- (__SecKey)_getPeerPublicKeyAndReturnError:(id *)a3
{
  id result = self->_peerPublicKey;
  if (!result)
  {
    id result = -[CUAppleIDClient _getPeerCertificateAndReturnError:](self, "_getPeerCertificateAndReturnError:");
    if (result)
    {
      id result = SecCertificateCopyKey(result);
      self->_peerPublicKey = result;
      if (a3)
      {
        if (!result)
        {
          NSErrorWithOSStatusF((const char *)0xFFFFE5D4LL);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          return self->_peerPublicKey;
        }
      }
    }
  }

  return result;
}

- (int)securityLevel
{
  int securityLevel = self->_securityLevel;
  if (!securityLevel)
  {
    if (AppleAccountLibrary_sOnce != -1) {
      dispatch_once(&AppleAccountLibrary_sOnce, &__block_literal_global_149);
    }
    id v4 = objc_alloc_init((Class)getACAccountStoreClass[0]());
    objc_msgSend(v4, "aa_primaryAppleAccount");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 accountPropertyForKey:@"altDSID"];
    CC_LONG v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      [(Class)getAKAccountManagerClass[0]() sharedInstance];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 authKitAccountWithAltDSID:v6 error:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        int securityLevel = [v7 securityLevelForAccount:v8];
        self->_int securityLevel = securityLevel;
      }

      else
      {
        int securityLevel = 0;
      }
    }

    else
    {
      int securityLevel = 0;
    }
  }

  return securityLevel;
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
}

- (CUAppleIDClient)myInfoClient
{
  return self->_myInfoClient;
}

- (void)setMyInfoClient:(id)a3
{
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (NSArray)peerAppleIDs
{
  return self->_peerAppleIDs;
}

- (void)setPeerAppleIDs:(id)a3
{
}

- (NSData)peerCertificateData
{
  return self->_peerCertificateData;
}

- (void)setPeerCertificateData:(id)a3
{
}

- (NSData)peerValidationData
{
  return self->_peerValidationData;
}

- (void)setPeerValidationData:(id)a3
{
}

- (NSData)myCertificateData
{
  return self->_myCertificateData;
}

- (void)setMyCertificateData:(id)a3
{
}

- (NSData)mySecretKeyData
{
  return self->_mySecretKeyData;
}

- (void)setMySecretKeyData:(id)a3
{
}

- (NSString)mySecretKeyType
{
  return self->_mySecretKeyType;
}

- (void)setMySecretKeyType:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__CUAppleIDClient_validatePeerWithFlags_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end