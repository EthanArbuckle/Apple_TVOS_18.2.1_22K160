@interface RSABSSATokenWaitingActivation
- (NSData)blindedMessage;
- (NSData)blindingInverse;
- (NSData)tokenContent;
- (RSABSSATokenBlinder)tokenBlinder;
- (RSABSSATokenWaitingActivation)initWithBlindingInverse:(id)a3 blindedMessage:(id)a4 tokenContent:(id)a5 tokenBlinder:(id)a6 ciphersuite:(const ccrsabssa_ciphersuite *)a7;
- (id)activateTokenWithServerResponse:(id)a3 error:(id *)a4;
@end

@implementation RSABSSATokenWaitingActivation

- (RSABSSATokenWaitingActivation)initWithBlindingInverse:(id)a3 blindedMessage:(id)a4 tokenContent:(id)a5 tokenBlinder:(id)a6 ciphersuite:(const ccrsabssa_ciphersuite *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RSABSSATokenWaitingActivation;
  v17 = -[RSABSSATokenWaitingActivation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_tokenBlinder, a6);
    objc_storeStrong((id *)&v18->_blindedMessage, a4);
    objc_storeStrong((id *)&v18->_blindingInverse, a3);
    objc_storeStrong((id *)&v18->_tokenContent, a5);
    v18->_ciphersuite = a7;
  }

  return v18;
}

- (id)activateTokenWithServerResponse:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x189603FB8];
  id v6 = a3;
  v7 = -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  objc_msgSend(v5, "dataWithLength:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[RSABSSATokenWaitingActivation tokenBlinder](self, "tokenBlinder");
  [v28 publicKey];
  id v9 = v6;
  [v9 bytes];
  [v9 length];

  id v10 = -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  [v10 bytes];
  v11 = -[RSABSSATokenWaitingActivation blindingInverse](self, "blindingInverse");
  [v11 length];
  id v12 = -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent");
  [v12 bytes];
  -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 length];
  id v14 = v8;
  uint64_t v25 = [v14 mutableBytes];
  uint64_t v26 = [v14 length];
  int v15 = ccrsabssa_unblind_signature();

  if (v15)
  {
    if (a4)
    {
      id v16 = (void *)MEMORY[0x189607870];
      v29 = @"corecrypto_error";
      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", v15, v25, v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 errorWithDomain:@"com.apple.cryptokit.rsabssa" code:4 userInfo:v18];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v19 = 0LL;
  }

  else
  {
    objc_super v20 = objc_alloc(&OBJC_CLASS___RSABSSATokenReady);
    v21 = -[RSABSSATokenWaitingActivation tokenContent](self, "tokenContent", v25, v26);
    v22 = -[RSABSSATokenWaitingActivation tokenBlinder](self, "tokenBlinder");
    [v22 keyId];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[RSABSSATokenReady initWithTokenContent:tokenSignature:keyId:]( v20,  "initWithTokenContent:tokenSignature:keyId:",  v21,  v14,  v23);
  }

  return v19;
}

- (NSData)blindedMessage
{
  return self->_blindedMessage;
}

- (NSData)blindingInverse
{
  return self->_blindingInverse;
}

- (RSABSSATokenBlinder)tokenBlinder
{
  return self->_tokenBlinder;
}

- (NSData)tokenContent
{
  return self->_tokenContent;
}

- (void).cxx_destruct
{
}

@end