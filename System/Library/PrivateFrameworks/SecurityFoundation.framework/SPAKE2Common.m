@interface SPAKE2Common
- (BOOL)generateStateWithError:(id *)a3;
- (BOOL)processMsg1:(id)a3 error:(id *)a4;
- (BOOL)processMsg2:(id)a3 error:(id *)a4;
- (BOOL)setupProver:(id *)a3;
- (BOOL)setupVerifier:(id *)a3;
- (BOOL)verified;
- (NSData)salt;
- (NSData)w0;
- (NSData)w1;
- (NSString)code;
- (SPAKE2Common)initWithSalt:(id)a3 code:(id)a4;
- (_SFAESKey)session_key;
- (ccrng_state)rng;
- (ccspake_cp)cp;
- (ccspake_ctx)spake_ctx;
- (ccspake_mac)mac;
- (id)decryptMessage:(id)a3 error:(id *)a4;
- (id)encryptMessage:(id)a3 error:(id *)a4;
- (id)getMsg1WithError:(id *)a3;
- (id)getMsg2WithError:(id *)a3;
- (unint64_t)point_size;
- (unint64_t)w_size;
- (void)dealloc;
- (void)setCode:(id)a3;
- (void)setCp:(ccspake_cp *)a3;
- (void)setMac:(ccspake_mac *)a3;
- (void)setPoint_size:(unint64_t)a3;
- (void)setRng:(ccrng_state *)a3;
- (void)setSalt:(id)a3;
- (void)setSession_key:(id)a3;
- (void)setSpake_ctx:(ccspake_ctx *)a3;
- (void)setVerified:(BOOL)a3;
- (void)setW0:(id)a3;
- (void)setW1:(id)a3;
- (void)setW_size:(unint64_t)a3;
@end

@implementation SPAKE2Common

- (SPAKE2Common)initWithSalt:(id)a3 code:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SPAKE2Common;
  v8 = -[SPAKE2Common init](&v11, sel_init);
  if (v8)
  {
    -[SPAKE2Common setRng:](v8, "setRng:", ccrng());
    -[SPAKE2Common setCp:](v8, "setCp:", ccspake_cp_256());
    -[SPAKE2Common setMac:](v8, "setMac:", ccspake_mac_hkdf_hmac_sha256());
    -[SPAKE2Common cp](v8, "cp");
    size_t v9 = ccspake_sizeof_ctx();
    -[SPAKE2Common setSpake_ctx:](v8, "setSpake_ctx:", malloc(v9));
    -[SPAKE2Common setSalt:](v8, "setSalt:", v6);
    -[SPAKE2Common setCode:](v8, "setCode:", v7);
    -[SPAKE2Common cp](v8, "cp");
    -[SPAKE2Common setW_size:](v8, "setW_size:", ccspake_sizeof_w());
    -[SPAKE2Common cp](v8, "cp");
    -[SPAKE2Common setPoint_size:](v8, "setPoint_size:", ccspake_sizeof_point());
  }

  return v8;
}

- (BOOL)generateStateWithError:(id *)a3
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v5 = -[SPAKE2Common code](self, "code");
  id v6 = (const char *)[v5 UTF8String];

  id v7 = (char *)&v21 - ((2 * -[SPAKE2Common w_size](self, "w_size") + 15) & 0xFFFFFFFFFFFFFFF0LL);
  size_t v8 = ccscrypt_storage_size();
  if ((v8 & 0x8000000000000000LL) != 0)
  {
    if (a3)
    {
      v18 = (void *)MEMORY[0x189607870];
      uint64_t v24 = *MEMORY[0x1896075E0];
      v25[0] = @"sscrypt_storage_size params failed";
      [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 errorWithDomain:@"SFCoreCryptoErrorDomain" code:-1 userInfo:v15];
      BOOL v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }

  else
  {
    size_t v9 = malloc(v8);
    strlen(v6);
    v10 = -[SPAKE2Common salt](self, "salt");
    [v10 length];
    id v11 = -[SPAKE2Common salt](self, "salt");
    [v11 bytes];
    uint64_t v12 = ccscrypt();

    free(v9);
    if (!(_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v7, -[SPAKE2Common w_size](self, "w_size"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAKE2Common setW0:](self, "setW0:", v19);

      objc_msgSend( MEMORY[0x189603F48],  "dataWithBytes:length:",  &v7[-[SPAKE2Common w_size](self, "w_size")],  -[SPAKE2Common w_size](self, "w_size"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPAKE2Common setW1:](self, "setW1:", v15);
      BOOL v17 = 1;
      goto LABEL_9;
    }

    if (a3)
    {
      v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = (int)v12;
      uint64_t v22 = *MEMORY[0x1896075E0];
      objc_msgSend(NSString, "stringWithFormat:", @"ccscrypt failed: %d", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v14 userInfo:v16];
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      BOOL v17 = 0;
LABEL_9:

      return v17;
    }
  }

  return 0;
}

- (BOOL)setupProver:(id *)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  -[SPAKE2Common cp](self, "cp");
  -[SPAKE2Common mac](self, "mac");
  -[SPAKE2Common rng](self, "rng");
  -[SPAKE2Common w_size](self, "w_size");
  id v5 = -[SPAKE2Common w0](self, "w0");
  [v5 bytes];
  id v6 = -[SPAKE2Common w1](self, "w1");
  [v6 bytes];
  uint64_t v7 = ccspake_prover_init();

  if (a3 && (_DWORD)v7)
  {
    size_t v8 = (void *)MEMORY[0x189607870];
    objc_msgSend( NSString,  "stringWithFormat:",  @"ccspake_prover_init failed: %d",  v7,  *MEMORY[0x1896075E0]);
    size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:@"SFCoreCryptoErrorDomain" code:(int)v7 userInfo:v10];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (_DWORD)v7 == 0;
}

- (BOOL)setupVerifier:(id *)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  -[SPAKE2Common point_size](self, "point_size");
  -[SPAKE2Common cp](self, "cp");
  -[SPAKE2Common w_size](self, "w_size");
  id v5 = -[SPAKE2Common w1](self, "w1");
  [v5 bytes];
  -[SPAKE2Common point_size](self, "point_size");
  -[SPAKE2Common rng](self, "rng");
  uint64_t L = ccspake_generate_L();

  if ((_DWORD)L)
  {
    if (a3)
    {
      uint64_t v7 = (void *)MEMORY[0x189607870];
      uint64_t v19 = *MEMORY[0x1896075E0];
      objc_msgSend(NSString, "stringWithFormat:", @"ccspake_generate_L failed: %d", L);
      size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7;
      uint64_t v11 = (int)L;
LABEL_7:
      [v10 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v11 userInfo:v9];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    -[SPAKE2Common spake_ctx](self, "spake_ctx");
    -[SPAKE2Common cp](self, "cp");
    -[SPAKE2Common mac](self, "mac");
    -[SPAKE2Common rng](self, "rng");
    -[SPAKE2Common w_size](self, "w_size");
    id v12 = -[SPAKE2Common w0](self, "w0");
    [v12 bytes];
    -[SPAKE2Common point_size](self, "point_size");
    uint64_t v13 = ccspake_verifier_init();

    if (!(_DWORD)v13) {
      return 1;
    }
    if (a3)
    {
      uint64_t v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = (int)v13;
      uint64_t v17 = *MEMORY[0x1896075E0];
      objc_msgSend(NSString, "stringWithFormat:", @"ccspake_verifier_init failed: %d", v13);
      size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      uint64_t v11 = v15;
      goto LABEL_7;
    }
  }

  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SPAKE2Common;
  -[SPAKE2Common dealloc](&v3, sel_dealloc);
}

- (id)getMsg1WithError:(id *)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v5 = (char *)&v12 - ((-[SPAKE2Common point_size](self, "point_size") + 15) & 0xFFFFFFFFFFFFFFF0LL);
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  -[SPAKE2Common point_size](self, "point_size");
  uint64_t v6 = ccspake_kex_generate();
  if ((_DWORD)v6)
  {
    if (a3)
    {
      uint64_t v7 = (void *)MEMORY[0x189607870];
      uint64_t v8 = (int)v6;
      uint64_t v13 = *MEMORY[0x1896075E0];
      objc_msgSend(NSString, "stringWithFormat:", @"ccspake_kex_generate failed: %d", v6);
      size_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v8 userInfo:v10];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v5, -[SPAKE2Common point_size](self, "point_size"));
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  [v6 length];
  id v7 = v6;
  [v7 bytes];

  uint64_t v8 = ccspake_kex_process();
  int v9 = v8;
  if (a4 && (_DWORD)v8)
  {
    v10 = (void *)MEMORY[0x189607870];
    objc_msgSend( NSString,  "stringWithFormat:",  @"ccspake_kex_process failed: %d",  v8,  *MEMORY[0x1896075E0]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v9 userInfo:v12];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == 0;
}

- (id)getMsg2WithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  uint64_t v4 = ccspake_mac_compute();
  if ((_DWORD)v4)
  {
    if (a3)
    {
      id v5 = (void *)MEMORY[0x189607870];
      uint64_t v6 = (int)v4;
      objc_msgSend( NSString,  "stringWithFormat:",  @"ccspake_mac_generate failed: %d",  v4,  *MEMORY[0x1896075E0]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v6 userInfo:v8];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    [MEMORY[0x189603F48] dataWithBytes:v12 length:32];
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[SPAKE2Common spake_ctx](self, "spake_ctx");
  [v6 length];
  id v7 = v6;
  [v7 bytes];

  uint64_t session_key = ccspake_mac_verify_and_get_session_key();
  if (!(_DWORD)session_key)
  {
    uint64_t v11 = -[_SFAESKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFAESKeySpecifier), "initWithBitSize:", 0LL);
    uint64_t v13 = objc_alloc(&OBJC_CLASS____SFAESKey);
    [MEMORY[0x189603F48] dataWithBytes:v19 length:16];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = -[_SFSymmetricKey initWithData:specifier:error:](v13, "initWithData:specifier:error:", v14, v11, a4);
    -[SPAKE2Common setSession_key:](self, "setSession_key:", a4);

    -[SPAKE2Common session_key](self, "session_key");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = v15 != 0LL;

    if (v15)
    {
      LOBYTE(a4) = 1;
      -[SPAKE2Common setVerified:](self, "setVerified:", 1LL);
    }

    goto LABEL_6;
  }

  if (a4)
  {
    int v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = (int)session_key;
    objc_msgSend( NSString,  "stringWithFormat:",  @"ccspake_mac_verify_and_get_session_key failed: %d",  session_key,  *MEMORY[0x1896075E0]);
    uint64_t v11 = (_SFAESKeySpecifier *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:@"SFCoreCryptoErrorDomain" code:v10 userInfo:v12];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
LABEL_6:
  }

  return (char)a4;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[_SFAESKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFAESKeySpecifier), "initWithBitSize:", 2LL);
  uint64_t v8 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:]( objc_alloc(&OBJC_CLASS____SFAuthenticatedEncryptionOperation),  "initWithKeySpecifier:",  v7);
  -[SPAKE2Common getKey](self, "getKey");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPAKE2Common salt](self, "salt");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAuthenticatedEncryptionOperation encrypt:withKey:additionalAuthenticatedData:error:]( v8,  "encrypt:withKey:additionalAuthenticatedData:error:",  v6,  v9,  v10,  a4);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [MEMORY[0x1896078F8] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:a4];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = v12;
    if (v12)
    {
      if (a4) {
        *a4 = 0LL;
      }
      id v14 = v12;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[_SFAESKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFAESKeySpecifier), "initWithBitSize:", 2LL);
  uint64_t v8 = -[_SFAuthenticatedEncryptionOperation initWithKeySpecifier:]( objc_alloc(&OBJC_CLASS____SFAuthenticatedEncryptionOperation),  "initWithKeySpecifier:",  v7);
  [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SPAKE2Common getKey](self, "getKey");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPAKE2Common salt](self, "salt");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAuthenticatedEncryptionOperation decrypt:withKey:additionalAuthenticatedData:error:]( v8,  "decrypt:withKey:additionalAuthenticatedData:error:",  v9,  v10,  v11,  a4);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (a4) {
        *a4 = 0LL;
      }
      id v13 = v12;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (ccrng_state)rng
{
  return self->_rng;
}

- (void)setRng:(ccrng_state *)a3
{
  self->_rng = a3;
}

- (ccspake_ctx)spake_ctx
{
  return self->_spake_ctx;
}

- (void)setSpake_ctx:(ccspake_ctx *)a3
{
  self->_spake_ctx = a3;
}

- (NSString)code
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCode:(id)a3
{
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSalt:(id)a3
{
}

- (ccspake_cp)cp
{
  return self->_cp;
}

- (void)setCp:(ccspake_cp *)a3
{
  self->_cp = a3;
}

- (ccspake_mac)mac
{
  return self->_mac;
}

- (void)setMac:(ccspake_mac *)a3
{
  self->_mac = a3;
}

- (NSData)w0
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setW0:(id)a3
{
}

- (NSData)w1
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setW1:(id)a3
{
}

- (unint64_t)w_size
{
  return self->_w_size;
}

- (void)setW_size:(unint64_t)a3
{
  self->_w_size = a3;
}

- (unint64_t)point_size
{
  return self->_point_size;
}

- (void)setPoint_size:(unint64_t)a3
{
  self->_point_size = a3;
}

- (_SFAESKey)session_key
{
  return (_SFAESKey *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setSession_key:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void).cxx_destruct
{
}

@end