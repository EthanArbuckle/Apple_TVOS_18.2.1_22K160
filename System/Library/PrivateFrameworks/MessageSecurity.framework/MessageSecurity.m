id findBestMutuallySupportedSignatureAlgorithm(__SecCertificate *a1, void *a2)
{
  id v3;
  uint64_t KeyTypeForCertificate;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  v3 = a2;
  KeyTypeForCertificate = getKeyTypeForCertificate(a1);
  if (KeyTypeForCertificate == 1)
  {
    v8 = findBestMutuallySupportedRSASignatureAlgorithm_onceToken;
    v9 = v3;
    if (v8 != -1) {
      dispatch_once(&findBestMutuallySupportedRSASignatureAlgorithm_onceToken, &__block_literal_global_11);
    }
    v7 = &findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
  }

  else
  {
    if (KeyTypeForCertificate != 3)
    {
      v10 = 0LL;
      goto LABEL_11;
    }

    v5 = findBestMutuallySupportedECSignatureAlgorithm_onceToken;
    v6 = v3;
    if (v5 != -1) {
      dispatch_once(&findBestMutuallySupportedECSignatureAlgorithm_onceToken, &__block_literal_global_10);
    }
    v7 = &findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
  }

  findBestMutuallySupportAlgorithm((void *)*v7, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v10;
}

uint64_t getKeyTypeForCertificate(__SecCertificate *a1)
{
  if (!a1) {
    return -1LL;
  }
  SecKeyRef v1 = SecCertificateCopyKey(a1);
  if (!v1) {
    return -1LL;
  }
  SecKeyRef v2 = v1;
  uint64_t AlgorithmId = SecKeyGetAlgorithmId();
  CFRelease(v2);
  return AlgorithmId;
}

id findBestMutuallySupportedKeyEncryptionAlgorithm(void *a1)
{
  uint64_t v1 = findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&findBestMutuallySupportedKeyEncryptionAlgorithm_onceToken, &__block_literal_global);
  }
  findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __findBestMutuallySupportedKeyEncryptionAlgorithm_block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.45", 0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v1];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.25", 0LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v2];
  v3 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.5", 0LL);
  [v0 addObject:v3];
  v4 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.16.3.7", 0LL);
  [v0 addObject:v4];
  v5 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.42", 0LL);
  [v0 addObject:v5];
  v6 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.22", 0LL);
  [v0 addObject:v6];
  v7 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.2", 0LL);
  [v0 addObject:v7];
  v8 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.3.7", 0LL);
  [v0 addObject:v8];
  v9 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.3.2", 0LL);
  [v0 addObject:v9];

  v10 = (void *)findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedKeyEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;
}

id findBestMutuallySupportAlgorithm(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    v16 = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    id v18 = 0LL;
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2020000000LL;
    v12[3] = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __findBestMutuallySupportAlgorithm_block_invoke;
    v8[3] = &unk_189B4A438;
    id v9 = v4;
    v10 = &v13;
    v11 = v12;
    [v3 enumerateObjectsUsingBlock:v8];
    id v6 = (id)v14[5];

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }

  else
  {
    [v3 objectAtIndex:0];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void sub_1810F08F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id findBestMutuallySupportedEncryptionAlgorithm(void *a1)
{
  uint64_t v1 = findBestMutuallySupportedEncryptionAlgorithm_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&findBestMutuallySupportedEncryptionAlgorithm_onceToken, &__block_literal_global_2);
  }
  findBestMutuallySupportAlgorithm((void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences, v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __findBestMutuallySupportedEncryptionAlgorithm_block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.42", 0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v1];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.22", 0LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v2];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"2.16.840.1.101.3.4.1.2", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v3];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.3.7", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v4];
  v5 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.3.2", 0LL);
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences;
  findBestMutuallySupportedEncryptionAlgorithm_keyEncryptionPreferences = (uint64_t)v0;
}

id MSDecryptGCMOneShot(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (void *)MEMORY[0x189603FB8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  objc_msgSend(v9, "dataWithLength:", objc_msgSend(v10, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v13;
  [v15 bytes];
  [v15 length];

  id v16 = v12;
  [v16 bytes];
  [v16 length];

  id v17 = v10;
  [v17 bytes];
  uint64_t v18 = [v17 length];

  id v19 = v14;
  uint64_t v20 = [v19 mutableBytes];
  id v21 = v11;
  uint64_t v22 = [v21 bytes];
  uint64_t v23 = [v21 length];

  uint64_t v30 = v22;
  uint64_t v24 = CCCryptorGCMOneshotDecrypt();
  if ((_DWORD)v24)
  {
    uint64_t v25 = v24;
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_4);
    }
    v26 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v25;
      _os_log_impl(&dword_1810EE000, v26, OS_LOG_TYPE_ERROR, "Error decrypting underlying crypto error %d", buf, 8u);
    }

    if (a6)
    {
      id v27 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  (int)v25,  *a6,  @"MSDecryptGCM error: %d",  v25,  v20,  v30,  v23);
      *a6 = v27;
    }

    else
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  (int)v25,  0LL,  @"MSDecryptGCM error: %d",  v25,  v20,  v30,  v23);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }

    v28 = 0LL;
  }

  else
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithData:", v19, v18, v20, v22, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

void __MSDecryptGCMOneShot_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findBestMutuallySupportedECSignatureAlgorithm_block_invoke()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.3.3", 0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v1];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.3.2", 0LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v2];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.3.4", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v3];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.3.1", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v4];
  v5 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.10045.4.1", 0LL);
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedECSignatureAlgorithm_ecPreferences;
  findBestMutuallySupportedECSignatureAlgorithm_ecPreferences = (uint64_t)v0;
}

void __findBestMutuallySupportedRSASignatureAlgorithm_block_invoke()
{
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.1.12", 0LL);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v1];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.1.11", 0LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v2];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.1.13", 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v3];

  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.1.14", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 addObject:v4];
  v5 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.1.5", 0LL);
  [v0 addObject:v5];

  id v6 = (void *)findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences;
  findBestMutuallySupportedRSASignatureAlgorithm_rsaPreferences = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __findBestMutuallySupportAlgorithm_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  v8 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  id v15 = __findBestMutuallySupportAlgorithm_block_invoke_2;
  id v16 = &unk_189B4A410;
  id v9 = v7;
  id v17 = v9;
  uint64_t v18 = &v19;
  [v8 enumerateObjectsUsingBlock:&v13];
  uint64_t v10 = v20[3];
  if (v10 == objc_msgSend(*(id *)(a1 + 32), "count", v13, v14, v15, v16))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }

  unint64_t v11 = v20[3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (v11 > *(void *)(v12 + 24))
  {
    *(void *)(v12 + 24) = v11;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  _Block_object_dispose(&v19, 8);
}

void sub_1810F1134( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __findBestMutuallySupportAlgorithm_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 containsObject:*(void *)(a1 + 32)];
  if ((_DWORD)result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
  return result;
}

LABEL_32:
  if (([v9 isEqualToString:@"2.16.840.1.101.3.4.1.42"] & 1) == 0
    && ([v9 isEqualToString:@"2.16.840.1.101.3.4.1.22"] & 1) == 0
    && ([v9 isEqualToString:@"2.16.840.1.101.3.4.1.2"] & 1) == 0
    && ([v9 isEqualToString:@"1.2.840.113549.3.7"] & 1) == 0
    && ![v9 isEqualToString:@"1.2.840.113549.3.2"])
  {
    v26 = 0LL;
    goto LABEL_44;
  }

  uint64_t v34 = -[MSAlgorithmIdentifier initWithOID:](objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier), "initWithOID:", v9);
  v35 = -[MSAlgorithmIdentifier blockSize:](v34, "blockSize:", 0LL);

  v36 = malloc(v35);
  SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], v35, v36);
  *(void *)buf = v35;
  *(void *)&buf[8] = v36;
  v37 = length_DataContent();
  [MEMORY[0x189603FB8] dataWithLength:v37];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v26 = v38;
    -[MSOID mutableBytes](v26, "mutableBytes");
    v39 = encode_DataContent();
    if (!v39)
    {
      if (v37 != v59) {
        goto LABEL_56;
      }
      goto LABEL_43;
    }

    v40 = v39;

    v41 = v40;
  }

  else
  {
    v41 = 12LL;
  }

  v42 = (void *)MEMORY[0x189607870];
  v63 = *MEMORY[0x1896075E0];
  v64 = @"Failed encoding type DataContent";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 errorWithDomain:@"com.apple.HeimASN1" code:v41 userInfo:v43];
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0LL;
LABEL_43:
  free(v36);
LABEL_44:
  v45 = -[MSAlgorithmIdentifier initWithOID:parameters:]( objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier),  "initWithOID:parameters:",  v9,  v26);
  -[MSAlgorithmIdentifier asn1AlgId](v45, "asn1AlgId");
  v46 = length_AlgorithmIdentifier();
  [MEMORY[0x189603FB8] dataWithLength:v46];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v47)
  {
    v51 = 12LL;
    goto LABEL_48;
  }

  v48 = v47;
  [v48 mutableBytes];
  -[MSAlgorithmIdentifier asn1AlgId](v45, "asn1AlgId");
  v49 = encode_AlgorithmIdentifier();
  if (v49)
  {
    v50 = v49;

    v51 = v50;
LABEL_48:
    v52 = (void *)MEMORY[0x189607870];
    v61 = *MEMORY[0x1896075E0];
    v62 = @"Failed encoding type AlgorithmIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v52 errorWithDomain:@"com.apple.HeimASN1" code:v51 userInfo:v53];
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0LL;
LABEL_50:
    v55 = -[MSAlgorithmIdentifier initWithOID:parameters:]( objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier),  "initWithOID:parameters:",  keyEncryptionAlgorithm,  v48);
    v56 = v11->_keyEncryptionAlgorithm;
    v11->_keyEncryptionAlgorithm = v55;

    goto LABEL_51;
  }

  if (v46 == *(void *)buf) {
    goto LABEL_50;
  }
LABEL_56:
  v58 = asn1_abort();
  return (MSCMSRecipientInfo *)__82__MSCMSRecipientInfo_initWithCertificate_keyEncryptionAlgorithm_keyWrapAlgorithm___block_invoke(v58);
}

          DecryptedData = 0LL;
          goto LABEL_21;
        }
      }
    }

    uint64_t v34 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v15,  @"unable to encrypt/decrypt the content");

    id v27 = 0LL;
    v26 = 0LL;
    id v15 = (void *)v34;
    goto LABEL_24;
  }

  uint64_t v21 = nsheim_decode_CMSCBCParameter(v17);

  if (v21) {
    goto LABEL_32;
  }
  NSDataFromOctetString(&v38);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  free_CMSCBCParameter();
LABEL_10:
  uint64_t v14 = v20;
  if (v20) {
    uint64_t v22 = (const void *)[v20 bytes];
  }
  else {
    uint64_t v22 = 0LL;
  }
  uint64_t v23 = v35;
  if (CCCryptorCreateWithMode( a3,  a5,  a4,  1u,  v22,  (const void *)[v23 bytes],  objc_msgSend(v23, "length"),  0,  0,  0,  0,  &cryptorRef))
  {
    id v27 = 0LL;
    v26 = 0LL;
    goto LABEL_24;
  }

  if (a3 == 1)
  {
    encryptedContent = self->_encryptedContent;
  }

  else
  {
    if (!-[MSOID isEqualToString:](self->_contentType, "isEqualToString:", @"1.2.840.113549.1.7.1"))
    {
      -[MSCMSMessage encodeMessageSecurityObject:](self->_embeddedContent, "encodeMessageSecurityObject:", 0LL);
      uint64_t v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }

    encryptedContent = self->_dataContent;
  }

  uint64_t v25 = encryptedContent;
LABEL_20:
  v26 = v25;
  if (v25)
  {
    id v27 = objc_msgSend( objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", CCCryptorGetOutputLength(cryptorRef, -[NSData length](v25, "length"), 1));
    v28 = (char *)[v27 mutableBytes];
    v29 = [v27 length];
    uint64_t v30 = cryptorRef;
    v26 = v26;
    if (!CCCryptorUpdate(v30, -[NSData bytes](v26, "bytes"), -[NSData length](v26, "length"), v28, v29, &dataOutMoved))
    {
      v31 = &v28[dataOutMoved];
      v32 = v29 - dataOutMoved;
      if (!CCCryptorFinal(cryptorRef, v31, v29 - dataOutMoved, &dataOutMoved))
      {
        objc_msgSend(v27, "setLength:", dataOutMoved - v32 + objc_msgSend(v27, "length"));
        goto LABEL_24;
      }
    }
  }

  id v27 = 0LL;
LABEL_24:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  if (a8 && v15) {
    *a8 = v15;
  }

  return v27;
}

  uint64_t result = sub_1811296B0();
  __break(1u);
  return result;
}

LABEL_14:
  return v12;
}

  return v17;
}

    id v17 = 0LL;
    goto LABEL_15;
  }

  uint64_t v12 = NSDataFromIntegerArray(a3->components, a3->length);
  OIDBytes = v6->_OIDBytes;
  v6->_OIDBytes = (NSData *)v12;

  uint64_t v14 = v6->_OIDBytes;
  if (!v14)
  {
    if (!a4) {
      goto LABEL_14;
    }
    v8 = MSErrorAllocationDomain[0];
    uint64_t v10 = *a4;
    unint64_t v11 = @"could not parse OID into data";
LABEL_12:
    id v9 = -108LL;
    goto LABEL_13;
  }

  id v15 = NSStringFromOIDData(v14);
  OIDString = v6->_OIDString;
  v6->_OIDString = (NSString *)v15;

  if (!v6->_OIDString)
  {
    if (!a4) {
      goto LABEL_14;
    }
    v8 = MSErrorAllocationDomain[0];
    uint64_t v10 = *a4;
    unint64_t v11 = @"could not parse OID into string";
    goto LABEL_12;
  }

  return v7;
}

  uint64_t v23 = 0LL;
  v8 = v14;
  a5 = v30;
  if (!v30) {
    goto LABEL_26;
  }
LABEL_24:
  if (v20) {
    *a5 = v20;
  }
LABEL_26:
  v28 = v19;

  return v28;
}

  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }

  return self;
}

  if (v10) {
    CFRelease(v10);
  }
  if (v14) {
    CFRelease(v14);
  }

  return self;
}

  swift_bridgeObjectRelease_n();
  uint64_t v13 = (uint64_t *)(v22 + OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if ((unint64_t)*v13 >> 62)
  {
    swift_bridgeObjectRetain_n();
    id v15 = sub_181129680();
    if (v15)
    {
LABEL_16:
      v5 = (void *)sub_18112057C(0LL, (unint64_t *)&unk_18C548160);
      if (v15 >= 1)
      {
        for (j = 0LL; j != v15; ++j)
        {
          if ((v14 & 0xC000000000000001LL) != 0) {
            id v17 = (id)MEMORY[0x186E061EC](j, v14);
          }
          else {
            id v17 = *(id *)(v14 + 8 * j + 32);
          }
          uint64_t v18 = v17;
          uint64_t v19 = objc_msgSend(v17, sel_attributeType);
          uint64_t v20 = sub_18112962C();

          if ((v20 & 1) != 0)
          {
            uint64_t v21 = v18;
            MEMORY[0x186E06144]();
            if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
              sub_1811295F0();
            }
            sub_181129608();
            sub_1811295E4();
          }
        }

        goto LABEL_27;
      }

LABEL_20:
  return v21;
}

  return v30;
}

  if (v12 != v29)
  {
    asn1_abort();
LABEL_22:
    id v17 = 12LL;
    if (a3)
    {
LABEL_23:
      uint64_t v21 = (void *)MEMORY[0x189607870];
      int v33 = *MEMORY[0x1896075E0];
      v34[0] = @"Failed encoding type SecCMS_SMIMEEncryptionKeyPreference";
      uint64_t v22 = (void *)MEMORY[0x189603F68];
      uint64_t v23 = (const __CFString **)v34;
      uint64_t v24 = &v33;
LABEL_26:
      [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 errorWithDomain:@"com.apple.HeimASN1" code:v17 userInfo:v25];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  v26 = 0LL;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (v20) {
    *a3 = v20;
  }
LABEL_25:

  return v26;
}

LABEL_36:
                if (!a6)
                {
LABEL_39:
                  uint64_t v18 = v38;

                  goto LABEL_40;
                }

      uint64_t v19 = 0LL;
      uint64_t v23 = 0LL;
      goto LABEL_31;
    }

LABEL_37:
                if (v10) {
                  *a6 = v10;
                }
                goto LABEL_39;
              }

              uint64_t v30 = 0LL;
              int v33 = 0LL;
            }

            else
            {
              +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v10,  @"decode failed for recipientInfo (keyEncryptionAlgorithm)");
              v43 = v42 = v26;

              v29 = 0LL;
              uint64_t v30 = 0LL;
              int v33 = 0LL;
              uint64_t v10 = (id)v43;
              v26 = v42;
            }

            v38 = 0LL;
            goto LABEL_31;
          }
        }

        else
        {
        }

        uint64_t v21 = (void *)v22;
        break;
      case 2:
        v57 = v10;
        id v16 = &v57;
        CertificateBySubjectKeyID = findCertificateBySubjectKeyID(&v60, v53, v9, &v57);
        goto LABEL_13;
      case 1:
        v58 = v10;
        id v16 = &v58;
        CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber(&v60, v53, v9, &v58);
LABEL_13:
        uint64_t v19 = (const void *)CertificateBySubjectKeyID;
        uint64_t v20 = *v16;

        uint64_t v21 = 0LL;
        goto LABEL_18;
      default:
        uint64_t v21 = 0LL;
        uint64_t v20 = v10;
        break;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v20,  @"decode failed for recipientInfo (originator)");
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();

    v38 = 0LL;
    int v33 = 0LL;
    uint64_t v30 = 0LL;
    v29 = 0LL;
    v52 = 0LL;
    v26 = 0LL;
    goto LABEL_36;
  }

  uint64_t v18 = 0LL;
LABEL_40:

  return v18;
}

  if (a4 && v7) {
    *a4 = v7;
  }
  if ((v36 & 1) == 0)
  {
    free_SignerInfo();
    v41 = 0;
    a3->var6 = 0LL;
    *(_OWORD *)&a3->var4.var0.components = 0u;
    a3->var5 = 0u;
    *(_OWORD *)&a3->var2.var0.components = 0u;
    *(_OWORD *)&a3->var3 = 0u;
    *(_OWORD *)&a3->var0 = 0u;
    *(_OWORD *)&a3->var1.var1 = 0u;
    goto LABEL_43;
  }

LABEL_56:
      uint64_t v24 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      v26 = 0LL;
      v28 = 0LL;
      uint64_t v30 = 0LL;
      if (!IdentityByCertificate) {
        goto LABEL_40;
      }
      goto LABEL_36;
    }

    valuePtr = v13;
    uint64_t v14 = (unint64_t)(v13 + 7) >> 3;
    goto LABEL_16;
  }

  originator = self->_originator;
  IdentityByCertificate = self->_originatorIdentity;
  if (!originator)
  {
    if (IdentityByCertificate) {
      goto LABEL_20;
    }
LABEL_58:
    uint64_t v24 = 0LL;
    goto LABEL_52;
  }

  if (IdentityByCertificate)
  {
LABEL_20:
    CFRetain(self->_originatorIdentity);
    goto LABEL_21;
  }

  IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(originator, 0LL, 0LL);
LABEL_21:
  uint64_t v23 = self->_recipientCertificates;
  if (!v23 || !-[NSArray count](v23, "count")) {
    goto LABEL_55;
  }
  uint64_t v22 = SecCertificateCopyKey((SecCertificateRef)-[NSArray objectAtIndex:]( self->_recipientCertificates,  "objectAtIndex:",  0LL));
  uint64_t v21 = 0LL;
  uint64_t v20 = 0LL;
  id v16 = 0LL;
LABEL_24:
  if (!IdentityByCertificate)
  {
    uint64_t v30 = 0LL;
    v28 = 0LL;
    v26 = 0LL;
    uint64_t v24 = 0LL;
    if (!v22) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }

  uint64_t v24 = 0LL;
  if (SecIdentityCopyPrivateKey(IdentityByCertificate, &privateKeyRef) || !privateKeyRef || !v22)
  {
    v26 = 0LL;
    v28 = 0LL;
    uint64_t v30 = 0LL;
    goto LABEL_36;
  }

  if (v5) {
    uint64_t v25 = -[MSCMSRecipientInfo createSecCMSSharedInfo:](self, "createSecCMSSharedInfo:", v8);
  }
  else {
    uint64_t v25 = -[MSCMSRecipientInfo createSharedInfo:](self, "createSharedInfo:", v8);
  }
  v26 = v25;
  if (!v25 || (int v33 = [v8 keySize:0], (unint64_t)(v33 - 0x7FFFFFFF) < 0xFFFFFFFF80000002))
  {
    uint64_t v24 = 0LL;
    v28 = 0LL;
LABEL_62:
    uint64_t v30 = 0LL;
    goto LABEL_36;
  }

  id v27 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v33);
  v28 = v27;
  if (!v27)
  {
    uint64_t v24 = 0LL;
    goto LABEL_62;
  }

  v29 = (void *)*MEMORY[0x18960BD80];
  v37[0] = *(void **)MEMORY[0x18960BD78];
  v37[1] = v29;
  v36[0] = v27;
  v36[1] = v26;
  uint64_t v30 = CFDictionaryCreate(0LL, (const void **)v37, (const void **)v36, 2LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (v30) {
    uint64_t v24 = SecKeyCopyKeyExchangeResult(privateKeyRef, (SecKeyAlgorithm)*MEMORY[0x18960BC18], v22, v30, 0LL);
  }
  else {
    uint64_t v24 = 0LL;
  }
LABEL_36:
  CFRelease(IdentityByCertificate);
  v31 = privateKeyRef;
  if (privateKeyRef)
  {
    privateKeyRef = 0LL;
    CFRelease(v31);
  }

  if (!v22) {
    goto LABEL_40;
  }
LABEL_39:
  CFRelease(v22);
LABEL_40:
  if (v16) {
    CFRelease(v16);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (v30) {
    CFRelease(v30);
  }
LABEL_52:

  return v24;
}

    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    v26 = sub_181123908(a6);
  }

LABEL_8:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }

  return v26;
}

    uint64_t v14 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x1896075E0];
    v23[0] = @"Failed encoding type SMIMECapabilities";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 errorWithDomain:@"com.apple.HeimASN1" code:v12 userInfo:v15];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  uint64_t v10 = v9;
  [v10 mutableBytes];
  unint64_t v11 = encode_SMIMECapabilities();
  if (v11)
  {

    uint64_t v12 = v11;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (v8 == v17) {
    goto LABEL_11;
  }
  uint64_t result = (id)asn1_abort();
  __break(1u);
  return result;
}

    id v17 = 0LL;
    goto LABEL_13;
  }

  [v6 attributeValues];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectAtIndex:0];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = nsheim_decode_AppleHashAgilityValue(v11);

  if (v12)
  {
    if (a4)
    {
      uint64_t v13 = MSErrorASN1Domain[0];
      uint64_t v14 = v12;
      id v15 = *a4;
      id v16 = @"unable to decode Apple Hash Agility Attribute";
LABEL_7:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v13,  v14,  v15,  v16);
      id v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }

    goto LABEL_8;
  }

  [MEMORY[0x189603F48] dataWithBytes:v21 length:v20];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    free_AppleHashAgilityValue();
    id v7 = -[MSCMSAppleHashAgilityAttribute initWithHashAgilityValue:](v7, "initWithHashAgilityValue:", v18);
    id v17 = v7;
  }

  else
  {
    id v17 = 0LL;
  }

LABEL_13:
  return v17;
}
}

  uint64_t v30 = a5;
  uint64_t v14 = v8;
  id v15 = self->_encryptionAlgorithm;
  uint64_t v34 = 0LL;
  id v16 = -[MSAlgorithmIdentifier ccMode:](v15, "ccMode:", &v34);
  id v17 = v34;
  if (v17)
  {
    uint64_t v23 = v17;
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v9,  @"unable to encrypt/decrypt the content");
    uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = 0LL;
LABEL_22:
    v8 = v14;
    a5 = v30;
    goto LABEL_23;
  }

  if (!(_DWORD)v6)
  {
    int v33 = v9;
    -[MSCMSEnvelopedData encodeEncryptionParameters:](self, "encodeEncryptionParameters:", &v33);
    uint64_t v18 = v33;

    id v9 = v18;
  }

  v32 = v9;
  -[MSCMSEnvelopedData bulkEncryptDecrypt:algorithm:mode:key:iv:error:]( self,  "bulkEncryptDecrypt:algorithm:mode:key:iv:error:",  v6,  v11,  v16,  v13,  0LL,  &v32);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v32;

  if ((_DWORD)v6 == 1)
  {
    [v14 keyEncryptionAlgorithm];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 algorithm];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v21 isEqualToString:@"1.3.133.16.840.63.0.2"])
    {
      uint64_t v22 = -[MSCMSEnvelopedData checkDecryptionResult:](self, "checkDecryptionResult:", v19);

      if (v22) {
        goto LABEL_14;
      }
      [v14 key:1];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v20;
      -[MSCMSEnvelopedData bulkEncryptDecrypt:algorithm:mode:key:iv:error:]( self,  "bulkEncryptDecrypt:algorithm:mode:key:iv:error:",  1LL,  v11,  v16,  v9,  0LL,  &v31);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v31;

      if (-[MSCMSEnvelopedData checkDecryptionResult:](self, "checkDecryptionResult:", v25))
      {
        id v27 = v25;

        uint64_t v19 = v27;
      }

      uint64_t v23 = 0LL;
      uint64_t v20 = v26;
    }

    else
    {

      uint64_t v23 = 0LL;
    }

    goto LABEL_22;
  }

LABEL_23:
    uint64_t v12 = 0LL;
    DecryptedData = 0LL;
    goto LABEL_24;
  }

  DecryptedData = SecKeyCreateDecryptedData( privateKeyRef,  (SecKeyAlgorithm)*MEMORY[0x18960BCC8],  (CFDataRef)-[NSArray objectAtIndex:](self->_encryptedKeys, "objectAtIndex:", 0LL),  0LL);
  uint64_t v12 = 0LL;
LABEL_24:
  CFRelease(v7);
  uint64_t v23 = privateKeyRef;
  if (privateKeyRef)
  {
    privateKeyRef = 0LL;
    CFRelease(v23);
  }

  der_free_octet_string();
  if (v12) {
    CFRelease(v12);
  }
  return DecryptedData;
}

        ++v15;
      }

      while (v15 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v12)
      {
LABEL_25:

        uint64_t v10 = v27;
        break;
      }
    }
  }
}

        unint64_t v11 = 0LL;
        goto LABEL_24;
      }

      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_7);
      }
      uint64_t v12 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      uint64_t v13 = "Found unsupported content type: AuthenticatedData";
    }

    _os_log_impl(&dword_1810EE000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v18, 2u);
    goto LABEL_23;
  }

  uint64_t v10 = &OBJC_CLASS___MSCMSSignedData;
LABEL_6:
  -[__objc2_class decodeMessageSecurityObject:options:error:]( v10,  "decodeMessageSecurityObject:options:error:",  v8,  v9,  a4);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v11;
}

  uint64_t v20 = (void *)_SecSecuritydCopyWhoAmI();
  uint64_t v18 = v20;
  id v16 = 0LL;
  if (!v20)
  {
    id v17 = 0LL;
    goto LABEL_47;
  }

  [v20 objectForKey:@"status"];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_46:
    id v16 = 0LL;
    goto LABEL_47;
  }

  [v18 objectForKey:@"musr"];
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v18 objectForKey:@"system-keychain"];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || !v17 || [v17 length] != 16)
  {

    goto LABEL_46;
  }

  id v17 = v17;
  uint64_t v22 = [v17 bytes];
  uint64_t v24 = *(void *)v22 != 0x104B57A5353A5AA7LL || *(_DWORD *)(v22 + 8) != -1803342146;

  if (v24) {
    goto LABEL_46;
  }
  [MEMORY[0x189603FC8] dictionaryWithDictionary:v1];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE70]];
  if (SecItemCopyMatching((CFDictionaryRef)v16, &result)) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v4;
  }
  if (v25 != 1) {
    goto LABEL_47;
  }
  v26 = result;
  if (result) {
    id v27 = v4;
  }
  else {
    id v27 = 0;
  }
  if (v27 == 1)
  {
    v28 = CFGetTypeID(result);
    v29 = CFArrayGetTypeID();
    v26 = result;
    if (v28 == v29)
    {
      [v2 addObjectsFromArray:result];
LABEL_57:
      v26 = result;
      goto LABEL_58;
    }
  }

  if (v26) {
    v32 = v4;
  }
  else {
    v32 = 0;
  }
  if (v32 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_57;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v14;
}

  v28 = +[MSAlgorithmIdentifier digestAlgorithmWithSignatureAlgorithm:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "digestAlgorithmWithSignatureAlgorithm:error:");
  digestAlgorithm = v8->_digestAlgorithm;
  v8->_digestAlgorithm = (MSAlgorithmIdentifier *)v28;

  if (!v8->_digestAlgorithm)
  {
    uint64_t v30 = 0LL;
    goto LABEL_26;
  }

id NSDataFromIntegerArray(_DWORD *a1, unint64_t a2)
{
  if (a2 >= 2 && *a1 <= 6u && (unsigned int v3 = a1[1], v3 <= 0x27))
  {
    char v14 = v3 + 40 * *a1;
    [MEMORY[0x189603FB8] dataWithBytes:&v14 length:1];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2 >= 3)
    {
      unint64_t v7 = 2LL;
      do
      {
        uint64_t v8 = 0LL;
        unsigned int v9 = a1[v7];
        char v13 = v9 & 0x7F;
        int16x8_t v10 = (int16x8_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v9), (uint32x4_t)xmmword_18112BBC0);
        v10.i64[0] = *(void *)&vmovn_s32((int32x4_t)v10) | 0x80008000800080LL;
        unsigned __int32 v12 = vmovn_s16(v10).u32[0];
        do
          int v11 = *((unsigned __int8 *)&v12 + v8++);
        while (v11 == 128);
        [v4 appendBytes:(char *)&v12 + v8 - 1 length:6 - v8];
        unint64_t v7 = (v7 + 1);
      }

      while (v7 < a2);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

LABEL_7:
    char v13 = 0LL;
    goto LABEL_8;
  }

  if (!-[MSOID setAsn1OidFromOIDString:error:](v9, "setAsn1OidFromOIDString:error:", v12, a4)) {
    goto LABEL_7;
  }
LABEL_4:
  char v13 = v9;
LABEL_8:

  return v13;
}

  id v17 = v6;
LABEL_15:

  return v17;
}

  sub_18111DC68();
  swift_allocError();
  *(_OWORD *)char v14 = xmmword_18112C330;
  *(_BYTE *)(v14 + 16) = 48;
LABEL_8:
  swift_willThrow();
  return v0;
}

id NSStringFromOIDData(void *a1)
{
  id v1 = a1;
  if (![v1 length] || (unint64_t)objc_msgSend(v1, "length") > 0x20)
  {
    id v2 = 0LL;
    goto LABEL_20;
  }

  id v3 = v1;
  unsigned int v4 = *(unsigned __int8 *)[v3 bytes];
  id v5 = v3;
  unsigned __int8 v6 = *(_BYTE *)[v5 bytes] % 0x28u;
  unsigned int v7 = 40 * (v4 / 0x28) - 80;
  if (v4 <= 0x77) {
    uint64_t v8 = v4 / 0x28;
  }
  else {
    uint64_t v8 = 2LL;
  }
  if (v4 <= 0x77) {
    unsigned int v7 = 0;
  }
  objc_msgSend(MEMORY[0x189607940], "stringWithFormat:", @"%u.%u", v8, v7 + v6);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v5 length] < 2)
  {
LABEL_17:
    id v2 = v9;
    goto LABEL_19;
  }

  int v10 = 0;
  int v11 = 0;
  unsigned int v12 = 2;
  uint64_t v13 = 1LL;
  unsigned int v14 = 2;
  while (1)
  {
    id v15 = v5;
    uint64_t v16 = *(_BYTE *)([v15 bytes] + v13) & 0x7F | (v11 << 7);
    id v17 = v15;
    objc_msgSend(v9, "appendFormat:", @".%u", v16);
    if (v14 > 0x13) {
      goto LABEL_18;
    }
    int v10 = 0;
    int v11 = 0;
    ++v14;
LABEL_16:
    uint64_t v13 = v12;
  }

  if (++v10 != 4)
  {
    int v11 = v16;
    goto LABEL_16;
  }

LABEL_18:
  id v2 = 0LL;
LABEL_19:

LABEL_20:
  return v2;
}

  if (v57 && v19) {
    *v57 = v19;
  }
  free_CMSSignedData();
  uint64_t v21 = v9;

  return v21;
}

  return v13;
}
}

LABEL_15:
    unsigned int v9 = 0LL;
    goto LABEL_16;
  }

  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v8,  *a4,  @"unable to copy Algorithm Identifier");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  free(v6->_asn1AlgId);
  unsigned int v9 = 0LL;
  v6->_asn1AlgId = 0LL;
LABEL_16:

  return v9;
}

    goto LABEL_16;
  }

  int v11 = 0;
LABEL_17:

  return v11;
}

      if (v11 == v34)
      {
LABEL_22:
        if ([v13 length])
        {
          v26 = objc_alloc(&OBJC_CLASS___MSAlgorithmIdentifier);
          -[MSAlgorithmIdentifier algorithm](self->_encryptionAlgorithm, "algorithm");
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[MSAlgorithmIdentifier initWithOID:parameters:](v26, "initWithOID:parameters:", v27, v13);

          if (v28)
          {
            v29 = self->_encryptionAlgorithm;
            self->_encryptionAlgorithm = v28;
            uint64_t v30 = v28;

            v31 = 1;
LABEL_25:
            v32 = (uint64_t)v5;
            free(v10);
            id v5 = v13;
            goto LABEL_26;
          }
        }

  if (self->_LAContext && !SecKeySetParameter())
  {
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_47_0);
    }
    uint64_t v22 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = cf;
      _os_log_impl( &dword_1810EE000,  v22,  OS_LOG_TYPE_ERROR,  "failed to set credential reference on signer public key: %@",  buf,  0xCu);
    }

    uint64_t v23 = cf;
    if (cf)
    {
      cf = 0LL;
      CFRelease(v23);
    }
  }

  uint64_t v24 = SecKeyVerifySignature( v8,  v11,  v6,  (CFDataRef)-[MSCMSSignerInfo signature](self, "signature"),  (CFErrorRef *)&cf) != 0;
  uint64_t v25 = (uint64_t)cf;
  if (!cf)
  {
    if (!a3) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }

LABEL_16:
      goto LABEL_17;
    }

    [v5 parameters];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_parameters) {
        goto LABEL_4;
      }
      int v11 = 0;
    }

    else
    {
      int v11 = 1;
    }

void __algorithmOIDToParameters_block_invoke()
{
  v3[27] = *MEMORY[0x1895F89C0];
  v2[0] = @"1.2.840.113549.2.5";
  v2[1] = @"1.3.14.3.2.26";
  v3[0] = MEMORY[0x189604A80];
  v3[1] = MEMORY[0x189604A88];
  v2[2] = @"2.16.840.1.101.3.4.2.4";
  v2[3] = @"2.16.840.1.101.3.4.2.1";
  v3[2] = MEMORY[0x189604A88];
  v3[3] = MEMORY[0x189604A88];
  v2[4] = @"2.16.840.1.101.3.4.2.2";
  v2[5] = @"2.16.840.1.101.3.4.2.3";
  v3[4] = MEMORY[0x189604A88];
  v3[5] = MEMORY[0x189604A88];
  v2[6] = @"1.2.840.113549.1.1.4";
  v2[7] = @"1.2.840.113549.1.1.5";
  v3[6] = MEMORY[0x189604A80];
  v3[7] = MEMORY[0x189604A80];
  v2[8] = @"1.2.840.113549.1.1.14";
  v2[9] = @"1.2.840.113549.1.1.11";
  v3[8] = MEMORY[0x189604A80];
  v3[9] = MEMORY[0x189604A80];
  v2[10] = @"1.2.840.113549.1.1.12";
  v2[11] = @"1.2.840.113549.1.1.13";
  v3[10] = MEMORY[0x189604A80];
  v3[11] = MEMORY[0x189604A80];
  v2[12] = @"1.2.840.10045.4.1";
  v2[13] = @"1.2.840.10045.4.3.1";
  v3[12] = MEMORY[0x189604A88];
  v3[13] = MEMORY[0x189604A88];
  v2[14] = @"1.2.840.10045.4.3.2";
  v2[15] = @"1.2.840.10045.4.3.3";
  v3[14] = MEMORY[0x189604A88];
  v3[15] = MEMORY[0x189604A88];
  v2[16] = @"1.2.840.10045.4.3.4";
  v2[17] = @"1.2.840.113549.1.1.1";
  v3[16] = MEMORY[0x189604A88];
  v3[17] = MEMORY[0x189604A80];
  v2[18] = @"2.16.840.1.101.3.4.1.2";
  v2[19] = @"2.16.840.1.101.3.4.1.22";
  v3[18] = MEMORY[0x189604A80];
  v3[19] = MEMORY[0x189604A80];
  v2[20] = @"2.16.840.1.101.3.4.1.42";
  v2[21] = @"2.16.840.1.101.3.4.1.6";
  v3[20] = MEMORY[0x189604A80];
  v3[21] = MEMORY[0x189604A80];
  v2[22] = @"2.16.840.1.101.3.4.1.26";
  v2[23] = @"2.16.840.1.101.3.4.1.46";
  v3[22] = MEMORY[0x189604A80];
  v3[23] = MEMORY[0x189604A80];
  v2[24] = @"2.16.840.1.101.3.4.1.5";
  v2[25] = @"2.16.840.1.101.3.4.1.25";
  v3[24] = MEMORY[0x189604A88];
  v3[25] = MEMORY[0x189604A88];
  v2[26] = @"2.16.840.1.101.3.4.1.45";
  v3[26] = MEMORY[0x189604A88];
  uint64_t v0 = [MEMORY[0x189603F68] dictionaryWithObjects:v3 forKeys:v2 count:27];
  id v1 = (void *)algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters;
  algorithmOIDToParameters_sAlgorithmOIDStringIsAbsentParameters = v0;
}

void *NSDataFromBaseData(void *a1)
{
  if (a1)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void *NSDataFromOctetString(void *a1)
{
  if (a1)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void *NSDataFromBitString(void *a1)
{
  if (a1)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void *NSDataFromAny(void *a1)
{
  if (a1)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void *NSDataFromAnySet(void *a1)
{
  if (a1)
  {
    [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

void *NSDataFromInteger(void *a1)
{
  id v1 = a1;
  if (a1)
  {
    if (*a1 && !*((_DWORD *)a1 + 4) && *(char *)a1[1] < 0)
    {
      char v4 = 0;
      [MEMORY[0x189603FB8] dataWithBytes:&v4 length:1];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 appendBytes:v1[1] length:*v1];
      [MEMORY[0x189603F48] dataWithData:v3];
      id v1 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", a1[1]);
      id v1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v1;
}

void *NSStringFromUTF8String(void *a1)
{
  if (a1)
  {
    [NSString stringWithUTF8String:*a1];
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

id CertificateSerialNumberData(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = der_length_heim_integer();
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  id v3 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:v1];
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  [v4 mutableBytes];
  else {
    BOOL v5 = v2 == 0;
  }
  if (!v5)
  {

    return 0LL;
  }

  return v4;
}

LABEL_11:
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v15,  -50LL,  0LL,  v14,  v24);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }

  if (!-[MSCMSIdentifier subjectKeyId](self, "subjectKeyId"))
  {
    id v15 = MSErrorCMSDomain[0];
    unsigned int v14 = @"CMSIdentifier has inconsistent type and stored values: expected subjectKeyId";
    goto LABEL_11;
  }

  -[MSCMSIdentifier subjectKeyId](self, "subjectKeyId");
  -[MSCMSIdentifier subjectKeyId](self, "subjectKeyId");
LABEL_7:
  unsigned __int8 v6 = length_CMSIdentifier();
  [MEMORY[0x189603FB8] dataWithLength:v6];
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    int v11 = 12LL;
    goto LABEL_13;
  }

  uint64_t v8 = v7;
  [v8 mutableBytes];
  unsigned int v9 = encode_CMSIdentifier();
  if (v9)
  {
    int v10 = v9;

    int v11 = v10;
LABEL_13:
    id v17 = (void *)MEMORY[0x189607870];
    v26 = *MEMORY[0x1896075E0];
    v27[0] = @"Failed encoding type CMSIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:@"com.apple.HeimASN1" code:v11 userInfo:v18];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    uint64_t v8 = 0LL;
    if (a3) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }

  if (v6 == v25)
  {
    uint64_t v16 = 0LL;
    if (a3)
    {
LABEL_15:
      if (v16) {
        *a3 = v16;
      }
    }

    uint64_t v19 = 0LL;
    goto LABEL_20;
  }

  [v6 attributeValues];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v10 count];

  if (!v11)
  {
    if (a4)
    {
      id v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      uint64_t v18 = @"Missing value for Multiple Signatures attribute";
      uint64_t v16 = -50LL;
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  [v6 attributeValues];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectAtIndex:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v14 = (void *)nsheim_decode_MultipleSignatures(v13);

  if (!(_DWORD)v14)
  {
    v31 = 0LL;
    uint64_t v20 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  v32,  &v31);
    uint64_t v21 = v31;
    bodyHashAlgorithm = v7->_bodyHashAlgorithm;
    v7->_bodyHashAlgorithm = (MSAlgorithmIdentifier *)v20;

    if (v7->_bodyHashAlgorithm)
    {
      uint64_t v30 = v21;
      uint64_t v23 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &v33,  &v30);
      uint64_t v24 = v30;

      signatureAlgorithm = v7->_signatureAlgorithm;
      v7->_signatureAlgorithm = (MSAlgorithmIdentifier *)v23;

      if (!v7->_signatureAlgorithm)
      {
        uint64_t v21 = v24;
        if (a4)
        {
LABEL_17:
          if (v21) {
            *a4 = v21;
          }
        }

    uint64_t v19 = 0LL;
    goto LABEL_18;
  }

  [v6 attributeValues];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v10 count];

  if (v11 != 1)
  {
    if (a4)
    {
      id v15 = MSErrorCMSDomain[0];
      id v17 = *a4;
      uint64_t v18 = @"SMIME Capabilities Attribute should only have one value";
      uint64_t v16 = -50LL;
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  [v6 attributeValues];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectAtIndex:0];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v14 = (void *)nsheim_decode_SMIMECapabilities(v13);

  if ((_DWORD)v14)
  {
    if (a4)
    {
      asn1ErrorToNSError(v14, a4);
      id v15 = MSErrorASN1Domain[0];
      uint64_t v16 = (int)v14;
      id v17 = *a4;
      uint64_t v18 = @"unable to decode SMIME Capabilities Attribute";
LABEL_10:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v15,  v16,  v17,  v18);
      uint64_t v19 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }

    goto LABEL_11;
  }

  [MEMORY[0x189603FE0] set];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    while (1)
    {
      uint64_t v23 = *(void *)(v28 + v21 + 16);
      uint64_t v25 = *(_OWORD *)(v28 + v21);
      v26 = v23;
      uint64_t v19 = -[MSOID initWithAsn1OID:error:](objc_alloc(&OBJC_CLASS___MSOID), "initWithAsn1OID:error:", &v25, a4);
      if (!v19) {
        break;
      }
      [v20 addObject:v19];

      ++v22;
      v21 += 24LL;
      if (v22 >= v27) {
        goto LABEL_16;
      }
    }
  }

  else
  {
LABEL_16:
    objc_storeStrong((id *)&v7->_capabilities, v20);
    free_SMIMECapabilities();
    uint64_t v19 = v7;
  }

LABEL_18:
  return (MSCMSSMIMECapabilitiesAttribute *)v19;
}

    uint64_t v18 = 0LL;
    goto LABEL_19;
  }

  [v6 attributeValues];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 count];

  if (v10 != 1)
  {
    if (a4)
    {
      unsigned int v14 = MSErrorCMSDomain[0];
      uint64_t v16 = *a4;
      id v17 = @"Expiration Time Attribute MUST have a single signed attribute value";
      id v15 = -50LL;
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  [v6 attributeValues];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectAtIndex:0];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = nsheim_decode_Time(v12);

  if (v13)
  {
    if (a4)
    {
      unsigned int v14 = MSErrorASN1Domain[0];
      id v15 = v13;
      uint64_t v16 = *a4;
      id v17 = @"unable to decode Expiration Time value";
LABEL_10:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v14,  v15,  v16,  v17);
      uint64_t v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }

    goto LABEL_11;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MSCMSAppleExpirationTimeAttribute;
  uint64_t v19 = -[MSCMSAppleExpirationTimeAttribute init](&v23, sel_init);
  if (v19)
  {
    if (v24 == 2 || v24 == 1)
    {
      uint64_t v20 = [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v25];
      expirationTime = v19->_expirationTime;
      v19->_expirationTime = (NSDate *)v20;
    }

    else if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -26275LL,  *a4,  @"invalid Time choice in Expiration Time");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  free_Time();
  self = v19;
  uint64_t v18 = self;
LABEL_19:

  return v18;
}

LABEL_17:
    return v8;
  }

  uint64_t v20 = (void *)asn1_abort();
  return +[MSCMSIdentifier decodeIdentifier:error:](v20, v21, v22, v23);
}

  if ([v6 length] >= a3->var0)
  {
    -[MSCMSMutableAttributeArray setEncodedAttributeSet:](v5, "setEncodedAttributeSet:", v6);
    goto LABEL_19;
  }

  return v9;
}

void sub_1810F9A54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1810F9BAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1810F9D20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1810FA0F8(_Unwind_Exception *a1)
{
}

void sub_1810FA24C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1810FA638(_Unwind_Exception *a1)
{
}

void sub_1810FB514( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

void sub_1810FB748( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_54:
  [v62 additionalCertificates];
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    [v62 additionalCertificates];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 addObjectsFromArray:v38];
  }

  -[MSCMSSignedData setCertificates:](v9, "setCertificates:", v20);
  [MEMORY[0x189603FA8] arrayWithCapacity:v75];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v75)
  {
    uint64_t v39 = 0LL;
    v40 = 0LL;
    do
    {
      v41 = *((void *)&v75 + 1);
      [v20 allObjects];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v62 LAContext];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v23;
      v44 = +[MSCMSSignerInfo decodeSignerInfo:certificates:LAContext:error:]( &OBJC_CLASS___MSCMSSignerInfo,  "decodeSignerInfo:certificates:LAContext:error:",  v41 + v39,  v42,  v43,  &v67);
      v45 = v67;

      if (v44)
      {
        [v44 setContainingSignedData:v9];
        [v61 addObject:v44];
        -[MSCMSSignedData addDigestAlgorithmFromSigner:](v9, "addDigestAlgorithmFromSigner:", v44);
        uint64_t v23 = v45;
      }

      else
      {
        +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  2LL,  v45,  @"failed to create signerInfo object for signer %u",  v40);
        uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
      }

      ++v40;
      v39 += 104LL;
    }

    while (v40 < v75);
  }

  -[MSCMSSignedData setSigners:](v9, "setSigners:", v61);
  v66 = v23;
  v46 = -[MSCMSSignedData checkSignedPerRFC5652:](v9, "checkSignedPerRFC5652:", &v66);
  v47 = v66;

  if (!v46)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v47,  @"decode failed for signedData due to RFC 5652 violation");
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }

  -[MSCMSSignedData setOptions:](v9, "setOptions:", v62);
  if ([v62 verifySigners])
  {
    [v62 signerPolicies];
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v62 verifyTime];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v62 anchorCertificates];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v47;
    v51 = -[MSCMSSignedData verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:]( v9,  "verifySignaturesAndSignersWithPolicies:verifyTime:anchorCertificates:error:",  v48,  v49,  v50,  &v65);
    uint64_t v19 = v65;

    if (!v51)
    {
      v52 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorTrustDomain,  -67808LL,  v19,  @"decode failed due to signer verification failure");

      unsigned int v9 = 0LL;
      uint64_t v19 = (id)v52;
    }
  }

  else if (([v62 verifySignatures] & 1) != 0 || objc_msgSend(v62, "verifyTimestamps"))
  {
    v64 = v47;
    v53 = -[MSCMSSignedData verifySignatures:](v9, "verifySignatures:", &v64);
    uint64_t v19 = v64;

    if (!v53)
    {
      v54 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  -67808LL,  v19,  @"decode failed due to signature verification failure");

      unsigned int v9 = 0LL;
      uint64_t v19 = (id)v54;
    }

    if ([v62 verifyTimestamps])
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      v77 = 0x3032000000LL;
      v78 = __Block_byref_object_copy__0;
      v79 = __Block_byref_object_dispose__0;
      v80 = 0LL;
      v63[0] = MEMORY[0x1895F87A8];
      v63[1] = 3221225472LL;
      v63[2] = __61__MSCMSSignedData_decodeMessageSecurityObject_options_error___block_invoke_96;
      v63[3] = &unk_189B4A888;
      v63[4] = buf;
      [v61 enumerateObjectsUsingBlock:v63];
      if (*(void *)(*(void *)&buf[8] + 40) || ![v61 count])
      {
        v55 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCryptoDomain[0],  -67808LL,  v19,  @"decode failed due to timestamp verification failure");

        unsigned int v9 = 0LL;
        uint64_t v19 = (id)v55;
      }

      _Block_object_dispose(buf, 8);
    }
  }

  else
  {
    uint64_t v19 = v47;
  }

void sub_1810FC29C(_Unwind_Exception *a1)
{
}

LABEL_13:
  BOOL v5 = 0LL;
LABEL_19:
  if (a4)
  {
    if (v12) {
      *a4 = v12;
    }
  }

  return v5;
}

    uint64_t v18 = 0LL;
    goto LABEL_14;
  }

  [v6 attributeValues];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 count];

  if (v10 != 1)
  {
    if (a4)
    {
      unsigned int v14 = MSErrorCMSDomain[0];
      uint64_t v16 = *a4;
      id v17 = @"Signing Time Attribute MUST have a single signed attribute value";
      id v15 = -50LL;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  [v6 attributeValues];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectAtIndex:0];
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = nsheim_decode_Time(v12);

  if (v13 || (v24 - 1) <= 1 && v25 == -1)
  {
    if (a4)
    {
      unsigned int v14 = MSErrorASN1Domain[0];
      id v15 = v13;
      uint64_t v16 = *a4;
      id v17 = @"unable to decode Signing Time value";
LABEL_12:
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v14,  v15,  v16,  v17);
      uint64_t v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MSCMSSigningTimeAttribute;
  uint64_t v20 = -[MSCMSSigningTimeAttribute init](&v23, sel_init);
  if (v20)
  {
    if (v24 == 2 || v24 == 1)
    {
      uint64_t v21 = [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)v25];
      signingTime = v20->_signingTime;
      v20->_signingTime = (NSDate *)v21;
    }

    else if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -26275LL,  *a4,  @"invalid Time choice in Signing Time");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  free_Time();
  self = v20;
  uint64_t v18 = self;
LABEL_14:

  return v18;
}

void sub_1810FCCF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_27:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

    unsigned int v14 = 0LL;
  }

  if ([v14 length])
  {
    v26 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.16.2.11", a3);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F18] arrayWithObject:v14];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = -[MSCMSAttribute initWithAttributeType:values:](v26, "initWithAttributeType:values:", v27, v28);
  }

  else
  {
    int v10 = 0LL;
  }

LABEL_32:
  return v10;
}

          int v10 = v39;
          if (!a6) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }

        +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  v18,  @"unable to find a certificate matching the signer");
        unsigned int v12 = (id)objc_claimAutoreleasedReturnValue();

        v40 = 0LL;
        uint64_t v23 = 0LL;
        uint64_t v30 = 0LL;
        v31 = 0LL;
        goto LABEL_33;
      }
    }

    else if (v16 == 2 && [v13 intValue] == 3)
    {
      goto LABEL_9;
    }

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  v12,  @"decode failed for signerInfo due to RFC 5652 violation (version)");
    v29 = v28 = v10;

    v40 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v30 = 0LL;
    v31 = 0LL;
    CertificateForIdentifier = 0LL;
    uint64_t v19 = 0LL;
    unsigned int v12 = (id)v29;
    int v10 = v28;
    if (!a6) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }

  v40 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v30 = 0LL;
  v31 = 0LL;
  CertificateForIdentifier = 0LL;
LABEL_33:
  uint64_t v19 = 0LL;
  if (!a6) {
    goto LABEL_30;
  }
LABEL_28:
  if (v12) {
    *a6 = v12;
  }
LABEL_30:
  v37 = v19;

  return v37;
}

  swift_bridgeObjectRelease_n();
  BOOL v5 = (void *)v23;
LABEL_30:
  result.value._rawValue = v5;
  result.is_nil = v6;
  return result;
}

void sub_1810FD12C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1810FD580( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_12:
    uint64_t v18 = 0LL;
    goto LABEL_17;
  }

  +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", &v21, a4);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    free_ContentType();
    self = -[MSCMSContentTypeAttribute initWithOID:](self, "initWithOID:", v19);
    uint64_t v18 = self;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

LABEL_17:
  return v18;
}

    uint64_t v18 = 0LL;
    goto LABEL_17;
  }

  [MEMORY[0x189603F48] dataWithBytes:v22 length:v21];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    free_MessageDigest();
    self = -[MSCMSMessageDigestAttribute initWithDigest:](self, "initWithDigest:", v19);
    uint64_t v18 = self;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

LABEL_17:
  return v18;
}

  uint64_t v23 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
  +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113635.100.9.2", a3);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = -[MSCMSAttribute initWithAttributeType:values:](v23, "initWithAttributeType:values:", v24, v7);
LABEL_19:

  return v25;
}

  return v22;
}

  free_SignerInfo();
  free(v7);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeAllObjects];
    *a4 = 1;
  }
}

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);

  return v13;
}

LABEL_4:
    int v10 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x1896075E0];
    v22[0] = @"Failed encoding type ContentType";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:@"com.apple.HeimASN1" code:v9 userInfo:v11];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  if (v4 != v20)
  {
    uint64_t v17 = (MSCMSContentTypeAttribute *)asn1_abort();
    return -[MSCMSContentTypeAttribute initWithOID:](v17, v18, v19);
  }

    int v11 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x1896075E0];
    v23[0] = @"Failed encoding type MessageDigest";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:@"com.apple.HeimASN1" code:v10 userInfo:v12];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  if (v5 != v21)
  {
    uint64_t v18 = (MSCMSMessageDigestAttribute *)asn1_abort();
    return -[MSCMSMessageDigestAttribute initWithDigest:](v18, v19, v20);
  }

    int v11 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x1896075E0];
    v22[0] = @"Failed encoding type AppleHashAgilityValue";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:@"com.apple.HeimASN1" code:v10 userInfo:v12];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  if (v5 != v20)
  {
    uint64_t v18 = (MSCMSAppleHashAgilityAttribute *)asn1_abort();
    return -[MSCMSAppleHashAgilityAttribute hashAgilityValue](v18, v19);
  }

LABEL_9:
  if ([v6 length])
  {
    unsigned int v12 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.3", a3);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F18] arrayWithObject:v6];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = -[MSCMSAttribute initWithAttributeType:values:](v12, "initWithAttributeType:values:", v13, v14);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

  if ([v7 length])
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113549.1.9.4", a3);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F18] arrayWithObject:v7];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[MSCMSAttribute initWithAttributeType:values:](v13, "initWithAttributeType:values:", v14, v15);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

  if ([v7 length])
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
    +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113635.100.9.1", a3);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F18] arrayWithObject:v7];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[MSCMSAttribute initWithAttributeType:values:](v13, "initWithAttributeType:values:", v14, v15);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

    uint64_t v13 = 0LL;
    goto LABEL_10;
  }

  CertificateBySubjectKeyID = findCertificateByIssuerAndSerialNumber( (void *)[v10 issuerAndSerialNumber],  v7,  v8,  a4);
LABEL_6:
  uint64_t v13 = CertificateBySubjectKeyID;
LABEL_10:

  return v13;
}

id generalizedTimeStringFromDate(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x189607848];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [MEMORY[0x189603F90] localeWithLocaleIdentifier:@"en_US_POSIX"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyyyMMddHHmmss'Z'"];
  [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setTimeZone:v5];

  [v3 stringFromDate:v2];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id UTCStringFromDate(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x189607848];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [MEMORY[0x189603F90] localeWithLocaleIdentifier:@"en_US_POSIX"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyMMddHHmmss'Z'"];
  [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setTimeZone:v5];

  [v3 stringFromDate:v2];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

LABEL_6:
    uint64_t v15 = (void *)MEMORY[0x189607870];
    id v27 = *MEMORY[0x1896075E0];
    v28[0] = @"Failed encoding type MultipleSignatures";
    [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:@"com.apple.HeimASN1" code:v14 userInfo:v16];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  if (v9 == v26) {
    goto LABEL_11;
  }
  uint64_t v22 = (MSCMSMultipleSignaturesAttribute *)asn1_abort();
  return -[MSCMSMultipleSignaturesAttribute initWithAttribute:error:](v22, v23, v24, v25);
}

LABEL_19:
        free_MultipleSignatures();
        uint64_t v19 = v7;

        goto LABEL_20;
      }

      v29 = v24;
      v26 = +[MSAlgorithmIdentifier algorithmIdentifierWithAsn1AlgId:error:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithAsn1AlgId:error:",  &v34,  &v29);
      uint64_t v21 = v29;

      signedAttrsHashAlgorithm = v7->_signedAttrsHashAlgorithm;
      v7->_signedAttrsHashAlgorithm = (MSAlgorithmIdentifier *)v26;

      if (v7->_signedAttrsHashAlgorithm) {
        objc_storeWeak((id *)&v7->_signedAttrsHash, 0LL);
      }
    }

    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }

  if (!a4) {
    goto LABEL_11;
  }
  asn1ErrorToNSError(v14, a4);
  uint64_t v15 = MSErrorASN1Domain[0];
  uint64_t v16 = (int)v14;
  uint64_t v17 = *a4;
  uint64_t v18 = @"unable to decode Multiple Signatures attribute";
LABEL_10:
  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v15,  v16,  v17,  v18);
  uint64_t v19 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v19;
}

void sub_1810FFC7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void _MSLog(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  switch(a1)
  {
    case 1LL:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5);
        }
        uint64_t v4 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 138543362;
          id v11 = v3;
          BOOL v5 = (os_log_s *)v4;
          os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
          goto LABEL_25;
        }
      }

      break;
    case 2LL:
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_4_0);
        }
        uint64_t v7 = MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_INFO))
        {
          int v10 = 138543362;
          id v11 = v3;
          BOOL v5 = (os_log_s *)v7;
          os_log_type_t v6 = OS_LOG_TYPE_INFO;
          goto LABEL_25;
        }
      }

      break;
    case 3LL:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
      }
      uint64_t v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v3;
        goto LABEL_20;
      }

      break;
    case 4LL:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_8);
      }
      uint64_t v8 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v3;
LABEL_20:
        BOOL v5 = (os_log_s *)v8;
        os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_25;
      }

      break;
    case 5LL:
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_10_1);
      }
      uint64_t v9 = MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543362;
        id v11 = v3;
        BOOL v5 = (os_log_s *)v9;
        os_log_type_t v6 = OS_LOG_TYPE_ERROR;
LABEL_25:
        _os_log_impl(&dword_1810EE000, v5, v6, "%{public}@", (uint8_t *)&v10, 0xCu);
      }

      break;
    default:
      break;
  }
}

void sub_181102704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_181102F4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1811030E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1811033C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_181103788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_181103ADC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id decodeEmbeddedCMSContent(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (!v8) {
    goto LABEL_23;
  }
  if (![v7 isEqualToString:@"1.2.840.113549.1.7.2"])
  {
    if ([v7 isEqualToString:@"1.2.840.113549.1.7.3"])
    {
      int v10 = &OBJC_CLASS___MSCMSEnvelopedData;
      goto LABEL_6;
    }

    if ([v7 isEqualToString:@"1.2.840.113549.1.7.5"])
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_6);
      }
      uint64_t v12 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      uint64_t v13 = "Found unsupported content type: DigestedData";
    }

    else if ([v7 isEqualToString:@"1.2.840.113549.1.7.6"])
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_5_0);
      }
      uint64_t v12 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
      if (!os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      LOWORD(v1_Block_object_dispose(va, 8) = 0;
      uint64_t v13 = "Found unimplemented contented type: EncryptedData";
    }

    else
    {
      if (![v7 isEqualToString:@"1.2.840.113549.1.9.16.1.2"])
      {
        if ([v7 isEqualToString:@"1.2.840.113549.1.9.16.1.23"])
        {
          int v10 = &OBJC_CLASS___MSCMSAuthEnvelopedData;
          goto LABEL_6;
        }

        if ([v7 isEqualToString:@"1.2.840.113549.1.9.16.1.9"])
        {
          int v10 = &OBJC_CLASS___MSCMSCompressedData;
          goto LABEL_6;
        }

        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_11_0);
        }
        uint64_t v15 = (void *)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = v15;
          [v7 OIDString];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v18 = 138412290;
          uint64_t v19 = v17;
          _os_log_impl( &dword_1810EE000,  v16,  OS_LOG_TYPE_ERROR,  "Found unknown content type: %@",  (uint8_t *)&v18,  0xCu);
        }

void __decodeEmbeddedCMSContent_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __decodeEmbeddedCMSContent_block_invoke_4()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __decodeEmbeddedCMSContent_block_invoke_6()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __decodeEmbeddedCMSContent_block_invoke_10()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  uint64_t v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

SecCertificateRef MSSecIdentityCopyCertificateWithError(__SecIdentity *a1, void *a2)
{
  SecCertificateRef certificateRef = 0LL;
  OSStatus v3 = SecIdentityCopyCertificate(a1, &certificateRef);
  if (!v3) {
    return certificateRef;
  }
  if (!a2) {
    return 0LL;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  v3,  *a2,  @"unable to get certificate from provided identity");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  SecCertificateRef result = 0LL;
  *a2 = v4;
  return result;
}

SecKeyRef MSSecIdentityCopyKeyWithError(__SecIdentity *a1, void *a2)
{
  SecKeyRef privateKeyRef = 0LL;
  OSStatus v3 = SecIdentityCopyPrivateKey(a1, &privateKeyRef);
  if (!v3) {
    return privateKeyRef;
  }
  if (!a2) {
    return 0LL;
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  v3,  *a2,  @"unable to get private key from provided identity");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  SecKeyRef result = 0LL;
  *a2 = v4;
  return result;
}

SecTrustRef MSSecTrustCreateWithError(uint64_t a1, void *a2, void *a3, void *a4, id *a5)
{
  id v9 = a2;
  int v10 = a3;
  id v11 = a4;
  SecTrustRef trust = 0LL;
  if (a5 && *a5) {
    uint64_t v12 = (void *)[*a5 copy];
  }
  else {
    uint64_t v12 = 0LL;
  }
  if (v9) {
    [MEMORY[0x189603FA8] arrayWithArray:v9];
  }
  else {
    [MEMORY[0x189603FA8] arrayWithCapacity:1];
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 insertObject:a1 atIndex:0];
  OSStatus v14 = SecTrustCreateWithCertificates(v13, v11, &trust);
  if (v14)
  {
    uint64_t v17 = @"unable to create trust object";
  }

  else
  {
    if (!v10 || (OSStatus v14 = SecTrustSetVerifyDate(trust, v10)) == 0)
    {
      if (!a5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }

    uint64_t v17 = @"unable to set verify date on trust object";
  }

  uint64_t v18 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  *MEMORY[0x189607670],  v14,  v12,  v17);

  uint64_t v12 = (void *)v18;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_12:
  if (v12) {
    *a5 = v12;
  }
LABEL_14:
  SecTrustRef v15 = trust;

  return v15;
}

CFTypeRef findItemInAllAvailableKeychains(void *a1)
{
  id v1 = a1;
  CFTypeRef result = 0LL;
  [MEMORY[0x189603FA8] array];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 objectForKeyedSubscript:*MEMORY[0x18960BDA0]];
  OSStatus v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:*MEMORY[0x18960BDA8]];
  uint64_t v5 = *MEMORY[0x18960BE68];
  uint64_t v6 = [v1 objectForKeyedSubscript:*MEMORY[0x18960BE68]];
  if (v6)
  {
    id v7 = (void *)v6;
    [v1 objectForKeyedSubscript:v5];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 BOOLValue];

    if (!v9)
    {
      int v10 = 0LL;
      goto LABEL_23;
    }
  }

  int v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v1];
  [v10 setObject:MEMORY[0x189604A88] forKey:v5];
  [v10 setObject:*MEMORY[0x18960BAB0] forKey:*MEMORY[0x18960BAA8]];
  if (SecItemCopyMatching((CFDictionaryRef)v10, &result)) {
    int v11 = 1;
  }
  else {
    int v11 = v4;
  }
  if (v11 != 1)
  {
    uint64_t v16 = 0LL;
    id v17 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_47;
  }

  CFTypeRef v12 = result;
  if (result) {
    int v13 = v4;
  }
  else {
    int v13 = 0;
  }
  if (v13 == 1)
  {
    CFTypeID v14 = CFGetTypeID(result);
    CFTypeID TypeID = CFArrayGetTypeID();
    CFTypeRef v12 = result;
    if (v14 == TypeID)
    {
      [v2 addObjectsFromArray:result];
LABEL_20:
      CFTypeRef v12 = result;
      goto LABEL_21;
    }
  }

  if (v12) {
    int v19 = v4;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
    objc_msgSend(v2, "addObject:");
    goto LABEL_20;
  }

LABEL_21:
  if (v12)
  {
    CFTypeRef result = 0LL;
    CFRelease(v12);
  }

  if (!*p_signatureAlgorithm)
  {
    findBestMutuallySupportedSignatureAlgorithm(a3, 0LL);
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v26 = +[MSAlgorithmIdentifier algorithmIdentifierWithOID:]( &OBJC_CLASS___MSAlgorithmIdentifier,  "algorithmIdentifierWithOID:",  v25);
    int v27 = *p_signatureAlgorithm;
    *p_signatureAlgorithm = (void *)v26;
  }

  uint64_t v21 = 0LL;
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (v17) {
    *a3 = v17;
  }
LABEL_26:

  return v21;
}

        int v10 = (v19 - 1) & v19;
        id v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      BOOL v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1811205B4(v24, v35);
      }

      else
      {
        sub_181124AF4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }

      sub_181129710();
      sub_1811295A8();
      CFTypeRef result = sub_18112971C();
      int v25 = -1LL << *(_BYTE *)(v7 + 32);
      CFTypeRef v26 = result & ~v25;
      int v27 = v26 >> 6;
      if (((-1LL << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        CFTypeID v14 = __clz(__rbit64((-1LL << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        CFTypeID v28 = 0;
        CFTypeID v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          CFTypeRef v30 = v27 == v29;
          if (v27 == v29) {
            int v27 = 0LL;
          }
          v28 |= v30;
          v31 = *(void *)(v11 + 8 * v27);
        }

        while (v31 == -1);
        CFTypeID v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      SecTrustRef v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *SecTrustRef v15 = v23;
      v15[1] = v22;
      CFTypeRef result = (uint64_t)sub_1811205B4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }

  CFTypeRef result = swift_release();
  void *v3 = v7;
  return result;
}

LABEL_58:
  if (v26)
  {
    CFTypeRef result = 0LL;
    CFRelease(v26);
  }

LABEL_47:
  CFTypeRef v30 = result;
  if (v4)
  {
    if (result)
    {
      CFTypeRef result = 0LL;
      CFRelease(v30);
    }

    CFTypeRef v30 = v2;
    CFTypeRef result = v30;
  }

  return v30;
}

uint64_t findCertificateByIssuerAndSerialNumber(void *a1, void *a2, void *a3, id *a4)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  id v41 = a2;
  id v39 = a3;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x2020000000LL;
  uint64_t v68 = 0LL;
  v36 = a4;
  if (a4 && *a4) {
    id v7 = (void *)[*a4 copy];
  }
  else {
    id v7 = 0LL;
  }
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  v62 = __Block_byref_object_copy__3;
  v63 = __Block_byref_object_dispose__3;
  NSDataFromInteger(a1 + 2);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [MEMORY[0x189603F48] dataWithBytes:a1[1] length:*a1];
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = __Block_byref_object_copy__3;
  v57 = __Block_byref_object_dispose__3;
  id v58 = (id)SecDistinguishedNameCopyNormalizedSequence();
  [MEMORY[0x189603FA8] array];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 && [v41 count])
  {
    v48[0] = MEMORY[0x1895F87A8];
    v48[1] = 3221225472LL;
    v48[2] = __findCertificateByIssuerAndSerialNumber_block_invoke;
    v48[3] = &unk_189B4AE60;
    v50 = &v53;
    v51 = &v59;
    v52 = &v65;
    id v49 = v38;
    [v41 enumerateObjectsUsingBlock:v48];
  }

  v37 = (void *)v8;
  uint64_t v9 = v66[3];
  if (v9)
  {
    id v40 = v7;
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setObject:*MEMORY[0x18960BB40] forKey:*MEMORY[0x18960BB38]];
    if (v54[5]) {
      int v11 = (void *)v54[5];
    }
    else {
      int v11 = v37;
    }
    [v10 setObject:v11 forKey:*MEMORY[0x18960B958]];
    [v10 setObject:v60[5] forKey:*MEMORY[0x18960BA78]];
    [v10 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE30]];
    if (v39) {
      [v10 setObject:v39 forKey:*MEMORY[0x18960BE50]];
    }
    v47 = v7;
    v35 = v10;
    CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v10);
    id v40 = v7;

    if (ItemInAllAvailableKeychains)
    {
      CFTypeID v13 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v13 == SecCertificateGetTypeID()) {
        v66[3] = (uint64_t)ItemInAllAvailableKeychains;
      }
      else {
        CFRelease(ItemInAllAvailableKeychains);
      }
    }

    if (!v66[3])
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_34);
      }
      CFTypeID v14 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        [(id)v60[5] asMessageSecurityHexString];
        SecTrustRef v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        uint64_t v71 = 1752392040LL;
        __int16 v72 = 2112;
        v73 = v15;
        _os_log_impl(&dword_1810EE000, v14, OS_LOG_TYPE_INFO, "QuerySN = %{mask.hash}@", buf, 0x16u);
      }

      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_36);
      }
      uint64_t v16 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        [(id)v54[5] asMessageSecurityHexString];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        uint64_t v71 = 1752392040LL;
        __int16 v72 = 2112;
        v73 = v17;
        _os_log_impl(&dword_1810EE000, v16, OS_LOG_TYPE_INFO, "QueryIssuer = %{mask.hash}@", buf, 0x16u);
      }

      dumpNSData("QuerySN", (void *)v60[5]);
      dumpNSData("QueryIssuer", (void *)v54[5]);
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id obj = v38;
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v69 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v43 + 1) + 8 * v20);
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_40);
            }
            uint64_t v22 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              [v21 objectAtIndexedSubscript:0];
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v23 asMessageSecurityHexString];
              BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              uint64_t v71 = 1752392040LL;
              __int16 v72 = 2112;
              v73 = v24;
              _os_log_impl(&dword_1810EE000, v22, OS_LOG_TYPE_INFO, "BundledSN = %{mask.hash}@", buf, 0x16u);
            }

            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_42);
            }
            int v25 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              [v21 objectAtIndexedSubscript:1];
              CFTypeRef v26 = (void *)objc_claimAutoreleasedReturnValue();
              [v26 asMessageSecurityHexString];
              int v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              uint64_t v71 = 1752392040LL;
              __int16 v72 = 2112;
              v73 = v27;
              _os_log_impl(&dword_1810EE000, v25, OS_LOG_TYPE_INFO, "BundledIssuer = %{mask.hash}@", buf, 0x16u);
            }

            [v21 objectAtIndexedSubscript:0];
            CFTypeID v28 = (void *)objc_claimAutoreleasedReturnValue();
            dumpNSData("BundledSN", v28);

            [v21 objectAtIndexedSubscript:1];
            CFTypeID v29 = (void *)objc_claimAutoreleasedReturnValue();
            dumpNSData("BundledIssuer", v29);

            ++v20;
          }

          while (v18 != v20);
          uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v69 count:16];
        }

        while (v18);
      }

      CFTypeRef v30 = MSErrorKeychainDomain[0];
      NSStringFromDERIntegerData((void *)v60[5]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSSStringFromIssuerName((void *)v54[5]);
      int v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  v30,  -25300LL,  1LL,  v40,  @"%s did not find IssuerAndSerialNumber %@ %@",  "findCertificateByIssuerAndSerialNumber",  v31,  v32);

      id v40 = (id)v33;
    }

    if (v36 && v40) {
      id *v36 = v40;
    }
    uint64_t v9 = v66[3];
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  return v9;
}

void sub_181105228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __findCertificateByIssuerAndSerialNumber_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  certificate = a2;
  CFDataRef v6 = SecCertificateCopyNormalizedIssuerSequence(certificate);
  CFDataRef v7 = SecCertificateCopySerialNumberData(certificate, 0LL);
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToData:v6]
    || ![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqualToData:v7])
  {
    [MEMORY[0x189603FA8] array];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    if (v7)
    {
      [v9 addObject:v7];
      if (v6)
      {
LABEL_8:
        [v10 addObject:v6];
LABEL_11:
        [*(id *)(a1 + 32) addObject:v10];

        goto LABEL_12;
      }
    }

    else
    {
      [MEMORY[0x189603F48] data];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 addObject:v11];

      if (v6) {
        goto LABEL_8;
      }
    }

    [MEMORY[0x189603F48] data];
    CFTypeRef v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v12];

    goto LABEL_11;
  }

  uint64_t v8 = certificate;
  if (certificate)
  {
    CFRetain(certificate);
    uint64_t v8 = certificate;
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v8;
  *a4 = 1;
LABEL_12:
}

void __findCertificateByIssuerAndSerialNumber_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateByIssuerAndSerialNumber_block_invoke_35()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void dumpNSData(const char *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v43 = a2;
  if (a1 && v43)
  {
    int v2 = os_variant_allows_internal_security_policies();
    CFPropertyListRef v3 = CFPreferencesCopyValue( @"logCMSDecodingFailures",  @"com.apple.messagesecurity",  (CFStringRef)*MEMORY[0x189605180],  (CFStringRef)*MEMORY[0x189605190]);
    int v4 = (const __CFString *)*MEMORY[0x189605170];
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"logCMSDecodingFailures", (CFStringRef)*MEMORY[0x189605170]);
    int IsForced = CFPreferencesAppValueIsForced(@"logCMSDecodingFailures", v4);
    if (v2 && v3 && (v7 = CFGetTypeID(v3), TypeID = CFBooleanGetTypeID(), uint64_t v9 = (const __CFBoolean *)v3, v7 == TypeID)
      || (IsForced ? (BOOL v10 = v5 == 0LL) : (BOOL v10 = 1),
          !v10 && (v11 = CFGetTypeID(v5), v12 = CFBooleanGetTypeID(), uint64_t v9 = (const __CFBoolean *)v5, v11 == v12)))
    {
      int Value = CFBooleanGetValue(v9);
    }

    else
    {
      int Value = 0;
    }

    CFTypeID v14 = &MS_DEFAULT_LOG_BLOCK;
    if (MS_DEFAULT_LOG_BLOCK != -1) {
      dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_148);
    }
    SecTrustRef v15 = (id *)&MS_DEFAULT_LOG_INTERNAL;
    uint64_t v16 = (void *)MS_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_DEBUG))
    {
      id v17 = v16;
      uint64_t v18 = [@"logCMSDecodingFailures" cString];
      *(_DWORD *)buf = 136316674;
      v48 = "valueForBooleanDefault";
      uint64_t v19 = "NULL";
      __int16 v49 = 2080;
      uint64_t v50 = v18;
      if (v3) {
        uint64_t v20 = "NOT_NULL";
      }
      else {
        uint64_t v20 = "NULL";
      }
      *(_DWORD *)v52 = v2;
      __int16 v51 = 1024;
      if (v5) {
        uint64_t v19 = "NOT_NULL";
      }
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = v20;
      *(_WORD *)&v52[14] = 1024;
      *(_DWORD *)&v52[16] = IsForced;
      *(_WORD *)uint64_t v53 = 2080;
      *(void *)&v53[2] = v19;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = Value;
      _os_log_impl( &dword_1810EE000,  v17,  OS_LOG_TYPE_DEBUG,  "%s %s isInternal: %d val: %s isForced: %d appVal: %s result: %d",  buf,  0x3Cu);
    }

    if (v3) {
      CFRelease(v3);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (Value)
    {
      id v21 = v43;
      uint64_t v22 = (unsigned __int8 *)[v21 bytes];
      uint64_t v23 = [v21 length];
      BOOL v24 = (char *)&log_buffer;
      bzero(&log_buffer, 0x2711uLL);
      if (v23)
      {
        uint64_t v25 = 0LL;
        __int128 v46 = 0LL;
        CFTypeRef v26 = v22 + 1;
        int v27 = "0x%02x,";
        do
        {
          unsigned int v28 = *v22++;
          int v29 = snprintf(&v24[v25], 10001 - v25, v27, v28);
          if (!--v23 || (v25 += v29, (unint64_t)(v25 - 9996) <= 5))
          {
            if (*v14 != -1) {
              dispatch_once(v14, &__block_literal_global_130_0);
            }
            CFTypeRef v30 = (os_log_s *)*v15;
            v31 = v26;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              __int128 v45 = v22;
              int v32 = v24;
              uint64_t v33 = v15;
              id v34 = v21;
              uint64_t v44 = [v34 bytes];
              id v35 = v34;
              v36 = v27;
              id v37 = v21;
              v38 = v14;
              id v39 = &v26[-[v35 bytes]];
              id v40 = v35;
              SecTrustRef v15 = v33;
              BOOL v24 = v32;
              uint64_t v22 = v45;
              uint64_t v41 = [v40 length];
              *(_DWORD *)buf = 136316418;
              v48 = a1;
              __int16 v49 = 2048;
              uint64_t v50 = v44;
              __int16 v51 = 2048;
              *(void *)v52 = v46;
              *(_WORD *)&v52[8] = 2048;
              *(void *)&v52[10] = v39;
              CFTypeID v14 = v38;
              id v21 = v37;
              int v27 = v36;
              *(_WORD *)&v52[18] = 2048;
              *(void *)uint64_t v53 = v41;
              *(_WORD *)&v53[8] = 2080;
              v54 = v24;
              _os_log_impl(&dword_1810EE000, v30, OS_LOG_TYPE_ERROR, "logging %s 0x%zx [%ld-%ld)/%ld %s", buf, 0x3Eu);
              v31 = v45;
            }

            __int128 v46 = &v31[-[v21 bytes]];
            bzero(v24, 0x2711uLL);
            uint64_t v25 = 0LL;
          }

          ++v26;
        }

        while (v23);
      }
    }
  }
}

void __findCertificateByIssuerAndSerialNumber_block_invoke_39()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateByIssuerAndSerialNumber_block_invoke_41()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

__CFString *NSStringFromDERIntegerData(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 bytes];
    [v3 length];
    if (der_get_integer() || [v3 length])
    {
      uint64_t v4 = [v3 asMessageSecurityHexString];
    }

    else
    {
      uint64_t v4 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%d", 0);
    }

    CFPropertyListRef v5 = (__CFString *)v4;
  }

  else
  {
    CFPropertyListRef v5 = @"NULL";
  }

  return v5;
}

__CFString *NSSStringFromIssuerName(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v24 = v1;
    int v2 = @"INVALID_ISSUER";
    if (!nsheim_decode_Name(v1) && v29 == 1)
    {
      unint64_t v3 = v30;
      if (v30)
      {
        unint64_t v4 = 0LL;
        int v2 = &stru_189B51650;
        do
        {
          CFPropertyListRef v5 = (unsigned int *)(v31 + 16 * v4);
          uint64_t v6 = *v5;
          if ((_DWORD)v6)
          {
            unint64_t v25 = v4;
            CFTypeID v7 = (__int128 *)*((void *)v5 + 1);
            do
            {
              uint64_t v8 = v2;
              __int128 v9 = *v7;
              __int128 v10 = v7[1];
              uint64_t v28 = *((void *)v7 + 4);
              __int128 v26 = v9;
              *(_OWORD *)__s = v10;
              CFTypeID v11 = -[MSOID initWithAsn1OID:error:]( objc_alloc(&OBJC_CLASS___MSOID),  "initWithAsn1OID:error:",  &v26,  0LL);
              CFTypeID v12 = v11;
              if (v11)
              {
                -[MSOID OIDString](v11, "OIDString");
                CFTypeID v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                CFTypeID v13 = @"INVALID_OID";
              }

              switch(LODWORD(__s[0]))
              {
                case 1:
                case 3:
                  id v14 = objc_alloc(NSString);
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 1LL;
                  goto LABEL_18;
                case 2:
                  [MEMORY[0x189603F48] dataWithBytes:__s[1] length:strlen(__s[1])];
                  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                  [v19 asMessageSecurityHexString];
                  uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  break;
                case 4:
                  id v14 = objc_alloc(NSString);
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 2348810496LL;
                  goto LABEL_18;
                case 5:
                  id v20 = objc_alloc(NSString);
                  uint64_t v21 = [v20 initWithUTF8String:__s[1]];
                  goto LABEL_19;
                case 6:
                  id v14 = objc_alloc(NSString);
                  uint64_t v16 = __s[1];
                  uint64_t v15 = v28;
                  uint64_t v17 = 10LL;
LABEL_18:
                  uint64_t v21 = [v14 initWithBytes:v15 length:v16 encoding:v17];
LABEL_19:
                  uint64_t v18 = (__CFString *)v21;
                  break;
                default:
                  uint64_t v18 = @"UNEXPECTED_VALUE";
                  break;
              }

              -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", @"%@:%@ ", v13, v18);
              int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

              CFTypeID v7 = (__int128 *)((char *)v7 + 40);
              --v6;
            }

            while (v6);
            unint64_t v3 = v30;
            unint64_t v4 = v25;
          }

          if (++v4 < v3)
          {
            uint64_t v22 = -[__CFString stringByAppendingFormat:](v2, "stringByAppendingFormat:", @"| ");

            unint64_t v3 = v30;
            int v2 = (__CFString *)v22;
          }
        }

        while (v4 < v3);
      }

      else
      {
        int v2 = &stru_189B51650;
      }
    }

    id v1 = v24;
  }

  else
  {
    int v2 = @"NULL";
  }

  return v2;
}

uint64_t findCertificateBySubjectKeyID(void *a1, void *a2, void *a3, id *a4)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v30 = a2;
  id v29 = a3;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  uint64_t v49 = 0LL;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  id v43 = __Block_byref_object_copy__3;
  uint64_t v44 = __Block_byref_object_dispose__3;
  NSDataFromOctetString(a1);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  int v27 = a4;
  if (a4 && *a4) {
    CFTypeID v7 = (void *)[*a4 copy];
  }
  else {
    CFTypeID v7 = 0LL;
  }
  [MEMORY[0x189603FA8] array];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 && [v30 count])
  {
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __findCertificateBySubjectKeyID_block_invoke;
    v36[3] = &unk_189B4AF08;
    v38 = &v40;
    id v39 = &v46;
    id v37 = v28;
    [v30 enumerateObjectsUsingBlock:v36];
  }

  uint64_t v8 = v47[3];
  if (!v8)
  {
    [MEMORY[0x189603FC8] dictionary];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:*MEMORY[0x18960BB40] forKey:*MEMORY[0x18960BB38]];
    [v9 setObject:v41[5] forKey:*MEMORY[0x18960BA98]];
    [v9 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE30]];
    if (v29) {
      [v9 setObject:v29 forKey:*MEMORY[0x18960BE50]];
    }
    id v35 = v7;
    unint64_t v25 = v9;
    CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v9);
    id v26 = v7;

    if (ItemInAllAvailableKeychains)
    {
      CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v11 == SecCertificateGetTypeID()) {
        v47[3] = (uint64_t)ItemInAllAvailableKeychains;
      }
      else {
        CFRelease(ItemInAllAvailableKeychains);
      }
    }

    if (v47[3])
    {
      CFTypeID v7 = v26;
    }

    else
    {
      if (MS_DEFAULT_LOG_BLOCK != -1) {
        dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_47);
      }
      CFTypeID v12 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        [(id)v41[5] asMessageSecurityHexString];
        CFTypeID v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 141558274;
        uint64_t v52 = 1752392040LL;
        __int16 v53 = 2112;
        v54 = v13;
        _os_log_impl(&dword_1810EE000, v12, OS_LOG_TYPE_INFO, "QuerySKID = %{mask.hash}@", buf, 0x16u);
      }

      dumpNSData("QuerySKID", (void *)v41[5]);
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v14 = v28;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v50 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v32;
        do
        {
          uint64_t v17 = 0LL;
          do
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
            if (MS_DEFAULT_LOG_BLOCK != -1) {
              dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_50);
            }
            uint64_t v19 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              [v18 asMessageSecurityHexString];
              id v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              uint64_t v52 = 1752392040LL;
              __int16 v53 = 2112;
              v54 = v20;
              _os_log_impl(&dword_1810EE000, v19, OS_LOG_TYPE_INFO, "BundledSKID = %{mask.hash}@", buf, 0x16u);
            }

            dumpNSData("BundledSKID", v18);
            ++v17;
          }

          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v50 count:16];
        }

        while (v15);
      }

      uint64_t v21 = MSErrorKeychainDomain[0];
      uint64_t v22 = v41[5];
      if (v22)
      {
        [(id)v41[5] asMessageSecurityHexString];
        uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v23 = @"NULL";
      }

      +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  v21,  -25300LL,  1LL,  v26,  @"%s did not find SubjectKeyIdentifier %@",  "findCertificateBySubjectKeyID",  v23,  v9);
      CFTypeID v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22) {
    }
      }

    if (v27 && v7) {
      *int v27 = v7;
    }
    uint64_t v8 = v47[3];
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v8;
}

void sub_1811061CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41)
{
}

void __findCertificateBySubjectKeyID_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id cf = a2;
  SubjectKeyID = (void *)SecCertificateGetSubjectKeyID();
  CFTypeID v7 = SubjectKeyID;
  if (SubjectKeyID) {
    CFRetain(SubjectKeyID);
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v8 && [v8 isEqualToData:v7])
  {
    id v9 = cf;
    if (cf)
    {
      CFRetain(cf);
      id v9 = cf;
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v9;
    *a4 = 1;
  }

  else
  {
    __int128 v10 = *(void **)(a1 + 32);
    if (v7)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }

    else
    {
      [MEMORY[0x189603F48] data];
      CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 addObject:v11];
    }
  }
}

void __findCertificateBySubjectKeyID_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateBySubjectKeyID_block_invoke_49()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

uint64_t findCertificateForIdentifier(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v7 = a2;
  id v8 = a3;
  +[MSCMSIdentifier decodeIdentifier:error:](&OBJC_CLASS___MSCMSIdentifier, "decodeIdentifier:error:", a1, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  int v11 = [v9 type];
  if (v11 == 2)
  {
    uint64_t CertificateBySubjectKeyID = findCertificateBySubjectKeyID((void *)[v10 subjectKeyId], v7, v8, a4);
    goto LABEL_6;
  }

  if (v11 != 1)
  {
    if (a4)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -26275LL,  *a4,  @"unable to find certificate by identifier; invalid choice in encoding");
      uint64_t v13 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }

uint64_t findCertificateByEmailAddress(void *a1, void *a2, void **a3)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  uint64_t v50 = __Block_byref_object_copy__3;
  __int16 v51 = __Block_byref_object_dispose__3;
  if (a3)
  {
    id v7 = *a3;
    if (*a3) {
      id v7 = (void *)[v7 copy];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v52 = v7;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  uint64_t v44 = __Block_byref_object_copy__3;
  id v45 = __Block_byref_object_dispose__3;
  id v46 = 0LL;
  [MEMORY[0x189603FC8] dictionary];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:*MEMORY[0x18960BB40] forKey:*MEMORY[0x18960BB38]];
  [v8 setObject:*MEMORY[0x18960BDA8] forKey:*MEMORY[0x18960BDA0]];
  [v8 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE30]];
  if (v6) {
    [v8 setObject:v6 forKey:*MEMORY[0x18960BE50]];
  }
  id v9 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9, obj);
  if (ItemInAllAvailableKeychains)
  {
    CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecCertificateGetTypeID())
    {
      uint64_t v12 = [MEMORY[0x189603FA8] arrayWithObject:ItemInAllAvailableKeychains];
    }

    else
    {
      CFTypeID v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        uint64_t v16 = 0LL;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_61);
        }
        uint64_t v17 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v16 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_impl( &dword_1810EE000,  v17,  OS_LOG_TYPE_DEBUG,  "found %lu candidate email certs from keychain",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v19 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        id v20 = (void *)v42[5];
        v42[5] = v19;

        v37[0] = MEMORY[0x1895F87A8];
        v37[1] = 3221225472LL;
        v37[2] = __findCertificateByEmailAddress_block_invoke_62;
        v37[3] = &unk_189B4AFB8;
        id v21 = v5;
        id v38 = v21;
        id v39 = &v41;
        [v16 enumerateObjectsUsingBlock:v37];
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_64);
        }
        uint64_t v22 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = [v16 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v23;
          _os_log_impl( &dword_1810EE000,  v22,  OS_LOG_TYPE_DEBUG,  "found %lu candidate certs from keychain with matching email addresses",  (uint8_t *)&buf,  0xCu);
        }

        id v13 = (id)v42[5];
        if ([v13 count] == 1)
        {
          [v13 objectAtIndex:0];
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          v54[3] = (uint64_t)v24;
        }

        else
        {
          if (![v13 count])
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  1LL,  v48[5],  @"unable to find any certificates with email address %@",  v21);
              uint64_t v14 = 0LL;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v14 = 0LL;
            }

            goto LABEL_34;
          }

          uint64_t v25 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          id v26 = (void *)v42[5];
          v42[5] = v25;

          v36[0] = MEMORY[0x1895F87A8];
          v36[1] = 3221225472LL;
          v36[2] = __findCertificateByEmailAddress_block_invoke_67;
          v36[3] = &unk_189B4B000;
          void v36[4] = &v47;
          v36[5] = &v41;
          [v13 enumerateObjectsUsingBlock:v36];
          if (MS_DEFAULT_LOG_BLOCK != -1) {
            dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_69);
          }
          int v27 = (os_log_s *)(id)MS_DEFAULT_LOG_INTERNAL;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v28 = [v13 count];
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v28;
            _os_log_impl( &dword_1810EE000,  v27,  OS_LOG_TYPE_DEBUG,  "found %lu valid email candidate certs",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v29 = [(id)v42[5] count];
          id v30 = (void *)v42[5];
          if (v29 != 1)
          {
            if ([v30 count])
            {
              id v33 = (id)v42[5];

              id v13 = v33;
            }

            *(void *)&__int128 buf = 0LL;
            *((void *)&buf + 1) = &buf;
            uint64_t v58 = 0x2020000000LL;
            uint64_t v59 = 0LL;
            v35[0] = MEMORY[0x1895F87A8];
            v35[1] = 3221225472LL;
            v35[2] = __findCertificateByEmailAddress_block_invoke_70;
            v35[3] = &unk_189B4B000;
            v35[4] = &buf;
            v35[5] = &v53;
            [v13 enumerateObjectsUsingBlock:v35];
            if (a3)
            {
              __int128 v34 = (void *)v48[5];
              if (v34) {
                *a3 = v34;
              }
            }

            uint64_t v14 = v54[3];
            _Block_object_dispose(&buf, 8);
            goto LABEL_34;
          }

          [v30 objectAtIndex:0];
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          v54[3] = (uint64_t)v31;
        }

        uint64_t v14 = v54[3];
LABEL_34:

        goto LABEL_35;
      }

      uint64_t v12 = [MEMORY[0x189603FA8] arrayWithArray:ItemInAllAvailableKeychains];
    }

    uint64_t v16 = (void *)v12;
    goto LABEL_16;
  }

  if (a3)
  {
    +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  1LL,  v48[5],  @"unable to find any certificates in keychain");
    id v13 = 0LL;
    uint64_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v13 = 0LL;
    uint64_t v14 = 0LL;
  }

LABEL_35:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v14;
}

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v5,  @"Unable to encode content info: missing content type or content");
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }

  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  uint64_t v42 = v39;
  if (embeddedContent) {
    goto LABEL_14;
  }
  if (-[MSOID isEqualToString:](contentType, "isEqualToString:", @"1.2.840.113549.1.7.1"))
  {
    id v37 = -[NSData length](*p_content, "length");
    -[NSData bytes](*p_content, "bytes");
    id v9 = length_DataContent();
    [MEMORY[0x189603FB8] dataWithLength:v9];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      CFTypeID v11 = v10;
      [v11 mutableBytes];
      uint64_t v12 = encode_DataContent();
      if (!v12)
      {
        if (v9 != v36) {
          goto LABEL_38;
        }
        goto LABEL_22;
      }

      id v13 = v12;

      uint64_t v14 = v13;
    }

    else
    {
      uint64_t v14 = 12LL;
    }

    if (a3)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      id v45 = *MEMORY[0x1896075E0];
      v46[0] = @"Failed encoding type DataContent";
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:@"com.apple.HeimASN1" code:v14 userInfo:v18];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    CFTypeID v11 = 0LL;
LABEL_22:
    if (![v11 length])
    {

      uint64_t v23 = 0LL;
      uint64_t v16 = v5;
      uint64_t v19 = 0LL;
      goto LABEL_31;
    }

    [MEMORY[0x189603F48] dataWithData:v11];
    CFTypeID v15 = (NSData *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }

  CFTypeID v15 = *p_content;
LABEL_24:
  uint64_t v16 = v5;
LABEL_25:
  uint64_t v19 = v15;
  v39[1] = -[NSData bytes](v19, "bytes");
  v39[0] = -[NSData length](v19, "length");
  uint64_t v40 = -[MSOID Asn1OID](self->_contentType, "Asn1OID");
  uint64_t v41 = v20;
  id v21 = length_ContentInfo();
  [MEMORY[0x189603FB8] dataWithLength:v21];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    id v26 = 12LL;
    goto LABEL_29;
  }

  uint64_t v23 = v22;
  [v23 mutableBytes];
  id v24 = encode_ContentInfo();
  if (!v24)
  {
    if (v21 == v37) {
      goto LABEL_31;
    }
LABEL_38:
    id v31 = (void *)asn1_abort();
    return +[MSCMSContentInfo decodeMessageSecurityObject:options:error:](v31, v32, v33, v34, v35);
  }

  uint64_t v25 = v24;

  id v26 = v25;
LABEL_29:
  int v27 = (void *)MEMORY[0x189607870];
  uint64_t v43 = *MEMORY[0x1896075E0];
  uint64_t v44 = @"Failed encoding type ContentInfo";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v27 errorWithDomain:@"com.apple.HeimASN1" code:v26 userInfo:v28];

  uint64_t v23 = 0LL;
  uint64_t v16 = (id)v29;
LABEL_31:
  if (a3)
  {
    if (v16) {
      *a3 = v16;
    }
  }

  return v23;
}

void sub_181106B24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void __findCertificateByEmailAddress_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateByEmailAddress_block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    unint64_t v4 = (void *)SecCertificateCopyRFC822Names();
    id v3 = v5;
    if (v4)
    {
      v6[0] = MEMORY[0x1895F87A8];
      v6[1] = 3221225472LL;
      v6[2] = __findCertificateByEmailAddress_block_invoke_2;
      v6[3] = &unk_189B4AF90;
      id v7 = *(id *)(a1 + 32);
      if ([v4 indexOfObjectPassingTest:v6] != 0x7FFFFFFFFFFFFFFFLL) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
      }

      id v3 = v5;
    }
  }
}

BOOL __findCertificateByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

void __findCertificateByEmailAddress_block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateByEmailAddress_block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v4 + 40);
  id v5 = MSSecTrustCreateWithError((uint64_t)v3, 0LL, 0LL, 0LL, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    if (SecTrustEvaluateWithError(v5, 0LL)) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    }
    CFRelease(v5);
  }
}

void __findCertificateByEmailAddress_block_invoke_2_68()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __findCertificateByEmailAddress_block_invoke_70(uint64_t a1, void *a2)
{
  CFTypeRef cf = a2;
  SecCertificateNotValidAfter();
  uint64_t v4 = (void *)cf;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v3 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v3;
    id v6 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v6)
    {
      CFRelease(v6);
      uint64_t v4 = (void *)cf;
    }

    if (v4)
    {
      CFRetain(v4);
      uint64_t v4 = (void *)cf;
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  }
}

const void *findIdentityByCertificate(__SecCertificate *a1, void *a2, id *a3)
{
  id v5 = a2;
  CFErrorRef error = 0LL;
  if (a3 && *a3) {
    id v6 = (id)[*a3 copy];
  }
  else {
    id v6 = 0LL;
  }
  [MEMORY[0x189603FC8] dictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFDataRef v8 = SecCertificateCopySerialNumberData(a1, &error);
  CFDataRef v9 = v8;
  CFErrorRef v10 = error;
  if (error || !v8)
  {

    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -26275LL,  v10,  @"Unable to get serial number from certificate");
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    CFDataRef v11 = 0LL;
  }

  else
  {
    CFDataRef v11 = SecCertificateCopyNormalizedIssuerSequence(a1);
    if (v11)
    {
      [v7 setObject:*MEMORY[0x18960BB50] forKey:*MEMORY[0x18960BB38]];
      [v7 setObject:v11 forKey:*MEMORY[0x18960B958]];
      [v7 setObject:v9 forKey:*MEMORY[0x18960BA78]];
      [v7 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE30]];
      if (v5) {
        [v7 setObject:v5 forKey:*MEMORY[0x18960BE50]];
      }
      CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v7);
      if (ItemInAllAvailableKeychains)
      {
        id v13 = ItemInAllAvailableKeychains;
        CFTypeID v14 = CFGetTypeID(ItemInAllAvailableKeychains);
        if (v14 == SecIdentityGetTypeID()) {
          goto LABEL_18;
        }
        CFRelease(v13);
      }
    }

    else
    {
      uint64_t v15 = +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  -26275LL,  v6,  @"Unable to get issuer sequence from certificate");

      id v6 = (id)v15;
    }
  }

  uint64_t v16 = v6;
  uint64_t v17 = MSErrorKeychainDomain[0];
  NSStringFromDERIntegerData(v9);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSSStringFromIssuerName(v11);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  v17,  -25300LL,  1LL,  v6,  @"%s did not find IssuerAndSerialNumber %@ %@",  "findIdentityByCertificate",  v18,  v19);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v13 = 0LL;
  if (a3 && v6)
  {
    id v6 = v6;
    id v13 = 0LL;
    *a3 = v6;
  }

uint64_t findIdentityByEmailAddress(void *a1, void *a2, void **a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v50 = 0LL;
  __int16 v51 = &v50;
  uint64_t v52 = 0x2020000000LL;
  uint64_t v53 = 0LL;
  uint64_t v44 = 0LL;
  id v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = __Block_byref_object_copy__3;
  uint64_t v48 = __Block_byref_object_dispose__3;
  if (a3)
  {
    id v7 = *a3;
    if (*a3) {
      id v7 = (void *)[v7 copy];
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v49 = v7;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = __Block_byref_object_copy__3;
  uint64_t v42 = __Block_byref_object_dispose__3;
  id v43 = 0LL;
  [MEMORY[0x189603FC8] dictionary];
  CFDataRef v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:*MEMORY[0x18960BB50] forKey:*MEMORY[0x18960BB38]];
  [v8 setObject:*MEMORY[0x18960BDA8] forKey:*MEMORY[0x18960BDA0]];
  [v8 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE30]];
  if (v6) {
    [v8 setObject:v6 forKey:*MEMORY[0x18960BE50]];
  }
  CFDataRef v9 = v45;
  id obj = v45[5];
  CFTypeRef ItemInAllAvailableKeychains = findItemInAllAvailableKeychains(v8);
  objc_storeStrong(v9 + 5, obj);
  if (ItemInAllAvailableKeychains)
  {
    CFTypeID v11 = CFGetTypeID(ItemInAllAvailableKeychains);
    if (v11 == SecIdentityGetTypeID())
    {
      uint64_t v12 = [MEMORY[0x189603FA8] arrayWithObject:ItemInAllAvailableKeychains];
    }

    else
    {
      CFTypeID v15 = CFGetTypeID(ItemInAllAvailableKeychains);
      if (v15 != CFArrayGetTypeID())
      {
        uint64_t v16 = 0LL;
LABEL_16:
        CFRelease(ItemInAllAvailableKeychains);
        uint64_t v17 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
        uint64_t v18 = (void *)v39[5];
        v39[5] = v17;

        uint64_t v19 = MEMORY[0x1895F87A8];
        v33[0] = MEMORY[0x1895F87A8];
        v33[1] = 3221225472LL;
        v33[2] = __findIdentityByEmailAddress_block_invoke;
        v33[3] = &unk_189B4B048;
        uint64_t v35 = &v44;
        id v20 = v5;
        id v34 = v20;
        v36 = &v38;
        [v16 enumerateObjectsUsingBlock:v33];
        id v13 = (id)v39[5];

        if ([v13 count] == 1)
        {
          [v13 objectAtIndex:0];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          if (![v13 count])
          {
            if (a3)
            {
              +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  1LL,  v45[5],  @"unable to find any identities with email address %@",  v20);
              uint64_t v14 = 0LL;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              uint64_t v14 = 0LL;
            }

            goto LABEL_22;
          }

          uint64_t v22 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          uint64_t v23 = (void *)v39[5];
          v39[5] = v22;

          v32[0] = v19;
          v32[1] = 3221225472LL;
          v32[2] = __findIdentityByEmailAddress_block_invoke_3;
          v32[3] = &unk_189B4B000;
          v32[4] = &v44;
          v32[5] = &v38;
          [v13 enumerateObjectsUsingBlock:v32];
          uint64_t v24 = [(id)v39[5] count];
          uint64_t v25 = (void *)v39[5];
          if (v24 != 1)
          {
            if ([v25 count])
            {
              id v28 = (id)v39[5];

              id v13 = v28;
            }

            v31[0] = 0LL;
            v31[1] = v31;
            v31[2] = 0x2020000000LL;
            v31[3] = 0LL;
            v30[0] = v19;
            v30[1] = 3221225472LL;
            v30[2] = __findIdentityByEmailAddress_block_invoke_4;
            v30[3] = &unk_189B4B070;
            v30[4] = &v44;
            v30[5] = v31;
            v30[6] = &v50;
            [v13 enumerateObjectsUsingBlock:v30];
            if (a3)
            {
              id v29 = v45[5];
              if (v29) {
                *a3 = v29;
              }
            }

            uint64_t v14 = v51[3];
            _Block_object_dispose(v31, 8);
            goto LABEL_22;
          }

          [v25 objectAtIndex:0];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

        id v26 = v21;
        v51[3] = (uint64_t)v26;

        uint64_t v14 = v51[3];
LABEL_22:

        goto LABEL_23;
      }

      uint64_t v12 = [MEMORY[0x189603FA8] arrayWithArray:ItemInAllAvailableKeychains];
    }

    uint64_t v16 = (void *)v12;
    goto LABEL_16;
  }

  if (a3)
  {
    +[MSError MSErrorWithDomain:code:errorLevel:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:errorLevel:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  1LL,  v45[5],  @"unable to find any identities in keychain");
    id v13 = 0LL;
    uint64_t v14 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v13 = 0LL;
    uint64_t v14 = 0LL;
  }

void sub_181107598( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void __findIdentityByEmailAddress_block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = SecCertificateCopyRFC822Names();
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = MEMORY[0x1895F87A8];
      uint64_t v9 = 3221225472LL;
      CFErrorRef v10 = __findIdentityByEmailAddress_block_invoke_2;
      CFTypeID v11 = &unk_189B4AF90;
      id v12 = *(id *)(a1 + 32);
      if ([v7 indexOfObjectPassingTest:&v8] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", v3, v8, v9, v10, v11);
      }
      CFRelease(v5);
    }

    else
    {
      CFRelease(v5);
    }
  }
}

BOOL __findIdentityByEmailAddress_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

void __findIdentityByEmailAddress_block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(id *)(v6 + 40);
  id v7 = MSSecTrustCreateWithError((uint64_t)v5, 0LL, 0LL, 0LL, &v8);
  objc_storeStrong((id *)(v6 + 40), v8);
  if (v7)
  {
    if (SecTrustEvaluateWithError(v7, 0LL)) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
    }
    CFRelease(v7);
  }

  if (v5) {
    CFRelease(v5);
  }
}

void __findIdentityByEmailAddress_block_invoke_4(void *a1, void *a2)
{
  double v3 = a2;
  uint64_t v4 = *(void *)(a1[4] + 8LL);
  id obj = *(id *)(v4 + 40);
  SecCertificateRef v5 = MSSecIdentityCopyCertificateWithError(v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  SecCertificateNotValidAfter();
  uint64_t v7 = *(void *)(a1[5] + 8LL);
  if (v6 > *(double *)(v7 + 24))
  {
    *(double *)(v7 + 24) = v6;
    id v8 = *(const void **)(*(void *)(a1[6] + 8LL) + 24LL);
    if (v8) {
      CFRelease(v8);
    }
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = CFRetain(v3);
  }

  if (v5) {
    CFRelease(v5);
  }
}

id asn1ErrorToNSError(id result, void *a2)
{
  double v3 = @"ASN1_BAD_TIMEFORMAT";
  switch((int)result)
  {
    case 1859794432:
      break;
    case 1859794433:
      double v3 = @"ASN1_MISSING_FIELD";
      break;
    case 1859794434:
      double v3 = @"ASN1_MISPLACED_FIELD";
      break;
    case 1859794435:
      double v3 = @"ASN1_TYPE_MISMATCH";
      break;
    case 1859794436:
      double v3 = @"ASN1_OVERFLOW";
      break;
    case 1859794437:
      double v3 = @"ASN1_OVERRUN";
      break;
    case 1859794438:
      double v3 = @"ASN1_BAD_ID";
      break;
    case 1859794439:
      double v3 = @"ASN1_BAD_LENGTH";
      break;
    case 1859794440:
      double v3 = @"ASN1_BAD_FORMAT";
      break;
    case 1859794441:
      double v3 = @"ASN1_PARSE_ERROR";
      break;
    case 1859794442:
      double v3 = @"ASN1_EXTRA_DATA";
      break;
    case 1859794443:
      double v3 = @"ASN1_BAD_CHARACTER";
      break;
    case 1859794444:
      double v3 = @"ASN1_MIN_CONSTRAINT";
      break;
    case 1859794445:
      double v3 = @"ASN1_MAX_CONSTRAINT";
      break;
    case 1859794446:
      double v3 = @"ASN1_EXACT_CONSTRAINT";
      break;
    case 1859794447:
      double v3 = @"ASN1_INDEF_OVERRUN";
      break;
    case 1859794448:
      double v3 = @"ASN1_INDEF_UNDERRUN";
      break;
    case 1859794449:
      double v3 = @"ASN1_GOT_BER";
      break;
    case 1859794450:
      double v3 = @"ASN1_INDEF_EXTRA_DATA";
      break;
    case 1859794451:
      double v3 = @"ASN1_INVALID_CHOICE";
      break;
    case 1859794452:
      double v3 = @"ASN1_GOT_INDEFINITE";
      break;
    default:
      double v3 = @"Unknown ASN1 error";
      if (!(_DWORD)result) {
        double v3 = @"ASN1 success";
      }
      break;
  }

  if (a2)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  result,  *a2,  @"%@",  v3);
    CFTypeRef result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }

  return result;
}

uint64_t uint32ToNetworkByteOrder(uint64_t result, uint64_t a2, uint64_t a3)
{
  {
    *(_BYTE *)(a2 - 1 + a3) = result;
    CFTypeRef result = result >> 8;
  }

  return result;
}

void __dumpNSData_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

void __valueForBooleanDefault_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MessageSecurity", "default");
  id v1 = (void *)MS_DEFAULT_LOG_INTERNAL;
  MS_DEFAULT_LOG_INTERNAL = (uint64_t)v0;
}

LABEL_25:
  free_ContentInfo();
  uint64_t v22 = v19;

  return v22;
}

  return v12;
}

    id v12 = (v23 - 1) & v23;
    CFTypeID v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    id v20 = 32 * v15;
    sub_181124AF4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    id v21 = (void *)(*(void *)(v4 + 48) + v16);
    *id v21 = v19;
    v21[1] = v18;
    sub_1811205B4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    CFTypeRef result = (void *)swift_bridgeObjectRetain();
  }

  uint64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    CFTypeRef result = (void *)swift_release();
    id v1 = v25;
    goto LABEL_28;
  }

  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    uint64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_34:
        id v31 = 0;
        goto LABEL_25;
      }

      asn1_abort();
      goto LABEL_17;
    }

    CFTypeID v11 = length_CMSCBCParameter();
    [MEMORY[0x189603FB8] dataWithLength:v11];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      id v13 = v17;
      [v13 mutableBytes];
      uint64_t v18 = encode_CMSCBCParameter();
      if (!v18) {
        goto LABEL_15;
      }
      uint64_t v19 = v18;

      uint64_t v16 = v19;
    }

    else
    {
      uint64_t v16 = 12LL;
    }

    id v20 = (void *)MEMORY[0x189607870];
    v36 = *MEMORY[0x1896075E0];
    id v37 = @"Failed encoding type CMSCBCParameter";
    id v21 = (void *)MEMORY[0x189603F68];
    uint64_t v22 = &v37;
    uint64_t v23 = &v36;
    goto LABEL_21;
  }

  id v31 = 0;
  if (!a3) {
    goto LABEL_29;
  }
LABEL_27:
  if (v5) {
    *a3 = v5;
  }
LABEL_29:

  return v31;
}

LABEL_24:
  id v30 = v8;
LABEL_26:

  return v30;
}

LABEL_28:
  uint64_t v7 = (id)v25;
  if (!a3) {
    goto LABEL_31;
  }
LABEL_29:
  if (v7) {
    *a3 = v7;
  }
LABEL_31:
  if (v8) {
    CFRelease(v8);
  }

  return v24;
}

void sub_18110CE30(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_18110D2F8(_Unwind_Exception *a1)
{
}

void sub_18110D7D0(_Unwind_Exception *a1)
{
}

LABEL_33:
      self->_signatureCalculated = v6;
      goto LABEL_34;
    }

    uint64_t v35 = v5;
    -[MSCMSSignerInfo calculateSignerInfoDigest:](self, "calculateSignerInfoDigest:", &v35);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v35;

    if (!v7)
    {
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  v8,  @"Could not sign data: no digest");
      SecCertificateRef v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
      double v6 = 0;
      if (a3) {
        goto LABEL_31;
      }
      goto LABEL_33;
    }

    if (!self->_signerPrivKey)
    {
      signerCertificate = self->_signerCertificate;
      if (!signerCertificate)
      {
        id v30 = MSErrorCMSDomain[0];
        id v31 = @"Could not sign data: no key or certificate specified";
LABEL_41:
        __int128 v32 = -50LL;
        goto LABEL_42;
      }

      LAContext = self->_LAContext;
      id v34 = v8;
      IdentityByCertificate = (__SecIdentity *)findIdentityByCertificate(signerCertificate, LAContext, &v34);
      id v12 = v34;

      if (!IdentityByCertificate)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorKeychainDomain[0],  -25300LL,  v12,  @"Could not sign data: no identity in keychain for certificate");
        SecCertificateRef v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }

      id v33 = v12;
      id v13 = MSSecIdentityCopyKeyWithError(IdentityByCertificate, &v33);
      id v8 = v33;

      self->_signerPrivKey = v13;
      CFRelease(IdentityByCertificate);
      if (!self->_signerPrivKey)
      {
        id v30 = MSErrorKeychainDomain[0];
        id v31 = @"Could not sign data: no private key";
        __int128 v32 = -25300LL;
LABEL_42:
        +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v30,  v32,  v8,  v31);
        SecCertificateRef v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_29;
      }
    }

    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeID v15 = [v14 secKeyAlgorithm];

    if (!v15)
    {
      uint64_t v25 = MSErrorCryptoDomain[0];
      -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 OIDString];
      int v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v25,  -4LL,  v8,  @"%@ is not a supported signature algorithm",  v27);
      SecCertificateRef v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
      goto LABEL_30;
    }

    -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 isEqualToString:@"1.2.840.113549.1.1.4"];

    if (!v17)
    {
      if (self->_LAContext && !SecKeySetParameter())
      {
        if (MS_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&MS_DEFAULT_LOG_BLOCK, &__block_literal_global_96);
        }
        uint64_t v18 = (os_log_s *)MS_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)MS_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v38 = cf;
          _os_log_impl( &dword_1810EE000,  v18,  OS_LOG_TYPE_ERROR,  "failed to set credential reference on signer private key: %@",  buf,  0xCu);
        }

        uint64_t v19 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v19);
        }
      }

      signerPrivKey = self->_signerPrivKey;
      -[MSAlgorithmIdentifier algorithm](self->_signatureAlgorithm, "algorithm");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      Signature = (NSData *)SecKeyCreateSignature( signerPrivKey,  (SecKeyAlgorithm)[v21 secKeyAlgorithm],  (CFDataRef)v7,  (CFErrorRef *)&cf);
      uint64_t v23 = self->_signature;
      self->_signature = Signature;

      uint64_t v24 = cf;
      if (cf)
      {

        id v8 = (id)v24;
      }

      double v6 = self->_signature != 0LL;

      SecCertificateRef v5 = v8;
      if (!a3) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }

    id v30 = MSErrorCryptoDomain[0];
    id v31 = @"MD5 is not supported for signing";
    goto LABEL_41;
  }

  double v6 = 1;
LABEL_34:

  return v6;
}

LABEL_41:
  uint64_t v41 = 1;
LABEL_43:

  return v41;
}

        MEMORY[0x186E06BA0](v19, -1LL, -1LL);

        goto LABEL_42;
      }

uint64_t nsheim_decode_CMSVersion(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSVersion()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSVersion()
{
  return _asn1_encode();
}

uint64_t length_CMSVersion()
{
  return _asn1_length();
}

uint64_t free_CMSVersion()
{
  return _asn1_free_top();
}

uint64_t copy_CMSVersion()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_DigestAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_DigestAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestAlgorithmIdentifiers(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DigestAlgorithmIdentifiers()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestAlgorithmIdentifiers()
{
  return _asn1_encode();
}

uint64_t length_DigestAlgorithmIdentifiers()
{
  return _asn1_length();
}

uint64_t free_DigestAlgorithmIdentifiers()
{
  return _asn1_free_top();
}

uint64_t copy_DigestAlgorithmIdentifiers()
{
  return _asn1_copy_top();
}

uint64_t add_DigestAlgorithmIdentifiers(unsigned int *a1)
{
  uint64_t v2 = realloc(*((void **)a1 + 1), 24LL * *a1 + 24);
  if (!v2) {
    return 12LL;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!(_DWORD)result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_DigestAlgorithmIdentifiers(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437LL;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove( (void *)(*(void *)(a1 + 8) + 24LL * a2),  (const void *)(*(void *)(a1 + 8) + 24LL * (a2 + 1)),  24LL * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }

  SecCertificateRef v5 = realloc(*(void **)(a1 + 8), 24LL * v4);
  if (!v5 && *(_DWORD *)a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  return result;
}

uint64_t nsheim_decode_SignatureAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignatureAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SignatureAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_SignatureAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentType(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ContentType()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentType()
{
  return _asn1_encode();
}

uint64_t length_ContentType()
{
  return _asn1_length();
}

uint64_t free_ContentType()
{
  return _asn1_free_top();
}

uint64_t copy_ContentType()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageDigest(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_MessageDigest()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageDigest()
{
  return _asn1_encode();
}

uint64_t length_MessageDigest()
{
  return _asn1_length();
}

uint64_t free_MessageDigest()
{
  return _asn1_free_top();
}

uint64_t copy_MessageDigest()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  return _asn1_decode_top();
}

uint64_t decode_ContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentInfo()
{
  return _asn1_encode();
}

uint64_t length_ContentInfo()
{
  return _asn1_length();
}

uint64_t free_ContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DataContent(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DataContent()
{
  return _asn1_decode_top();
}

uint64_t encode_DataContent()
{
  return _asn1_encode();
}

uint64_t length_DataContent()
{
  return _asn1_length();
}

uint64_t free_DataContent()
{
  return _asn1_free_top();
}

uint64_t copy_DataContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncapsulatedContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_EncapsulatedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncapsulatedContentInfo()
{
  return _asn1_encode();
}

uint64_t length_EncapsulatedContentInfo()
{
  return _asn1_length();
}

uint64_t free_EncapsulatedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncapsulatedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateChoices(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CertificateChoices()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateChoices()
{
  return _asn1_encode();
}

uint64_t length_CertificateChoices()
{
  return _asn1_length();
}

uint64_t free_CertificateChoices()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateChoices()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSet(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CertificateSet()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateSet()
{
  return _asn1_encode();
}

uint64_t length_CertificateSet()
{
  return _asn1_length();
}

uint64_t free_CertificateSet()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateSet()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateList()
{
  return _asn1_encode();
}

uint64_t length_CertificateList()
{
  return _asn1_length();
}

uint64_t free_CertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateRevocationLists(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CertificateRevocationLists()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateRevocationLists()
{
  return _asn1_encode();
}

uint64_t length_CertificateRevocationLists()
{
  return _asn1_length();
}

uint64_t free_CertificateRevocationLists()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateRevocationLists()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_IssuerAndSerialNumber(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_IssuerAndSerialNumber()
{
  return _asn1_decode_top();
}

uint64_t encode_IssuerAndSerialNumber()
{
  return _asn1_encode();
}

uint64_t length_IssuerAndSerialNumber()
{
  return _asn1_length();
}

uint64_t free_IssuerAndSerialNumber()
{
  return _asn1_free_top();
}

uint64_t copy_IssuerAndSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSIdentifier()
{
  return _asn1_encode();
}

uint64_t length_CMSIdentifier()
{
  return _asn1_length();
}

uint64_t free_CMSIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_CMSIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignerIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SignerIdentifier()
{
  return _asn1_length();
}

uint64_t free_SignerIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SignerIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientIdentifier()
{
  return _asn1_encode();
}

uint64_t length_RecipientIdentifier()
{
  return _asn1_length();
}

uint64_t free_RecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSAttributes()
{
  return _asn1_encode();
}

uint64_t length_CMSAttributes()
{
  return _asn1_length();
}

uint64_t free_CMSAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSOrderedAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSOrderedAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSOrderedAttributes()
{
  return _asn1_encode();
}

uint64_t length_CMSOrderedAttributes()
{
  return _asn1_length();
}

uint64_t free_CMSOrderedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_CMSOrderedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignatureValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignatureValue()
{
  return _asn1_decode_top();
}

uint64_t encode_SignatureValue()
{
  return _asn1_encode();
}

uint64_t length_SignatureValue()
{
  return _asn1_length();
}

uint64_t free_SignatureValue()
{
  return _asn1_free_top();
}

uint64_t copy_SignatureValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignerInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfo()
{
  return _asn1_encode();
}

uint64_t length_SignerInfo()
{
  return _asn1_length();
}

uint64_t free_SignerInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SignerInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignerInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignerInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SignerInfos()
{
  return _asn1_encode();
}

uint64_t length_SignerInfos()
{
  return _asn1_length();
}

uint64_t free_SignerInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SignerInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSSignedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  return _asn1_decode_top();
}

uint64_t decode_CMSSignedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSSignedData()
{
  return _asn1_encode();
}

uint64_t length_CMSSignedData()
{
  return _asn1_length();
}

uint64_t free_CMSSignedData()
{
  return _asn1_free_top();
}

uint64_t copy_CMSSignedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_OriginatorInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorInfo()
{
  return _asn1_encode();
}

uint64_t length_OriginatorInfo()
{
  return _asn1_length();
}

uint64_t free_OriginatorInfo()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyEncryptionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ContentEncryptionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_ContentEncryptionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_EncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedKey()
{
  return _asn1_encode();
}

uint64_t length_EncryptedKey()
{
  return _asn1_length();
}

uint64_t free_EncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyTransRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyTransRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyTransRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_KeyTransRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_KeyTransRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyTransRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_ECC_CMS_SharedInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECC_CMS_SharedInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ECC_CMS_SharedInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ECC_CMS_SharedInfo()
{
  return _asn1_encode();
}

uint64_t length_ECC_CMS_SharedInfo()
{
  return _asn1_length();
}

uint64_t free_ECC_CMS_SharedInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ECC_CMS_SharedInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherKeyAttribute(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_OtherKeyAttribute()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherKeyAttribute()
{
  return _asn1_encode();
}

uint64_t length_OtherKeyAttribute()
{
  return _asn1_length();
}

uint64_t free_OtherKeyAttribute()
{
  return _asn1_free_top();
}

uint64_t copy_OtherKeyAttribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_RecipientKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_RecipientKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyAgreeRecipientIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyAgreeRecipientIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKey()
{
  return _asn1_encode();
}

uint64_t length_RecipientEncryptedKey()
{
  return _asn1_length();
}

uint64_t free_RecipientEncryptedKey()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientEncryptedKeys(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientEncryptedKeys()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientEncryptedKeys()
{
  return _asn1_encode();
}

uint64_t length_RecipientEncryptedKeys()
{
  return _asn1_length();
}

uint64_t free_RecipientEncryptedKeys()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientEncryptedKeys()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UserKeyingMaterial(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_UserKeyingMaterial()
{
  return _asn1_decode_top();
}

uint64_t encode_UserKeyingMaterial()
{
  return _asn1_encode();
}

uint64_t length_UserKeyingMaterial()
{
  return _asn1_length();
}

uint64_t free_UserKeyingMaterial()
{
  return _asn1_free_top();
}

uint64_t copy_UserKeyingMaterial()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_OriginatorPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorPublicKey()
{
  return _asn1_encode();
}

uint64_t length_OriginatorPublicKey()
{
  return _asn1_length();
}

uint64_t free_OriginatorPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_OriginatorIdentifierOrKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_length();
}

uint64_t free_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OriginatorIdentifierOrKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_OriginatorIdentifierOrKey()
{
  return _asn1_decode_top();
}

uint64_t encode_OriginatorIdentifierOrKey()
{
  return _asn1_encode();
}

uint64_t length_OriginatorIdentifierOrKey()
{
  return _asn1_length();
}

uint64_t free_OriginatorIdentifierOrKey()
{
  return _asn1_free_top();
}

uint64_t copy_OriginatorIdentifierOrKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_KeyAgreeRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_KeyAgreeRecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyAgreeRecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyAgreeRecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_KeyAgreeRecipientInfo()
{
  return _asn1_length();
}

uint64_t free_KeyAgreeRecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_KeyAgreeRecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_RecipientInfo()
{
  return _asn1_length();
}

uint64_t free_SecCMS_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfo()
{
  return _asn1_encode();
}

uint64_t length_RecipientInfo()
{
  return _asn1_length();
}

uint64_t free_RecipientInfo()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_RecipientInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_RecipientInfos()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_RecipientInfos()
{
  return _asn1_length();
}

uint64_t free_SecCMS_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RecipientInfos(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RecipientInfos()
{
  return _asn1_decode_top();
}

uint64_t encode_RecipientInfos()
{
  return _asn1_encode();
}

uint64_t length_RecipientInfos()
{
  return _asn1_length();
}

uint64_t free_RecipientInfos()
{
  return _asn1_free_top();
}

uint64_t copy_RecipientInfos()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContent(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_EncryptedContent()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContent()
{
  return _asn1_encode();
}

uint64_t length_EncryptedContent()
{
  return _asn1_length();
}

uint64_t free_EncryptedContent()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContent()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EncryptedContentInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_EncryptedContentInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_EncryptedContentInfo()
{
  return _asn1_encode();
}

uint64_t length_EncryptedContentInfo()
{
  return _asn1_length();
}

uint64_t free_EncryptedContentInfo()
{
  return _asn1_free_top();
}

uint64_t copy_EncryptedContentInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UnprotectedAttributes(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_UnprotectedAttributes()
{
  return _asn1_decode_top();
}

uint64_t encode_UnprotectedAttributes()
{
  return _asn1_encode();
}

uint64_t length_UnprotectedAttributes()
{
  return _asn1_length();
}

uint64_t free_UnprotectedAttributes()
{
  return _asn1_free_top();
}

uint64_t copy_UnprotectedAttributes()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSEncryptedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSEncryptedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSEncryptedData()
{
  return _asn1_encode();
}

uint64_t length_CMSEncryptedData()
{
  return _asn1_length();
}

uint64_t free_CMSEncryptedData()
{
  return _asn1_free_top();
}

uint64_t copy_CMSEncryptedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_EnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_EnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_EnvelopedData()
{
  return _asn1_length();
}

uint64_t free_SecCMS_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_EnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_EnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_EnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_EnvelopedData()
{
  return _asn1_length();
}

uint64_t free_EnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_EnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageAuthenticationCode(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_MessageAuthenticationCode()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageAuthenticationCode()
{
  return _asn1_encode();
}

uint64_t length_MessageAuthenticationCode()
{
  return _asn1_length();
}

uint64_t free_MessageAuthenticationCode()
{
  return _asn1_free_top();
}

uint64_t copy_MessageAuthenticationCode()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthEnvelopedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AuthEnvelopedData()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthEnvelopedData()
{
  return _asn1_encode();
}

uint64_t length_AuthEnvelopedData()
{
  return _asn1_length();
}

uint64_t free_AuthEnvelopedData()
{
  return _asn1_free_top();
}

uint64_t copy_AuthEnvelopedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_CCM_ICVlen(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AES_CCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_CCM_ICVlen()
{
  return _asn1_encode();
}

uint64_t length_AES_CCM_ICVlen()
{
  return _asn1_length();
}

uint64_t free_AES_CCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_CCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CCMParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_CCMParameters()
{
  return _asn1_encode();
}

uint64_t length_CCMParameters()
{
  return _asn1_length();
}

uint64_t free_CCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_CCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AES_GCM_ICVlen(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AES_GCM_ICVlen()
{
  return _asn1_decode_top();
}

uint64_t encode_AES_GCM_ICVlen()
{
  return _asn1_encode();
}

uint64_t length_AES_GCM_ICVlen()
{
  return _asn1_length();
}

uint64_t free_AES_GCM_ICVlen()
{
  return _asn1_free_top();
}

uint64_t copy_AES_GCM_ICVlen()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GCMParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_GCMParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_GCMParameters()
{
  return _asn1_encode();
}

uint64_t length_GCMParameters()
{
  return _asn1_length();
}

uint64_t free_GCMParameters()
{
  return _asn1_free_top();
}

uint64_t copy_GCMParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSRC2CBCParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSRC2CBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSRC2CBCParameter()
{
  return _asn1_encode();
}

uint64_t length_CMSRC2CBCParameter()
{
  return _asn1_length();
}

uint64_t free_CMSRC2CBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSRC2CBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CMSCBCParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CMSCBCParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_CMSCBCParameter()
{
  return _asn1_encode();
}

uint64_t length_CMSCBCParameter()
{
  return _asn1_length();
}

uint64_t free_CMSCBCParameter()
{
  return _asn1_free_top();
}

uint64_t copy_CMSCBCParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressionAlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CompressionAlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressionAlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_CompressionAlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_CompressionAlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_CompressionAlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CompressedData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CompressedData()
{
  return _asn1_decode_top();
}

uint64_t encode_CompressedData()
{
  return _asn1_encode();
}

uint64_t length_CompressedData()
{
  return _asn1_length();
}

uint64_t free_CompressedData()
{
  return _asn1_free_top();
}

uint64_t copy_CompressedData()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SecCMS_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_encode();
}

uint64_t length_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_length();
}

uint64_t free_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SecCMS_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMEEncryptionKeyPreference(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SMIMEEncryptionKeyPreference()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMEEncryptionKeyPreference()
{
  return _asn1_encode();
}

uint64_t length_SMIMEEncryptionKeyPreference()
{
  return _asn1_length();
}

uint64_t free_SMIMEEncryptionKeyPreference()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMEEncryptionKeyPreference()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapability(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SMIMECapability()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapability()
{
  return _asn1_encode();
}

uint64_t length_SMIMECapability()
{
  return _asn1_length();
}

uint64_t free_SMIMECapability()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapability()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SMIMECapabilities(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SMIMECapabilities()
{
  return _asn1_decode_top();
}

uint64_t encode_SMIMECapabilities()
{
  return _asn1_encode();
}

uint64_t length_SMIMECapabilities()
{
  return _asn1_length();
}

uint64_t free_SMIMECapabilities()
{
  return _asn1_free_top();
}

uint64_t copy_SMIMECapabilities()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SignAttrsHash(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SignAttrsHash()
{
  return _asn1_decode_top();
}

uint64_t encode_SignAttrsHash()
{
  return _asn1_encode();
}

uint64_t length_SignAttrsHash()
{
  return _asn1_length();
}

uint64_t free_SignAttrsHash()
{
  return _asn1_free_top();
}

uint64_t copy_SignAttrsHash()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MultipleSignatures(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_MultipleSignatures()
{
  return _asn1_decode_top();
}

uint64_t encode_MultipleSignatures()
{
  return _asn1_encode();
}

uint64_t length_MultipleSignatures()
{
  return _asn1_length();
}

uint64_t free_MultipleSignatures()
{
  return _asn1_free_top();
}

uint64_t copy_MultipleSignatures()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_MessageImprint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_MessageImprint()
{
  return _asn1_decode_top();
}

uint64_t encode_MessageImprint()
{
  return _asn1_encode();
}

uint64_t length_MessageImprint()
{
  return _asn1_length();
}

uint64_t free_MessageImprint()
{
  return _asn1_free_top();
}

uint64_t copy_MessageImprint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSAPolicyId(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TSAPolicyId()
{
  return _asn1_decode_top();
}

uint64_t encode_TSAPolicyId()
{
  return _asn1_encode();
}

uint64_t length_TSAPolicyId()
{
  return _asn1_length();
}

uint64_t free_TSAPolicyId()
{
  return _asn1_free_top();
}

uint64_t copy_TSAPolicyId()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampReq(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TimeStampReq()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampReq()
{
  return _asn1_encode();
}

uint64_t length_TimeStampReq()
{
  return _asn1_length();
}

uint64_t free_TimeStampReq()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampReq()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatus(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_PKIStatus()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatus()
{
  return _asn1_encode();
}

uint64_t length_PKIStatus()
{
  return _asn1_length();
}

uint64_t free_PKIStatus()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatus()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIFailureInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_PKIFailureInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFailureInfo()
{
  return _asn1_encode();
}

uint64_t length_PKIFailureInfo()
{
  return _asn1_length();
}

uint64_t free_PKIFailureInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFailureInfo()
{
  return _asn1_copy_top();
}

uint64_t PKIFailureInfo2int(int a1)
{
  return a1 & 0x203C025;
}

uint64_t int2PKIFailureInfo(int a1)
{
  return a1 & 0x203C025;
}

uint64_t nsheim_decode_PKIFreeText(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_PKIFreeText()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIFreeText()
{
  return _asn1_encode();
}

uint64_t length_PKIFreeText()
{
  return _asn1_length();
}

uint64_t free_PKIFreeText()
{
  return _asn1_free_top();
}

uint64_t copy_PKIFreeText()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIStatusInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_PKIStatusInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIStatusInfo()
{
  return _asn1_encode();
}

uint64_t length_PKIStatusInfo()
{
  return _asn1_length();
}

uint64_t free_PKIStatusInfo()
{
  return _asn1_free_top();
}

uint64_t copy_PKIStatusInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampToken(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TimeStampToken()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampToken()
{
  return _asn1_encode();
}

uint64_t length_TimeStampToken()
{
  return _asn1_length();
}

uint64_t free_TimeStampToken()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampToken()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Accuracy(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Accuracy()
{
  return _asn1_decode_top();
}

uint64_t encode_Accuracy()
{
  return _asn1_encode();
}

uint64_t length_Accuracy()
{
  return _asn1_length();
}

uint64_t free_Accuracy()
{
  return _asn1_free_top();
}

uint64_t copy_Accuracy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TSTInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TSTInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_TSTInfo()
{
  return _asn1_encode();
}

uint64_t length_TSTInfo()
{
  return _asn1_length();
}

uint64_t free_TSTInfo()
{
  return _asn1_free_top();
}

uint64_t copy_TSTInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TimeStampResp(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TimeStampResp()
{
  return _asn1_decode_top();
}

uint64_t encode_TimeStampResp()
{
  return _asn1_encode();
}

uint64_t length_TimeStampResp()
{
  return _asn1_length();
}

uint64_t free_TimeStampResp()
{
  return _asn1_free_top();
}

uint64_t copy_TimeStampResp()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Version(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Version()
{
  return _asn1_decode_top();
}

uint64_t encode_Version()
{
  return _asn1_encode();
}

uint64_t length_Version()
{
  return _asn1_length();
}

uint64_t free_Version()
{
  return _asn1_free_top();
}

uint64_t copy_Version()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AlgorithmIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AlgorithmIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_AlgorithmIdentifier()
{
  return _asn1_encode();
}

uint64_t length_AlgorithmIdentifier()
{
  return _asn1_length();
}

uint64_t free_AlgorithmIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_AlgorithmIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeType(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AttributeType()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeType()
{
  return _asn1_encode();
}

uint64_t length_AttributeType()
{
  return _asn1_length();
}

uint64_t free_AttributeType()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeType()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AttributeValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeValue()
{
  return _asn1_encode();
}

uint64_t length_AttributeValue()
{
  return _asn1_length();
}

uint64_t free_AttributeValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DirectoryString(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DirectoryString()
{
  return _asn1_decode_top();
}

uint64_t encode_DirectoryString()
{
  return _asn1_encode();
}

uint64_t length_DirectoryString()
{
  return _asn1_length();
}

uint64_t free_DirectoryString()
{
  return _asn1_free_top();
}

uint64_t copy_DirectoryString()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Attribute(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Attribute()
{
  return _asn1_decode_top();
}

uint64_t encode_Attribute()
{
  return _asn1_encode();
}

uint64_t length_Attribute()
{
  return _asn1_length();
}

uint64_t free_Attribute()
{
  return _asn1_free_top();
}

uint64_t copy_Attribute()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AttributeTypeAndValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AttributeTypeAndValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AttributeTypeAndValue()
{
  return _asn1_encode();
}

uint64_t length_AttributeTypeAndValue()
{
  return _asn1_length();
}

uint64_t free_AttributeTypeAndValue()
{
  return _asn1_free_top();
}

uint64_t copy_AttributeTypeAndValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RelativeDistinguishedName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RelativeDistinguishedName()
{
  return _asn1_decode_top();
}

uint64_t encode_RelativeDistinguishedName()
{
  return _asn1_encode();
}

uint64_t length_RelativeDistinguishedName()
{
  return _asn1_length();
}

uint64_t free_RelativeDistinguishedName()
{
  return _asn1_free_top();
}

uint64_t copy_RelativeDistinguishedName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RDNSequence(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RDNSequence()
{
  return _asn1_decode_top();
}

uint64_t encode_RDNSequence()
{
  return _asn1_encode();
}

uint64_t length_RDNSequence()
{
  return _asn1_length();
}

uint64_t free_RDNSequence()
{
  return _asn1_free_top();
}

uint64_t copy_RDNSequence()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Name(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Name()
{
  return _asn1_decode_top();
}

uint64_t encode_Name()
{
  return _asn1_encode();
}

uint64_t length_Name()
{
  return _asn1_length();
}

uint64_t free_Name()
{
  return _asn1_free_top();
}

uint64_t copy_Name()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CertificateSerialNumber(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CertificateSerialNumber()
{
  return _asn1_decode_top();
}

uint64_t encode_CertificateSerialNumber()
{
  return _asn1_encode();
}

uint64_t length_CertificateSerialNumber()
{
  return _asn1_length();
}

uint64_t free_CertificateSerialNumber()
{
  return _asn1_free_top();
}

uint64_t copy_CertificateSerialNumber()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Time(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Time()
{
  return _asn1_decode_top();
}

uint64_t encode_Time()
{
  return _asn1_encode();
}

uint64_t length_Time()
{
  return _asn1_length();
}

uint64_t free_Time()
{
  return _asn1_free_top();
}

uint64_t copy_Time()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Validity(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Validity()
{
  return _asn1_decode_top();
}

uint64_t encode_Validity()
{
  return _asn1_encode();
}

uint64_t length_Validity()
{
  return _asn1_length();
}

uint64_t free_Validity()
{
  return _asn1_free_top();
}

uint64_t copy_Validity()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_UniqueIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_UniqueIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_UniqueIdentifier()
{
  return _asn1_encode();
}

uint64_t length_UniqueIdentifier()
{
  return _asn1_length();
}

uint64_t free_UniqueIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_UniqueIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectPublicKeyInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SubjectPublicKeyInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectPublicKeyInfo()
{
  return _asn1_encode();
}

uint64_t length_SubjectPublicKeyInfo()
{
  return _asn1_length();
}

uint64_t free_SubjectPublicKeyInfo()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectPublicKeyInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extension(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Extension()
{
  return _asn1_decode_top();
}

uint64_t encode_Extension()
{
  return _asn1_encode();
}

uint64_t length_Extension()
{
  return _asn1_length();
}

uint64_t free_Extension()
{
  return _asn1_free_top();
}

uint64_t copy_Extension()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Extensions(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Extensions()
{
  return _asn1_decode_top();
}

uint64_t encode_Extensions()
{
  return _asn1_encode();
}

uint64_t length_Extensions()
{
  return _asn1_length();
}

uint64_t free_Extensions()
{
  return _asn1_free_top();
}

uint64_t copy_Extensions()
{
  return _asn1_copy_top();
}

uint64_t add_Extensions(unsigned int *a1)
{
  uint64_t v2 = realloc(*((void **)a1 + 1), 40LL * *a1 + 40);
  if (!v2) {
    return 12LL;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!(_DWORD)result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_Extensions(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437LL;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove( (void *)(*(void *)(a1 + 8) + 40LL * a2),  (const void *)(*(void *)(a1 + 8) + 40LL * (a2 + 1)),  40LL * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }

  SecCertificateRef v5 = realloc(*(void **)(a1 + 8), 40LL * v4);
  if (!v5 && *(_DWORD *)a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  return result;
}

uint64_t nsheim_decode_TBSCertificate(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TBSCertificate()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCertificate()
{
  return _asn1_encode();
}

uint64_t length_TBSCertificate()
{
  return _asn1_length();
}

uint64_t free_TBSCertificate()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCertificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificate(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Certificate()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificate()
{
  return _asn1_encode();
}

uint64_t length_Certificate()
{
  return _asn1_length();
}

uint64_t free_Certificate()
{
  return _asn1_free_top();
}

uint64_t copy_Certificate()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_Certificates(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_Certificates()
{
  return _asn1_decode_top();
}

uint64_t encode_Certificates()
{
  return _asn1_encode();
}

uint64_t length_Certificates()
{
  return _asn1_length();
}

uint64_t free_Certificates()
{
  return _asn1_free_top();
}

uint64_t copy_Certificates()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ValidationParms(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ValidationParms()
{
  return _asn1_decode_top();
}

uint64_t encode_ValidationParms()
{
  return _asn1_encode();
}

uint64_t length_ValidationParms()
{
  return _asn1_length();
}

uint64_t free_ValidationParms()
{
  return _asn1_free_top();
}

uint64_t copy_ValidationParms()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DomainParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DomainParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_DomainParameters()
{
  return _asn1_encode();
}

uint64_t length_DomainParameters()
{
  return _asn1_length();
}

uint64_t free_DomainParameters()
{
  return _asn1_free_top();
}

uint64_t copy_DomainParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHParameter(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DHParameter()
{
  return _asn1_decode_top();
}

uint64_t encode_DHParameter()
{
  return _asn1_encode();
}

uint64_t length_DHParameter()
{
  return _asn1_length();
}

uint64_t free_DHParameter()
{
  return _asn1_free_top();
}

uint64_t copy_DHParameter()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DHPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DHPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DHPublicKey()
{
  return _asn1_encode();
}

uint64_t length_DHPublicKey()
{
  return _asn1_length();
}

uint64_t free_DHPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DHPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_OtherName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_OtherName()
{
  return _asn1_decode_top();
}

uint64_t encode_OtherName()
{
  return _asn1_encode();
}

uint64_t length_OtherName()
{
  return _asn1_length();
}

uint64_t free_OtherName()
{
  return _asn1_free_top();
}

uint64_t copy_OtherName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_GeneralName()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralName()
{
  return _asn1_encode();
}

uint64_t length_GeneralName()
{
  return _asn1_length();
}

uint64_t free_GeneralName()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralNames(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_GeneralNames()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralNames()
{
  return _asn1_encode();
}

uint64_t length_GeneralNames()
{
  return _asn1_length();
}

uint64_t free_GeneralNames()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralNames()
{
  return _asn1_copy_top();
}

uint64_t add_GeneralNames(unsigned int *a1)
{
  uint64_t v2 = realloc(*((void **)a1 + 1), 40LL * *a1 + 40);
  if (!v2) {
    return 12LL;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!(_DWORD)result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_GeneralNames(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437LL;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove( (void *)(*(void *)(a1 + 8) + 40LL * a2),  (const void *)(*(void *)(a1 + 8) + 40LL * (a2 + 1)),  40LL * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }

  SecCertificateRef v5 = realloc(*(void **)(a1 + 8), 40LL * v4);
  if (!v5 && *(_DWORD *)a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  return result;
}

uint64_t nsheim_decode_KeyUsage(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyUsage()
{
  return _asn1_encode();
}

uint64_t length_KeyUsage()
{
  return _asn1_length();
}

uint64_t free_KeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_KeyUsage()
{
  return _asn1_copy_top();
}

uint64_t KeyUsage2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2KeyUsage(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_KeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_KeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_KeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_KeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_KeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_KeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AuthorityKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_AuthorityKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_AuthorityKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_SubjectKeyIdentifier(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_SubjectKeyIdentifier()
{
  return _asn1_decode_top();
}

uint64_t encode_SubjectKeyIdentifier()
{
  return _asn1_encode();
}

uint64_t length_SubjectKeyIdentifier()
{
  return _asn1_length();
}

uint64_t free_SubjectKeyIdentifier()
{
  return _asn1_free_top();
}

uint64_t copy_SubjectKeyIdentifier()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BasicConstraints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_BasicConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_BasicConstraints()
{
  return _asn1_encode();
}

uint64_t length_BasicConstraints()
{
  return _asn1_length();
}

uint64_t free_BasicConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_BasicConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_BaseDistance(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_BaseDistance()
{
  return _asn1_decode_top();
}

uint64_t encode_BaseDistance()
{
  return _asn1_encode();
}

uint64_t length_BaseDistance()
{
  return _asn1_length();
}

uint64_t free_BaseDistance()
{
  return _asn1_free_top();
}

uint64_t copy_BaseDistance()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtree(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_GeneralSubtree()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtree()
{
  return _asn1_encode();
}

uint64_t length_GeneralSubtree()
{
  return _asn1_length();
}

uint64_t free_GeneralSubtree()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtree()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_GeneralSubtrees(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_GeneralSubtrees()
{
  return _asn1_decode_top();
}

uint64_t encode_GeneralSubtrees()
{
  return _asn1_encode();
}

uint64_t length_GeneralSubtrees()
{
  return _asn1_length();
}

uint64_t free_GeneralSubtrees()
{
  return _asn1_free_top();
}

uint64_t copy_GeneralSubtrees()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_NameConstraints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_NameConstraints()
{
  return _asn1_decode_top();
}

uint64_t encode_NameConstraints()
{
  return _asn1_encode();
}

uint64_t length_NameConstraints()
{
  return _asn1_length();
}

uint64_t free_NameConstraints()
{
  return _asn1_free_top();
}

uint64_t copy_NameConstraints()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ExtKeyUsage(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ExtKeyUsage()
{
  return _asn1_decode_top();
}

uint64_t encode_ExtKeyUsage()
{
  return _asn1_encode();
}

uint64_t length_ExtKeyUsage()
{
  return _asn1_length();
}

uint64_t free_ExtKeyUsage()
{
  return _asn1_free_top();
}

uint64_t copy_ExtKeyUsage()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPointReasonFlags(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DistributionPointReasonFlags()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointReasonFlags()
{
  return _asn1_encode();
}

uint64_t length_DistributionPointReasonFlags()
{
  return _asn1_length();
}

uint64_t free_DistributionPointReasonFlags()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointReasonFlags()
{
  return _asn1_copy_top();
}

uint64_t DistributionPointReasonFlags2int(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t int2DistributionPointReasonFlags(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t nsheim_decode_DistributionPointName(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DistributionPointName()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPointName()
{
  return _asn1_encode();
}

uint64_t length_DistributionPointName()
{
  return _asn1_length();
}

uint64_t free_DistributionPointName()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPointName()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DistributionPoint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DistributionPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_DistributionPoint()
{
  return _asn1_encode();
}

uint64_t length_DistributionPoint()
{
  return _asn1_length();
}

uint64_t free_DistributionPoint()
{
  return _asn1_free_top();
}

uint64_t copy_DistributionPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLDistributionPoints(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CRLDistributionPoints()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLDistributionPoints()
{
  return _asn1_encode();
}

uint64_t length_CRLDistributionPoints()
{
  return _asn1_length();
}

uint64_t free_CRLDistributionPoints()
{
  return _asn1_free_top();
}

uint64_t copy_CRLDistributionPoints()
{
  return _asn1_copy_top();
}

uint64_t add_CRLDistributionPoints(unsigned int *a1)
{
  uint64_t v2 = realloc(*((void **)a1 + 1), 24LL * *a1 + 24);
  if (!v2) {
    return 12LL;
  }
  *((void *)a1 + 1) = v2;
  uint64_t result = _asn1_copy_top();
  if (!(_DWORD)result) {
    ++*a1;
  }
  return result;
}

uint64_t remove_CRLDistributionPoints(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)a1 <= a2) {
    return 1859794437LL;
  }
  _asn1_free_top();
  unsigned int v4 = *(_DWORD *)a1 - 1;
  *(_DWORD *)a1 = v4;
  if (v4 > a2)
  {
    memmove( (void *)(*(void *)(a1 + 8) + 24LL * a2),  (const void *)(*(void *)(a1 + 8) + 24LL * (a2 + 1)),  24LL * (v4 - a2));
    unsigned int v4 = *(_DWORD *)a1;
  }

  SecCertificateRef v5 = realloc(*(void **)(a1 + 8), 24LL * v4);
  if (!v5 && *(_DWORD *)a1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  return result;
}

uint64_t nsheim_decode_DSASigValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DSASigValue()
{
  return _asn1_decode_top();
}

uint64_t encode_DSASigValue()
{
  return _asn1_encode();
}

uint64_t length_DSASigValue()
{
  return _asn1_length();
}

uint64_t free_DSASigValue()
{
  return _asn1_free_top();
}

uint64_t copy_DSASigValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAPublicKey()
{
  return _asn1_encode();
}

uint64_t length_DSAPublicKey()
{
  return _asn1_length();
}

uint64_t free_DSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_DSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DSAParams(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DSAParams()
{
  return _asn1_decode_top();
}

uint64_t encode_DSAParams()
{
  return _asn1_encode();
}

uint64_t length_DSAParams()
{
  return _asn1_length();
}

uint64_t free_DSAParams()
{
  return _asn1_free_top();
}

uint64_t copy_DSAParams()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECPoint(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ECPoint()
{
  return _asn1_decode_top();
}

uint64_t encode_ECPoint()
{
  return _asn1_encode();
}

uint64_t length_ECPoint()
{
  return _asn1_length();
}

uint64_t free_ECPoint()
{
  return _asn1_free_top();
}

uint64_t copy_ECPoint()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECParameters(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ECParameters()
{
  return _asn1_decode_top();
}

uint64_t encode_ECParameters()
{
  return _asn1_encode();
}

uint64_t length_ECParameters()
{
  return _asn1_length();
}

uint64_t free_ECParameters()
{
  return _asn1_free_top();
}

uint64_t copy_ECParameters()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ECDSA_Sig_Value(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ECDSA_Sig_Value()
{
  return _asn1_decode_top();
}

uint64_t encode_ECDSA_Sig_Value()
{
  return _asn1_encode();
}

uint64_t length_ECDSA_Sig_Value()
{
  return _asn1_length();
}

uint64_t free_ECDSA_Sig_Value()
{
  return _asn1_free_top();
}

uint64_t copy_ECDSA_Sig_Value()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPublicKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RSAPublicKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPublicKey()
{
  return _asn1_encode();
}

uint64_t length_RSAPublicKey()
{
  return _asn1_length();
}

uint64_t free_RSAPublicKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPublicKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_RSAPrivateKey(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_RSAPrivateKey()
{
  return _asn1_decode_top();
}

uint64_t encode_RSAPrivateKey()
{
  return _asn1_encode();
}

uint64_t length_RSAPrivateKey()
{
  return _asn1_length();
}

uint64_t free_RSAPrivateKey()
{
  return _asn1_free_top();
}

uint64_t copy_RSAPrivateKey()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_DigestInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_DigestInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_DigestInfo()
{
  return _asn1_encode();
}

uint64_t length_DigestInfo()
{
  return _asn1_length();
}

uint64_t free_DigestInfo()
{
  return _asn1_free_top();
}

uint64_t copy_DigestInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_TBSCRLCertList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_TBSCRLCertList()
{
  return _asn1_decode_top();
}

uint64_t encode_TBSCRLCertList()
{
  return _asn1_encode();
}

uint64_t length_TBSCRLCertList()
{
  return _asn1_length();
}

uint64_t free_TBSCRLCertList()
{
  return _asn1_free_top();
}

uint64_t copy_TBSCRLCertList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLCertificateList(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CRLCertificateList()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLCertificateList()
{
  return _asn1_encode();
}

uint64_t length_CRLCertificateList()
{
  return _asn1_length();
}

uint64_t free_CRLCertificateList()
{
  return _asn1_free_top();
}

uint64_t copy_CRLCertificateList()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_CRLReason(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_CRLReason()
{
  return _asn1_decode_top();
}

uint64_t encode_CRLReason()
{
  return _asn1_encode();
}

uint64_t length_CRLReason()
{
  return _asn1_length();
}

uint64_t free_CRLReason()
{
  return _asn1_free_top();
}

uint64_t copy_CRLReason()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_PKIXXmppAddr(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_PKIXXmppAddr()
{
  return _asn1_decode_top();
}

uint64_t encode_PKIXXmppAddr()
{
  return _asn1_encode();
}

uint64_t length_PKIXXmppAddr()
{
  return _asn1_length();
}

uint64_t free_PKIXXmppAddr()
{
  return _asn1_free_top();
}

uint64_t copy_PKIXXmppAddr()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AccessDescription(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AccessDescription()
{
  return _asn1_decode_top();
}

uint64_t encode_AccessDescription()
{
  return _asn1_encode();
}

uint64_t length_AccessDescription()
{
  return _asn1_length();
}

uint64_t free_AccessDescription()
{
  return _asn1_free_top();
}

uint64_t copy_AccessDescription()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AuthorityInfoAccessSyntax(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AuthorityInfoAccessSyntax()
{
  return _asn1_decode_top();
}

uint64_t encode_AuthorityInfoAccessSyntax()
{
  return _asn1_encode();
}

uint64_t length_AuthorityInfoAccessSyntax()
{
  return _asn1_length();
}

uint64_t free_AuthorityInfoAccessSyntax()
{
  return _asn1_free_top();
}

uint64_t copy_AuthorityInfoAccessSyntax()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyPolicy(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ProxyPolicy()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyPolicy()
{
  return _asn1_encode();
}

uint64_t length_ProxyPolicy()
{
  return _asn1_length();
}

uint64_t free_ProxyPolicy()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyPolicy()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_ProxyCertInfo(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_ProxyCertInfo()
{
  return _asn1_decode_top();
}

uint64_t encode_ProxyCertInfo()
{
  return _asn1_encode();
}

uint64_t length_ProxyCertInfo()
{
  return _asn1_length();
}

uint64_t free_ProxyCertInfo()
{
  return _asn1_free_top();
}

uint64_t copy_ProxyCertInfo()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AppleHashAgilityValue(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AppleHashAgilityValue()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleHashAgilityValue()
{
  return _asn1_encode();
}

uint64_t length_AppleHashAgilityValue()
{
  return _asn1_length();
}

uint64_t free_AppleHashAgilityValue()
{
  return _asn1_free_top();
}

uint64_t copy_AppleHashAgilityValue()
{
  return _asn1_copy_top();
}

uint64_t nsheim_decode_AppleAgileHash(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = _asn1_decode_top();
  if (!(_DWORD)v2)
  {
    if (v4 == [v1 length]) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = 1859794442LL;
    }
  }

  return v2;
}

uint64_t decode_AppleAgileHash()
{
  return _asn1_decode_top();
}

uint64_t encode_AppleAgileHash()
{
  return _asn1_encode();
}

uint64_t length_AppleAgileHash()
{
  return _asn1_length();
}

uint64_t free_AppleAgileHash()
{
  return _asn1_free_top();
}

uint64_t copy_AppleAgileHash()
{
  return _asn1_copy_top();
}

uint64_t sub_1811186AC()
{
  uint64_t v0 = sub_181129578();
  __swift_allocate_value_buffer(v0, qword_18C548508);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C548508);
  return sub_18112956C();
}

uint64_t sub_18111872C(uint64_t a1)
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)sub_18112953C();
  double v3 = (void *)sub_18112953C();
  uint64_t v4 = (void *)sub_18112953C();
  SecCertificateRef v5 = (void *)sub_18112953C();
  v13[0] = 0LL;
  id v6 = MSDecryptGCMOneShot(a1, v2, v3, v4, v5, v13);

  id v7 = v13[0];
  uint64_t v8 = sub_181129554();
  unint64_t v10 = v9;

  if (v7)
  {
    id v11 = v7;
    swift_willThrow();
    sub_181118884(v8, v10);
  }

  return v8;
}

uint64_t sub_181118884(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1811188C8()
{
  return 0LL;
}

uint64_t MSCMSAuthEnvelopedData.dataContent.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_1811189A4(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_1811189A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t MSCMSAuthEnvelopedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  SecCertificateRef v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_181118884(v6, v7);
}

uint64_t (*MSCMSAuthEnvelopedData.dataContent.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_181118B0C()
{
  return MEMORY[0x18961AFE8];
}

uint64_t MSCMSAuthEnvelopedData.recipients.getter()
{
  return sub_181118F3C();
}

uint64_t MSCMSAuthEnvelopedData.recipients.setter(uint64_t a1)
{
  return sub_181118FF8(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
}

uint64_t (*MSCMSAuthEnvelopedData.recipients.modify())()
{
  return j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.encryptionAlgorithm.getter()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  return *v1;
}

void MSCMSAuthEnvelopedData.encryptionAlgorithm.setter(void *a1)
{
}

uint64_t (*MSCMSAuthEnvelopedData.encryptionAlgorithm.modify())()
{
  return j_j__swift_endAccess;
}

id sub_181118CB4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  SecCertificateRef v5 = (void *)sub_1811295CC();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.getter()
{
  return sub_181118F3C();
}

uint64_t sub_181118D60(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void *a6)
{
  uint64_t v8 = sub_1811295D8();
  unint64_t v9 = (uint64_t *)(a1 + *a6);
  swift_beginAccess();
  uint64_t *v9 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t MSCMSAuthEnvelopedData.protectedAttributes.setter(uint64_t a1)
{
  return sub_181118FF8(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.protectedAttributes.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.getter()
{
  return sub_181118F3C();
}

uint64_t MSCMSAuthEnvelopedData.unprotectedAttributes.setter(uint64_t a1)
{
  return sub_181118FF8(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
}

uint64_t (*MSCMSAuthEnvelopedData.unprotectedAttributes.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.getter()
{
  return sub_181118F3C();
}

uint64_t sub_181118F3C()
{
  return swift_bridgeObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.originatorCertificates.setter(uint64_t a1)
{
  return sub_181118FF8(a1, &OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates);
}

uint64_t sub_181118FF8(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.originatorCertificates.modify())()
{
  return j_j__swift_endAccess;
}

id MSCMSAuthEnvelopedData.contentType.getter()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  return *v1;
}

void MSCMSAuthEnvelopedData.contentType.setter(void *a1)
{
}

void sub_18111912C(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  SecCertificateRef v5 = *v4;
  void *v4 = a1;
}

uint64_t (*MSCMSAuthEnvelopedData.contentType.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1811191BC()
{
  return 0LL;
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MSCMSAuthEnvelopedData.embeddedContent.setter(uint64_t a1)
{
  double v3 = (void *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSAuthEnvelopedData.embeddedContent.modify())()
{
  return j_j__swift_endAccess;
}

void *sub_18111934C()
{
  return &unk_18112C2A0;
}

uint64_t sub_181119358()
{
  return 16LL;
}

id MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_18111D444(a1);

  return v4;
}

id MSCMSAuthEnvelopedData.init(encryptionAlgorithm:)(void *a1)
{
  id v2 = sub_18111D444(a1);

  return v2;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)( uint64_t a1, unint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_18111D5AC(a1, a2, a3);

  sub_181118884(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:)(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = sub_18111D5AC(a1, a2, a3);

  sub_181118884(a1, a2);
  return v6;
}

id MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)( uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_18111D870(a1, a2, a3, a4);

  sub_181118884(a1, a2);
  return v10;
}

id MSCMSAuthEnvelopedData.init(dataContent:recipient:encryptionAlgorithm:)( uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v8 = sub_18111D870(a1, a2, a3, a4);

  sub_181118884(a1, a2);
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  sub_181129590();
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v6 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v7 = sub_18111CD44();
  id v8 = objc_msgSend(v5, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:)(uint64_t a1, void *a2)
{
  id v3 = v2;
  sub_181129590();
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v6 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v7 = sub_18111CD44();
  id v8 = objc_msgSend(v3, sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_, a1, a2, v7);

  swift_unknownObjectRelease();
  return v8;
}

id MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)( void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_18111DAAC(a1, a2, a3);
  swift_unknownObjectRelease();

  return v8;
}

id MSCMSAuthEnvelopedData.init(embeddedContent:recipient:encryptionAlgorithm:)(void *a1, void *a2, void *a3)
{
  id v5 = sub_18111DAAC(a1, a2, a3);
  swift_unknownObjectRelease();

  return v5;
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addRecipient(_:)(MSCMSRecipientInfo *a1)
{
}

Swift::OpaquePointer_optional __swiftcall MSCMSAuthEnvelopedData.getAttributes(OID:)(MSOID *OID)
{
  unint64_t v23 = MEMORY[0x18961AFE8];
  id v2 = (uint64_t *)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if ((unint64_t)*v2 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_181129680();
    if (!v4) {
      goto LABEL_14;
    }
  }

  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v4) {
      goto LABEL_14;
    }
  }

  id v5 = (void *)sub_18112057C(0LL, (unint64_t *)&unk_18C548160);
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }

  for (uint64_t i = 0LL; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001LL) != 0) {
      id v8 = (id)MEMORY[0x186E061EC](i, v3);
    }
    else {
      id v8 = *(id *)(v3 + 8 * i + 32);
    }
    id v9 = v8;
    id v10 = objc_msgSend(v8, sel_attributeType);
    char v11 = sub_18112962C();

    if ((v11 & 1) != 0)
    {
      id v12 = v9;
      MEMORY[0x186E06144]();
      if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
        sub_1811295F0();
      }
      sub_181129608();
      sub_1811295E4();
    }
  }

LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }

  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v15) {
      goto LABEL_16;
    }
  }

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addProtectedAttribute(_:)(MSCMSAttribute *a1)
{
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.addUnprotectedAttribute(_:)(MSCMSAttribute *a1)
{
}

uint64_t sub_181119EA8(void *a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  id v5 = a1;
  MEMORY[0x186E06144]();
  if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*v4 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
    sub_1811295F0();
  }
  sub_181129608();
  sub_1811295E4();
  return swift_endAccess();
}

void sub_181119F4C(char *a1, uint64_t a2, void *a3, void *a4)
{
  Swift::Bool v6 = &a1[*a4];
  swift_beginAccess();
  id v7 = a3;
  id v8 = a1;
  MEMORY[0x186E06144]();
  if (*(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8LL)
                                                                              + 0x18) >> 1)
    sub_1811295F0();
  sub_181129608();
  sub_1811295E4();
  swift_endAccess();
}

Swift::Void __swiftcall MSCMSAuthEnvelopedData.setContentType(type:)(MSOID *type)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  uint64_t v4 = *v3;
  objc_class *v3 = type;
  id v5 = type;
}

void sub_18111A064(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  Swift::Bool v6 = *v5;
  MSOID *v5 = a3;
  id v7 = a3;
}

uint64_t MSCMSAuthEnvelopedData.encodeMessageSecurityObject()()
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  int v70 = 0;
  uint64_t v71 = 0LL;
  int v72 = 0;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  uint64_t v78 = 0LL;
  id v54 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  int v69 = 0;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  uint64_t v65 = 0LL;
  uint64_t v66 = 0LL;
  uint64_t v1 = (void *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_recipients);
  swift_beginAccess();
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_181129680();
    swift_bridgeObjectRelease();
    if (v44 >= 1)
    {
LABEL_3:
      id v64 = 0LL;
      uint64_t v60 = 0LL;
      uint64_t v61 = 0LL;
      uint64_t v62 = 0LL;
      uint64_t v2 = (id *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
      swift_beginAccess();
      uint64_t v53 = v2;
      id v58 = objc_msgSend(*v2, sel_Asn1OID);
      uint64_t v59 = v3;
      uint64_t v63 = swift_slowAlloc();
      uint64_t v4 = (void *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
      swift_beginAccess();
      id v5 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_initWithOID_, *v4);
      id v6 = objc_msgSend(v5, sel_keySize_, 0);

      *(void *)&__int128 v56 = sub_18111DCAC((uint64_t)v6);
      *((void *)&v56 + 1) = v7;
      sub_18111CE0C((uint64_t)&v56);
      __int128 v57 = v56;
      id v8 = objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_initWithOID_, *v4);
      id v9 = objc_msgSend(v8, sel_blockSize_, 0);

      id v10 = (void *)swift_slowAlloc();
      *(void *)&__int128 v67 = v9;
      *((void *)&v67 + 1) = v10;
      uint64_t v11 = swift_allocObject();
      int v12 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], (size_t)v9, v10);
      *(_DWORD *)(v11 + 16) = v12;
      id v13 = (_DWORD *)(v11 + 16);
      if (v12)
      {
        if (qword_18C548500 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_181129578();
        __swift_project_value_buffer(v14, (uint64_t)qword_18C548508);
        uint64_t v15 = (os_log_s *)sub_181129560();
        os_log_type_t v16 = sub_181129614();
        if (os_log_type_enabled(v15, v16))
        {
          id v17 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)id v17 = 67109120;
          swift_beginAccess();
          LODWORD(v56) = *v13;
          sub_181129644();
          _os_log_impl(&dword_1810EE000, v15, v16, "Unable to generate nonce underlying crypto error %d", v17, 8u);
          MEMORY[0x186E06BA0](v17, -1LL, -1LL);
        }

        swift_beginAccess();
        uint64_t v0 = *(unsigned int *)(v11 + 16);
        sub_18111DC68();
        swift_allocError();
        *(void *)uint64_t v18 = v0;
        *(void *)(v18 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
        *(_BYTE *)(v18 + 16) = 0;
        swift_willThrow();
        swift_release();
        if (!*((void *)&v67 + 1))
        {
          __break(1u);
          goto LABEL_44;
        }

        MEMORY[0x186E06BA0](*((void *)&v67 + 1), -1LL, -1LL);
        sub_181118884(v57, *((unint64_t *)&v57 + 1));
        uint64_t v19 = v63;
        if (v63) {
          goto LABEL_41;
        }
        __break(1u);
      }

      length_GCMParameters();
      char v20 = (_BYTE *)swift_slowAlloc();
      int v21 = encode_GCMParameters();
      *id v13 = v21;
      if (!v21) {
        goto LABEL_19;
      }
      if (qword_18C548500 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_181129578();
      __swift_project_value_buffer(v22, (uint64_t)qword_18C548508);
      uint64_t v0 = sub_181129560();
      os_log_type_t v23 = sub_181129614();
      if (os_log_type_enabled((os_log_t)v0, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl(&dword_1810EE000, (os_log_t)v0, v23, "Invalid data - Error encoding GCM parameters", v24, 2u);
        MEMORY[0x186E06BA0](v24, -1LL, -1LL);
      }

      sub_18111DC68();
      swift_allocError();
      *(_OWORD *)uint64_t v25 = xmmword_18112C220;
      *(_BYTE *)(v25 + 16) = 48;
      swift_willThrow();
      MEMORY[0x186E06BA0](v20, -1LL, -1LL);
      swift_release();
      if (*((void *)&v67 + 1))
      {
        MEMORY[0x186E06BA0](*((void *)&v67 + 1), -1LL, -1LL);
        sub_181118884(v57, *((unint64_t *)&v57 + 1));
        uint64_t v19 = v63;
        if (!v63)
        {
          __break(1u);
LABEL_19:
          uint64_t v50 = v20;
          uint64_t v26 = sub_18111DE18(v20, 0LL);
          unint64_t v51 = v27;
          uint64_t v52 = v26;
          id v28 = *v53;
          sub_181129590();
          id v29 = v28;
          id v30 = (void *)sub_181129584();
          swift_bridgeObjectRelease();
          unsigned int v31 = objc_msgSend(v29, sel_isEqualToString_, v30);

          if (v31)
          {
            __int128 v32 = (uint64_t *)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
            swift_beginAccess();
            unint64_t v33 = v32[1];
            sub_1811189A4(*v32, v33);
            goto LABEL_24;
          }

          id v34 = (void **)(v0 + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
          swift_beginAccess();
          uint64_t v35 = *v34;
          if (*v34)
          {
            v55[0] = 0LL;
            id v36 = objc_msgSend(v35, sel_encodeMessageSecurityObject_, v55);
            id v37 = v55[0];
            if (v36)
            {
              sub_181129554();
              unint64_t v33 = v38;

LABEL_24:
              __asm { BR              X10 }
            }

            id v43 = v37;
            sub_181129500();

            swift_willThrow();
            sub_181118884(v52, v51);
            MEMORY[0x186E06BA0](v50, -1LL, -1LL);
            swift_release();
            if (*((void *)&v67 + 1))
            {
              MEMORY[0x186E06BA0](*((void *)&v67 + 1), -1LL, -1LL);
              sub_181118884(v57, *((unint64_t *)&v57 + 1));
              uint64_t v19 = v63;
              if (!v63)
              {
                __break(1u);
                JUMPOUT(0x18111AB20LL);
              }

              goto LABEL_41;
            }
          }

          else
          {
            if (qword_18C548500 != -1) {
              swift_once();
            }
            uint64_t v39 = sub_181129578();
            __swift_project_value_buffer(v39, (uint64_t)qword_18C548508);
            uint64_t v0 = sub_181129560();
            os_log_type_t v40 = sub_181129614();
            if (os_log_type_enabled((os_log_t)v0, v40))
            {
              uint64_t v41 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v41 = 0;
              _os_log_impl(&dword_1810EE000, (os_log_t)v0, v40, "Invalid input data/embedded data", v41, 2u);
              MEMORY[0x186E06BA0](v41, -1LL, -1LL);
            }

            sub_18111DC68();
            swift_allocError();
            *(void *)uint64_t v42 = 0LL;
            *(void *)(v42 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
            *(_BYTE *)(v42 + 16) = 48;
            swift_willThrow();
            sub_181118884(v52, v51);
            sub_18111DEC4(0LL, 0xF000000000000000LL);
            MEMORY[0x186E06BA0](v50, -1LL, -1LL);
            swift_release();
            if (*((void *)&v67 + 1))
            {
              MEMORY[0x186E06BA0](*((void *)&v67 + 1), -1LL, -1LL);
              sub_181118884(v57, *((unint64_t *)&v57 + 1));
              uint64_t v19 = v63;
              if (!v63)
              {
                __break(1u);
                JUMPOUT(0x18111A804LL);
              }

              goto LABEL_41;
            }

            __break(1u);
          }

          __break(1u);
          JUMPOUT(0x18111BBCCLL);
        }

LABEL_44:
      __break(1u);
      JUMPOUT(0x18111BBC0LL);
    }
  }

  else if (*(uint64_t *)((*v1 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= 1)
  {
    goto LABEL_3;
  }

  if (qword_18C548500 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_181129578();
  __swift_project_value_buffer(v45, (uint64_t)qword_18C548508);
  uint64_t v0 = sub_181129560();
  os_log_type_t v46 = sub_181129614();
  if (os_log_type_enabled((os_log_t)v0, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v47 = 0;
    _os_log_impl(&dword_1810EE000, (os_log_t)v0, v46, "No recipient found", v47, 2u);
    MEMORY[0x186E06BA0](v47, -1LL, -1LL);
  }

  sub_18111DC68();
  swift_allocError();
  *(_OWORD *)uint64_t v48 = xmmword_18112C210;
  *(_BYTE *)(v48 + 16) = 48;
  swift_willThrow();
LABEL_42:

  return v0;
}

void sub_18111BC88( uint64_t a1@<X2>, _BYTE *a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8 >> 60 != 15)
  {
    MEMORY[0x1895F8858](a7, a8);
    __asm { BR              X10 }
  }

  *a2 = 1;
}

void *sub_18111C130( uint64_t a1, uint64_t a2, id *a3, uint64_t a4, uint64_t a5, unint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t *a14, uint64_t a15, uint64_t a16)
{
  v59[6] = *MEMORY[0x1895F89C0];
  int v21 = (void **)(a4 + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  uint64_t v22 = *v21;
  id v23 = objc_allocWithZone((Class)&OBJC_CLASS___MSAlgorithmIdentifier);
  id v24 = v22;
  sub_1811189A4(a5, a6);
  uint64_t v25 = (void *)sub_18112953C();
  sub_181118884(a5, a6);
  id v26 = objc_msgSend(v23, sel_initWithOID_parameters_, v24, v25);

  id v27 = *a3;
  *a3 = v26;

  id v28 = *a3;
  v59[0] = *a7;
  unsigned int v29 = objc_msgSend(v28, sel_ccAlgorithm_, v59);
  id v30 = (void *)v59[0];
  unsigned int v31 = (void *)*a7;
  *a7 = v59[0];
  id v32 = v30;

  id v33 = *a3;
  v59[0] = *a7;
  unsigned int v34 = objc_msgSend(v33, sel_ccMode_, v59);
  uint64_t v35 = (void *)v59[0];
  id v36 = (void *)*a7;
  *a7 = v59[0];
  id v37 = v35;

  if (v29 || v34 != 11)
  {
    if (qword_18C548500 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_181129578();
    __swift_project_value_buffer(v45, (uint64_t)qword_18C548508);
    os_log_type_t v46 = (os_log_s *)sub_181129560();
    os_log_type_t v47 = sub_181129614();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 67109120;
      LODWORD(v59[0]) = v29;
      sub_181129644();
      _os_log_impl(&dword_1810EE000, v46, v47, "Invalid input algorithm %u", v48, 8u);
      MEMORY[0x186E06BA0](v48, -1LL, -1LL);
    }

    sub_18111DC68();
    swift_allocError();
    *(void *)uint64_t v49 = 0LL;
    *(void *)(v49 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(_BYTE *)(v49 + 16) = 48;
    return (void *)swift_willThrow();
  }

  Swift::OpaquePointer_optional result = objc_msgSend(*a3, sel_asn1AlgId);
  uint64_t v39 = result[2];
  *(_OWORD *)(a8 + 16) = *(_OWORD *)result;
  *(void *)(a8 + 32) = v39;
  if (a10)
  {
    int v40 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], a11 - (void)a10, a10);
    swift_beginAccess();
    *(_DWORD *)(a9 + 16) = v40;
    if (v40)
    {
      if (qword_18C548500 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_181129578();
      __swift_project_value_buffer(v41, (uint64_t)qword_18C548508);
      swift_retain();
      uint64_t v42 = (os_log_s *)sub_181129560();
      os_log_type_t v43 = sub_181129614();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 67109120;
        swift_beginAccess();
        sub_181129644();
        swift_release();
        _os_log_impl(&dword_1810EE000, v42, v43, "Unable to generate key underlying crypto error %d", v44, 8u);
        MEMORY[0x186E06BA0](v44, -1LL, -1LL);
      }

      else
      {

        swift_release();
      }

      swift_beginAccess();
      uint64_t v55 = *(unsigned int *)(a9 + 16);
LABEL_22:
      sub_18111DC68();
      swift_allocError();
      *(void *)uint64_t v56 = v55;
      *(void *)(v56 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      *(_BYTE *)(v56 + 16) = 0;
      return (void *)swift_willThrow();
    }

    Swift::OpaquePointer_optional result = (void *)CCCryptorGCMOneshotEncrypt();
    if ((_DWORD)result)
    {
      unsigned int v50 = result;
      if (qword_18C548500 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_181129578();
      __swift_project_value_buffer(v51, (uint64_t)qword_18C548508);
      uint64_t v52 = (os_log_s *)sub_181129560();
      os_log_type_t v53 = sub_181129614();
      if (os_log_type_enabled(v52, v53))
      {
        id v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)id v54 = 67109120;
        sub_181129644();
        _os_log_impl(&dword_1810EE000, v52, v53, "Error encrypting underlying crypto error %d", v54, 8u);
        MEMORY[0x186E06BA0](v54, -1LL, -1LL);
      }

      uint64_t v55 = v50;
      goto LABEL_22;
    }

    __int128 v57 = *(void **)(a8 + 40);
    if (v57)
    {
      uint64_t v58 = *a14;
      *__int128 v57 = a16;
      v57[1] = v58;
      return result;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t static MSCMSAuthEnvelopedData.decodeMessageSecurityObject(_:options:)(void *a1, uint64_t a2)
{
  return sub_18111E900(a1, a2);
}

uint64_t sub_18111C7A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_181129680();
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v3 = MEMORY[0x18961AFE8];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x18961AFE8];
  uint64_t result = sub_18111D2BC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        MEMORY[0x186E061EC](i, a1);
        type metadata accessor for SecCertificate();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_18111D2BC(0, *(void *)(v3 + 16) + 1LL, 1);
          uint64_t v3 = v13;
        }

        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_18111D2BC(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }

        *(void *)(v3 + 16) = v7 + 1;
        sub_1811205B4(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }

    else
    {
      unint64_t v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_18111D2BC(0, *(void *)(v3 + 16) + 1LL, 1);
          uint64_t v3 = v13;
        }

        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_18111D2BC(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }

        *(void *)(v3 + 16) = v11 + 1;
        sub_1811205B4(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }

      while (v2);
    }

    return v3;
  }

  __break(1u);
  return result;
}

void __swiftcall MSCMSAuthEnvelopedData.type()(MSOID *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  sub_18111CD44();
}

id MSCMSAuthEnvelopedData.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSAuthEnvelopedData.init()()
{
}

id MSCMSAuthEnvelopedData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_18111CD44()
{
  v6[1] = *(id *)MEMORY[0x1895F89C0];
  id v1 = (void *)sub_181129584();
  swift_bridgeObjectRelease();
  v6[0] = 0LL;
  id v2 = objc_msgSend(v0, sel_initWithString_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }

  else
  {
    id v4 = v6[0];
    sub_181129500();

    swift_willThrow();
  }

  return v2;
}

void sub_18111CE0C(uint64_t a1)
{
  __asm { BR              X13 }

void *sub_18111CE68( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  unsigned __int8 v32 = BYTE4(v24);
  unsigned __int8 v33 = BYTE5(v24);
  unsigned __int8 v34 = BYTE6(v24);
  uint64_t result = memset(&v30, v27, BYTE6(v24));
  unint64_t v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  void *v26 = v30;
  v26[1] = v29;
  return result;
}

void sub_18111CFF4(uint64_t a1)
{
  __asm { BR              X11 }

void sub_18111D058(uint64_t a1@<X8>)
{
  uint64_t *v3 = v4;
  v3[1] = (uint64_t)&v6;
  if (v4 > 0) {
    *(void *)(v5 + _Block_object_dispose((const void *)(v1 - 96), 8) = v3;
  }
  *id v1 = v2;
  v1[1] = a1 & 0xFFFFFFFFFFFFFFLL;
}

char *sub_18111D23C(int *a1, int a2)
{
  uint64_t result = (char *)sub_181129524();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t result = (char *)sub_181129494();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  unint64_t v7 = result;
  uint64_t result = (char *)sub_1811294B8();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_1811294AC();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_18111D2BC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_18111D2D8(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_18111D2D8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C548170);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

id sub_18111D444(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_18112C240;
  uint64_t v4 = MEMORY[0x18961AFE8];
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x18961AFE8];
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v4;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0LL;
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_18112C240;
  *(void *)&v1[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a1;
  sub_181129590();
  uint64_t v5 = v1;
  id v6 = a1;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v7 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_18111CD44();

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id sub_18111D5AC(uint64_t a1, unint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = (uint64_t *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_18112C240;
  id v7 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  uint64_t v8 = MEMORY[0x18961AFE8];
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x18961AFE8];
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v8;
  *(void *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0LL;
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_18112C240;
  sub_181129590();
  objc_super v9 = v3;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v10 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v11 = sub_18111CD44();
  *(void *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = v11;
  sub_181129590();
  id v17 = v11;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v12 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  *(void *)&v9[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_18111CD44();
  swift_beginAccess();
  uint64_t v13 = *v6;
  unint64_t v14 = v6[1];
  uint64_t *v6 = a1;
  v6[1] = a2;
  sub_1811189A4(a1, a2);
  sub_181118884(v13, v14);
  swift_beginAccess();
  id v15 = a3;
  MEMORY[0x186E06144]();
  if (*(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*(void *)v7 & 0xFFFFFFFFFFFFFF8LL)
                                                                              + 0x18) >> 1)
    sub_1811295F0();
  sub_181129608();
  sub_1811295E4();
  swift_endAccess();

  v20.receiver = v9;
  v20.super_class = ObjectType;
  return objc_msgSendSuper2(&v20, sel_init);
}

id sub_18111D870(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  id v10 = (uint64_t *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent];
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_18112C240;
  uint64_t v11 = MEMORY[0x18961AFE8];
  id v12 = &v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients] = MEMORY[0x18961AFE8];
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v11;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0LL;
  *(_OWORD *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_18112C240;
  *(void *)&v5[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a4;
  sub_181129590();
  uint64_t v13 = v5;
  id v14 = a4;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v15 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  *(void *)&v13[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = sub_18111CD44();
  swift_beginAccess();
  uint64_t v16 = *v10;
  unint64_t v17 = v10[1];
  uint64_t *v10 = a1;
  v10[1] = a2;
  sub_1811189A4(a1, a2);
  sub_181118884(v16, v17);
  if (a3)
  {
    swift_beginAccess();
    id v18 = a3;
    MEMORY[0x186E06144]();
    if (*(void *)((*(void *)v12 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*(void *)v12 & 0xFFFFFFFFFFFFFF8LL)
                                                                                 + 0x18) >> 1)
      sub_1811295F0();
    sub_181129608();
    sub_1811295E4();
    swift_endAccess();
  }

  v21.receiver = v13;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_18111DAAC(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v3[OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent] = xmmword_18112C240;
  objc_super v9 = &v3[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  uint64_t v10 = MEMORY[0x18961AFE8];
  *(void *)objc_super v9 = MEMORY[0x18961AFE8];
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes] = v10;
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes] = v10;
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates] = v10;
  uint64_t v11 = &v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent];
  *(void *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent] = 0LL;
  *(_OWORD *)&v4[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent] = xmmword_18112C240;
  swift_beginAccess();
  *(void *)uint64_t v11 = a1;
  id v12 = v4;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(a1, sel_type);
  *(void *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_contentType] = v13;
  swift_beginAccess();
  id v14 = a2;
  MEMORY[0x186E06144]();
  if (*(void *)((*(void *)v9 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*(void *)v9 & 0xFFFFFFFFFFFFFF8LL)
                                                                              + 0x18) >> 1)
    sub_1811295F0();
  sub_181129608();
  sub_1811295E4();
  swift_endAccess();
  *(void *)&v12[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm] = a3;
  id v15 = a3;

  v17.receiver = v12;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_18111DC68()
{
  unint64_t result = qword_18C548280;
  if (!qword_18C548280)
  {
    unint64_t result = MEMORY[0x186E06B4C](&protocol conformance descriptor for MSCMSError, &type metadata for MSCMSError);
    atomic_store(result, (unint64_t *)&qword_18C548280);
  }

  return result;
}

uint64_t sub_18111DCAC(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0LL;
      }
    }

    else
    {
      sub_1811294C4();
      swift_allocObject();
      sub_1811294A0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_181129530();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0LL;
        *(void *)(result + 24) = v1;
      }

      else
      {
        return v1 << 32;
      }
    }
  }

  return result;
}

uint64_t sub_18111DD48()
{
  return swift_deallocObject();
}

uint64_t sub_18111DD58(_BYTE *__src, _BYTE *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_18111DE18(_BYTE *__src, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 <= 14) {
    return sub_18111DD58(__src, &__src[a2]);
  }
  sub_1811294C4();
  swift_allocObject();
  sub_181129488();
  sub_181129530();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_18111DEC4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_181118884(a1, a2);
  }
  return a1;
}

uint64_t sub_18111DED8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t result = sub_181129494();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = sub_1811294B8();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v8 += a1 - result;
  }

  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v11 = sub_1811294AC();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0LL;
  }
  a4(v8, v14);
  return 0LL;
}

void sub_18111DF78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (sub_181129494())
  {
    if (__OFSUB__(a1, sub_1811294B8()))
    {
      __break(1u);
    }

    else if (!__OFSUB__(a2, a1))
    {
      sub_1811294AC();
      sub_18111BC88(a4, &v18, a10, a11, a12, a13, a14, a15);
      return;
    }

    __break(1u);
  }

  __break(1u);
}

void sub_18111E084(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_18111E118@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  *(void *)(v9 - 120) = v8;
  *(_WORD *)(v9 - 112) = a3;
  *(_BYTE *)(v9 - 110) = BYTE2(a3);
  *(_BYTE *)(v9 - 109) = BYTE3(a3);
  *(_BYTE *)(v9 - 10_Block_object_dispose((const void *)(v1 - 96), 8) = BYTE4(a3);
  *(_BYTE *)(v9 - 107) = BYTE5(a3);
  *(_BYTE *)(v9 - 106) = BYTE6(a3);
  id v10 = a2;
  sub_1811189A4(v5, v4);
  swift_retain();
  sub_18111BC88(v7, (_BYTE *)(v9 - 97), *(void *)(v9 - 128), v3, *(void *)(v9 - 136), v22, v21, v20);
  if (v6)
  {
    uint64_t v11 = *(void *)(v9 - 120);
    *(void *)(v9 - 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(unsigned int *)(v9 - 112);
    uint64_t v12 = *(unsigned __int8 *)(v9 - 108);
    uint64_t v13 = *(unsigned __int8 *)(v9 - 107);
    uint64_t v14 = *(unsigned __int8 *)(v9 - 106);

    sub_181118884(v5, v4);
    uint64_t v15 = *(void *)(v9 - 128) | (v12 << 32) | (v13 << 40) | (v14 << 48);
  }

  else
  {
    uint64_t v13 = *(unsigned __int8 *)(v9 - 97);
    uint64_t v11 = *(void *)(v9 - 120);
    *(void *)(v9 - 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(unsigned int *)(v9 - 112);
    *(void *)(v9 - 136) = *(unsigned __int8 *)(v9 - 108);
    uint64_t v16 = *(unsigned __int8 *)(v9 - 107);
    uint64_t v17 = *(unsigned __int8 *)(v9 - 106);

    sub_181118884(v5, v4);
    uint64_t v15 = *(void *)(v9 - 128) | (*(void *)(v9 - 136) << 32) | (v16 << 40) | (v17 << 48);
  }

  *a1 = v11;
  a1[1] = v15;
  swift_release();
  return v13;
}

uint64_t sub_18111E744()
{
  uint64_t result = encode_AuthEnvelopedData();
  if ((_DWORD)result)
  {
    if (qword_18C548500 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_181129578();
    __swift_project_value_buffer(v1, (uint64_t)qword_18C548508);
    unint64_t v2 = (os_log_s *)sub_181129560();
    os_log_type_t v3 = sub_181129614();
    if (os_log_type_enabled(v2, v3))
    {
      unint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_1810EE000, v2, v3, "Invalid data - error encoding AuthEnvelopedData", v4, 2u);
      MEMORY[0x186E06BA0](v4, -1LL, -1LL);
    }

    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v5 = xmmword_18112C220;
    *(_BYTE *)(v5 + 16) = 48;
    return swift_willThrow();
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x186E06B40]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void type metadata accessor for SecCertificate()
{
  if (!qword_18C548188)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C548188);
    }
  }

uint64_t sub_18111E900(void *a1, uint64_t a2)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v4 = objc_msgSend(objc_allocWithZone((Class)MSCMSRecipientInfo), sel_init);
  os_log_type_t v43 = (char *)objc_msgSend(objc_allocWithZone((Class)MSAlgorithmIdentifier), sel_init);
  id v5 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_init);
  int v46 = 0;
  uint64_t v47 = 0LL;
  int v48 = 0;
  __int128 v49 = 0u;
  memset(v50, 0, sizeof(v50));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  uint64_t v53 = 0LL;
  if (nsheim_decode_AuthEnvelopedData(a1))
  {
    if (qword_18C548500 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_181129578();
    __swift_project_value_buffer(v6, (uint64_t)qword_18C548508);
    uint64_t v7 = (os_log_s *)sub_181129560();
    os_log_type_t v8 = sub_181129614();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1810EE000, v7, v8, "Invalid data - error decoding AuthEnvelopedData", v9, 2u);
      MEMORY[0x186E06BA0](v9, -1LL, -1LL);
    }

    dumpNSData("AuthEnvelopedData", a1);
    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v10 = xmmword_18112C270;
    *(_BYTE *)(v10 + 16) = 48;
    swift_willThrow();

    uint64_t v11 = v43;
LABEL_7:

    return a2;
  }

  id v13 = objc_allocWithZone((Class)type metadata accessor for MSCMSAuthEnvelopedData());
  id v14 = v5;
  uint64_t v15 = (char *)sub_18111D444(v14);
  uint64_t v41 = v14;

  uint64_t v42 = v15;
  uint64_t v16 = v15;
  a2 = 0LL;
  swift_bridgeObjectRelease();
  uint64_t v17 = &v15[OBJC_IVAR___MSCMSAuthEnvelopedData_recipients];
  swift_beginAccess();
  if (*(void *)v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_181129680();
    swift_bridgeObjectRelease();
    if (v30 >= 1) {
      goto LABEL_11;
    }
  }

  else if (*(uint64_t *)((*(void *)v17 & 0xFFFFFFFFFFFFF8LL) + 0x10) >= 1)
  {
LABEL_11:
    uint64_t v44 = v17;
    if ((void)v51)
    {
      char v18 = NSDataFromOctetString((void *)v51);
      uint64_t v19 = sub_181129554();
      uint64_t v21 = v20;

      uint64_t v22 = (uint64_t *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
      uint64_t v23 = *(void *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent];
      unint64_t v24 = *(void *)&v42[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent + 8];
      *uint64_t v22 = v19;
      v22[1] = v21;
      sub_181118884(v23, v24);
      *(void *)&__int128 v45 = 0LL;
      id v25 = objc_msgSend( objc_allocWithZone((Class)MSAlgorithmIdentifier),  sel_initWithAsn1AlgId_error_,  &v50[1],  &v45);

      (id)v45;
      id v26 = v25;
      int v27 = NSDataFromOctetString(&v52);
      sub_181129554();
      uint64_t v29 = v28;

      __asm { BR              X10 }
    }

    __break(1u);
    swift_once();
    uint64_t v36 = sub_181129578();
    __swift_project_value_buffer(v36, (uint64_t)qword_18C548508);
    id v37 = (os_log_s *)sub_181129560();
    os_log_type_t v38 = sub_181129614();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1810EE000, v37, v38, "Invalid data - no certificate in originatorCertificates", v39, 2u);
      MEMORY[0x186E06BA0](v39, -1LL, -1LL);
    }

    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v40 = xmmword_18112C280;
    *(_BYTE *)(v40 + 16) = 48;
    swift_willThrow();

    uint64_t v11 = v44;
    goto LABEL_7;
  }

  if (qword_18C548500 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_181129578();
  __swift_project_value_buffer(v31, (uint64_t)qword_18C548508);
  unsigned __int8 v32 = (os_log_s *)sub_181129560();
  os_log_type_t v33 = sub_181129614();
  if (os_log_type_enabled(v32, v33))
  {
    unsigned __int8 v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned __int8 v34 = 0;
    _os_log_impl(&dword_1810EE000, v32, v33, "Invalid data - no recipients found", v34, 2u);
    MEMORY[0x186E06BA0](v34, -1LL, -1LL);
  }

  sub_18111DC68();
  swift_allocError();
  *(_OWORD *)uint64_t v35 = xmmword_18112C270;
  *(_BYTE *)(v35 + 16) = 48;
  swift_willThrow();

  return a2;
}

uint64_t type metadata accessor for MSCMSAuthEnvelopedData()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSAuthEnvelopedData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(dataContent:recipient:encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of MSCMSAuthEnvelopedData.__allocating_init(embeddedContent:recipient:encryptionAlgorithm:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_18112057C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }

  return result;
}

_OWORD *sub_1811205B4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_1811205C8(uint64_t a1, uint64_t a2)
{
  return sub_18111C130( a1,  a2,  *(id **)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(void **)(v2 + 48),  *(void *)(v2 + 56),  *(void *)(v2 + 64),  *(void **)(v2 + 72),  *(void *)(v2 + 80),  *(void *)(v2 + 88),  *(void *)(v2 + 96),  *(uint64_t **)(v2 + 104),  *(void *)(v2 + 112),  *(void *)(v2 + 120));
}

uint64_t sub_181120608(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1811189A4(a1, a2);
  }
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

id MSCMSCompressedData.type.getter()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___MSCMSCompressedData_type);
  swift_beginAccess();
  return *v1;
}

void MSCMSCompressedData.type.setter(void *a1)
{
}

uint64_t (*MSCMSCompressedData.type.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_18112074C()
{
  return 0LL;
}

uint64_t MSCMSCompressedData.dataContent.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSCompressedData_dataContent;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_181120608(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t MSCMSCompressedData.dataContent.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (uint64_t *)(v2 + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_18111DEC4(v6, v7);
}

uint64_t (*MSCMSCompressedData.dataContent.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MSCMSCompressedData.embeddedContent.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t MSCMSCompressedData.embeddedContent.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  void *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*MSCMSCompressedData.embeddedContent.modify())()
{
  return j_j__swift_endAccess;
}

id MSCMSCompressedData.contentType.getter()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  return *v1;
}

void MSCMSCompressedData.contentType.setter(void *a1)
{
}

uint64_t (*MSCMSCompressedData.contentType.modify())()
{
  return j__swift_endAccess;
}

id MSCMSCompressedData.__allocating_init(dataContent:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return MSCMSCompressedData.init(dataContent:)(a1, a2);
}

id MSCMSCompressedData.init(dataContent:)(uint64_t a1, unint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v2[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_18112C230;
  unint64_t v7 = &v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(void *)&v2[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0LL;
  swift_beginAccess();
  uint64_t v9 = *(void *)v6;
  unint64_t v8 = *((void *)v6 + 1);
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  uint64_t v10 = v2;
  sub_1811189A4(a1, a2);
  sub_18111DEC4(v9, v8);
  swift_beginAccess();
  *(void *)unint64_t v7 = 0LL;
  swift_unknownObjectRelease();
  sub_181129590();
  id v11 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v12 = sub_18111CD44();
  if (v3)
  {
    sub_181118884(a1, a2);
    sub_18111DEC4(*(void *)v6, *((void *)v6 + 1));
    swift_unknownObjectRelease();
    id v15 = v10;

    swift_deallocPartialClassInstance();
  }

  else
  {
    *(void *)&v10[OBJC_IVAR___MSCMSCompressedData_contentType] = v12;
    sub_181129590();
    id v13 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
    *(void *)&v10[OBJC_IVAR___MSCMSCompressedData_type] = sub_18111CD44();

    v16.receiver = v10;
    v16.super_class = ObjectType;
    id v15 = objc_msgSendSuper2(&v16, sel_init);
    sub_181118884(a1, a2);
  }

  return v15;
}

objc_class *MSCMSCompressedData.__allocating_init(embeddedContent:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MSCMSCompressedData.init(embeddedContent:)(a1);
}

objc_class *MSCMSCompressedData.init(embeddedContent:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = &v1[OBJC_IVAR___MSCMSCompressedData_dataContent];
  *(_OWORD *)&v1[OBJC_IVAR___MSCMSCompressedData_dataContent] = xmmword_18112C230;
  uint64_t v6 = &v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent];
  *(void *)&v1[OBJC_IVAR___MSCMSCompressedData_embeddedContent] = 0LL;
  swift_beginAccess();
  uint64_t v7 = *(void *)v5;
  unint64_t v8 = *((void *)v5 + 1);
  *(_OWORD *)id v5 = xmmword_18112C230;
  uint64_t v9 = v1;
  sub_18111DEC4(v7, v8);
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(a1, sel_type);
  uint64_t v11 = OBJC_IVAR___MSCMSCompressedData_contentType;
  *(void *)&v9[OBJC_IVAR___MSCMSCompressedData_contentType] = v10;
  sub_181129590();
  id v12 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v13 = sub_18111CD44();
  if (v2)
  {
    swift_unknownObjectRelease();
    sub_18111DEC4(*(void *)v5, *((void *)v5 + 1));
    swift_unknownObjectRelease();
    id v14 = *(void **)&v9[v11];

    swift_deallocPartialClassInstance();
  }

  else
  {
    *(void *)&v9[OBJC_IVAR___MSCMSCompressedData_type] = v13;

    v16.receiver = v9;
    v16.super_class = ObjectType;
    ObjectType = (objc_class *)objc_msgSendSuper2(&v16, sel_init);
    swift_unknownObjectRelease();
  }

  return ObjectType;
}

uint64_t MSCMSCompressedData.encodeSecurityObject()()
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v18 = 0;
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  __int128 v19 = asn1_oid_id_alg_zlibCompress;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_181129590();
  id v3 = v2;
  id v4 = (void *)sub_181129584();
  swift_bridgeObjectRelease();
  unsigned int v5 = objc_msgSend(v3, sel_isEqualToString_, v4);

  if (v5)
  {
    uint64_t v6 = v0 + OBJC_IVAR___MSCMSCompressedData_dataContent;
    swift_beginAccess();
    uint64_t v7 = *(void **)v6;
    unint64_t v8 = *(void *)(v6 + 8);
    sub_181120608((uint64_t)v7, v8);
LABEL_6:
    if (v8 >> 60 != 15)
    {
      v17[0] = v7;
      v17[1] = (id)v8;
      __asm { BR              X10 }
    }

    goto LABEL_7;
  }

  uint64_t v9 = (void **)(v0 + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  id v10 = *v9;
  if (*v9)
  {
    v17[0] = 0LL;
    id v11 = objc_msgSend(v10, sel_encodeMessageSecurityObject_, v17);
    id v12 = v17[0];
    if (!v11)
    {
      id v15 = v12;
      sub_181129500();

      goto LABEL_8;
    }

    uint64_t v7 = (void *)sub_181129554();
    unint64_t v8 = v13;

    goto LABEL_6;
  }

void sub_181121414(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9 = (id *)(a2 + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  a3[4] = objc_msgSend(*v9, sel_Asn1OID);
  a3[5] = v10;
  a3[6] = a1;
  uint64_t v11 = length_CompressedData();
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x189603FB8]), sel_initWithLength_, v11);
  if (!v12)
  {
    sub_18111DC68();
    uint64_t v15 = swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_18112C340;
    *(_BYTE *)(v17 + 16) = 48;
    swift_willThrow();
    goto LABEL_8;
  }

  id v13 = v12;
  objc_msgSend(v13, sel_mutableBytes);
  else {
    BOOL v14 = v11 == 0;
  }
  if (!v14)
  {
    sub_18111DC68();
    uint64_t v15 = swift_allocError();
    *(_OWORD *)uint64_t v16 = xmmword_18112C330;
    *(_BYTE *)(v16 + 16) = 48;
    swift_willThrow();

LABEL_8:
    *a4 = v15;
    return;
  }

  *a5 = sub_181129554();
  a5[1] = v18;
}

objc_class *static MSCMSCompressedData.decodeSecurityObject(_:options:)(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_181121C10(a1, a2, a3);
}

id MSCMSCompressedData.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSCompressedData.init()()
{
}

id MSCMSCompressedData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_181121874(uint64_t a1)
{
  __asm { BR              X12 }

void sub_1811218DC(uint64_t a1@<X8>)
{
  uint64_t v13 = v1;
  LOWORD(v14) = a1;
  BYTE2(v14) = BYTE2(a1);
  HIBYTE(v14) = BYTE3(a1);
  unsigned __int8 v15 = BYTE4(a1);
  unsigned __int8 v16 = BYTE5(a1);
  unsigned __int8 v17 = BYTE6(a1);
  v18[0] = v6;
  v18[1] = &v13;
  sub_181121414((uint64_t)v18, (uint64_t)v3, v4, &v12, v5);
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  uint64_t v11 = v17;

  *objc_super v2 = v7;
  v2[1] = v8 | (v9 << 32) | (v10 << 40) | (v11 << 48);
}

void sub_181121B1C(int *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  v16[2] = *MEMORY[0x1895F89C0];
  sub_181129524();
  uint64_t v10 = *a1;
  if (a1[1] < (int)v10)
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v11 = sub_181129494();
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  uint64_t v13 = sub_1811294B8();
  if (__OFSUB__(v10, v13))
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }

  uint64_t v14 = v12 + v10 - v13;
  sub_1811294AC();
  v16[0] = a2;
  v16[1] = v14;
  sub_181121414((uint64_t)v16, (uint64_t)a3, a4, &v15, a5);
}

objc_class *sub_181121C10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  int v30 = 0;
  memset(v31, 0, sizeof(v31));
  uint64_t v6 = (void *)sub_18112953C();
  int v7 = nsheim_decode_CompressedData(v6);

  if (v7)
  {
    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_18112C340;
    *(_BYTE *)(v8 + 16) = 48;
    swift_willThrow();
LABEL_3:
    free_CompressedData();
    return v4;
  }

  id v10 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, v31, 0);
  __int128 v29 = asn1_oid_id_alg_zlibCompress;
  id v11 = objc_msgSend(objc_allocWithZone((Class)MSOID), sel_initWithAsn1OID_error_, &v29, 0);
  if (!objc_msgSend(v10, sel_isEqual_, v11))
  {
    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v17 = xmmword_18112C340;
    *(_BYTE *)(v17 + 16) = 48;
    swift_willThrow();

    goto LABEL_3;
  }

  uint64_t v12 = (uint64_t *)*((void *)&v31[2] + 1);
  __int128 v28 = *(_OWORD *)((char *)&v31[1] + 8);
  uint64_t result = (objc_class *)objc_msgSend( objc_allocWithZone((Class)MSOID),  sel_initWithAsn1OID_error_,  &v28,  0);
  if (v12)
  {
    uint64_t v13 = result;
    if (!*v12)
    {
      uint64_t v14 = 0LL;
      unint64_t v16 = 0xC000000000000000LL;
LABEL_12:
      sub_181129590();
      uint64_t v18 = (void *)sub_181129584();
      swift_bridgeObjectRelease();
      unsigned __int8 v19 = -[objc_class isEqualToString:](v13, sel_isEqualToString_, v18, v28, v29);

      if ((v19 & 1) != 0)
      {
        id v20 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
        uint64_t v21 = (objc_class *)MSCMSCompressedData.init(dataContent:)(v14, v16);
        if (!v3)
        {
          id v4 = v21;

LABEL_22:
          free_CompressedData();
          return v4;
        }
      }

      else
      {
        uint64_t v22 = (void *)sub_18112953C();
        id v23 = decodeEmbeddedCMSContent(v13, v22, a3, 0LL);

        if (v23)
        {
          id v24 = objc_allocWithZone((Class)type metadata accessor for MSCMSCompressedData());
          id v25 = (void *)swift_unknownObjectRetain();
          id v26 = MSCMSCompressedData.init(embeddedContent:)(v25);
          if (!v3)
          {
            id v4 = v26;
            sub_181118884(v14, v16);

            swift_unknownObjectRelease();
            goto LABEL_22;
          }

          sub_181118884(v14, v16);

          swift_unknownObjectRelease();
LABEL_20:

          goto LABEL_3;
        }

        sub_18111DC68();
        swift_allocError();
        *(_OWORD *)uint64_t v27 = xmmword_18112C340;
        *(_BYTE *)(v27 + 16) = 48;
        swift_willThrow();
        sub_181118884(v14, v16);
      }

      goto LABEL_20;
    }

    uint64_t result = (objc_class *)v12[1];
    if (result)
    {
      uint64_t v14 = sub_18111DE18(result, *v12);
      unint64_t v16 = v15;
      goto LABEL_12;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for MSCMSCompressedData()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSCompressedData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(dataContent:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MSCMSCompressedData.__allocating_init(embeddedContent:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t static MSCMSSignedData.isImplementedInSwift()()
{
  return 1LL;
}

id sub_181121FFC(uint64_t a1)
{
  return sub_1811220A4(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x18960B3D8], 16);
}

id sub_181122050(uint64_t a1)
{
  return sub_1811220A4(a1, (uint64_t (*)(uint64_t, id *))MEMORY[0x18960B3E0], 24);
}

id sub_1811220A4(uint64_t a1, uint64_t (*a2)(uint64_t, id *), char a3)
{
  v9[1] = *(id *)MEMORY[0x1895F89C0];
  v9[0] = 0LL;
  unsigned int v4 = a2(a1, v9);
  id v5 = v9[0];
  if (v4 || !v9[0])
  {
    uint64_t v6 = v4;
    sub_18111DC68();
    swift_allocError();
    *(void *)uint64_t v7 = v6;
    *(void *)(v7 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(_BYTE *)(v7 + 16) = a3;
    swift_willThrow();
  }

  return v5;
}

id sub_181122160()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  return *v1;
}

void sub_1811221A4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  unsigned int v4 = *v3;
  objc_class *v3 = a1;
}

uint64_t (*sub_1811221F4())()
{
  return j__swift_endAccess;
}

id MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id MSCMSEnvelopedDataInternal.init(envelopedData:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData] = a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

NSData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSEnvelopedDataInternal.encodeMessageSecurityObject()()
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  uint64_t v40 = 0LL;
  int v41 = 0;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  objc_super v2 = (id *)&v0[OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData];
  swift_beginAccess();
  id v3 = objc_msgSend(*v2, sel_getRecipients);
  sub_18112057C(0LL, &qword_18C548198);
  unint64_t v4 = sub_1811295D8();

  if (!(v4 >> 62))
  {
LABEL_30:
    swift_bridgeObjectRelease();
    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v34 = xmmword_18112C260;
    *(_BYTE *)(v34 + 16) = 48;
LABEL_31:
    swift_willThrow();
    return (NSData)v0;
  }

  swift_bridgeObjectRetain();
  uint64_t v33 = sub_181129680();
  swift_bridgeObjectRelease();
  if (v33 < 1) {
    goto LABEL_30;
  }
LABEL_3:
  id v5 = objc_msgSend(*v2, sel_version);
  unsigned int v6 = objc_msgSend(v5, sel_unsignedIntValue);

  unsigned int v39 = v6;
  __int128 v38 = xmmword_18112C240;
  unint64_t v7 = v4 & 0xC000000000000001LL;
  if ((v4 & 0xC000000000000001LL) != 0)
  {
    id v8 = (id)MEMORY[0x186E061EC](0LL, v4);
  }

  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      JUMPOUT(0x1811227B0LL);
    }

    id v8 = *(id *)(v4 + 32);
  }

  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_originatorIdentity);

  if (!v10)
  {
LABEL_13:
    if (v7) {
      id v15 = (id)MEMORY[0x186E061EC](0LL, v4);
    }
    else {
      id v15 = *(id *)(v4 + 32);
    }
    unint64_t v16 = v15;
    id v17 = objc_msgSend(v15, sel_originator);

    if (v17)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C548170);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_18112C250;
      if (v7) {
        id v19 = (id)MEMORY[0x186E061EC](0LL, v4);
      }
      else {
        id v19 = *(id *)(v4 + 32);
      }
      id v20 = v19;
      id v21 = objc_msgSend(v19, sel_originator);

      if (v21)
      {
        uint64_t v22 = (void *)objc_opt_self();
        type metadata accessor for SecCertificate();
        *(void *)(v18 + 56) = v23;
        *(void *)(v18 + 32) = v21;
        id v24 = (void *)sub_1811295CC();
        swift_bridgeObjectRelease();
        id v36 = 0LL;
        id v25 = objc_msgSend(v22, sel_encodeOriginatorInfoCertificates_error_, v24, &v36);

        id v26 = v36;
        if (v25)
        {
          uint64_t v27 = sub_181129554();
          uint64_t v29 = v28;

          *(void *)&__int128 v38 = v27;
          *((void *)&v38 + 1) = v29;
          id v36 = 0LL;
          uint64_t v37 = 0LL;
          __asm { BR              X10 }
        }

        int v30 = v26;
        swift_bridgeObjectRelease();
        sub_181129500();

        goto LABEL_31;
      }

      __break(1u);
    }

    else
    {
      id v36 = 0LL;
      uint64_t v37 = 0LL;
      uint64_t v31 = v0;
      sub_181124608((uint64_t)&v38);
      uint64_t v0 = v32;

      swift_bridgeObjectRelease();
      if (v1 || v0)
      {
        sub_181118884(v38, *((unint64_t *)&v38 + 1));
        return (NSData)v0;
      }
    }

    __break(1u);
    JUMPOUT(0x1811227C4LL);
  }

  if (v7) {
    id v11 = (id)MEMORY[0x186E061EC](0LL, v4);
  }
  else {
    id v11 = *(id *)(v4 + 32);
  }
  uint64_t v12 = v11;
  id v13 = sub_181121FFC((uint64_t)v10);
  if (!v1)
  {
    uint64_t v14 = v13;
    objc_msgSend(v12, sel_setOriginator_, v13);

    goto LABEL_13;
  }

  swift_bridgeObjectRelease();
  return (NSData)v0;
}

uint64_t sub_1811227D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  v18[7] = *(id *)MEMORY[0x1895F89C0];
  if (a3 <= 0) {
    a1 = 0LL;
  }
  *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 96), 8) = a1;
  id v8 = (void **)(a4 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  uint64_t v9 = *v8;
  v18[0] = 0LL;
  id v10 = objc_msgSend(v9, sel_encryptContent_, v18);
  id v11 = v18[0];
  if (v10)
  {
    uint64_t v12 = (void *)sub_181129554();
    uint64_t v14 = v13;

    v18[5] = v12;
    v18[6] = v14;
    v18[1] = 0LL;
    __asm { BR              X11 }
  }

  id v15 = v11;
  uint64_t v16 = sub_181129500();

  uint64_t result = swift_willThrow();
  *a6 = v16;
  return result;
}

uint64_t sub_1811229B8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  a2[9] = a1;
  id v5 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  id v6 = objc_msgSend(*v5, sel_contentType);
  id v7 = objc_msgSend(v6, sel_Asn1OID);
  uint64_t v9 = v8;

  a2[4] = v7;
  a2[5] = v9;
  id v10 = objc_msgSend(*v5, sel_encryptionAlgorithm);
  id v11 = objc_msgSend(v10, sel_algorithm);

  id v12 = objc_msgSend(v11, sel_Asn1OID);
  uint64_t v14 = v13;

  a2[6] = v12;
  a2[7] = v14;
  id v15 = objc_msgSend(*v5, sel_encryptionAlgorithm);
  id v16 = objc_msgSend(v15, sel_parameters);

  if (v16)
  {
    sub_181129554();
    uint64_t v18 = v17;

    __asm { BR              X10 }
  }

  *a4 = 0LL;
  return sub_18111DEC4(0LL, 0xF000000000000000LL);
}

uint64_t sub_181122BE8@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  void v36[4] = *MEMORY[0x1895F89C0];
  *(void *)(a2 + 64) = a1;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_181129680();
    swift_bridgeObjectRelease();
    if ((v12 & 0x8000000000000000LL) != 0)
    {
      __break(1u);
      goto LABEL_22;
    }
  }

  else
  {
    unint64_t v12 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  if (HIDWORD(v12))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    id v7 = sub_1811238F4((uint64_t)v7);
    goto LABEL_16;
  }

  uint64_t v28 = a6;
  unint64_t v29 = a2;
  uint64_t v30 = v6;
  uint64_t v31 = a5;
  *(_DWORD *)(a2 + 16) = v12;
  if (v12)
  {
    type metadata accessor for RecipientInfo(0LL);
    uint64_t v13 = sub_1811295FC();
    id v7 = (char *)v13;
    *(void *)(v13 + 16) = v12;
    uint64_t v14 = 32LL;
    do
    {
      uint64_t v15 = v13 + v14;
      *(_DWORD *)uint64_t v15 = 0;
      *(_OWORD *)(v15 + 8_Block_object_dispose((const void *)(v1 - 96), 8) = 0uLL;
      *(_OWORD *)(v15 + 72) = 0uLL;
      *(void *)(v15 + 104) = 0LL;
      *(_OWORD *)(v15 + 56) = 0uLL;
      *(_OWORD *)(v15 + 40) = 0uLL;
      *(_OWORD *)(v15 + 24) = 0uLL;
      v14 += 112LL;
      *(_OWORD *)(v15 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0uLL;
      --v12;
    }

    while (v12);
  }

  else
  {
    id v7 = (char *)MEMORY[0x18961AFE8];
  }

  if (*((void *)v7 + 2))
  {
    uint64_t v33 = (id *)(a4 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    if ((a3 & 0xC000000000000001LL) != 0)
    {
      id v16 = (id)MEMORY[0x186E061EC](0LL, a3);
    }

    else
    {
      if (!*(void *)((a3 & 0xFFFFFFFFFFFFFF8LL) + 0x10))
      {
        __break(1u);
        JUMPOUT(0x181123010LL);
      }

      id v16 = *(id *)(a3 + 32);
    }

    uint64_t v17 = v16;
    id v18 = objc_msgSend(*v33, sel_encryptionKey);
    uint64_t v19 = sub_181129554();
    unint64_t v21 = v20;

    uint64_t v22 = (void *)sub_18112953C();
    sub_181118884(v19, v21);
    id v23 = objc_msgSend(v17, sel_encryptBulkKey_, v22);

    sub_181129554();
    uint64_t v25 = v24;

    __asm { BR              X9 }
  }

  uint64_t v34 = v7;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_23;
  }
LABEL_16:
  uint64_t v26 = *((void *)v7 + 2);
  v35[0] = v7 + 32;
  v35[1] = v26;
  sub_181123070(v35, v29, a4, &v34, a3, (uint64_t)v36);
  swift_bridgeObjectRelease();
  if (v30)
  {
    uint64_t result = swift_bridgeObjectRelease();
    void *v31 = v30;
  }

  else
  {
    void *v28 = v36[0];
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t sub_181123070@<X0>( void *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, char **a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v7 = v6;
  uint64_t v59 = a5;
  uint64_t v71 = *MEMORY[0x1895F89C0];
  uint64_t v58 = sub_18112950C();
  uint64_t v55 = *(void (***)(char **, uint64_t))(v58 - 8);
  MEMORY[0x1895F8858](v58, v13);
  uint64_t v15 = (char **)((char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *(void *)(a2 + 24) = *a1;
  id v64 = 0LL;
  id v16 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
  swift_beginAccess();
  id v17 = objc_msgSend(*v16, sel_unprotectedAttributes);
  uint64_t v53 = (void *)a6;
  if (!v17)
  {
    int v63 = 0;
    a6 = MEMORY[0x18961AFE8];
    LODWORD(v20) = 1;
    goto LABEL_18;
  }

  id v18 = v17;
  id v56 = (id)a3;
  unint64_t v19 = (unint64_t)objc_msgSend(v17, sel_count);

  if ((v19 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_60;
  }

  if (HIDWORD(v19))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }

  int v63 = v19;
  if (v19)
  {
    type metadata accessor for Attribute(0LL);
    a6 = sub_1811295FC();
    *(void *)(a6 + 16) = v19;
    LODWORD(v20) = a6 + 32;
    unint64_t v21 = v19;
    uint64_t v22 = a6 + 32;
    do
    {
      *(void *)(v22 + 24) = 0LL;
      *(void *)uint64_t v22 = 0LL;
      *(void *)(v22 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      *(_DWORD *)(v22 + 16) = 0;
      v22 += 32LL;
      --v21;
    }

    while (v21);
    if ((_DWORD)v19)
    {
      id v23 = objc_msgSend(*v16, sel_unprotectedAttributes);
      if (v23)
      {
        unint64_t v54 = a2;
        __int128 v57 = v6;
        id v24 = v23;
        sub_181129620();
        id v52 = v24;

        sub_181124AAC();
        sub_181129638();
        if ((void)v67)
        {
          a2 = -1LL;
          a3 = MEMORY[0x18961AFC0] + 8LL;
          do
          {
            sub_1811205B4(&v65, v62);
            sub_181124AF4((uint64_t)v62, (uint64_t)v61);
            sub_18112057C(0LL, &qword_18C548190);
            swift_dynamicCast();
            id v25 = v60;
            objc_msgSend(v60, sel_generateAttributeStruct);

            if (++a2 >= *(void *)(a6 + 16)) {
              goto LABEL_57;
            }
            copy_Attribute();
            free_Attribute();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v62);
            sub_181129638();
            LODWORD(v20) = v20 + 32;
          }

          while ((void)v67);
        }

        v55[1](v15, v58);

        LODWORD(v20) = 0;
        id v7 = v57;
        a2 = v54;
      }

      else
      {
        LODWORD(v20) = 0;
      }

      goto LABEL_17;
    }
  }

  else
  {
    a6 = MEMORY[0x18961AFE8];
  }

  LODWORD(v20) = 1;
LABEL_17:
  a3 = (unint64_t)v56;
LABEL_18:
  uint64_t v15 = v7;
  swift_bridgeObjectRetain();
  uint64_t v26 = (char *)a6;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_58;
  }
  while (1)
  {
    id v64 = v26 + 32;
    uint64_t v27 = &v63;
    if ((_DWORD)v20) {
      uint64_t v27 = 0LL;
    }
    *(void *)(a2 + 80) = v27;
    uint64_t v28 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    if (objc_msgSend(*v28, sel_legacyASN1Encoding))
    {
      uint64_t v29 = *(void *)(a2 + 8);
      int v30 = *(_DWORD *)(a2 + 16);
      LODWORD(v65) = *(_DWORD *)a2;
      *((void *)&v65 + 1) = v29;
      int v66 = v30;
      __int128 v67 = *(_OWORD *)(a2 + 24);
      __int128 v68 = *(_OWORD *)(a2 + 40);
      __int128 v69 = *(_OWORD *)(a2 + 56);
      __int128 v70 = *(_OWORD *)(a2 + 72);
      uint64_t v31 = length_SecCMS_EnvelopedData();
    }

    else
    {
      uint64_t v31 = length_EnvelopedData();
    }

    uint64_t v32 = (char **)v31;
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x189603FB8]), sel_initWithLength_, v31);
    if (!v33)
    {
      sub_18111DC68();
      swift_allocError();
      *(_OWORD *)uint64_t v39 = xmmword_18112C260;
      *(_BYTE *)(v39 + 16) = 48;
      swift_willThrow();
      goto LABEL_53;
    }

    uint64_t v58 = (uint64_t)v26;
    __int128 v57 = v15;
    uint64_t v55 = (void (**)(char **, uint64_t))v33;
    objc_msgSend(v55, sel_mutableBytes);
    uint64_t v15 = v32;
    id v60 = 0LL;
    uint64_t v34 = (id *)(a3 + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData);
    swift_beginAccess();
    unsigned int v35 = objc_msgSend(*v34, sel_legacyASN1Encoding);
    id v56 = v32;
    if (v35)
    {
      uint64_t v36 = *(void *)(a2 + 8);
      int v37 = *(_DWORD *)(a2 + 16);
      LODWORD(v65) = *(_DWORD *)a2;
      *((void *)&v65 + 1) = v36;
      int v66 = v37;
      __int128 v67 = *(_OWORD *)(a2 + 24);
      __int128 v68 = *(_OWORD *)(a2 + 40);
      __int128 v69 = *(_OWORD *)(a2 + 56);
      __int128 v70 = *(_OWORD *)(a2 + 72);
      int v38 = encode_SecCMS_EnvelopedData();
    }

    else
    {
      int v38 = encode_EnvelopedData();
    }

    LODWORD(v54) = v38;
    uint64_t v40 = v59;
    int v41 = *a4;
    a2 = *((void *)*a4 + 2);
    if (!a2) {
      break;
    }
    id v16 = (id *)(v59 & 0xC000000000000001LL);
    if ((v59 & 0xC000000000000001LL) != 0 || a2 <= *(void *)((v59 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      unint64_t v20 = 0LL;
      a3 = 32LL;
      uint64_t v15 = &selRef_addSigner_withChainMode_error_;
      while (1)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a4 = v41;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          int v41 = sub_1811238F4((uint64_t)v41);
          *a4 = v41;
        }

        if (v20 >= *((void *)v41 + 2)) {
          break;
        }
        if (v16) {
          id v42 = (id)MEMORY[0x186E061EC](v20, v40);
        }
        else {
          id v42 = *(id *)(v40 + 8 * v20 + 32);
        }
        __int128 v43 = v42;
        ++v20;
        objc_msgSend(v42, sel_freeRecipientInfo_, &v41[a3]);

        int v41 = *a4;
        a3 += 112LL;
        uint64_t v40 = v59;
        if (a2 == v20) {
          goto LABEL_40;
        }
      }

      __break(1u);
      goto LABEL_56;
    }

LABEL_61:
    __break(1u);
LABEL_62:
    a6 = (uint64_t)sub_181123908(a6);
LABEL_42:
    a3 = 0LL;
    LODWORD(v20) = a6 + 32;
    while (a3 < *(void *)(a6 + 16))
    {
      ++a3;
      free_Attribute();
      LODWORD(v20) = v20 + 32;
      if (v16 == (id *)a3) {
        goto LABEL_47;
      }
    }

LABEL_40:
  id v16 = *(id **)(a6 + 16);
  if (v16)
  {
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = v57;
    if ((v45 & 1) != 0) {
      goto LABEL_42;
    }
    goto LABEL_62;
  }

  uint64_t v15 = v57;
LABEL_47:
  uint64_t v46 = v55;
  if ((_DWORD)v54 || v60 != v56)
  {
    sub_18111DC68();
    swift_allocError();
    *(_OWORD *)uint64_t v48 = xmmword_18112C260;
    *(_BYTE *)(v48 + 16) = 48;
    swift_willThrow();
  }

  else
  {
    uint64_t v47 = v55;
    if (v15)
    {
    }

    else
    {
      __int128 v49 = v47;

      *uint64_t v53 = v49;
    }
  }

LABEL_53:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id MSCMSEnvelopedDataInternal.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSEnvelopedDataInternal.init()()
{
}

id MSCMSEnvelopedDataInternal.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1811238F4(uint64_t a1)
{
  return sub_18112391C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_181123908(uint64_t a1)
{
  return sub_181123A34(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_18112391C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C548308);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 112);
  }

  else
  {
    id v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[112 * v8]) {
      memmove(v12, v13, 112 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v12, v13, 112 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

char *sub_181123A34(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C548300);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }

  else
  {
    id v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 32 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_181123B2C( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  v19[2] = *MEMORY[0x1895F89C0];
  uint64_t v12 = sub_181129494();
  if (!v12) {
LABEL_6:
  }
    __break(1u);
  uint64_t v13 = v12;
  uint64_t v14 = sub_1811294B8();
  if (__OFSUB__(a1, v14))
  {
    __break(1u);
    goto LABEL_6;
  }

  uint64_t v15 = v13 + a1 - v14;
  sub_1811294AC();
  v19[0] = a3;
  v19[1] = v15;
  uint64_t result = sub_181122BE8((uint64_t)v19, a4, a5, a6, &v17, &v18);
  if (!v6) {
    return v18;
  }
  return result;
}

void sub_181123C08(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_181123C70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = v5;
  LOWORD(v22) = a1;
  BYTE2(v22) = BYTE2(a1);
  HIBYTE(v22) = BYTE3(a1);
  unsigned __int8 v23 = BYTE4(a1);
  unsigned __int8 v24 = BYTE5(a1);
  unsigned __int8 v25 = BYTE6(a1);
  v27[0] = v6;
  v27[1] = &v21;
  swift_bridgeObjectRetain();
  id v8 = v2;
  sub_181122BE8((uint64_t)v27, v4, v3, (unint64_t)v8, &v20, &v26);
  if (v7)
  {
    uint64_t v9 = v21;
    uint64_t v10 = v22;
    uint64_t v11 = v23;
    uint64_t v12 = v24;
    uint64_t v13 = v25;

    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    v1[1] = v10 | (v11 << 32) | (v12 << 40) | (v13 << 48);
  }

  else
  {
    uint64_t v9 = v26;
    uint64_t v19 = v21;
    uint64_t v14 = v22;
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    uint64_t v17 = v25;

    swift_bridgeObjectRelease();
    *uint64_t v1 = v19;
    v1[1] = v14 | (v15 << 32) | (v16 << 40) | (v17 << 48);
  }

  return v9;
}

void sub_181124064(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_1811240C8@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v20 = v5;
  LOWORD(v21) = a2;
  BYTE2(v21) = BYTE2(a2);
  HIBYTE(v21) = BYTE3(a2);
  unsigned __int8 v22 = BYTE4(a2);
  unsigned __int8 v23 = BYTE5(a2);
  unsigned __int8 v24 = BYTE6(a2);
  *(void *)(v4 + _Block_object_dispose((const void *)(v1 - 96), 8) = &v20;
  id v7 = a1;
  swift_bridgeObjectRetain();
  sub_1811229B8(v4, v6, (uint64_t)v7, &v19);
  if (v3)
  {
    uint64_t v8 = v20;
    uint64_t v9 = v21;
    uint64_t v10 = v22;
    uint64_t v11 = v23;
    uint64_t v12 = v24;
    swift_bridgeObjectRelease();

    *objc_super v2 = v8;
    v2[1] = v9 | (v10 << 32) | (v11 << 40) | (v12 << 48);
  }

  else
  {
    uint64_t v8 = v19;
    uint64_t v18 = v20;
    uint64_t v13 = v21;
    uint64_t v14 = v22;
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    swift_bridgeObjectRelease();

    *objc_super v2 = v18;
    v2[1] = v13 | (v14 << 32) | (v15 << 40) | (v16 << 48);
  }

  return v8;
}

uint64_t sub_181124548(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = sub_181129494();
  if (!result) {
    goto LABEL_6;
  }
  uint64_t v15 = result;
  uint64_t result = sub_1811294B8();
  if (__OFSUB__(a1, result))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    return result;
  }

  uint64_t v16 = v15 + a1 - result;
  sub_1811294AC();
  *a3 = a4;
  a3[1] = v16;
  uint64_t result = sub_1811227D4((uint64_t)a3, a5, a4, a6, a7, v17);
  if (!v7) {
    return v17[2];
  }
  return result;
}

void sub_181124608(uint64_t a1)
{
  __asm { BR              X11 }

uint64_t sub_181124670@<X0>(void *a1@<X4>, uint64_t a2@<X8>)
{
  uint64_t v22 = v6;
  LOWORD(v23) = a2;
  BYTE2(v23) = BYTE2(a2);
  HIBYTE(v23) = BYTE3(a2);
  unsigned __int8 v24 = BYTE4(a2);
  unsigned __int8 v25 = BYTE5(a2);
  unsigned __int8 v26 = BYTE6(a2);
  uint64_t *v7 = v8;
  v7[1] = (uint64_t)&v22;
  id v9 = a1;
  swift_bridgeObjectRetain();
  sub_1811227D4((uint64_t)v7, v5, v8, (uint64_t)v9, v2, &v21);
  if (v4)
  {
    uint64_t v10 = v22;
    uint64_t v11 = v23;
    uint64_t v12 = v24;
    uint64_t v13 = v25;
    uint64_t v14 = v26;
    swift_bridgeObjectRelease();

    void *v3 = v10;
    v3[1] = v11 | (v12 << 32) | (v13 << 40) | (v14 << 48);
  }

  else
  {
    uint64_t v10 = v27;
    uint64_t v20 = v22;
    uint64_t v15 = v23;
    uint64_t v16 = v24;
    uint64_t v17 = v25;
    uint64_t v18 = v26;
    swift_bridgeObjectRelease();

    void *v3 = v20;
    v3[1] = v15 | (v16 << 32) | (v17 << 40) | (v18 << 48);
  }

  return v10;
}

uint64_t type metadata accessor for MSCMSEnvelopedDataInternal()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSEnvelopedDataInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSEnvelopedDataInternal.__allocating_init(envelopedData:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void type metadata accessor for RecipientInfo(uint64_t a1)
{
}

unint64_t sub_181124AAC()
{
  unint64_t result = qword_18C5482F8;
  if (!qword_18C5482F8)
  {
    uint64_t v1 = sub_18112950C();
    unint64_t result = MEMORY[0x186E06B4C](MEMORY[0x189606968], v1);
    atomic_store(result, (unint64_t *)&qword_18C5482F8);
  }

  return result;
}

uint64_t sub_181124AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for Attribute(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_181124B74(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181124B94(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 32) = v3;
  return result;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t sub_181124BE4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 112)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181124C04(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 104) = 0LL;
    *(_OWORD *)(result + 8_Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 112) = v3;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for Attribute_value(uint64_t a1)
{
}

void type metadata accessor for heim_oid(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSTimestampAttributeInternal.decodedAttribute( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = result;
  return result;
}

uint64_t sub_181124CDC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181124CFC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 8_Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 104) = v3;
  return result;
}

void type metadata accessor for RecipientInfo.__Unnamed_union_u(uint64_t a1)
{
}

void type metadata accessor for RecipientInfo_enum(uint64_t a1)
{
}

uint64_t sub_181124D68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181124D88(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for heim_base_data(uint64_t a1)
{
}

void sub_181124DC4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_181124E14()
{
  return sub_1811296EC();
}

uint64_t sub_181124E3C()
{
  return sub_1811296E0();
}

void MSCMSContentError.errorDescription.getter()
{
  __asm { BR              X12 }

uint64_t sub_181124EB8()
{
  return 0x72726520314E5341LL;
}

unint64_t static MSCMSContentError.errorDomain.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t MSCMSContentError.errorCode.getter()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_181124FD0 + 4 * byte_18112C4A4[*(unsigned __int8 *)(v0 + 16)]))(1LL);
}

uint64_t sub_181124FD0()
{
  return 2LL;
}

uint64_t sub_181124FD8()
{
  return 4LL;
}

uint64_t sub_181124FE0()
{
  if (*v0 == 0LL) {
    return 3LL;
  }
  else {
    return 5LL;
  }
}

unint64_t MSCMSContentError.errorUserInfo.getter()
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  int v3 = *(unsigned __int8 *)(v0 + 16);
  unint64_t v4 = sub_18112537C(MEMORY[0x18961AFE8]);
  unint64_t v29 = v4;
  *(void *)&__int128 v31 = v1;
  *((void *)&v31 + 1) = v2;
  char v32 = v3;
  MSCMSContentError.errorDescription.getter();
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = sub_181129590();
    uint64_t v11 = v10;
    unint64_t v33 = MEMORY[0x189617FA8];
    *(void *)&__int128 v31 = v7;
    *((void *)&v31 + 1) = v8;
    sub_1811205B4(&v31, v30);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_18112665C(v30, v9, v11, isUniquelyReferenced_nonNull_native);
    unint64_t v29 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  switch(v3)
  {
    case 2:
      unint64_t v33 = MEMORY[0x18961A860];
      LODWORD(v31) = (_DWORD)v1;
      sub_1811205B4(&v31, v30);
      char v13 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v28 = v29;
      uint64_t v15 = 0x5664696C61766E49LL;
      uint64_t v14 = 0xEE006E6F69737265LL;
      goto LABEL_8;
    case 1:
      uint64_t v16 = sub_181129590();
      uint64_t v18 = v17;
      id v19 = objc_allocWithZone(MEMORY[0x189607870]);
      uint64_t v20 = (void *)sub_181129584();
      id v21 = objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, (int)v1, 0);

      unint64_t v22 = sub_18112678C();
      unint64_t v33 = v22;
      *(void *)&__int128 v31 = v21;
      sub_1811205B4(&v31, v30);
      char v23 = swift_isUniquelyReferenced_nonNull_native();
      sub_18112665C(v30, v16, v18, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&__int128 v31 = 0LL;
      asn1ErrorToNSError(v1, &v31);
      unsigned __int8 v24 = (void *)v31;
      if ((void)v31)
      {
        unint64_t v33 = v22;
        sub_1811205B4(&v31, v30);
        id v25 = v24;
        char v26 = swift_isUniquelyReferenced_nonNull_native();
        sub_18112665C(v30, 0x6F727245314E5341LL, 0xE900000000000072LL, v26);
        swift_bridgeObjectRelease();
      }

      else
      {
        sub_18112609C(0x6F727245314E5341LL, 0xE900000000000072LL, &v31);
        sub_1811267C8((uint64_t)&v31);
      }

      break;
    case 0:
      unint64_t v33 = MEMORY[0x189617FA8];
      *(void *)&__int128 v31 = v1;
      *((void *)&v31 + 1) = v2;
      sub_1811205B4(&v31, v30);
      swift_bridgeObjectRetain();
      char v13 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v28 = v29;
      uint64_t v14 = 0x80000001811302E0LL;
      uint64_t v15 = 0xD000000000000015LL;
LABEL_8:
      sub_18112665C(v30, v15, v14, v13);
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      break;
  }

  return v29;
}

unint64_t sub_18112537C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C548380);
  uint64_t v2 = sub_1811296A4();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1811271C0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_181126038(v15, v16);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1811205B4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1811254A4()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_1811254C0()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1811254E0 + 4 * byte_18112C4A8[*(unsigned __int8 *)(v0 + 16)]))(1LL);
}

uint64_t sub_1811254E0()
{
  return 2LL;
}

uint64_t sub_1811254E8()
{
  return 4LL;
}

uint64_t sub_1811254F0()
{
  if (*v0 == 0LL) {
    return 3LL;
  }
  else {
    return 5LL;
  }
}

uint64_t sub_181125510()
{
  return sub_1811296EC();
}

uint64_t sub_181125538()
{
  return sub_1811296E0();
}

unint64_t MSCMSContentTypeError.errorDescription.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16) >> 6;
  unint64_t v2 = 0xD000000000000010LL;
  if (v1 != 1) {
    unint64_t v2 = 0xD000000000000014LL;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0xD000000000000014LL;
  }
}

unint64_t static MSCMSContentTypeError.errorDomain.getter()
{
  return 0xD00000000000002FLL;
}

unint64_t MSCMSContentTypeError.errorCode.getter()
{
  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

unint64_t MSCMSContentTypeError.errorUserInfo.getter()
{
  uint64_t v2 = *(void *)v0;
  uint64_t v1 = *(void *)(v0 + 8);
  unsigned int v3 = *(unsigned __int8 *)(v0 + 16);
  unint64_t v4 = sub_18112537C(MEMORY[0x18961AFE8]);
  if (v3 >> 6)
  {
    if (v3 >> 6 == 1)
    {
      unint64_t v5 = 0xD000000000000010LL;
      unint64_t v6 = 0x8000000181130320LL;
      goto LABEL_7;
    }

    uint64_t v7 = "TimeStampToken error";
  }

  else
  {
    uint64_t v7 = "Unknown content type";
  }

  unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000LL;
  unint64_t v5 = 0xD000000000000014LL;
LABEL_7:
  uint64_t v8 = sub_181129590();
  uint64_t v10 = v9;
  uint64_t v11 = (ValueMetadata *)MEMORY[0x189617FA8];
  char v23 = (ValueMetadata *)MEMORY[0x189617FA8];
  *(void *)&__int128 v21 = v5;
  *((void *)&v21 + 1) = v6;
  sub_1811205B4(&v21, v20);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_18112665C(v20, v8, v10, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3 > 0x3F)
  {
    uint64_t v15 = sub_181129590();
    uint64_t v17 = v16;
    char v23 = &type metadata for MSCMSContentError;
    *(void *)&__int128 v21 = v2;
    *((void *)&v21 + 1) = v1;
    char v22 = v3 & 0x3F;
    sub_1811205B4(&v21, v20);
    sub_181126808(v2, v1, v3);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    sub_18112665C(v20, v15, v17, v18);
    unint64_t v14 = v4;
    swift_bridgeObjectRelease();
  }

  else
  {
    char v23 = v11;
    *(void *)&__int128 v21 = v2;
    *((void *)&v21 + 1) = v1;
    sub_1811205B4(&v21, v20);
    swift_bridgeObjectRetain();
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_18112665C(v20, 0xD000000000000015LL, 0x8000000181130390LL, v13);
    unint64_t v14 = v4;
  }

  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1811257EC()
{
  return 0xD00000000000002FLL;
}

unint64_t sub_181125808()
{
  return ((unint64_t)*(unsigned __int8 *)(v0 + 16) >> 6) + 1;
}

uint64_t sub_18112581C()
{
  return sub_1811296EC();
}

uint64_t sub_181125844()
{
  return sub_1811296E0();
}

void MSCMSError.errorDescription.getter()
{
  __asm { BR              X11 }

uint64_t sub_1811258BC()
{
  return v0 + 3;
}

unint64_t static MSCMSError.errorDomain.getter()
{
  return 0xD000000000000019LL;
}

uint64_t MSCMSError.errorCode.getter()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_181125BD4
                                          + 4 * byte_18112C4B3[(*(unsigned __int8 *)(v0 + 16) >> 3) & 7]))(-6LL);
}

uint64_t sub_181125BD4()
{
  return -7LL;
}

uint64_t sub_181125BDC()
{
  return -15LL;
}

uint64_t sub_181125BE4()
{
  return -16LL;
}

uint64_t sub_181125BEC()
{
  return 1LL;
}

uint64_t sub_181125BF4()
{
  return 2LL;
}

uint64_t sub_181125BFC@<X0>(int a1@<W8>)
{
  uint64_t v3 = *(void *)(v2 + 8);
  if (a1 == 48 && (v3 | v1) == 0) {
    return -1LL;
  }
  if (a1 == 48 && v1 == 1 && v3 == 0) {
    return -2LL;
  }
  if (a1 == 48 && v1 == 2 && !v3) {
    return -3LL;
  }
  if (a1 == 48 && v1 == 3 && !v3) {
    return -4LL;
  }
  if (a1 == 48 && v1 == 4 && !v3) {
    return -5LL;
  }
  if (a1 == 48 && v1 == 5 && !v3) {
    return -8LL;
  }
  if (a1 == 48 && v1 == 6 && !v3) {
    return -9LL;
  }
  if (a1 == 48 && v1 == 7 && !v3) {
    return -10LL;
  }
  if (a1 == 48 && v1 == 8 && !v3) {
    return -11LL;
  }
  if (a1 == 48 && v1 == 9 && !v3) {
    return -12LL;
  }
  if (v3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v1 == 10;
  }
  if (v8 && a1 == 48) {
    return -13LL;
  }
  else {
    return -14LL;
  }
}

unint64_t MSCMSError.errorUserInfo.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(_BYTE *)(v0 + 16);
  unint64_t v4 = sub_18112537C(MEMORY[0x18961AFE8]);
  *(void *)&__int128 v19 = v1;
  *((void *)&v19 + 1) = v2;
  char v20 = v3;
  MSCMSError.errorDescription.getter();
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = sub_181129590();
    uint64_t v11 = v10;
    __int128 v21 = (ValueMetadata *)MEMORY[0x189617FA8];
    *(void *)&__int128 v19 = v7;
    *((void *)&v19 + 1) = v8;
    sub_1811205B4(&v19, v18);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_18112665C(v18, v9, v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  if ((v3 & 0x30) == 0x20)
  {
    uint64_t v13 = sub_181129590();
    uint64_t v15 = v14;
    __int128 v21 = &type metadata for MSCMSContentTypeError;
    *(void *)&__int128 v19 = v1;
    *((void *)&v19 + 1) = v2;
    char v20 = v3 & 0xC7;
    sub_1811205B4(&v19, v18);
    sub_181126848(v1, v2, v3);
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_18112665C(v18, v13, v15, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v4;
}

unint64_t sub_181125E98()
{
  return 0xD000000000000019LL;
}

uint64_t sub_181125EB4()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_181125EDC
                                          + 4 * byte_18112C4BA[(*(unsigned __int8 *)(v0 + 16) >> 3) & 7]))(-6LL);
}

uint64_t sub_181125EDC()
{
  return -7LL;
}

uint64_t sub_181125EE4()
{
  return -15LL;
}

uint64_t sub_181125EEC()
{
  return -16LL;
}

uint64_t sub_181125EF4()
{
  return 1LL;
}

uint64_t sub_181125EFC()
{
  return 2LL;
}

uint64_t sub_181125F04@<X0>(int a1@<W8>)
{
  uint64_t v3 = *(void *)(v2 + 8);
  if (a1 == 48 && (v3 | v1) == 0) {
    return -1LL;
  }
  if (a1 == 48 && v1 == 1 && v3 == 0) {
    return -2LL;
  }
  if (a1 == 48 && v1 == 2 && !v3) {
    return -3LL;
  }
  if (a1 == 48 && v1 == 3 && !v3) {
    return -4LL;
  }
  if (a1 == 48 && v1 == 4 && !v3) {
    return -5LL;
  }
  if (a1 == 48 && v1 == 5 && !v3) {
    return -8LL;
  }
  if (a1 == 48 && v1 == 6 && !v3) {
    return -9LL;
  }
  if (a1 == 48 && v1 == 7 && !v3) {
    return -10LL;
  }
  if (a1 == 48 && v1 == 8 && !v3) {
    return -11LL;
  }
  if (a1 == 48 && v1 == 9 && !v3) {
    return -12LL;
  }
  if (v3) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v1 == 10;
  }
  if (v8 && a1 == 48) {
    return -13LL;
  }
  else {
    return -14LL;
  }
}

unint64_t sub_181126038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18112971C();
  return sub_181126EFC(a1, a2, v4);
}

double sub_18112609C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_181126038(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_181126FDC();
      uint64_t v11 = v13;
    }

    swift_bridgeObjectRelease();
    sub_1811205B4((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_181126488(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_18112618C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C548380);
  uint64_t v6 = sub_181129698();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1LL << v8);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }

        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if ((a2 & 1) != 0)
              {
                uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v34 = -1LL << v32;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1LL)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v13 = v20;
          }
        }

unint64_t sub_181126488(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_181129650();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_181129710();
        swift_bridgeObjectRetain();
        sub_1811295A8();
        uint64_t v10 = sub_18112971C();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }

        else if (v11 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            __int128 v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }

LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1LL << v3) - 1;
  }

  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1LL << result) - 1;
  }

  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1LL);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

_OWORD *sub_18112665C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_181126038(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      int64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_1811205B4(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_181126FDC();
      goto LABEL_7;
    }

    sub_18112618C(v15, a4 & 1);
    unint64_t v21 = sub_181126038(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_181126E94(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }

  uint64_t result = (_OWORD *)sub_1811296D4();
  __break(1u);
  return result;
}

unint64_t sub_18112678C()
{
  unint64_t result = qword_18C548348;
  if (!qword_18C548348)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C548348);
  }

  return result;
}

uint64_t sub_1811267C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C548350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_181126808(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return sub_181126834(result, a2, a3 & 0x3F);
  }
  if (!(a3 >> 6)) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_181126834(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_181126848(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20) {
    return sub_181126808(result, a2, a3 & 0xC7);
  }
  return result;
}

unint64_t sub_181126864()
{
  unint64_t result = qword_18C548358;
  if (!qword_18C548358)
  {
    unint64_t result = MEMORY[0x186E06B4C]( &protocol conformance descriptor for MSCMSContentError,  &type metadata for MSCMSContentError);
    atomic_store(result, (unint64_t *)&qword_18C548358);
  }

  return result;
}

unint64_t sub_1811268AC()
{
  unint64_t result = qword_18C548360;
  if (!qword_18C548360)
  {
    unint64_t result = MEMORY[0x186E06B4C]( &protocol conformance descriptor for MSCMSContentTypeError,  &type metadata for MSCMSContentTypeError);
    atomic_store(result, (unint64_t *)&qword_18C548360);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126BA8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_181126834);
}

uint64_t destroy for MSCMSContentError(uint64_t a1)
{
  return sub_181126910(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_181126910(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for MSCMSContentError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126C04( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_181126834,  (void (*)(uint64_t, uint64_t, uint64_t))sub_181126910);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for MSCMSContentError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_181126C70(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_181126910);
}

uint64_t getEnumTagSinglePayload for MSCMSContentError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSContentError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1811269E4(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_181126A00(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    LOBYTE(a2) = 3;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentError()
{
  return &type metadata for MSCMSContentError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSContentTypeError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126BA8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_181126808);
}

uint64_t destroy for MSCMSContentTypeError(uint64_t a1)
{
  return sub_181126A44(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_181126A44(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return sub_181126910(result, a2, a3 & 0x3F);
  }
  if (!(a3 >> 6)) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for MSCMSContentTypeError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126C04( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_181126808,  (void (*)(uint64_t, uint64_t, uint64_t))sub_181126A44);
}

uint64_t *assignWithTake for MSCMSContentTypeError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_181126C70(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_181126A44);
}

uint64_t getEnumTagSinglePayload for MSCMSContentTypeError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x3E && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 62);
  }
  unsigned int v3 = (*(_BYTE *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSContentTypeError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3D)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 62;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    if (a3 >= 0x3E) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0x3E) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0LL;
      *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }

  return result;
}

uint64_t sub_181126B34(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_181126B40(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_181126B50(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 3 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for MSCMSContentTypeError()
{
  return &type metadata for MSCMSContentTypeError;
}

uint64_t initializeBufferWithCopyOfBuffer for MSCMSError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126BA8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_181126848);
}

uint64_t destroy for MSCMSError(uint64_t a1)
{
  return sub_181126B90(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_181126B90(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 0x30) == 0x20) {
    return sub_181126A44(result, a2, a3 & 0xC7);
  }
  return result;
}

uint64_t sub_181126BA8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for MSCMSError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_181126C04( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_181126848,  (void (*)(uint64_t, uint64_t, uint64_t))sub_181126B90);
}

uint64_t *sub_181126C04( uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for MSCMSError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_181126C70(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_181126B90);
}

uint64_t *sub_181126C70( uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xA && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 10);
  }
  unsigned int v3 = ((2 * *(unsigned __int8 *)(a1 + 16)) & 8 | (*(unsigned __int8 *)(a1 + 16) >> 3) & 7) ^ 0xF;
  if (v3 >= 9) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for MSCMSError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 10;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    if (a3 >= 0xA) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xA) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0LL;
      *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      *(_BYTE *)(result + 16) = 4 * ((((-a2 & 8) != 0) - 2 * a2) & 0xF);
    }
  }

  return result;
}

uint64_t sub_181126D5C(uint64_t a1)
{
  unsigned int v1 = (*(unsigned __int8 *)(a1 + 16) >> 3) & 7;
  if (v1 <= 5) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t sub_181126D78(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0xC7u;
  return result;
}

uint64_t sub_181126D88(uint64_t result, unsigned int a2)
{
  if (a2 < 6)
  {
    *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 0xC3 | (8 * (a2 & 7));
  }

  else
  {
    *(void *)__n128 result = a2 - 6;
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(_BYTE *)(result + 16) = 48;
  }

  return result;
}

ValueMetadata *type metadata accessor for MSCMSError()
{
  return &type metadata for MSCMSError;
}

unint64_t sub_181126DC8()
{
  unint64_t result = qword_18C548368;
  if (!qword_18C548368)
  {
    unint64_t result = MEMORY[0x186E06B4C](&protocol conformance descriptor for MSCMSError, &type metadata for MSCMSError);
    atomic_store(result, (unint64_t *)&qword_18C548368);
  }

  return result;
}

unint64_t sub_181126E0C()
{
  unint64_t result = qword_18C548370;
  if (!qword_18C548370)
  {
    unint64_t result = MEMORY[0x186E06B4C]( &protocol conformance descriptor for MSCMSContentTypeError,  &type metadata for MSCMSContentTypeError);
    atomic_store(result, (unint64_t *)&qword_18C548370);
  }

  return result;
}

unint64_t sub_181126E50()
{
  unint64_t result = qword_18C548378;
  if (!qword_18C548378)
  {
    unint64_t result = MEMORY[0x186E06B4C]( &protocol conformance descriptor for MSCMSContentError,  &type metadata for MSCMSContentError);
    atomic_store(result, (unint64_t *)&qword_18C548378);
  }

  return result;
}

_OWORD *sub_181126E94(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_1811205B4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_181126EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1811296C8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_1811296C8() & 1) == 0);
    }
  }

  return v6;
}

void *sub_181126FDC()
{
  unsigned int v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C548380);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18112968C();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    unint64_t result = (void *)swift_release();
LABEL_28:
    *unsigned int v1 = v4;
    return result;
  }

  uint64_t v25 = v1;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1811271C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C548388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

id MSCMSTimestampAttributeInternal.attributeType.getter()
{
  unsigned int v1 = (id *)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  return *v1;
}

void MSCMSTimestampAttributeInternal.attributeType.setter(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t *v3 = a1;
}

uint64_t (*MSCMSTimestampAttributeInternal.attributeType.modify())()
{
  return j_j__swift_endAccess;
}

__n128 sub_181127384@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  __int128 v4 = *(_OWORD *)(v3 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v3 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(void *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(v3 + 128);
  __int128 v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  __int128 v6 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = *(__n128 *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_1811273F0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  __int128 v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v3 + 112) = v4;
  *(void *)(v3 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a1 + 128);
  __int128 v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  __int128 v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a1;
  *(__n128 *)(v3 + 16) = result;
  return result;
}

uint64_t (*sub_18112745C())()
{
  return j_j__swift_endAccess;
}

void *sub_1811274A0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1811274EC(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  __int128 v4 = *v3;
  uint64_t *v3 = a1;
}

uint64_t (*sub_18112753C())()
{
  return j__swift_endAccess;
}

id MSCMSTimestampAttributeInternal.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  free_TSTInfo();
  swift_endAccess();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void MSCMSTimestampAttributeInternal.__allocating_init(attribute:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  MSCMSTimestampAttributeInternal.init(attribute:)(a1);
}

void MSCMSTimestampAttributeInternal.init(attribute:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __int128 v5 = (void **)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(void *)&v1[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0LL;
  __int128 v6 = v1;
  id v7 = objc_msgSend(a1, sel_attributeType);
  sub_181129590();
  uint64_t v8 = (void *)sub_181129584();
  swift_bridgeObjectRelease();
  unsigned int v9 = objc_msgSend(v7, sel_isEqualToString_, v8);

  if (!v9)
  {
    sub_18111DC68();
    swift_allocError();
    *(void *)uint64_t v19 = 0LL;
    *(void *)(v19 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(_BYTE *)(v19 + 16) = 48;
    swift_willThrow();
LABEL_9:

    unint64_t v21 = *v5;
    swift_deallocPartialClassInstance();
    return;
  }

  id v10 = objc_msgSend(a1, sel_attributeType);
  uint64_t v11 = OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType;
  *(void *)&v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v10;
  id v12 = objc_msgSend(a1, sel_attributeValues);
  uint64_t v13 = sub_1811295D8();

  uint64_t v14 = *(void *)(v13 + 16);
  swift_bridgeObjectRelease();
  if (v14 != 1)
  {
    sub_18111DC68();
    swift_allocError();
    *(void *)uint64_t v20 = 0LL;
    *(void *)(v20 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(_BYTE *)(v20 + 16) = 48;
    swift_willThrow();

    goto LABEL_8;
  }

  id v15 = objc_msgSend(a1, sel_attributeValues);
  uint64_t v16 = (void *)sub_1811295D8();

  if (v16[2])
  {
    uint64_t v17 = v16[4];
    unint64_t v18 = v16[5];
    sub_1811189A4(v17, v18);
    swift_bridgeObjectRelease();
    sub_1811287D8((uint64_t)v31);
    if (v2)
    {

      sub_181118884(v17, v18);
LABEL_8:
      a1 = *(void **)&v6[v11];
      goto LABEL_9;
    }

    sub_181118884(v17, v18);
    sub_181128CFC((uint64_t)&v33, (uint64_t)v34);
    swift_beginAccess();
    int64_t v22 = *v5;
    sub_181128CFC((uint64_t)v34, (uint64_t)v5);

    unint64_t v23 = &v6[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)unint64_t v23 = v31[0];
    __int128 v24 = v31[4];
    __int128 v26 = v31[1];
    __int128 v25 = v31[2];
    *((_OWORD *)v23 + 3) = v31[3];
    *((_OWORD *)v23 + 4) = v24;
    *((_OWORD *)v23 + 1) = v26;
    *((_OWORD *)v23 + 2) = v25;
    __int128 v27 = v31[6];
    __int128 v28 = v31[7];
    __int128 v29 = v31[5];
    *((void *)v23 + 16) = v32;
    *((_OWORD *)v23 + 6) = v27;
    *((_OWORD *)v23 + 7) = v28;
    *((_OWORD *)v23 + 5) = v29;

    v30.receiver = v6;
    v30.super_class = ObjectType;
    objc_msgSendSuper2(&v30, sel_init);
  }

  else
  {
    __break(1u);
  }

__n128 sub_1811279EC@<Q0>(uint64_t a1@<X8>)
{
  if (!v1)
  {
    __int128 v4 = v7[7];
    *(_OWORD *)(a1 + 96) = v7[6];
    *(_OWORD *)(a1 + 112) = v4;
    *(_OWORD *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = v7[8];
    __int128 v5 = v7[3];
    *(_OWORD *)(a1 + 32) = v7[2];
    *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v5;
    __int128 v6 = v7[5];
    *(_OWORD *)(a1 + 64) = v7[4];
    *(_OWORD *)(a1 + 80) = v6;
    __n128 result = (__n128)v7[1];
    *(_OWORD *)a1 = v7[0];
    *(__n128 *)(a1 + 16) = result;
  }

  return result;
}

uint64_t MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return MSCMSTimestampAttributeInternal.init(timestampToken:)(a1, a2);
}

uint64_t MSCMSTimestampAttributeInternal.init(timestampToken:)(uint64_t a1, unint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __int128 v6 = (void **)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData];
  *(void *)&v2[OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData] = 0LL;
  sub_181129590();
  objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v7 = v2;
  id v8 = sub_18111CD44();
  if (v3)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }

  else
  {
    *(void *)&v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType] = v8;
    sub_1811287D8((uint64_t)v20);
    sub_181128CFC((uint64_t)&v22, (uint64_t)v23);
    swift_beginAccess();
    unsigned int v9 = *v6;
    sub_181128CFC((uint64_t)v23, (uint64_t)v6);

    id v10 = &v7[OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo];
    *(_OWORD *)id v10 = v20[0];
    __int128 v11 = v20[4];
    __int128 v13 = v20[1];
    __int128 v12 = v20[2];
    *((_OWORD *)v10 + 3) = v20[3];
    *((_OWORD *)v10 + 4) = v11;
    *((_OWORD *)v10 + 1) = v13;
    *((_OWORD *)v10 + 2) = v12;
    __int128 v14 = v20[6];
    __int128 v15 = v20[7];
    __int128 v16 = v20[5];
    *((void *)v10 + 16) = v21;
    *((_OWORD *)v10 + 6) = v14;
    *((_OWORD *)v10 + 7) = v15;
    *((_OWORD *)v10 + 5) = v16;

    v19.receiver = v7;
    v19.super_class = ObjectType;
    id v17 = objc_msgSendSuper2(&v19, sel_init);
    sub_181118884(a1, a2);
    return (uint64_t)v17;
  }

  return result;
}

__n128 sub_181127D84@<Q0>(uint64_t a1@<X8>)
{
  __int128 v2 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(a1 + 112) = v2;
  *(void *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(v1 + 128);
  __int128 v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v3;
  __int128 v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = *(__n128 *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

__n128 sub_181127DB0(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v1 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v1 + 112) = v2;
  *(void *)(v1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a1 + 128);
  __int128 v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v3;
  __int128 v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v1 + 80) = v4;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(__n128 *)(v1 + 16) = result;
  return result;
}

uint64_t (*sub_181127DDC())()
{
  return nullsub_1;
}

void *sub_181127DEC()
{
  uint64_t v1 = *(void **)(v0 + 136);
  id v2 = v1;
  return v1;
}

void sub_181127E10(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
}

uint64_t (*sub_181127E38())()
{
  return nullsub_1;
}

__n128 sub_181127E48@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a3 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a3 + 112) = v3;
  uint64_t v4 = *(void *)(a1 + 128);
  __int128 v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a3 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v5;
  __int128 v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a3 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(__n128 *)(a3 + 16) = result;
  *(void *)(a3 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = v4;
  *(void *)(a3 + 136) = a2;
  return result;
}

void MSCMSTimestampAttributeInternal.verifyTimestamp(expectedMessageDigest:)(uint64_t a1, uint64_t a2)
{
  v20[6] = *(id *)MEMORY[0x1895F89C0];
  __int128 v5 = (void **)(v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_signedData);
  swift_beginAccess();
  __int128 v6 = *v5;
  if (*v5)
  {
    v20[0] = 0LL;
    id v7 = v6;
    unsigned int v8 = objc_msgSend(v7, sel_verifySignatures_, v20);
    id v9 = v20[0];
    if (v8)
    {
      uint64_t v10 = v2 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
      swift_beginAccess();
      id v11 = v9;
      __int128 v12 = NSDataFromOctetString((void *)(v10 + 48));
      swift_endAccess();
      uint64_t v13 = sub_181129554();
      unint64_t v15 = v14;

      sub_181128DF8(a1, a2);
      if ((v16 & 1) == 0)
      {
        sub_1811268AC();
        swift_allocError();
        *(_OWORD *)uint64_t v17 = xmmword_18112C7E0;
        *(_BYTE *)(v17 + 16) = -125;
        swift_willThrow();
      }

      sub_181118884(v13, v15);
    }

    else
    {
      id v19 = v20[0];
      sub_181129500();

      swift_willThrow();
    }
  }

  else
  {
    sub_1811268AC();
    swift_allocError();
    *(_OWORD *)uint64_t v18 = xmmword_18112C7E0;
    *(_BYTE *)(v18 + 16) = 67;
    swift_willThrow();
  }

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MSCMSTimestampAttributeInternal.encodeAttribute()( MSCMSAttribute *__return_ptr retstr)
{
  *(void *)uint64_t v1 = 0LL;
  *(void *)(v1 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
  *(_BYTE *)(v1 + 16) = 48;
  swift_willThrow();
}

NSDate __swiftcall MSCMSTimestampAttributeInternal.timestampToken()()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo;
  swift_beginAccess();
  return (NSDate)objc_msgSend( objc_allocWithZone(MEMORY[0x189603F50]),  sel_initWithTimeIntervalSince1970_,  (double)*(uint64_t *)(v1 + 88));
}

id MSCMSTimestampAttributeInternal.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MSCMSTimestampAttributeInternal.init()()
{
}

void sub_18112834C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

uint64_t sub_1811283AC( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  uint64_t v42 = v39;
  __int16 v43 = v40;
  char v44 = BYTE2(v40);
  char v45 = BYTE3(v40);
  char v46 = BYTE4(v40);
  char v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x181128590LL);
  }

  uint64_t result = memcmp(v38, &v42, BYTE6(v40));
  BOOL *v37 = (_DWORD)result == 0;
  return result;
}

void sub_1811285B4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_181128610()
{
  uint64_t v8 = v3;
  __int16 v9 = v4;
  char v10 = BYTE2(v4);
  char v11 = BYTE3(v4);
  char v12 = BYTE4(v4);
  char v13 = BYTE5(v4);
  sub_18112834C((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_181118884(v1, v0);
  if (!v2) {
    char v5 = v7;
  }
  return v5 & 1;
}

void sub_1811287D8(uint64_t a1@<X8>)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)objc_opt_self();
  uint64_t v3 = (void *)sub_18112953C();
  id v45 = 0LL;
  id v4 = objc_msgSend(v2, sel_decodeMessageSecurityObject_options_error_, v3, 0, &v45);

  if (!v4)
  {
    id v22 = v45;
    uint64_t v20 = (void *)sub_181129500();

    swift_willThrow();
    goto LABEL_15;
  }

  id v5 = v45;
  id v6 = objc_msgSend(v4, sel_contentType);
  sub_181129590();
  char v7 = (void *)sub_181129584();
  swift_bridgeObjectRelease();
  unsigned int v8 = objc_msgSend(v6, sel_isEqualToString_, v7);

  if (!v8)
  {
    id v23 = objc_msgSend(v4, sel_contentType);
    id v24 = objc_msgSend(v23, sel_OIDString);

    uint64_t v25 = sub_181129590();
    uint64_t v27 = v26;

    sub_18111DC68();
    uint64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v28 = v25;
    *(void *)(v28 + _Block_object_dispose((const void *)(v1 - 96), 8) = v27;
    char v29 = 96;
LABEL_14:
    *(_BYTE *)(v28 + 16) = v29;
    swift_willThrow();

    goto LABEL_15;
  }

  if (!objc_msgSend(v4, sel_embeddedContent))
  {
LABEL_13:
    sub_18111DC68();
    uint64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v28 = 0LL;
    *(void *)(v28 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    char v29 = 99;
    goto LABEL_14;
  }

  objc_opt_self();
  __int16 v9 = (void *)swift_dynamicCastObjCClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    goto LABEL_13;
  }

  char v10 = v9;
  uint64_t v44 = a1;
  id v11 = objc_msgSend(v9, sel_contentType);
  sub_181129590();
  char v12 = (void *)sub_181129584();
  swift_bridgeObjectRelease();
  unsigned int v13 = objc_msgSend(v11, sel_isEqualToString_, v12);

  if (v13)
  {
    LODWORD(v45) = 0;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    memset(v49, 0, 28);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v14 = objc_msgSend(v10, sel_dataContent);
    if (v14)
    {
      uint64_t v15 = sub_181129554();
      unint64_t v17 = v16;

      id v14 = (id)sub_18112953C();
      sub_181118884(v15, v17);
    }

    unsigned int v18 = nsheim_decode_TSTInfo(v14);

    if (v18)
    {
      sub_181126864();
      uint64_t v20 = (void *)swift_allocError();
      *(void *)uint64_t v19 = v18;
      *(void *)(v19 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      char v21 = 1;
    }

    else
    {
      uint64_t v41 = v45;
      if ((_DWORD)v45 == 1)
      {

        uint64_t v42 = *(void *)&v49[1];
        int v43 = DWORD2(v49[1]);
        *(_DWORD *)uint64_t v44 = 1;
        *(_OWORD *)(v44 + _Block_object_dispose((const void *)(v1 - 96), 8) = v46;
        *(_OWORD *)(v44 + 24) = v47;
        *(_OWORD *)(v44 + 40) = v48;
        *(_OWORD *)(v44 + 56) = v49[0];
        *(void *)(v44 + 72) = v42;
        *(_DWORD *)(v44 + 80) = v43;
        *(_OWORD *)(v44 + 8_Block_object_dispose((const void *)(v1 - 96), 8) = v50;
        *(_OWORD *)(v44 + 104) = v51;
        *(_OWORD *)(v44 + 120) = v52;
        *(void *)(v44 + 136) = v10;
        return;
      }

      sub_181126864();
      uint64_t v20 = (void *)swift_allocError();
      *(void *)uint64_t v19 = v41;
      *(void *)(v19 + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
      char v21 = 2;
    }

    *(_BYTE *)(v19 + 16) = v21;
  }

  else
  {
    id v35 = objc_msgSend(v10, sel_contentType);
    id v36 = objc_msgSend(v35, sel_OIDString);

    uint64_t v37 = sub_181129590();
    uint64_t v39 = v38;

    sub_181126864();
    uint64_t v20 = (void *)swift_allocError();
    *(void *)uint64_t v40 = v37;
    *(void *)(v40 + _Block_object_dispose((const void *)(v1 - 96), 8) = v39;
    *(_BYTE *)(v40 + 16) = 0;
  }

  swift_willThrow();

  swift_unknownObjectRelease();
LABEL_15:
  id v30 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C5483B0);
  if (swift_dynamicCast())
  {

    id v31 = v45;
    uint64_t v32 = v46;
    char v33 = BYTE8(v46) | 0xA0;
    sub_18111DC68();
    swift_allocError();
    *(void *)uint64_t v34 = v31;
    *(void *)(v34 + _Block_object_dispose((const void *)(v1 - 96), 8) = v32;
    *(_BYTE *)(v34 + 16) = v33;
    swift_willThrow();
  }
}

uint64_t sub_181128CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C547290);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_181128D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_181129494();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1811294B8();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v11 += a1 - result;
  }

  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v14 = sub_1811294AC();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v11 + v15;
  if (v11) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  sub_18112834C(v11, v17, a4, a5);
  if (!v5) {
    char v18 = v19;
  }
  return v18 & 1;
}

void sub_181128DF8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_181128E3C()
{
  return ((uint64_t (*)(void))((char *)&loc_181128E70 + *((int *)qword_181128F30 + (v0 >> 62))))();
}

uint64_t sub_181128E80@<X0>(uint64_t a1@<X8>)
{
  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      char v5 = 1;
    }

    else
    {
      sub_1811189A4(v2, v1);
      sub_1811285B4(v4, v3);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t type metadata accessor for MSCMSTimestampAttributeInternal()
{
  return objc_opt_self();
}

uint64_t method lookup function for MSCMSTimestampAttributeInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(attribute:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MSCMSTimestampAttributeInternal.__allocating_init(timestampToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void destroy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1)
{
}

uint64_t initializeWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v3;
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = v4;
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  char v7 = *(void **)(a2 + 136);
  *(void *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  id v8 = v7;
  return a1;
}

uint64_t assignWithCopy for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 8_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 128);
  __int128 v3 = *(void **)(a1 + 136);
  __int128 v4 = *(void **)(a2 + 136);
  *(void *)(a1 + 136) = v4;
  id v5 = v4;

  return a1;
}

__n128 __swift_memcpy144_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for MSCMSTimestampAttributeInternal.decodedAttribute(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + _Block_object_dispose((const void *)(v1 - 96), 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 8_Block_object_dispose((const void *)(v1 - 96), 8) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  __int128 v3 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);

  return a1;
}

uint64_t getEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute( uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 144)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 136);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MSCMSTimestampAttributeInternal.decodedAttribute( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0LL;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 8_Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 144) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 144) = 0;
    }
    if (a2) {
      *(void *)(result + 136) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MSCMSTimestampAttributeInternal.decodedAttribute()
{
  return &type metadata for MSCMSTimestampAttributeInternal.decodedAttribute;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v1 - 96), 8) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 12_Block_object_dispose((const void *)(v1 - 96), 8) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t sub_181129270(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181129290(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 8_Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 136) = v3;
  return result;
}

void type metadata accessor for TSTInfo(uint64_t a1)
{
}

void type metadata accessor for Extensions(uint64_t a1)
{
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_181129318(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_181129338(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for GeneralName(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for Accuracy(uint64_t a1)
{
}

uint64_t sub_1811293A8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1811293C8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + _Block_object_dispose((const void *)(v1 - 96), 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for heim_integer(uint64_t a1)
{
}

void type metadata accessor for MessageImprint(uint64_t a1)
{
}

void type metadata accessor for Extension(uint64_t a1)
{
}

void type metadata accessor for GeneralName.__Unnamed_union_u(uint64_t a1)
{
}

void type metadata accessor for GeneralName_enum(uint64_t a1)
{
}

void type metadata accessor for AlgorithmIdentifier(uint64_t a1)
{
}

uint64_t sub_18112947C()
{
  return MEMORY[0x1896061F0]();
}

uint64_t sub_181129488()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_181129494()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_1811294A0()
{
  return MEMORY[0x189606218]();
}

uint64_t sub_1811294AC()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_1811294B8()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_1811294C4()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_1811294D0()
{
  return MEMORY[0x189606290]();
}

uint64_t sub_1811294DC()
{
  return MEMORY[0x1896062A0]();
}

uint64_t sub_1811294E8()
{
  return MEMORY[0x1896062B0]();
}

uint64_t sub_1811294F4()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_181129500()
{
  return MEMORY[0x189606940]();
}

uint64_t sub_18112950C()
{
  return MEMORY[0x189606960]();
}

uint64_t sub_181129518()
{
  return MEMORY[0x189606AF8]();
}

uint64_t sub_181129524()
{
  return MEMORY[0x189606B60]();
}

uint64_t sub_181129530()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_18112953C()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_181129548()
{
  return MEMORY[0x189606C70]();
}

uint64_t sub_181129554()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_181129560()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_18112956C()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_181129578()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_181129584()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_181129590()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_18112959C()
{
  return MEMORY[0x189607188]();
}

uint64_t sub_1811295A8()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1811295B4()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1811295C0()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_1811295CC()
{
  return MEMORY[0x1896071D0]();
}

uint64_t sub_1811295D8()
{
  return MEMORY[0x1896071E0]();
}

uint64_t sub_1811295E4()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_1811295F0()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_1811295FC()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_181129608()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_181129614()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_181129620()
{
  return MEMORY[0x1896072E0]();
}

uint64_t sub_18112962C()
{
  return MEMORY[0x18961BAF0]();
}

uint64_t sub_181129638()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_181129644()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_181129650()
{
  return MEMORY[0x189619020]();
}

uint64_t sub_18112965C()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_181129668()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_181129674()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_181129680()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_18112968C()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_181129698()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1811296A4()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1811296B0()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1811296BC()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_1811296C8()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1811296D4()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_1811296E0()
{
  return MEMORY[0x1896073A0]();
}

uint64_t sub_1811296EC()
{
  return MEMORY[0x1896073B0]();
}

uint64_t sub_1811296F8()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_181129704()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_181129710()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_18112971C()
{
  return MEMORY[0x18961A6C0]();
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode( CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B8]( *(void *)&op,  *(void *)&mode,  *(void *)&alg,  *(void *)&padding,  iv,  key,  keyLength,  tweak);
}

CCCryptorStatus CCCryptorFinal( CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F80C0](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x1895F80F0]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x1895F80F8]();
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1895F8118](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

int CCSymmetricKeyUnwrap( CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  return MEMORY[0x1895F8230](*(void *)&algorithm, iv, ivLen, kek, kekLen, wrappedKey, wrappedKeyLen, rawKey);
}

int CCSymmetricKeyWrap( CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  return MEMORY[0x1895F8238](*(void *)&algorithm, iv, ivLen, kek, kekLen, rawKey, rawKeyLen, wrappedKey);
}

size_t CCSymmetricUnwrappedSize(CCWrappingAlgorithm algorithm, size_t wrappedKeyLen)
{
  return MEMORY[0x1895F8240](*(void *)&algorithm, wrappedKeyLen);
}

size_t CCSymmetricWrappedSize(CCWrappingAlgorithm algorithm, size_t rawKeyLen)
{
  return MEMORY[0x1895F8248](*(void *)&algorithm, rawKeyLen);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x189602C48](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x189602F60](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B260](certificate);
}

uint64_t SecCertificateCopyIssuerSequence()
{
  return MEMORY[0x18960B278]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B290](certificate);
}

CFDataRef SecCertificateCopyNormalizedIssuerSequence(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B298](certificate);
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x18960B2B0]();
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B2C0](certificate, error);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x18960B2E0]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x18960B2F8]();
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x18960B300]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x18960B308]();
}

uint64_t SecCertificateGetSubjectKeyID()
{
  return MEMORY[0x18960B318]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x18960B320]();
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x18960B328]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x18960B338]();
}

uint64_t SecCertificateVersion()
{
  return MEMORY[0x18960B348]();
}

uint64_t SecDistinguishedNameCopyNormalizedSequence()
{
  return MEMORY[0x18960B3B0]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x18960B3D8](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x18960B3E0](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x18960B3F0]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B430](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult( SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B438](privateKey, algorithm, publicKey, parameters, error);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x18960B448]();
}

CFDataRef SecKeyCreateDecryptedData( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B480](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B490](key, algorithm, plaintext, error);
}

CFDataRef SecKeyCreateSignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B4C0](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x18960B4C8](keyData, attributes, error);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x18960B4E0]();
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x18960B508]();
}

Boolean SecKeyVerifySignature( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x18960B510](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x18960B680](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x18960B6E0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x18960B710](trust, anchorCertificates);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x18960B748](trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SecSecuritydCopyWhoAmI()
{
  return MEMORY[0x18960B7B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _asn1_copy_top()
{
  return MEMORY[0x1896151E8]();
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x1896151F0]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x1896151F8]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x189615200]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x189615208]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

uint64_t asn1_abort()
{
  return MEMORY[0x189615210]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1895FA068]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FA268]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FA270]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FA298]();
}

uint64_t copy_heim_any()
{
  return MEMORY[0x189615218]();
}

uint64_t copy_heim_any_set()
{
  return MEMORY[0x189615220]();
}

uint64_t der_copy_oid()
{
  return MEMORY[0x189615240]();
}

uint64_t der_free_octet_string()
{
  return MEMORY[0x189615258]();
}

uint64_t der_free_oid()
{
  return MEMORY[0x189615260]();
}

uint64_t der_get_integer()
{
  return MEMORY[0x189615268]();
}

uint64_t der_get_length()
{
  return MEMORY[0x189615270]();
}

uint64_t der_get_octet_string_ber()
{
  return MEMORY[0x189615278]();
}

uint64_t der_get_tag()
{
  return MEMORY[0x189615288]();
}

uint64_t der_length_heim_integer()
{
  return MEMORY[0x1896152B8]();
}

uint64_t der_put_heim_integer()
{
  return MEMORY[0x1896152F8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x18961B1A8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

uint64_t objc_msgSend_MSErrorWithDomain_code_errorLevel_underlyingError_description_arguments_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_MSErrorWithDomain_code_errorLevel_underlyingError_description_arguments_);
}

uint64_t objc_msgSend_initWithAttribute_certificates_LAContext_containingSignerInfo_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithAttribute_certificates_LAContext_containingSignerInfo_error_);
}

uint64_t objc_msgSend_stringEncodingForData_encodingOptions_convertedString_usedLossyConversion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_stringEncodingForData_encodingOptions_convertedString_usedLossyConversion_);
}

uint64_t objc_msgSend_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_error_);
}

uint64_t objc_msgSend_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_verifyCountersignaturesAndCountersignersWithPolicies_verifyTime_anchorCertificates_signature_error_);
}

uint64_t objc_msgSend_verifySignatureAndSignerWithPolicies_verifyTime_anchorCertificates_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_verifySignatureAndSignerWithPolicies_verifyTime_anchorCertificates_error_);
}

uint64_t objc_msgSend_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_verifySignaturesAndSignersWithPolicies_verifyTime_anchorCertificates_error_);
}