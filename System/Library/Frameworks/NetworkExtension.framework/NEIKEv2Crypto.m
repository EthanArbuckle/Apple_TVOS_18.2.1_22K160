@interface NEIKEv2Crypto
+ (BOOL)validateCalculatedSharedKeyAuthData:(void *)a3 remoteAuthData:;
+ (CFErrorRef)validateSignature:(void *)a3 signedData:(const __CFString *)a4 signatureAlgorithm:(__SecKey *)a5 publicKey:;
+ (NEIKEv2SignatureHashProtocol)copySignHashProtocolForAuth:(uint64_t)a1;
+ (id)copySignHashDataForSet:(uint64_t)a1;
+ (id)copySignHashDataForSet:(void *)a3 authentication:;
+ (id)copySignHashDataForSet:(void *)a3 authenticationSet:;
+ (os_log_s)copyAuthenticationProtocolForAuthMethod:(void *)a3 authData:;
+ (os_log_s)createHMACFromData:(void *)a3 key:(void *)a4 prfProtocol:;
+ (os_log_s)createRandomWithSize:(uint64_t)a1;
+ (uint64_t)copyCertificateFromPersistentData:(int)a3 isModernSystem:;
+ (uint64_t)copySecIdentity:(void *)a3 keyData:(int)a4 isModernSystem:;
+ (uint64_t)copySignHashSetForAuthMethod:(uint64_t)a1;
+ (uint64_t)createNATDetectionHashForInitiatorSPI:(void *)a3 responderSPI:(void *)a4 address:;
+ (uint64_t)isRemoteAuthenticationPacketProtocol:(void *)a3 compatibleWithConfiguredProtocol:;
+ (uint64_t)signatureAlgorithmTypeForAuthentication:(uint64_t)a1;
+ (uint64_t)validateSignature:(void *)a3 signedData:(void *)a4 authProtocol:(__SecKey *)a5 publicKey:;
+ (void)copyDataFromPersistentReference:(uint64_t)a1;
+ (void)copySignHashSetForData:(uint64_t)a1;
@end

@implementation NEIKEv2Crypto

+ (os_log_s)createRandomWithSize:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2)
  {
    ne_log_obj();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v9 = 67109120;
      unsigned int v10 = 0;
      _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, "Invalid size %u", (uint8_t *)&v9, 8u);
    }

    goto LABEL_10;
  }

  v3 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], a2);
  if (!v3)
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 67109120;
      unsigned int v10 = a2;
      _os_log_fault_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed",  (uint8_t *)&v9,  8u);
    }

    v5 = 0LL;
LABEL_10:
    v6 = 0LL;
    goto LABEL_4;
  }

  v4 = v3;
  arc4random_buf((void *)-[__CFData mutableBytes](v3, "mutableBytes"), a2);
  v5 = v4;
  v6 = v5;
LABEL_4:

  return v6;
}

+ (os_log_s)createHMACFromData:(void *)a3 key:(void *)a4 prfProtocol:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_self();
  if (!v7)
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    int v20 = 136315138;
    v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
    v18 = "%s called with null key";
LABEL_19:
    _os_log_fault_impl(&dword_1876B1000, v15, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&v20, 0xCu);
    goto LABEL_23;
  }

  if (!v6)
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    int v20 = 136315138;
    v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
    v18 = "%s called with null data";
    goto LABEL_19;
  }

  if (!v8)
  {
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v20 = 136315138;
      v21 = "+[NEIKEv2Crypto createHMACFromData:key:prfProtocol:]";
      v18 = "%s called with null prfProtocol";
      goto LABEL_19;
    }

+ (uint64_t)signatureAlgorithmTypeForAuthentication:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  uint64_t v3 = [v2 method];
  uint64_t v4 = 0LL;
  switch(v3)
  {
    case 9LL:
LABEL_2:
      v5 = (uint64_t *)MEMORY[0x18960BC58];
      goto LABEL_7;
    case 10LL:
      v5 = (uint64_t *)MEMORY[0x18960BC60];
      goto LABEL_7;
    case 11LL:
      v5 = (uint64_t *)MEMORY[0x18960BC68];
      goto LABEL_7;
    case 12LL:
    case 13LL:
      goto LABEL_8;
    case 14LL:
      switch([v2 digitalSignatureAlgorithm])
      {
        case 1LL:
          v5 = (uint64_t *)MEMORY[0x18960BD18];
          goto LABEL_7;
        case 2LL:
          v5 = (uint64_t *)MEMORY[0x18960BC80];
          goto LABEL_7;
        case 3LL:
          v5 = (uint64_t *)MEMORY[0x18960BCA8];
          goto LABEL_7;
        case 4LL:
          v5 = (uint64_t *)MEMORY[0x18960BCB0];
          goto LABEL_7;
        case 5LL:
          v5 = (uint64_t *)MEMORY[0x18960BD20];
          goto LABEL_7;
        case 6LL:
          v5 = (uint64_t *)MEMORY[0x18960BD28];
          goto LABEL_7;
        case 7LL:
          v5 = (uint64_t *)MEMORY[0x18960BC88];
          goto LABEL_7;
        case 8LL:
          v5 = (uint64_t *)MEMORY[0x18960BC90];
          goto LABEL_7;
        case 9LL:
          v5 = (uint64_t *)MEMORY[0x18960BD30];
          goto LABEL_7;
        case 10LL:
          v5 = (uint64_t *)MEMORY[0x18960BD38];
          goto LABEL_7;
        case 11LL:
          v5 = (uint64_t *)MEMORY[0x18960BD40];
          goto LABEL_7;
        default:
          uint64_t v4 = 0LL;
          goto LABEL_8;
      }

    default:
      if (v3 != 1) {
        goto LABEL_8;
      }
      v5 = (uint64_t *)MEMORY[0x18960BD08];
LABEL_7:
      uint64_t v4 = *v5;
LABEL_8:

      return v4;
  }

+ (CFErrorRef)validateSignature:(void *)a3 signedData:(const __CFString *)a4 signatureAlgorithm:(__SecKey *)a5 publicKey:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  unsigned int v9 = a2;
  objc_opt_self();
  CFErrorRef error = 0LL;
  int v10 = SecKeyVerifySignature(a5, a4, v8, v9, &error);

  if (!error) {
    return (CFErrorRef)(v10 != 0);
  }
  ne_log_obj();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFErrorRef v15 = error;
    _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "Error when validating signature with public key: %@",  buf,  0xCu);
  }

  CFErrorRef result = error;
  if (error)
  {
    CFRelease(error);
    return 0LL;
  }

  return result;
}

+ (uint64_t)validateSignature:(void *)a3 signedData:(void *)a4 authProtocol:(__SecKey *)a5 publicKey:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_opt_self();
  if (![v8 length])
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null signatureData.length";
LABEL_36:
    _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_23;
  }

  if (![v9 length])
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null signedData.length";
    goto LABEL_36;
  }

  if (!v10)
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "+[NEIKEv2Crypto validateSignature:signedData:authProtocol:publicKey:]";
    v28 = "%s called with null authentication";
    goto LABEL_36;
  }

  uint64_t v11 = +[NEIKEv2Crypto signatureAlgorithmTypeForAuthentication:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v10);
  if (!v11)
  {
    ne_log_obj();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    v32 = (const char *)v10;
    v28 = "Invalid signature protcocol %@";
    goto LABEL_36;
  }

  unint64_t v12 = (const __CFString *)v11;
  if ([v10 isDigitalSignature])
  {
    unsigned __int8 v30 = 0;
    [v8 getBytes:&v30 length:1];
    unint64_t v13 = v30 + 1LL;
    uint64_t v14 = [v8 length];
    if ([v8 length] <= v13)
    {
      ne_log_obj();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      uint64_t v29 = [v8 length];
      *(_DWORD *)buf = 134218240;
      v32 = (const char *)v29;
      __int16 v33 = 1024;
      int v34 = v30;
      v25 = "AUTH payload length %zu is too short for signature algorithm length %u";
      v26 = v22;
      uint32_t v27 = 18;
      goto LABEL_27;
    }

    uint64_t v15 = objc_msgSend(v8, "subdataWithRange:", v13, v14 - v13);

    id v8 = (id)v15;
  }

  unsigned __int8 v16 = +[NEIKEv2Crypto validateSignature:signedData:signatureAlgorithm:publicKey:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v8,  v9,  v12,  a5);
  ne_log_obj();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, "Failed to verify signature", buf, 2u);
    }

    if ([v10 method] != 1) {
      goto LABEL_24;
    }
    ne_log_obj();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_INFO,  "Retrying legacy RSA signature verification using SHA-256",  buf,  2u);
    }

    unsigned __int8 v20 = +[NEIKEv2Crypto validateSignature:signedData:signatureAlgorithm:publicKey:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  v8,  v9,  (const __CFString *)*MEMORY[0x18960BD18],  a5);
    ne_log_obj();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v21;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1876B1000, v22, OS_LOG_TYPE_DEBUG, "Peer signature is valid on second try", buf, 2u);
      }

      goto LABEL_21;
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

LABEL_24:
      uint64_t v23 = 0LL;
      goto LABEL_25;
    }

    *(_WORD *)buf = 0;
    v25 = "Failed to verify signature on second try";
    v26 = v22;
    uint32_t v27 = 2;
LABEL_27:
    _os_log_error_impl(&dword_1876B1000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_23;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEBUG, "Peer signature is valid", buf, 2u);
  }

LABEL_21:
  uint64_t v23 = 1LL;
LABEL_25:

  return v23;
}

+ (BOOL)validateCalculatedSharedKeyAuthData:(void *)a3 remoteAuthData:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  uint64_t v6 = [v4 length];
  if (v6 == [v5 length])
  {
    [v4 length];
    [v4 bytes];
    [v5 bytes];
    BOOL v7 = cc_cmp_safe() == 0;
  }

  else
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218240;
      uint64_t v11 = [v4 length];
      __int16 v12 = 2048;
      uint64_t v13 = [v5 length];
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "calculatedAuthData.length(%zu) != authenticationData.length(%zu)",  (uint8_t *)&v10,  0x16u);
    }

    BOOL v7 = 0LL;
  }

  return v7;
}

+ (os_log_s)copyAuthenticationProtocolForAuthMethod:(void *)a3 authData:
{
  v71[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_self();
  if (a2 != 14)
  {
    if (a2 == 12) {
      id v5 = -[NEIKEv2AuthenticationProtocol initWithSecurePassword:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithSecurePassword:",  -1LL);
    }
    else {
      id v5 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  a2);
    }
    goto LABEL_13;
  }

  if (![v4 length])
  {
    ne_log_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v69 = "+[NEIKEv2Crypto copyAuthenticationProtocolForAuthMethod:authData:]";
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null authData.length", buf, 0xCu);
    }

    goto LABEL_54;
  }

  uint64_t v6 = (unsigned __int8 *)[v4 bytes];
  unint64_t v7 = *v6;
  if ([v4 length] - 1 < v7)
  {
    ne_log_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v69 = v7;
    *(_WORD *)&v69[4] = 2112;
    *(void *)&v69[6] = v4;
    __int16 v33 = "AuthData too short for first byte AlgorithmIdentifier, len %u %@";
    goto LABEL_68;
  }

  if ((_DWORD)v7 != 4 || *(_DWORD *)(v6 + 1) != 1885668097)
  {
    v51[0] = v6 + 1;
    v51[1] = v7;
    int v8 = DERParseSequenceToObject( (uint64_t)v51,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)v52,  0x20uLL,  0x20uLL);
    int v54 = v8;
    if (v8)
    {
      int v40 = v8;
      ne_log_obj();
      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v69 = v40;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v7;
      *(_WORD *)&v69[10] = 2112;
      *(void *)&v69[12] = v4;
      __int16 v33 = "Could not parse AlgorithmIdentifier, error %d payload len %u payload %@";
    }

    else
    {
      int v9 = NEIKEv2ASN1CheckForNULLItem((uint64_t)v53, &v54);
      if (!v54)
      {
        int v10 = v9;
        if (DEROidCompare((uint64_t)v52, (uint64_t)&oidEd25519))
        {
          uint64_t v11 = 3LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidEd448))
        {
          uint64_t v11 = 4LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidSha256Rsa))
        {
          uint64_t v11 = 1LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidSha384Rsa))
        {
          uint64_t v11 = 5LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidSha512Rsa))
        {
          uint64_t v11 = 6LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidSha256Ecdsa))
        {
          uint64_t v11 = 2LL;
        }

        else if (DEROidCompare((uint64_t)v52, (uint64_t)&oidSha384Ecdsa))
        {
          uint64_t v11 = 7LL;
        }

        else
        {
          if (!DEROidCompare((uint64_t)v52, (uint64_t)&oidSha512Ecdsa))
          {
LABEL_35:
            if (!DEROidCompare((uint64_t)v52, (uint64_t)&oidPSSRsa))
            {
              ne_log_obj();
              __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                goto LABEL_54;
              }
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v69 = v7;
              *(_WORD *)&v69[4] = 2112;
              *(void *)&v69[6] = v4;
              __int16 v33 = "Unrecognized digital signature AlgorithmIdentifier OID, payload len %u payload %@";
              goto LABEL_68;
            }

            if (!v10)
            {
              objc_opt_self();
              int v16 = DERParseSequenceToObject( (uint64_t)v53,  4u,  (uint64_t)&NEIKEv2ASN1RSAPSSAlgoParamItemSpecs,  (unint64_t)buf,  0x40uLL,  0x40uLL);
              int v55 = v16;
              if (v16)
              {
                int v42 = v16;
                ne_log_obj();
                __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_64;
                }
                int v65 = 67109120;
                int v66 = v42;
                v36 = "Could not parse RSA-PSS parameters, error %d";
              }

              else
              {
                char v17 = NEIKEv2ASN1CheckForNULLItem((uint64_t)v71, &v55);
                int v18 = v55;
                if (v55)
                {
                  ne_log_obj();
                  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_64;
                  }
                  int v65 = 67109120;
                  int v66 = v18;
                  v36 = "Could not parse RSA-PSS trailer field parameter, error %d";
                }

                else
                {
                  if ((v17 & 1) != 0) {
                    goto LABEL_42;
                  }
                  int v19 = NEIKEv2ASN1DecodeIntegerItem((uint64_t)v71, &v55);
                  int v20 = v55;
                  if (v55)
                  {
                    ne_log_obj();
                    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_64;
                    }
                    int v65 = 67109120;
                    int v66 = v20;
                    v36 = "Could not parse RSA-PSS trailer field parameter, error %d";
                  }

                  else
                  {
                    int v21 = v19;
                    if (v19 == 1)
                    {
LABEL_42:
                      int v22 = DERParseSequenceToObject( (uint64_t)buf,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v65,  0x20uLL,  0x20uLL);
                      int v55 = v22;
                      if (v22)
                      {
                        int v43 = v22;
                        ne_log_obj();
                        __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                          goto LABEL_64;
                        }
                        int v62 = 67109120;
                        int v63 = v43;
                        v36 = "Could not parse RSA-PSS HashAlgorithm, error %d";
                      }

                      else
                      {
                        char v23 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v67, &v55);
                        int v24 = v55;
                        if (!v55)
                        {
                          if ((v23 & 1) != 0)
                          {
                            int v25 = DERParseSequenceToObject( (uint64_t)&v69[12],  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v62,  0x20uLL,  0x20uLL);
                            if (v25)
                            {
                              int v44 = v25;
                              ne_log_obj();
                              __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                              if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_64;
                              }
                              v60[0] = 67109120;
                              v60[1] = v44;
                              v36 = "Could not parse RSA-PSS MaskGenAlgorithm, error %d";
                              v37 = v60;
                              goto LABEL_118;
                            }

                            if (DEROidCompare((uint64_t)&v62, (uint64_t)&oidMfg1))
                            {
                              int v26 = DERParseSequenceToObject( (uint64_t)&v64,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)v60,  0x20uLL,  0x20uLL);
                              int v55 = v26;
                              if (v26)
                              {
                                int v45 = v26;
                                ne_log_obj();
                                __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_64;
                                }
                                *(_DWORD *)v56 = 67109120;
                                int v57 = v45;
                                v36 = "Could not parse RSA-PSS MaskGenAlgorithm parameters, error %d";
                              }

                              else
                              {
                                char v27 = NEIKEv2ASN1CheckForNULLItem((uint64_t)&v61, &v55);
                                int v28 = v55;
                                if (!v55)
                                {
                                  if ((v27 & 1) != 0)
                                  {
                                    if (DEROidCompare((uint64_t)&v65, (uint64_t)v60))
                                    {
                                      if (DEROidCompare((uint64_t)&v65, (uint64_t)&oidSha256))
                                      {
                                        int v29 = 32;
                                        uint64_t v30 = 9LL;
                                        goto LABEL_59;
                                      }

                                      if (DEROidCompare((uint64_t)&v65, (uint64_t)&oidSha384))
                                      {
                                        int v29 = 48;
                                        uint64_t v30 = 10LL;
                                        goto LABEL_59;
                                      }

                                      if (DEROidCompare((uint64_t)&v65, (uint64_t)&oidSha512))
                                      {
                                        int v29 = 64;
                                        uint64_t v30 = 11LL;
LABEL_59:
                                        __int16 v12 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithDigitalSignature:",  v30);
                                        int v31 = NEIKEv2ASN1DecodeIntegerItem((uint64_t)&v70, &v55);
                                        if (v55)
                                        {
                                          int v46 = v55;
                                          ne_log_obj();
                                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (!os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
                                          {
LABEL_112:

                                            goto LABEL_64;
                                          }

                                          *(_DWORD *)v56 = 67109120;
                                          int v57 = v46;
                                          v48 = "Could not parse RSA-PSS salt length parameter, error %d";
                                          v49 = (os_log_s *)v47;
                                          uint32_t v50 = 8;
                                        }

                                        else
                                        {
                                          int v32 = v31;
                                          if (v31 == v29)
                                          {
                                            if (v12) {
                                              goto LABEL_14;
                                            }
                                            goto LABEL_65;
                                          }

                                          ne_log_obj();
                                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                                          if (!os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR)) {
                                            goto LABEL_112;
                                          }
                                          *(_DWORD *)v56 = 67109376;
                                          int v57 = v32;
                                          __int16 v58 = 1024;
                                          int v59 = v29;
                                          v48 = "RSA-PSS salt length %u != expected %u";
                                          v49 = (os_log_s *)v47;
                                          uint32_t v50 = 14;
                                        }

                                        _os_log_error_impl(&dword_1876B1000, v49, OS_LOG_TYPE_ERROR, v48, v56, v50);
                                        goto LABEL_112;
                                      }

                                      ne_log_obj();
                                      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
                                      {
LABEL_64:

LABEL_65:
                                        ne_log_obj();
                                        __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                          goto LABEL_54;
                                        }
                                        *(_DWORD *)buf = 67109378;
                                        *(_DWORD *)v69 = v7;
                                        *(_WORD *)&v69[4] = 2112;
                                        *(void *)&v69[6] = v4;
                                        __int16 v33 = "Unable to get RSA-PSS authentication protocol, payload len %u payload %@";
                                        goto LABEL_68;
                                      }

                                      *(_WORD *)v56 = 0;
                                      v36 = "Unrecognized PSA-PSS hash algorithm OID";
                                    }

                                    else
                                    {
                                      ne_log_obj();
                                      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                        goto LABEL_64;
                                      }
                                      *(_WORD *)v56 = 0;
                                      v36 = "PSA-PSS hash algorithm OIDs do not match";
                                    }
                                  }

                                  else
                                  {
                                    ne_log_obj();
                                    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                      goto LABEL_64;
                                    }
                                    *(_WORD *)v56 = 0;
                                    v36 = "Unexpected non-NULL RSA-PSS MaskGenAlgorithm.HashAlgorithm parameters";
                                  }

                                  v37 = (int *)v56;
                                  goto LABEL_72;
                                }

                                ne_log_obj();
                                __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                                if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                                  goto LABEL_64;
                                }
                                *(_DWORD *)v56 = 67109120;
                                int v57 = v28;
                                v36 = "Could not parse RSA-PSS MaskGenAlgorithm.HashAlgorithm parameters, error %d";
                              }

                              v37 = (int *)v56;
LABEL_118:
                              v38 = v12;
                              uint32_t v39 = 8;
                              goto LABEL_73;
                            }

                            ne_log_obj();
                            __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_64;
                            }
                            LOWORD(v60[0]) = 0;
                            v36 = "Incorrect RSA-PSS MaskGenAlgorithm.OID";
                            v37 = v60;
                          }

                          else
                          {
                            ne_log_obj();
                            __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                              goto LABEL_64;
                            }
                            LOWORD(v62) = 0;
                            v36 = "Unexpected non-NULL HashAlgorithm parameters";
                            v37 = &v62;
                          }

+ (uint64_t)isRemoteAuthenticationPacketProtocol:(void *)a3 compatibleWithConfiguredProtocol:
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if ([v5 isEqual:v4]) {
    goto LABEL_2;
  }
  if (![v5 isDigitalSignature])
  {
    if ([v4 isDigitalSignature])
    {
      if (v4)
      {
        uint64_t v8 = [v4 method];
        if (v8 == 245 || v8 == 14 && (unint64_t)([v4 digitalSignatureAlgorithm] - 9) <= 2)
        {
          uint64_t v6 = -[NEIKEv2AuthenticationProtocol isRSA]((uint64_t)v5);
          goto LABEL_22;
        }

        uint64_t v9 = [v4 method];
        if (v9 == 1
          || v9 == 14 && (unint64_t v10 = [v4 digitalSignatureAlgorithm], v10 <= 6) && ((0x62u >> v10) & 1) != 0)
        {
          uint64_t v6 = [v5 method] == 1;
          goto LABEL_22;
        }
      }

      if (-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v4)
        && -[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v5))
      {
        uint64_t v11 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v5);
        __int16 v12 = +[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v4);
        uint64_t v6 = [v11 containsObject:v12];

        goto LABEL_22;
      }
    }

+ (uint64_t)copySignHashSetForAuthMethod:(uint64_t)a1
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  uint64_t v3 = +[NEIKEv2Crypto copySignHashProtocolForAuth:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, v2);
  if (!v3 || ![v2 isDigitalSignature])
  {
    if (-[NEIKEv2AuthenticationProtocol isRSA]((uint64_t)v2))
    {
      uint64_t v7 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  4LL);
      v16[0] = v7;
      uint64_t v8 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  3LL);
      v16[1] = v8;
      uint64_t v9 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  2LL);
      v16[2] = v9;
      [MEMORY[0x189603F18] arrayWithObjects:v16 count:3];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v6 = [objc_alloc(MEMORY[0x189604010]) initWithArray:v10];
      goto LABEL_13;
    }

    if (!-[NEIKEv2AuthenticationProtocol isECDSA]((uint64_t)v2))
    {
      uint64_t v6 = 0LL;
      goto LABEL_13;
    }

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:3];
    [v11 addObject:v3];
    uint64_t v12 = -[NEIKEv2SignatureHashProtocol hashType](v3, "hashType");
    if (v12 != 3)
    {
      if (v12 != 2)
      {
LABEL_11:
        uint64_t v6 = [objc_alloc(MEMORY[0x189604010]) initWithArray:v11];

        goto LABEL_13;
      }

      uint64_t v13 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  3LL);

      [v11 addObject:v13];
      uint64_t v3 = v13;
    }

    uint64_t v14 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  4LL);

    [v11 addObject:v14];
    uint64_t v3 = v14;
    goto LABEL_11;
  }

  id v4 = objc_alloc(MEMORY[0x189604010]);
  v17[0] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 initWithArray:v5];

LABEL_13:
  return v6;
}

+ (NEIKEv2SignatureHashProtocol)copySignHashProtocolForAuth:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  id v3 = v2;
  objc_opt_self();
  uint64_t v4 = [v3 method];
  switch(v4)
  {
    case 9LL:
      uint64_t v5 = 2LL;
      goto LABEL_9;
    case 10LL:
      uint64_t v5 = 3LL;
      goto LABEL_9;
    case 11LL:
      uint64_t v5 = 4LL;
      goto LABEL_9;
    case 12LL:
    case 13LL:
      goto LABEL_10;
    case 14LL:
      uint64_t v6 = [v3 digitalSignatureAlgorithm];
      uint64_t v5 = qword_187872DF8[v6 - 1];
      goto LABEL_9;
    default:
      uint64_t v5 = v4;
      if (v4 == 1)
      {
LABEL_9:

        return -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  v5);
      }

      else
      {
LABEL_10:

        return 0LL;
      }
  }

+ (id)copySignHashDataForSet:(void *)a3 authenticationSet:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_self();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:v4];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)+[NEIKEv2Crypto copySignHashSetForAuthMethod:]( (uint64_t)&OBJC_CLASS___NEIKEv2Crypto,  *(void **)(*((void *)&v16 + 1) + 8 * v12));
        objc_msgSend(v7, "unionSet:", v13, (void)v16);

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  id v14 = +[NEIKEv2Crypto copySignHashDataForSet:](v6, v7);
  return v14;
}

+ (id)copySignHashDataForSet:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if ([v2 count])
  {
    [v2 allObjects];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 sortedArrayUsingSelector:sel_compare_];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    id v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithCapacity:", 2 * objc_msgSend(v4, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    [v4 reverseObjectEnumerator];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) hashType];
          __int16 v14 = bswap32(v11) >> 16;
          if ((_WORD)v11) {
            [v5 appendBytes:&v14 length:2];
          }
          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    if ([v5 length]) {
      id v12 = v5;
    }
    else {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

+ (id)copySignHashDataForSet:(void *)a3 authentication:
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_self();
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = objc_alloc(MEMORY[0x189604010]);
    v13[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v8 initWithArray:v9];
    id v11 = +[NEIKEv2Crypto copySignHashDataForSet:authenticationSet:](v7, v4, v10);
  }

  else
  {
    id v11 = +[NEIKEv2Crypto copySignHashDataForSet:](v6, v4);
  }

  return v11;
}

+ (void)copySignHashSetForData:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  unint64_t v3 = [v2 length];
  if (!v3)
  {
LABEL_16:
    uint64_t v6 = 0LL;
    goto LABEL_17;
  }

  unint64_t v4 = v3;
  if ((v3 & 1) != 0)
  {
    ne_log_obj();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = v4;
      _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Sign hash data length %zu is not divisible by sizeof(uint16_t)",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  unint64_t v5 = v3 >> 1;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:v3 >> 1];
  uint64_t v7 = [v2 bytes];
  if (v4 >= 2)
  {
    id v8 = (unsigned __int16 *)v7;
    if (v5 <= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v4 >> 1;
    }
    do
    {
      unsigned int v10 = *v8++;
      unint64_t v11 = bswap32(v10) >> 16;
      if ((unsigned __int16)(v11 - 6) > 0xFFFAu)
      {
        id v12 = -[NEIKEv2SignatureHashProtocol initWithHashType:]( objc_alloc(&OBJC_CLASS___NEIKEv2SignatureHashProtocol),  "initWithHashType:",  v11);
        [v6 addObject:v12];
      }

      else
      {
        ne_log_obj();
        id v12 = (NEIKEv2SignatureHashProtocol *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v16 = v11;
          _os_log_impl(&dword_1876B1000, (os_log_t)v12, OS_LOG_TYPE_INFO, "Ignoring sign hash algorithm %zu", buf, 0xCu);
        }
      }

      --v9;
    }

    while (v9);
  }

+ (uint64_t)createNATDetectionHashForInitiatorSPI:(void *)a3 responderSPI:(void *)a4 address:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_self();
  if (v8)
  {
    if ([v8 addressFamily] == 2)
    {
      uint64_t v9 = [v8 address];
      unsigned int v10 = (const void *)(v9 + 4);
      unint64_t v11 = (__int16 *)(v9 + 2);
      CC_LONG v12 = 4;
LABEL_9:
      __int16 v21 = *v11;
      uint64_t data = [v6 value];
      uint64_t v19 = [v7 value];
      CC_SHA1_Init(&buf);
      CC_SHA1_Update(&buf, &data, 8u);
      CC_SHA1_Update(&buf, &v19, 8u);
      CC_SHA1_Update(&buf, v10, v12);
      CC_SHA1_Update(&buf, &v21, 2u);
      CC_SHA1_Final(md, &buf);
      uint64_t v14 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:20];
      ne_log_obj();
      unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int v22 = 138413058;
        uint64_t v23 = v14;
        __int16 v24 = 2112;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "Created NAT hash (%@) for %@ : %@ : %@",  v22,  0x2Au);
      }

      goto LABEL_15;
    }

    if ([v8 addressFamily] == 30)
    {
      uint64_t v15 = [v8 address];
      unsigned int v10 = (const void *)(v15 + 8);
      unint64_t v11 = (__int16 *)(v15 + 2);
      CC_LONG v12 = 16;
      goto LABEL_9;
    }

    ne_log_obj();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      buf.h0 = 67109120;
      buf.h1 = [v8 addressFamily];
      _os_log_fault_impl(&dword_1876B1000, v17, OS_LOG_TYPE_FAULT, "Unknown address family %u", (uint8_t *)&buf, 8u);
    }

    uint64_t v14 = 0LL;
  }

  else
  {
    ne_log_obj();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      buf.h0 = 138412546;
      *(void *)&buf.h1 = v6;
      LOWORD(buf.h3) = 2112;
      *(void *)((char *)&buf.h3 + 2) = v7;
      _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEFAULT,  "Generating fake NAT detection hash for %@ %@",  (uint8_t *)&buf,  0x16u);
    }

    uint64_t v14 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:&createNATDetectionHashForInitiatorSPI_responderSPI_address__hashBytes length:20];
  }

+ (uint64_t)copyCertificateFromPersistentData:(int)a3 isModernSystem:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_opt_self();
  ne_log_obj();
  unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)CFErrorRef result = 138412546;
      *(void *)&result[4] = v4;
      __int16 v25 = 1024;
      int v26 = a3;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "copyCertificateFromPersistentData: %@ isModernSystem %d",  result,  0x12u);
    }

    uint64_t v7 = *MEMORY[0x189604DE8];
    uint64_t v8 = *MEMORY[0x18960BE80];
    if ((a3 & 1) != 0)
    {
      v20[0] = *MEMORY[0x18960BE30];
      v20[1] = v8;
      uint64_t v9 = *MEMORY[0x18960BE70];
      v20[2] = *MEMORY[0x18960BB38];
      v20[3] = v9;
      v21[0] = v7;
      v21[1] = v4;
      v21[2] = *MEMORY[0x18960BB40];
      v21[3] = v7;
      unsigned int v10 = (void *)MEMORY[0x189603F68];
      unint64_t v11 = v21;
      CC_LONG v12 = v20;
    }

    else
    {
      v22[0] = *MEMORY[0x18960BE30];
      v22[1] = v8;
      uint64_t v13 = *MEMORY[0x18960BE70];
      v22[2] = *MEMORY[0x18960BB38];
      v22[3] = v13;
      v23[0] = v7;
      v23[1] = v4;
      v23[2] = *MEMORY[0x18960BB40];
      v23[3] = v7;
      unsigned int v10 = (void *)MEMORY[0x189603F68];
      unint64_t v11 = v23;
      CC_LONG v12 = v22;
    }

    [v10 dictionaryWithObjects:v11 forKeys:v12 count:4];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    *(void *)CFErrorRef result = 0LL;
    OSStatus v14 = SecItemCopyMatching(v6, (CFTypeRef *)result);
    if (!v14)
    {
      uint64_t v17 = *(void *)result;
      goto LABEL_14;
    }

    OSStatus v15 = v14;
    ne_log_obj();
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v15;
      _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to retrieve certificate from persistent data (%d)",  (uint8_t *)v19,  8u);
    }

    if (*(void *)result) {
      CFRelease(*(CFTypeRef *)result);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)CFErrorRef result = 136315138;
    *(void *)&result[4] = "+[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:]";
    _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "%s called with null persistentData", result, 0xCu);
  }

  uint64_t v17 = 0LL;
LABEL_14:

  return v17;
}

+ (void)copyDataFromPersistentReference:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x189604DE8];
    uint64_t v4 = *MEMORY[0x18960BE80];
    v14[0] = *MEMORY[0x18960BE20];
    v14[1] = v4;
    uint64_t v5 = *MEMORY[0x18960BE70];
    v14[2] = *MEMORY[0x18960BB38];
    v14[3] = v5;
    v15[0] = v3;
    v15[1] = v2;
    v15[2] = *MEMORY[0x18960BB48];
    v15[3] = v3;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:4];
    id v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    *(void *)CFErrorRef result = 0LL;
    OSStatus v7 = SecItemCopyMatching(v6, (CFTypeRef *)result);
    uint64_t v8 = *(void **)result;
    if (!*(void *)result
      || v7
      || (CFTypeID v9 = CFGetTypeID(*(CFTypeRef *)result), TypeID = CFDataGetTypeID(), v8 = *(void **)result, v9 != TypeID))
    {
      if (v8)
      {
        CFRelease(v8);
        *(void *)CFErrorRef result = 0LL;
      }

      ne_log_obj();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_error_impl(&dword_1876B1000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "SecItemCopyMatching", v13, 2u);
      }

      CFDataRef v11 = 0LL;
      goto LABEL_12;
    }

    *(void *)CFErrorRef result = 0LL;
    if (!+[NSData isSensitiveDataInstance:](MEMORY[0x189603F48], v8))
    {
      CFDataRef v11 = +[NSData sensitiveDataWithData:](MEMORY[0x189603F48], v8);
LABEL_12:

      uint64_t v8 = v11;
    }
  }

  else
  {
    ne_log_obj();
    id v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CFErrorRef result = 136315138;
      *(void *)&result[4] = "+[NEIKEv2Crypto copyDataFromPersistentReference:]";
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "%s called with null persistentReference",  result,  0xCu);
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (uint64_t)copySecIdentity:(void *)a3 keyData:(int)a4 isModernSystem:
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_opt_self();
  if (v6)
  {
    if (v7 && [v7 length])
    {
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = objc_opt_self();
      ne_log_obj();
      CFDataRef v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)CFErrorRef result = 138412802;
        *(void *)&result[4] = v8;
        *(_WORD *)&_BYTE result[12] = 2112;
        *(void *)&result[14] = v9;
        *(_WORD *)&result[22] = 1024;
        LODWORD(v50) = a4;
        _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "copySecIdentityFromModernDP %@ %@ %d",  result,  0x1Cu);
      }

      uint64_t v12 = +[NEIKEv2Crypto copyCertificateFromPersistentData:isModernSystem:](v10, v8, a4);
      if (v12)
      {
        uint64_t v13 = (const void *)v12;
        id v14 = v9;
        objc_opt_self();
        ne_log_obj();
        OSStatus v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412546;
          *(void *)&v51[4] = v14;
          __int16 v52 = 1024;
          int v53 = a4;
          _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "copyKeyFromPersistentData: %@ isModernSystem %d",  v51,  0x12u);
        }

        uint64_t v16 = *MEMORY[0x189604DE8];
        uint64_t v17 = *MEMORY[0x18960BE80];
        if ((a4 & 1) != 0)
        {
          v43[0] = *MEMORY[0x18960BE30];
          v43[1] = v17;
          uint64_t v18 = *MEMORY[0x18960BE70];
          v43[2] = *MEMORY[0x18960BB38];
          v43[3] = v18;
          v44[0] = v16;
          v44[1] = v14;
          v44[2] = *MEMORY[0x18960BB60];
          v44[3] = v16;
          uint64_t v19 = (void *)MEMORY[0x189603F68];
          uint64_t v20 = v44;
          __int16 v21 = (uint8_t *)v43;
        }

        else
        {
          *(void *)CC_SHA1_CTX buf = *MEMORY[0x18960BE30];
          uint64_t v46 = v17;
          uint64_t v30 = *MEMORY[0x18960BE70];
          uint64_t v47 = *MEMORY[0x18960BB38];
          uint64_t v48 = v30;
          *(void *)CFErrorRef result = v16;
          *(void *)&result[8] = v14;
          *(void *)&result[16] = *MEMORY[0x18960BB60];
          uint64_t v50 = v16;
          uint64_t v19 = (void *)MEMORY[0x189603F68];
          uint64_t v20 = result;
          __int16 v21 = buf;
        }

        [v19 dictionaryWithObjects:v20 forKeys:v21 count:4];
        int v31 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        *(void *)v51 = 0LL;
        OSStatus v32 = SecItemCopyMatching(v31, (CFTypeRef *)v51);
        if (v32)
        {
          OSStatus v33 = v32;
          ne_log_obj();
          int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int v41 = 67109120;
            OSStatus v42 = v33;
            _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "Failed to retrieve private key from persistent data (%d)",  v41,  8u);
          }

          if (*(void *)v51) {
            CFRelease(*(CFTypeRef *)v51);
          }

          goto LABEL_27;
        }

        v37 = *(const void **)v51;

        if (!v37)
        {
LABEL_27:
          ne_log_obj();
          uint32_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)CFErrorRef result = 0;
            _os_log_error_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to retrieve certificate key reference for configured local certificate",  result,  2u);
          }

          CFRelease(v13);
          goto LABEL_30;
        }

        uint64_t v28 = SecIdentityCreate();
        CFRelease(v13);
        CFRelease(v37);
        if (v28) {
          goto LABEL_31;
        }
        ne_log_obj();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CFErrorRef result = 0;
          v38 = "Failed to create identity reference for configured local certificate";
LABEL_38:
          _os_log_error_impl(&dword_1876B1000, v29, OS_LOG_TYPE_ERROR, v38, result, 2u);
        }
      }

      else
      {
        ne_log_obj();
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CFErrorRef result = 0;
          v38 = "Failed to retrieve certificate reference for configured local certificate";
          goto LABEL_38;
        }
      }

LABEL_30:
      uint64_t v28 = 0LL;
LABEL_31:

      goto LABEL_32;
    }

    uint64_t v22 = *MEMORY[0x189604DE8];
    uint64_t v23 = *MEMORY[0x18960BE80];
    v39[0] = *MEMORY[0x18960BE30];
    v39[1] = v23;
    uint64_t v24 = *MEMORY[0x18960BE70];
    v39[2] = *MEMORY[0x18960BB38];
    v39[3] = v24;
    v40[0] = v22;
    v40[1] = v6;
    v40[2] = *MEMORY[0x18960BB50];
    v40[3] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:4];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    *(void *)CFErrorRef result = 0LL;
    OSStatus v25 = SecItemCopyMatching((CFDictionaryRef)v8, (CFTypeRef *)result);
    if (!v25)
    {
      uint64_t v28 = *(void *)result;
      goto LABEL_32;
    }

    OSStatus v26 = v25;
    ne_log_obj();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_SHA1_CTX buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v26;
      _os_log_error_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_ERROR,  "Failed to retrieve data for configured local certificate identity (%d)",  buf,  8u);
    }

    if (*(void *)result) {
      CFRelease(*(CFTypeRef *)result);
    }
  }

  else
  {
    ne_log_obj();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CFErrorRef result = 136315138;
      *(void *)&result[4] = "+[NEIKEv2Crypto copySecIdentity:keyData:isModernSystem:]";
      _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v8,  OS_LOG_TYPE_FAULT,  "%s called with null certIdentityData",  result,  0xCu);
    }
  }

  uint64_t v28 = 0LL;
LABEL_32:

  return v28;
}

@end