@interface KCSRPServerContext
- (BOOL)resetWithPassword:(id)a3 error:(id *)a4;
- (KCSRPServerContext)initWithUser:(id)a3 password:(id)a4 digestInfo:(const ccdigest_info *)a5 group:(ccdh_gp *)a6 randomSource:(ccrng_state *)a7;
- (KCSRPServerContext)initWithUser:(id)a3 salt:(id)a4 verifier:(id)a5 digestInfo:(const ccdigest_info *)a6 group:(ccdh_gp *)a7 randomSource:(ccrng_state *)a8;
- (NSData)salt;
- (NSData)verifier;
- (id)copyChallengeFor:(id)a3 error:(id *)a4;
- (id)copyConfirmationFor:(id)a3 error:(id *)a4;
- (void)setVerifier:(id)a3;
@end

@implementation KCSRPServerContext

- (BOOL)resetWithPassword:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x189603FB8];
  id v6 = a3;
  [v5 dataWithLength:16];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( MEMORY[0x189603FB8],  "dataWithLength:",  8 * MEMORY[0x1895B61D8]((void)-[KCSRPContext context](self, "context")[8]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[KCSRPContext dataForPassword:](self, "dataForPassword:", v6);
  v21 = -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  -[KCSRPContext userNameString](self, "userNameString");
  [v9 length];
  id v10 = v9;
  [v10 bytes];
  [v7 length];
  id v11 = v7;
  [v11 mutableBytes];
  id v12 = v8;
  [v12 mutableBytes];
  uint64_t salt_and_verification = ccsrp_generate_salt_and_verification();
  BOOL v19 = CoreCryptoError( salt_and_verification,  a4,  @"Error generating SRP salt/verifier",  v14,  v15,  v16,  v17,  v18,  (uint64_t)v21);
  if (v19)
  {
    -[KCSRPServerContext setVerifier:](self, "setVerifier:", v12);
    objc_storeStrong((id *)&self->_salt, v11);
  }

  return v19;
}

- (KCSRPServerContext)initWithUser:(id)a3 password:(id)a4 digestInfo:(const ccdigest_info *)a5 group:(ccdh_gp *)a6 randomSource:(ccrng_state *)a7
{
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KCSRPServerContext;
  v13 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:]( &v17,  sel_initWithUser_digestInfo_group_randomSource_,  a3,  a5,  a6,  a7);
  uint64_t v14 = v13;
  if (!v13 || (uint64_t v15 = 0LL, -[KCSRPServerContext resetWithPassword:error:](v13, "resetWithPassword:error:", v12, 0LL))) {
    uint64_t v15 = v14;
  }

  return v15;
}

- (KCSRPServerContext)initWithUser:(id)a3 salt:(id)a4 verifier:(id)a5 digestInfo:(const ccdigest_info *)a6 group:(ccdh_gp *)a7 randomSource:(ccrng_state *)a8
{
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___KCSRPServerContext;
  objc_super v17 = -[KCSRPContext initWithUser:digestInfo:group:randomSource:]( &v20,  sel_initWithUser_digestInfo_group_randomSource_,  a3,  a6,  a7,  a8);
  uint64_t v18 = v17;
  if (v17)
  {
    -[KCSRPServerContext setVerifier:](v17, "setVerifier:", v16);
    objc_storeStrong((id *)&v18->_salt, a4);
  }

  return v18;
}

- (id)copyChallengeFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[KCSRPContext context](self, "context");
  uint64_t v7 = ccsrp_exchange_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, @"start data")) {
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x189603FB8];
  -[KCSRPContext context](self, "context");
  [v8 dataWithLength:ccsrp_exchange_size()];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  -[KCSRPContext userNameString](self, "userNameString");
  v9 = -[KCSRPServerContext salt](self, "salt");
  [v9 length];
  id v10 = -[KCSRPServerContext salt](self, "salt");
  [v10 bytes];
  id v11 = -[KCSRPServerContext verifier](self, "verifier");
  [v11 bytes];
  [v6 bytes];
  id v12 = v20;
  [v12 mutableBytes];
  uint64_t started = ccsrp_server_start_authentication();

  if (!CoreCryptoError(started, a4, @"Server start authentication failed: %d", v14, v15, v16, v17, v18, started))
  {

LABEL_4:
    id v12 = 0LL;
  }

  return v12;
}

- (id)copyConfirmationFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[KCSRPContext context](self, "context");
  uint64_t v7 = ccsrp_session_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, @"response data")) {
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x189603FB8];
  -[KCSRPContext context](self, "context");
  [v8 dataWithLength:ccsrp_session_size()];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  [v6 bytes];
  id v10 = v9;
  [v10 mutableBytes];
  int v11 = ccsrp_server_verify_session();
  if (!CoreCryptoError(v11 ^ 1u, a4, @"SRP verification failed", v12, v13, v14, v15, v16, v18))
  {

LABEL_4:
    id v10 = 0LL;
  }

  return v10;
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSData)verifier
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setVerifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end