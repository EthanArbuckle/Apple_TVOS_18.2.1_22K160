@interface KCSRPClientContext
- (BOOL)verifyConfirmation:(id)a3 error:(id *)a4;
- (id)copyResposeToChallenge:(id)a3 password:(id)a4 salt:(id)a5 error:(id *)a6;
- (id)copyStart:(id *)a3;
@end

@implementation KCSRPClientContext

- (id)copyStart:(id *)a3
{
  v5 = (void *)MEMORY[0x189603FB8];
  -[KCSRPContext context](self, "context");
  [v5 dataWithLength:ccsrp_exchange_size()];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSRPContext context](self, "context");
  -[KCSRPContext rng](self, "rng");
  id v7 = v6;
  [v7 mutableBytes];
  uint64_t started = ccsrp_client_start_authentication();
  if (!CoreCryptoError(started, a3, @"Start packet copy failed: %d", v9, v10, v11, v12, v13, started))
  {

    return 0LL;
  }

  return v7;
}

- (id)copyResposeToChallenge:(id)a3 password:(id)a4 salt:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[KCSRPContext context](self, "context");
  uint64_t v13 = ccsrp_exchange_size();
  if (ExactDataSizeRequirement(v10, v13, a6, @"challenge data"))
  {
    v14 = (void *)MEMORY[0x189603FB8];
    -[KCSRPContext context](self, "context");
    [v14 dataWithLength:ccsrp_session_size()];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[KCSRPContext dataForPassword:](self, "dataForPassword:", v11);
    -[KCSRPContext context](self, "context");
    -[KCSRPContext userNameString](self, "userNameString");
    [v16 length];
    id v17 = v16;
    [v17 bytes];
    [v12 length];
    [v12 bytes];
    [v10 bytes];
    id v18 = v15;
    [v18 mutableBytes];
    uint64_t v19 = ccsrp_client_process_challenge();
    if (!CoreCryptoError(v19, a6, @"Challenge processing failed: %d", v20, v21, v22, v23, v24, v19))
    {

      id v18 = 0LL;
    }
  }

  else
  {
    id v18 = 0LL;
  }

  return v18;
}

- (BOOL)verifyConfirmation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[KCSRPContext context](self, "context");
  uint64_t v7 = ccsrp_session_size();
  if (ExactDataSizeRequirement(v6, v7, a4, @"confirmation data"))
  {
    -[KCSRPContext context](self, "context");
    [v6 bytes];
    char v8 = ccsrp_client_verify_session();
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

@end