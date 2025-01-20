@interface LACDTOServiceProcessor
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOServiceProcessor)initWithSubprocessors:(id)a3;
- (id)_entitlementsForRequest:(id)a3;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOServiceProcessor

- (LACDTOServiceProcessor)initWithSubprocessors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOServiceProcessor;
  v5 = -[LACDTOServiceProcessor init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = +[LACEvaluationRequestProcessorFactory makeProcessorWithSubprocessors:]( &OBJC_CLASS___LACEvaluationRequestProcessorFactory,  "makeProcessorWithSubprocessors:",  v4);
    compoundProcessor = v5->_compoundProcessor;
    v5->_compoundProcessor = (LACEvaluationRequestProcessor *)v6;
  }

  return v5;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3 = a3;
  if (LACPolicyIsLocationBasedPolicy([v3 policy]))
  {
    char v4 = 1;
  }

  else
  {
    [v3 options];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1068];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:v6];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = [v7 BOOLValue];
  }

  return v4;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v21 = a4;
  objc_super v9 = (void (**)(id, void *))a5;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v10 = -[LACDTOServiceProcessor _entitlementsForRequest:](self, "_entitlementsForRequest:", v8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        [v8 client];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        char v17 = [v16 checkEntitlement:v15];

        if ((v17 & 1) == 0)
        {
          v19 = +[LACError missingEntitlementError:](&OBJC_CLASS___LACError, "missingEntitlementError:", v15);
          v20 = +[LACEvaluationResult resultWithFailure:](&OBJC_CLASS___LACEvaluationResult, "resultWithFailure:", v19);
          v9[2](v9, v20);

          v18 = v21;
          goto LABEL_11;
        }

        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v18 = v21;
  -[LACEvaluationRequestProcessor processRequest:configuration:completion:]( self->_compoundProcessor,  "processRequest:configuration:completion:",  v8,  v21,  v9);
LABEL_11:
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[LACEvaluationRequestProcessor postProcessRequest:result:completion:]( self->_compoundProcessor,  "postProcessRequest:result:completion:",  v10,  v9,  v8);
  }
  else {
    v8[2](v8, v9);
  }
}

- (id)_entitlementsForRequest:(id)a3
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x189603FA8]);
  v17[0] = @"com.apple.private.CoreAuthentication.SPI";
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v4 initWithArray:v5];

  if ([v3 policy] == 1026) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO"];
  }
  [v3 options];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInteger:1061];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.ShortExpiration"];
  }
  [MEMORY[0x189607968] numberWithInteger:1062];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"];
  }
  [MEMORY[0x189607968] numberWithInteger:1068];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.FallbackToNoAuth"];
  }
  [MEMORY[0x189607968] numberWithInteger:1085];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15) {
    [v6 addObject:@"com.apple.private.LocalAuthentication.DTO.AllowUnapprovedSensor"];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end