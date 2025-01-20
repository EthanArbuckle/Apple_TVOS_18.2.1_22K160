@interface MSCMSCountersignatureAttribute
- (BOOL)verifyCountersignatures:(id)a3 error:(id *)a4;
- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 signature:(id)a6 error:(id *)a7;
- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 LAContext:(id)a4 error:(id *)a5;
- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 containingSignerInfo:(id)a6 error:(id *)a7;
- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6;
- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3;
- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 additionalCertificates:(id)a4;
- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4;
- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4 additionalCertificates:(id)a5;
- (MSCMSSignerInfo)containingSignerInfo;
- (MSOID)attributeType;
- (NSArray)additionalCertificates;
- (NSArray)signers;
- (id)encodeAttributeWithError:(id *)a3;
- (unint64_t)chainMode;
- (void)addSigner:(id)a3;
- (void)addSigner:(id)a3 withCertificates:(id)a4;
- (void)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5;
- (void)removeSignerCertificatesWithIndexes:(id)a3;
- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4;
- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4;
- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4;
- (void)setAdditionalCertificates:(id)a3;
- (void)setChainMode:(unint64_t)a3;
- (void)setContainingSignerInfo:(id)a3;
@end

@implementation MSCMSCountersignatureAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.6", 0LL);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:LAContext:error:]( self,  "initWithAttribute:LAContext:error:",  a3,  0LL,  a4);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 LAContext:(id)a4 error:(id *)a5
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:error:]( self,  "initWithAttribute:certificates:LAContext:error:",  a3,  0LL,  a4,  a5);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 error:(id *)a6
{
  return -[MSCMSCountersignatureAttribute initWithAttribute:certificates:LAContext:containingSignerInfo:error:]( self,  "initWithAttribute:certificates:LAContext:containingSignerInfo:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (MSCMSCountersignatureAttribute)initWithAttribute:(id)a3 certificates:(id)a4 LAContext:(id)a5 containingSignerInfo:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [v12 attributeType];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v16 isEqualToString:@"1.2.840.113549.1.9.6"];

  if ((v17 & 1) != 0)
  {
    v43.receiver = self;
    v43.super_class = (Class)&OBJC_CLASS___MSCMSCountersignatureAttribute;
    self = -[MSCMSCountersignatureAttribute init](&v43, sel_init);
    if (!self) {
      goto LABEL_13;
    }
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = __Block_byref_object_copy__2;
    v41 = __Block_byref_object_dispose__2;
    if (a7)
    {
      id v18 = *a7;
      if (*a7) {
        id v18 = (id)[v18 copy];
      }
    }

    else
    {
      id v18 = 0LL;
    }

    id v42 = v18;
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    v34 = __Block_byref_object_copy__2;
    v35 = __Block_byref_object_dispose__2;
    v20 = (void *)MEMORY[0x189603FA8];
    [v12 attributeValues];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    -[MSCMSCountersignatureAttribute setContainingSignerInfo:](self, "setContainingSignerInfo:", v15);
    [v12 attributeValues];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __102__MSCMSCountersignatureAttribute_initWithAttribute_certificates_LAContext_containingSignerInfo_error___block_invoke;
    v25[3] = &unk_189B4AD18;
    v29 = &v37;
    id v26 = v13;
    id v27 = v14;
    id v28 = v15;
    v30 = &v31;
    [v22 enumerateObjectsUsingBlock:v25];

    v19 = (MSCMSCountersignatureAttribute *)[(id)v32[5] count];
    if (v19)
    {
      objc_storeStrong((id *)&self->_signers, (id)v32[5]);
    }

    else if (a7)
    {
      v24 = (void *)v38[5];
      if (v24) {
        *a7 = v24;
      }
    }

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    if (v19)
    {
LABEL_13:
      self = self;
      v19 = self;
    }
  }

  else if (a7)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  *a7,  @"Not a Countersignature attribute according to AttributeType");
    v19 = 0LL;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v19 = 0LL;
  }

  return v19;
}

uint64_t __102__MSCMSCountersignatureAttribute_initWithAttribute_certificates_LAContext_containingSignerInfo_error___block_invoke( void *a1,  void *a2)
{
  uint64_t v13 = 0LL;
  memset(v12, 0, sizeof(v12));
  int v3 = nsheim_decode_SignerInfo(a2);
  if (v3)
  {
    uint64_t v9 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v3,  *(void *)(*(void *)(a1[7] + 8LL) + 40LL),  @"unable to decode signerInfo in countersignature");
    uint64_t v10 = *(void *)(a1[7] + 8LL);
    v7 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
    goto LABEL_4;
  }

  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v6 + 40);
  v7 = +[MSCMSSignerInfo decodeSignerInfo:certificates:LAContext:error:]( &OBJC_CLASS___MSCMSCounterSignerInfo,  "decodeSignerInfo:certificates:LAContext:error:",  v12,  v4,  v5,  &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  [v7 setContainingSignerInfo:a1[6]];
  if (v7)
  {
    [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v7];
LABEL_4:
  }

  return free_SignerInfo();
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:]( self,  "initWithSignerInfo:signerChainMode:additionalCertificates:",  a3,  1LL,  0LL);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 additionalCertificates:(id)a4
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:]( self,  "initWithSignerInfo:signerChainMode:additionalCertificates:",  a3,  1LL,  a4);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4
{
  return -[MSCMSCountersignatureAttribute initWithSignerInfo:signerChainMode:additionalCertificates:]( self,  "initWithSignerInfo:signerChainMode:additionalCertificates:",  a3,  a4,  0LL);
}

- (MSCMSCountersignatureAttribute)initWithSignerInfo:(id)a3 signerChainMode:(unint64_t)a4 additionalCertificates:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MSCMSCountersignatureAttribute;
  uint64_t v10 = -[MSCMSCountersignatureAttribute init](&v14, sel_init);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x189603F18] arrayWithObject:v8];
    signers = v10->_signers;
    v10->_signers = (NSArray *)v11;

    v10->_chainMode = a4;
    objc_storeStrong((id *)&v10->_additionalCertificates, a5);
  }

  return v10;
}

- (void)setContainingSignerInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_storeWeak((id *)&self->_containingSignerInfo, v4);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[MSCMSCountersignatureAttribute signers](self, "signers", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setContainingSignerInfo:v4];
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)addSigner:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[MSCMSCountersignatureAttribute containingSignerInfo](self, "containingSignerInfo");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setContainingSignerInfo:v5];

    [MEMORY[0x189603FA8] arrayWithArray:self->_signers];
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v6, "addObject:", v4);

    signers = self->_signers;
    self->_signers = v6;

    -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", 1LL);
  }

- (void)addSigner:(id)a3 withCertificates:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    -[MSCMSCountersignatureAttribute addSigner:](self, "addSigner:");
    p_containingSignerInfo = &self->_containingSignerInfo;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
    [WeakRetained containingSignedData];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v6)
      {
        id v10 = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
        [v10 containingSignedData];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 certificates];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 addObjectsFromArray:v6];
      }

      id v13 = objc_loadWeakRetained((id *)p_containingSignerInfo);
      [v13 containingSignedData];
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = objc_loadWeakRetained((id *)p_containingSignerInfo);
      [v14 addCounterSignerCertificates:v15 mode:1 error:0];
    }

    else
    {
      -[MSCMSCountersignatureAttribute setAdditionalCertificates:](self, "setAdditionalCertificates:", v6);
      -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", 1LL);
    }
  }
}

- (void)addSigner:(id)a3 withChainMode:(unint64_t)a4 error:(id *)a5
{
  p_containingSignerInfo = &self->_containingSignerInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
  [WeakRetained containingSignedData];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_containingSignerInfo);
    [v13 containingSignedData];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = objc_loadWeakRetained((id *)p_containingSignerInfo);
    [v11 addCounterSignerCertificates:v12 mode:a4 error:a5];
  }

  else
  {
    -[MSCMSCountersignatureAttribute setChainMode:](self, "setChainMode:", a4);
  }

- (void)removeSignerCertificatesWithIndexes:(id)a3
{
  signers = self->_signers;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __70__MSCMSCountersignatureAttribute_removeSignerCertificatesWithIndexes___block_invoke;
  v4[3] = &unk_189B4AD40;
  v4[4] = self;
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:]( signers,  "enumerateObjectsAtIndexes:options:usingBlock:",  a3,  0LL,  v4);
}

void __70__MSCMSCountersignatureAttribute_removeSignerCertificatesWithIndexes___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 setContainingSignerInfo:0];
  [*(id *)(a1 + 32) containingSignerInfo];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 containingSignedData];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 certificates];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 signerCertificate];

  [v5 removeObject:v6];
}

- (void)removeSignersWithIndexes:(id)a3 error:(id *)a4
{
  id v9 = a3;
  if ([v9 count])
  {
    [MEMORY[0x189603FA8] arrayWithArray:self->_signers];
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray removeObjectsAtIndexes:](v6, "removeObjectsAtIndexes:", v9);
    -[MSCMSCountersignatureAttribute removeSignerCertificatesWithIndexes:]( self,  "removeSignerCertificatesWithIndexes:",  v9);
    id signers = self->_signers;
    self->_id signers = v6;
  }

  else
  {
    if (a4 && *a4) {
      uint64_t v8 = (void *)[*a4 copy];
    }
    else {
      uint64_t v8 = 0LL;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v8,  @"no signer with input certificate hash");
    id signers = (id)objc_claimAutoreleasedReturnValue();

    if (a4 && signers)
    {
      id signers = signers;
      *a4 = signers;
    }
  }
}

- (void)removeSignersWithCertificate:(__SecCertificate *)a3 error:(id *)a4
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  [MEMORY[0x189607938] indexSet];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id signers = self->_signers;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __69__MSCMSCountersignatureAttribute_removeSignersWithCertificate_error___block_invoke;
  v8[3] = &unk_189B4A8B0;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v8);
  -[MSCMSCountersignatureAttribute removeSignersWithIndexes:error:](self, "removeSignersWithIndexes:error:", v10[5], a4);
  _Block_object_dispose(&v9, 8);
}

void __69__MSCMSCountersignatureAttribute_removeSignersWithCertificate_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (*(void *)(a1 + 40))
  {
    uint64_t v9 = v5;
    uint64_t v7 = [v5 signerCertificate];
    uint64_t v6 = v9;
    if (v7)
    {
      int v8 = CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)[v9 signerCertificate]);
      uint64_t v6 = v9;
      if (v8)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addIndex:a3];
        uint64_t v6 = v9;
      }
    }
  }
}

- (void)removeSignersWithEmailAddress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  [MEMORY[0x189607938] indexSet];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id signers = self->_signers;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke;
  id v12 = &unk_189B4A900;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", &v9);
  -[MSCMSCountersignatureAttribute removeSignersWithIndexes:error:]( self,  "removeSignersWithIndexes:error:",  v16[5],  a4,  v9,  v10,  v11,  v12);

  _Block_object_dispose(&v15, 8);
}

void __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v7 = (id)SecCertificateCopyRFC822Names();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke_2;
  v8[3] = &unk_189B4A8D8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = a3;
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __70__MSCMSCountersignatureAttribute_removeSignersWithEmailAddress_error___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result) {
    return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addIndex:*(void *)(a1 + 48)];
  }
  return result;
}

- (void)removeSignersWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  id v12 = v7;
  SecCertificateRef v8 = MSSecIdentityCopyCertificateWithError(a3, &v12);
  id v9 = v12;

  if (v8)
  {
    id v11 = v9;
    -[MSCMSCountersignatureAttribute removeSignersWithCertificate:error:]( self,  "removeSignersWithCertificate:error:",  v8,  &v11);
    id v10 = v11;

    id v9 = v10;
  }

  if (a4 && v9) {
    *a4 = v9;
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (BOOL)verifyCountersignatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  if (a4)
  {
    id v7 = *a4;
    if (*a4) {
      id v7 = (id)[v7 copy];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v22 = v7;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  id signers = self->_signers;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __64__MSCMSCountersignatureAttribute_verifyCountersignatures_error___block_invoke;
  v12[3] = &unk_189B4AD68;
  v12[5] = &v13;
  _OWORD v12[6] = a4;
  v12[4] = &v17;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v12);
  if (a4)
  {
    id v9 = (void *)v18[5];
    if (v9) {
      *a4 = v9;
    }
  }

  BOOL v10 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __64__MSCMSCountersignatureAttribute_verifyCountersignatures_error___block_invoke( void *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v16 = a2;
  if (([v16 verifySignature:a1[6]] & 1) == 0)
  {
    uint64_t v7 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"signature verification failed for signer %lu",  a3);
    uint64_t v8 = *(void *)(a1[4] + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  if (!*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    if (([v16 verifyCountersignatures:a1[6]] & 1) == 0)
    {
      uint64_t v10 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"countersignature verification failed for signer %lu",  a3);
      uint64_t v11 = *(void *)(a1[4] + 8LL);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    }

    if (!*(_BYTE *)(*(void *)(a1[5] + 8) + 24) && ([v16 verifyTimestamps:a1[6]] & 1) == 0)
    {
      uint64_t v13 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -67808LL,  *(void *)(*(void *)(a1[4] + 8LL) + 40LL),  @"timestamp verification failed for signer %lu",  a3);
      uint64_t v14 = *(void *)(a1[4] + 8LL);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    }
  }
}

- (BOOL)verifyCountersignaturesAndCountersignersWithPolicies:(id)a3 verifyTime:(id)a4 anchorCertificates:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = __Block_byref_object_copy__2;
  uint64_t v39 = __Block_byref_object_dispose__2;
  if (a7)
  {
    id v16 = *a7;
    if (*a7) {
      id v16 = (id)[v16 copy];
    }
  }

  else
  {
    id v16 = 0LL;
  }

  id v40 = v16;
  uint64_t v17 = (id *)(v36 + 5);
  id obj = (id)v36[5];
  BOOL v18 = -[MSCMSCountersignatureAttribute verifyCountersignatures:error:]( self,  "verifyCountersignatures:error:",  v15,  &obj);
  objc_storeStrong(v17, obj);
  if (v18)
  {
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000LL;
    char v33 = 0;
    id signers = self->_signers;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __133__MSCMSCountersignatureAttribute_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error___block_invoke;
    v24[3] = &unk_189B4AD90;
    id v25 = v12;
    id v26 = v13;
    id v27 = v14;
    id v28 = &v35;
    v29 = &v30;
    -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v24);
    if (a7)
    {
      id v20 = (void *)v36[5];
      if (v20) {
        *a7 = v20;
      }
    }

    BOOL v21 = *((_BYTE *)v31 + 24) == 0;

    _Block_object_dispose(&v30, 8);
  }

  else if (a7 && (id v22 = (void *)v36[5]) != 0LL)
  {
    BOOL v21 = 0;
    *a7 = v22;
  }

  else
  {
    BOOL v21 = 0;
  }

  _Block_object_dispose(&v35, 8);

  return v21;
}

void __133__MSCMSCountersignatureAttribute_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error___block_invoke( void *a1,  void *a2)
{
  id v3 = a2;
  CFErrorRef error = 0LL;
  uint64_t v4 = a1[4];
  [v3 verifyTime:a1[5]];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[7] + 8LL);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = (__SecTrust *)[v3 createTrustObjectWithPolicies:v4 verifyTime:v5 anchorCertificates:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!v8) {
    goto LABEL_12;
  }
  if (!SecTrustEvaluateWithError(v8, &error))
  {
    if (error)
    {
      CFIndex Code = CFErrorGetCode(error);
      CFErrorRef v17 = error;
    }

    else
    {
      CFErrorRef v17 = 0LL;
      CFIndex Code = -1LL;
    }

    uint64_t v18 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  Code,  v17,  @"trust evaluation of signer failed");
    uint64_t v19 = *(void *)(a1[7] + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    goto LABEL_11;
  }

  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = *(void *)(a1[7] + 8LL);
  id v22 = *(id *)(v12 + 40);
  int v13 = [v3 verifyCountersignaturesAndCountersignersWithPolicies:v9 verifyTime:v10 anchorCertificates:v11 error:&v22];
  objc_storeStrong((id *)(v12 + 40), v22);
  if (!v13
    || (uint64_t v14 = *(void *)(a1[7] + 8LL),
        id v21 = *(id *)(v14 + 40),
        int v15 = [v3 verifyTimestamps:&v21],
        objc_storeStrong((id *)(v14 + 40), v21),
        !v15))
  {
LABEL_11:
    CFRelease(v8);
LABEL_12:
    *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = 1;
    goto LABEL_6;
  }

  CFRelease(v8);
LABEL_6:
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSArray count](self->_signers, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__2;
  CFErrorRef v17 = __Block_byref_object_dispose__2;
  if (a3)
  {
    id v5 = *a3;
    if (*a3) {
      id v5 = (id)[v5 copy];
    }
  }

  else
  {
    id v5 = 0LL;
  }

  id v18 = v5;
  id signers = self->_signers;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __59__MSCMSCountersignatureAttribute_encodeAttributeWithError___block_invoke;
  v12[3] = &unk_189B4ADB8;
  v12[4] = &v13;
  v12[5] = &v19;
  -[NSArray enumerateObjectsUsingBlock:](signers, "enumerateObjectsUsingBlock:", v12);
  if ([(id)v20[5] count])
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.6", a3);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[MSCMSAttribute initWithAttributeType:values:](v7, "initWithAttributeType:values:", v8, v20[5]);

    if (!a3) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
    if (!a3) {
      goto LABEL_11;
    }
  }

  uint64_t v10 = (void *)v14[5];
  if (v10) {
    *a3 = v10;
  }
LABEL_11:
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __59__MSCMSCountersignatureAttribute_encodeAttributeWithError___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v6 = a2;
  uint64_t v7 = malloc(0x68uLL);
  uint64_t v8 = [v6 containingSignerInfo];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = (void *)v8;
  [v6 containingSignerInfo];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 signature];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id obj = *(id *)(v12 + 40);
    int v13 = [v6 encodeSignerInfo:v7 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      uint64_t v14 = length_SignerInfo();
      [MEMORY[0x189603FB8] dataWithLength:v14];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        uint64_t v19 = 12LL;
        goto LABEL_9;
      }

      id v16 = v15;
      [v16 mutableBytes];
      int v17 = encode_SignerInfo();
      if (v17)
      {
        int v18 = v17;

        uint64_t v19 = v18;
LABEL_9:
        v23 = (void *)MEMORY[0x189607870];
        uint64_t v32 = *MEMORY[0x1896075E0];
        v33[0] = @"Failed encoding type SignerInfo";
        [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = [v23 errorWithDomain:@"com.apple.HeimASN1" code:v19 userInfo:v24];
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 8LL);
        id v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        goto LABEL_12;
      }

      if (v14 != v30)
      {
        id v28 = (MSCMSCountersignatureAttribute *)asn1_abort();
        -[MSCMSCountersignatureAttribute containingSignerInfo](v28, v29);
        return;
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
    }
  }

  else
  {
LABEL_7:
    uint64_t v20 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  0LL,  @"counter signer has no reference to a signer with a signature");
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }

- (MSCMSSignerInfo)containingSignerInfo
{
  return (MSCMSSignerInfo *)objc_loadWeakRetained((id *)&self->_containingSignerInfo);
}

- (NSArray)signers
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (unint64_t)chainMode
{
  return self->_chainMode;
}

- (void)setChainMode:(unint64_t)a3
{
  self->_chainMode = a3;
}

- (NSArray)additionalCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAdditionalCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end