@interface NEIKEv2SecurityContextChaCha20Poly1305
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:;
@end

@implementation NEIKEv2SecurityContextChaCha20Poly1305

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self) {
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    }
    else {
      outgoingEncryptionContext = 0LL;
    }
    v9 = outgoingEncryptionContext;
    -[NSMutableData mutableBytes](v9, "mutableBytes");
    ccchacha20poly1305_info();
    id v10 = v6;
    uint64_t v11 = [v6 length];
    int v12 = [v7 length];
    unsigned int v13 = -[NEIKEv2SecurityContext overheadForPlaintextLength:](self, "overheadForPlaintextLength:", v11);
    int v14 = ccchacha20poly1305_reset();
    if (!v14)
    {
      *(_DWORD *)&__s[8] = 0;
      *(void *)__s = 0LL;
      if (self)
      {
        -[NSData getBytes:length:](self->_outgoingEncryptionSalt, "getBytes:length:", __s, 4LL);
        unint64_t currentOutgoingIV = self->_currentOutgoingIV;
        self->_unint64_t currentOutgoingIV = currentOutgoingIV + 1;
      }

      else
      {
        [0 getBytes:__s length:4];
        unint64_t currentOutgoingIV = 0LL;
      }

      *(void *)&__s[4] = currentOutgoingIV;
      int v16 = ccchacha20poly1305_setnonce();
      if (v16)
      {
        int v25 = v16;
        memset_s(__s, 0xCuLL, 0, 0xCuLL);
        ne_log_obj();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v33 = v25;
          _os_log_fault_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_FAULT,  "ccchacha20poly1305_setnonce failed: %d",  buf,  8u);
        }

        v21 = 0LL;
        id v6 = v10;
        goto LABEL_12;
      }

      v17 = (os_log_s *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v12 + (_DWORD)v11 + v13];
      -[os_log_s appendData:](v17, "appendData:", v7);
      -[os_log_s appendBytes:length:](v17, "appendBytes:length:", &__s[4], 8LL);
      memset_s(__s, 0xCuLL, 0, 0xCuLL);
      -[os_log_s appendData:](v17, "appendData:", v6);
      char v31 = 0;
      -[os_log_s appendBytes:length:](v17, "appendBytes:length:", &v31, 1LL);
      -[os_log_s setLength:](v17, "setLength:", -[os_log_s length](v17, "length") + 16);
      -[os_log_s bytes](v17, "bytes");
      int v18 = ccchacha20poly1305_aad();
      if (v18)
      {
        int v26 = v18;
        ne_log_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v33 = v26;
          _os_log_fault_impl(&dword_1876B1000, v27, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_aad failed: %d", buf, 8u);
        }

        goto LABEL_25;
      }

      -[os_log_s mutableBytes](v17, "mutableBytes");
      int v19 = ccchacha20poly1305_encrypt();
      if (v19)
      {
        int v28 = v19;
        ne_log_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 67109120;
        int v33 = v28;
        v29 = "ccchacha20poly1305_encrypt failed: %d";
      }

      else
      {
        int v20 = ccchacha20poly1305_finalize();
        if (!v20)
        {
          v21 = v17;
LABEL_12:

          goto LABEL_13;
        }

        int v30 = v20;
        ne_log_obj();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
LABEL_25:

          v21 = 0LL;
          goto LABEL_12;
        }

        *(_DWORD *)buf = 67109120;
        int v33 = v30;
        v29 = "ccchacha20poly1305_finalize failed: %d";
      }

      _os_log_fault_impl(&dword_1876B1000, v27, OS_LOG_TYPE_FAULT, v29, buf, 8u);
      goto LABEL_25;
    }

    int v23 = v14;
    ne_log_obj();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v23;
      _os_log_fault_impl(&dword_1876B1000, v24, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_reset failed: %d", __s, 8u);
    }

    v21 = 0LL;
    id v6 = v10;
  }

  else
  {
    ne_log_obj();
    v9 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(void *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "%s called with null authenticatedHeaders",  __s,  0xCu);
    }

    v21 = 0LL;
  }

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(void *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 decryptPayloadData:authenticatedHeaders:]";
      v22 = "%s called with null payloadData";
LABEL_21:
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v22, __s, 0xCu);
    }

- (void).cxx_destruct
{
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_14;
  }
  if (!v7)
  {
    ne_log_obj();
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v35 = (uint64_t)"-[NEIKEv2SecurityContextChaCha20Poly1305 initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
    int v25 = "%s called with null encryptionProtocol";
    int v26 = v23;
    uint32_t v27 = 12;
    goto LABEL_20;
  }

  if (v7[2] != 28LL) {
    goto LABEL_14;
  }
  a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
  if (!a1) {
    goto LABEL_14;
  }
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = [v8 length];
  CFDataRef v12 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x189603F48], (const UInt8 *)(v10 + v11 - 4), 4LL);
  id v13 = a1[4];
  a1[4] = v12;

  if (a1[4])
  {
    int v33 = 0LL;
    int v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)&OBJC_CLASS___NEIKEv2Crypto, 8u);
    -[os_log_s getBytes:length:](v14, "getBytes:length:", &v33, 8LL);
    a1[6] = v33;
    int v15 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], 256LL);
    if (v15)
    {
      ccchacha20poly1305_info();
      -[__CFData mutableBytes](v15, "mutableBytes");
      [v8 bytes];
      if (ccchacha20poly1305_init())
      {
        ne_log_obj();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_16;
        }
        *(_WORD *)buf = 0;
        int v28 = "ccchacha20poly1305_init failed";
      }

      else
      {
        objc_storeStrong(a1 + 2, v15);
        uint64_t v16 = [v9 bytes];
        uint64_t v17 = [v9 length];
        CFDataRef v18 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x189603F48], (const UInt8 *)(v16 + v17 - 4), 4LL);
        id v19 = a1[5];
        a1[5] = v18;

        if (a1[5])
        {
          int v20 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], 256LL);
          if (v20)
          {
            v21 = v20;
            ccchacha20poly1305_info();
            -[os_log_s mutableBytes](v21, "mutableBytes");
            [v9 bytes];
            if (!ccchacha20poly1305_init())
            {
              objc_storeStrong(a1 + 3, v21);
              v22 = a1;
LABEL_17:

              goto LABEL_18;
            }

            ne_log_obj();
            int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1876B1000, v32, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_init failed", buf, 2u);
            }
          }

          else
          {
            ne_log_obj();
            int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v35 = 256LL;
              _os_log_fault_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  buf,  0xCu);
            }

            v21 = 0LL;
          }

@end