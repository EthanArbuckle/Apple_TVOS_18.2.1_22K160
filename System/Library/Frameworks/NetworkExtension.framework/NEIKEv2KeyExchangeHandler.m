@interface NEIKEv2KeyExchangeHandler
+ (NEIKEv2KeyExchangeHandlerMLKEM)handlerForKEMethod:(void *)a3 peerPayload:;
+ (id)handlerForKEMethod:(uint64_t)a1;
- (BOOL)processPeerPayload:(id)a3;
- (void)initWithMethod:(void *)a1;
- (void)setSharedSecret:(uint64_t)a1;
@end

@implementation NEIKEv2KeyExchangeHandler

- (void)setSharedSecret:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (BOOL)processPeerPayload:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (id)handlerForKEMethod:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2 > 0x25) {
    goto LABEL_28;
  }
  if (((1LL << a2) & 0x7C026) != 0)
  {
    v3 = objc_alloc(&OBJC_CLASS___NEIKEv2KeyExchangeHandlerMODP);
    if (!v3)
    {
      v4 = 0LL;
      goto LABEL_36;
    }

    v4 = (id *)-[NEIKEv2KeyExchangeHandler initWithMethod:](v3, a2);
    if (!v4)
    {
LABEL_52:
      v4 = v4;
      v9 = v4;
      goto LABEL_53;
    }

    switch(a2)
    {
      case 1uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP768;
        uint64_t v7 = 96LL;
        break;
      case 2uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1024;
        uint64_t v7 = 128LL;
        break;
      case 5uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1536;
        uint64_t v7 = 192LL;
        break;
      case 0xEuLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP2048;
        uint64_t v7 = 256LL;
        break;
      case 0xFuLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP3072;
        uint64_t v7 = 384LL;
        break;
      case 0x10uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP4096;
        uint64_t v7 = 512LL;
        break;
      case 0x11uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP6144;
        uint64_t v7 = 768LL;
        break;
      case 0x12uLL:
        id v5 = objc_alloc(MEMORY[0x189603F48]);
        v6 = &NEIKEv2CryptoDHPrimeMODP8192;
        uint64_t v7 = 1024LL;
        break;
      default:
        ne_log_obj();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v67 = a2;
          _os_log_fault_impl(&dword_1876B1000, v18, OS_LOG_TYPE_FAULT, "Unsupported KE method %zu", buf, 0xCu);
        }

        goto LABEL_36;
    }

    uint64_t v19 = [v5 initWithBytesNoCopy:v6 length:v7 freeWhenDone:0];
    id v20 = v4[4];
    v4[4] = (id)v19;

    ne_log_obj();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v46 = v4[1];
      *(_DWORD *)buf = 134217984;
      unint64_t v67 = (unint64_t)v46;
      _os_log_debug_impl(&dword_1876B1000, v21, OS_LOG_TYPE_DEBUG, "Generate MODP DH %zu key", buf, 0xCu);
    }

    id v22 = v4[4];
    id v65 = 0LL;
    [v22 bytes];
    [v22 length];
    int v23 = SecDHCreate();
    if (v23)
    {
      int v54 = v23;
      ne_log_obj();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        id v55 = v4[1];
        *(_DWORD *)buf = 134218240;
        unint64_t v67 = (unint64_t)v55;
        __int16 v68 = 1024;
        LODWORD(v69) = v54;
        v56 = "Failed to create MODP DH %zu context: %d";
        v57 = v27;
        uint32_t v58 = 18;
LABEL_81:
        _os_log_fault_impl(&dword_1876B1000, v57, OS_LOG_TYPE_FAULT, v56, buf, v58);
      }
    }

    else
    {
      v4[5] = v65;
      unint64_t v24 = [v22 length];
      unint64_t v25 = SecDHGetMaxKeyLength();
      if (v25 <= v24)
      {
        v26 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v24);
        if (v26)
        {
          v27 = v26;
          -[__CFData mutableBytes](v26, "mutableBytes");
          int v28 = SecDHGenerateKeypair();
          if (!v28)
          {
            objc_storeStrong(v4 + 2, v27);
            ne_log_obj();
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              id v47 = v4[1];
              *(_DWORD *)buf = 134217984;
              unint64_t v67 = (unint64_t)v47;
              _os_log_debug_impl(&dword_1876B1000, v29, OS_LOG_TYPE_DEBUG, "Generated MODP DH %zu key", buf, 0xCu);
            }

            goto LABEL_52;
          }

          int v62 = v28;
          ne_log_obj();
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
          {
            id v64 = v4[1];
            *(_DWORD *)buf = 134218240;
            unint64_t v67 = (unint64_t)v64;
            __int16 v68 = 1024;
            LODWORD(v69) = v62;
            _os_log_fault_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_FAULT,  "Failed to generate MODP DH %zu key pair: %d",  buf,  0x12u);
          }
        }

        else
        {
          ne_log_obj();
          v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v67 = v24;
            _os_log_fault_impl( &dword_1876B1000,  v61,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  buf,  0xCu);
          }

          v27 = 0LL;
        }

        goto LABEL_88;
      }

      unint64_t v59 = v25;
      ne_log_obj();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        id v60 = v4[1];
        *(_DWORD *)buf = 134218496;
        unint64_t v67 = (unint64_t)v60;
        __int16 v68 = 2048;
        v69 = (id *)v59;
        __int16 v70 = 2048;
        unint64_t v71 = v24;
        v56 = "Max MODP DH %zu key length (%zu) is greater than prime length (%zu)";
        v57 = v27;
        uint32_t v58 = 32;
        goto LABEL_81;
      }
    }

- (void)initWithMethod:(void *)a1
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_CLASS___NEIKEv2KeyExchangeHandler;
  result = objc_msgSendSuper2(&v6, sel_init);
  if (result)
  {
    result[1] = a2;
  }

  else
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_fault_impl(&dword_1876B1000, v4, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }

    return 0LL;
  }

  return result;
}

+ (NEIKEv2KeyExchangeHandlerMLKEM)handlerForKEMethod:(void *)a3 peerPayload:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = objc_opt_self();
  if (a2 <= 0x25)
  {
    if (((1LL << a2) & 0x1803FC026LL) != 0)
    {
      objc_super v6 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:](v5, a2);
      if ([v6 processPeerPayload:v4])
      {
        uint64_t v7 = v6;
LABEL_5:

        goto LABEL_6;
      }

@end