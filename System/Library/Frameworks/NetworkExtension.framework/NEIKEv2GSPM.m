@interface NEIKEv2GSPM
- (id)initWithIKESA:(id *)a1;
- (void)createLocalSignedOctets;
- (void)createRemoteSignedOctets;
@end

@implementation NEIKEv2GSPM

- (void).cxx_destruct
{
}

- (id)initWithIKESA:(id *)a1
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v37 = 0LL;
    goto LABEL_30;
  }

  if (v3) {
    v5 = (void *)v3[13];
  }
  else {
    v5 = 0LL;
  }
  id v6 = v5;

  if (!v6)
  {
    ne_log_obj();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.remoteSecurePasswordMethod";
LABEL_27:
    _os_log_fault_impl(&dword_1876B1000, v38, OS_LOG_TYPE_FAULT, v39, buf, 0xCu);
    goto LABEL_28;
  }
  v8 = -[NEIKEv2IKESA sharedSecret](v4, v7);
  if (!v8)
  {
    ne_log_obj();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.sharedSecret";
    goto LABEL_27;
  }

  v10 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v9);

  if (!v10)
  {
    ne_log_obj();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyInitiatorIdentifier";
    goto LABEL_27;
  }

  v12 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v11);

  if (!v12)
  {
    ne_log_obj();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyResponderIdentifier";
    goto LABEL_27;
  }

  if (v4) {
    v13 = (void *)*((void *)v4 + 13);
  }
  else {
    v13 = 0LL;
  }
  id v14 = v13;
  uint64_t v15 = [v14 securePasswordMethod];

  if (v15 == 11001)
  {
    id location = 0LL;
    v16 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v4, (char *)&location);
    v48 = v16;
    if (!v16)
    {
      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v46 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      id v41 = location;
      if (v46)
      {
        *(_DWORD *)buf = 138412546;
        v54 = (const char *)location;
        __int16 v55 = 2112;
        v56 = v4;
        _os_log_error_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to retrieve concatenated nonces %@ for %@",  buf,  0x16u);
      }

      v37 = 0LL;
      goto LABEL_34;
    }

    v17 = v16;
    v18 = (os_log_s *)-[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v4, (char *)&location);
    if (v18)
    {
      v51.receiver = a1;
      v51.super_class = (Class)&OBJC_CLASS___NEIKEv2GSPM;
      v19 = (id *)objc_msgSendSuper2(&v51, sel_init);
      if (!v19)
      {
        ne_log_obj();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1876B1000, v35, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
        }

        a1 = 0LL;
        goto LABEL_32;
      }

      a1 = v19;
      v20 = objc_alloc(&OBJC_CLASS____TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus);
      v22 = -[NEIKEv2IKESA sharedSecret](v4, v21);
      v24 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v23);
      [v24 identifierData];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v26);
      [v27 identifierData];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4) {
        uint64_t v29 = v4[9] & 1;
      }
      else {
        uint64_t v29 = 0LL;
      }
      id obj = location;
      uint64_t v30 = -[NEIKEv2CryptoKitSPAKE2Plus initWithSeed:initiatorID:responderID:salt:context:forInitiator:error:]( v20,  "initWithSeed:initiatorID:responderID:salt:context:forInitiator:error:",  v22,  v25,  v28,  v17,  v18,  v29,  &obj);
      id v31 = obj;
      objc_storeStrong(&location, obj);
      id v32 = a1[3];
      a1[3] = (id)v30;

      id v33 = a1[3];
      if (v33)
      {
        id v49 = v31;
        id v34 = v33;
        [v34 getFirstMessageAndReturnError:&v49];
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v36 = v49;
        id location = v36;

        if (v35)
        {
          objc_storeStrong(a1 + 4, v35);
          objc_storeStrong(a1 + 2, v35);
          a1 = a1;
          v37 = a1;
LABEL_33:

          id v41 = location;
LABEL_34:

          goto LABEL_29;
        }

        ne_log_obj();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = (const char *)v36;
          _os_log_error_impl( &dword_1876B1000,  v47,  OS_LOG_TYPE_ERROR,  "Failed to get first message from SPAKE2 handler %@",  buf,  0xCu);
        }

        v35 = 0LL;
LABEL_32:
        v37 = 0LL;
        goto LABEL_33;
      }

      ne_log_obj();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412290;
      v54 = (const char *)v31;
      v42 = "Failed to create SPAKE2 handler %@";
      v43 = v35;
      uint32_t v44 = 12;
    }

    else
    {
      ne_log_obj();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412546;
      v54 = (const char *)location;
      __int16 v55 = 2112;
      v56 = v4;
      v42 = "Failed to retrieve concatenated SPIs %@ for %@";
      v43 = v35;
      uint32_t v44 = 22;
    }

    _os_log_error_impl(&dword_1876B1000, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);
    goto LABEL_32;
  }

  ne_log_obj();
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
  {
    String = (__CFString *)NEIKEv2SecurePasswordMethodCreateString(v15);
    *(_DWORD *)buf = 138412290;
    v54 = (const char *)String;
    _os_log_fault_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_FAULT,  "Support for secure password method %@ is not implemented",  buf,  0xCu);
  }

- (void)createLocalSignedOctets
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (!*(void *)(a1 + 32))
  {
    ne_log_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0LL;
    }

    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }

  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    ne_log_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
    goto LABEL_12;
  }

  id v3 = v2;
  uint64_t v4 = [v3 length];
  uint64_t v5 = [*(id *)(a1 + 40) length] + v4;

  id v6 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v5];
  [v6 appendData:*(void *)(a1 + 32)];
  [v6 appendData:*(void *)(a1 + 40)];
  return v6;
}

- (void)createRemoteSignedOctets
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    ne_log_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0LL;
    }

    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }

  if (!*(void *)(a1 + 32))
  {
    ne_log_obj();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    int v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
    goto LABEL_12;
  }

  id v3 = v2;
  uint64_t v4 = [v3 length];
  uint64_t v5 = [*(id *)(a1 + 40) length] + v4;

  id v6 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v5];
  [v6 appendData:*(void *)(a1 + 40)];
  [v6 appendData:*(void *)(a1 + 32)];
  return v6;
}

@end