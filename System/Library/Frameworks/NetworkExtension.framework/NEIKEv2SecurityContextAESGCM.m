@interface NEIKEv2SecurityContextAESGCM
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:;
@end

@implementation NEIKEv2SecurityContextAESGCM

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(void *)&__s[4] = "-[NEIKEv2SecurityContextAESGCM constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", __s, 0xCu);
    }

    goto LABEL_17;
  }

  if (self) {
    encryptionContext = self->_encryptionContext;
  }
  else {
    encryptionContext = 0LL;
  }
  v9 = encryptionContext;
  -[os_log_s mutableBytes](v9, "mutableBytes");
  ccaes_gcm_encrypt_mode();
  uint64_t v10 = [v6 length];
  int v11 = [v7 length];
  unsigned int v12 = -[NEIKEv2SecurityContext overheadForPlaintextLength:](self, "overheadForPlaintextLength:", v10);
  int v13 = ccgcm_reset();
  if (v13)
  {
    int v21 = v13;
    ne_log_obj();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v21;
      _os_log_fault_impl(&dword_1876B1000, v22, OS_LOG_TYPE_FAULT, "ccgcm_reset failed: %d", __s, 8u);
    }

LABEL_17:
    v19 = 0LL;
    goto LABEL_11;
  }

  *(_DWORD *)&__s[8] = 0;
  *(void *)__s = 0LL;
  int v14 = ccgcm_inc_iv();
  if (v14)
  {
    int v23 = v14;
    memset_s(__s, 0xCuLL, 0, 0xCuLL);
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v23;
      _os_log_fault_impl(&dword_1876B1000, v15, OS_LOG_TYPE_FAULT, "ccgcm_inc_iv failed: %d", buf, 8u);
    }

    goto LABEL_26;
  }

  v15 = (os_log_s *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v11 + (_DWORD)v10 + v12];
  -[os_log_s appendData:](v15, "appendData:", v7);
  -[os_log_s appendBytes:length:](v15, "appendBytes:length:", &__s[4], 8LL);
  memset_s(__s, 0xCuLL, 0, 0xCuLL);
  -[os_log_s appendData:](v15, "appendData:", v6);
  char v29 = 0;
  -[os_log_s appendBytes:length:](v15, "appendBytes:length:", &v29, 1LL);
  -[os_log_s setLength:](v15, "setLength:", -[os_log_s length](v15, "length") + 16);
  -[os_log_s bytes](v15, "bytes");
  int v16 = ccgcm_aad();
  if (v16)
  {
    int v24 = v16;
    ne_log_obj();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = v24;
      v26 = "ccgcm_aad failed: %d";
      goto LABEL_28;
    }

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int __s = 136315138;
      v34 = "-[NEIKEv2SecurityContextAESGCM decryptPayloadData:authenticatedHeaders:]";
      v22 = "%s called with null payloadData";
LABEL_21:
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&__s, 0xCu);
    }

- (void).cxx_destruct
{
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  *(void *)&v32[5] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_14;
  }
  if (!v7)
  {
    ne_log_obj();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int __s = 136315138;
      *(void *)v32 = "-[NEIKEv2SecurityContextAESGCM initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
      _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null encryptionProtocol",  (uint8_t *)&__s,  0xCu);
    }

    int v11 = 0LL;
    goto LABEL_20;
  }

  unint64_t v10 = v7[2];
  if (v10 > 0x1E)
  {
LABEL_14:
    int v11 = 0LL;
    goto LABEL_21;
  }

  int v11 = 0LL;
  if (((0x401C0000u >> v10) & 1) != 0 && v10 - 29 >= 3)
  {
    a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
    if (a1)
    {
      ccaes_gcm_encrypt_mode();
      CFIndex v12 = ccgcm_context_size();
      int v13 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v12);
      if (v13)
      {
        int v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, 8u);
        if (v14)
        {
          int v15 = v14;
          objc_msgSend(v8, "getBytes:range:", &__s, objc_msgSend(v8, "length") - 4, 4);
          [v15 getBytes:v32 length:8];
          -[os_log_s mutableBytes](v13, "mutableBytes");
          [v8 length];
          [v8 bytes];
          int v16 = ccgcm_init_with_iv();
          memset_s(&__s, 0xCuLL, 0, 0xCuLL);
          if (v16)
          {
            ne_log_obj();
            int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v29) = 0;
              _os_log_fault_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_FAULT,  "ccgcm_init_with_iv failed",  (uint8_t *)&v29,  2u);
            }

            goto LABEL_17;
          }

          objc_storeStrong(a1 + 2, v13);
          ccaes_gcm_decrypt_mode();
          CFIndex v17 = ccgcm_context_size();
          int v18 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v17);
          if (!v18)
          {
            ne_log_obj();
            int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              int v29 = 134217984;
              CFIndex v30 = v17;
              _os_log_fault_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  (uint8_t *)&v29,  0xCu);
            }

            int v19 = 0LL;
            goto LABEL_17;
          }

          int v19 = v18;
          -[__CFData mutableBytes](v18, "mutableBytes");
          [v9 length];
          [v9 bytes];
          if (ccgcm_init())
          {
            ne_log_obj();
            int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              goto LABEL_16;
            }
            LOWORD(v29) = 0;
            v26 = "ccgcm_init failed";
          }

          else
          {
            objc_storeStrong(a1 + 3, v19);
            uint64_t v20 = [v9 bytes];
            uint64_t v21 = [v9 length];
            CFDataRef v22 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x189603F48], (const UInt8 *)(v20 + v21 - 4), 4LL);
            id v23 = a1[4];
            a1[4] = v22;

            if (a1[4])
            {
              int v11 = a1;
LABEL_18:

LABEL_19:
LABEL_20:

              goto LABEL_21;
            }

            ne_log_obj();
            int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
              goto LABEL_16;
            }
            LOWORD(v29) = 0;
            v26 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_GCM_SALT_LEN] failed";
          }

          _os_log_fault_impl(&dword_1876B1000, v24, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v29, 2u);
LABEL_16:

LABEL_17:
          int v11 = 0LL;
          goto LABEL_18;
        }

        ne_log_obj();
        int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          int __s = 67109120;
          v32[0] = 8;
          _os_log_fault_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_FAULT,  "[NEIKEv2Crypto createRandomWithSize:%u] failed",  (uint8_t *)&__s,  8u);
        }

        int v15 = 0LL;
      }

      else
      {
        ne_log_obj();
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_FAULT))
        {
          int __s = 134217984;
          *(void *)v32 = v12;
          _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v15,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  (uint8_t *)&__s,  0xCu);
        }
      }

      int v11 = 0LL;
      goto LABEL_19;
    }

    goto LABEL_14;
  }

@end