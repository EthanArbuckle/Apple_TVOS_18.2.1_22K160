@interface TKTokenAccessRegistry
- (BOOL)_isPersistenceEnabled;
- (BOOL)_platformAllowsAllRequests;
- (BOOL)_shouldAutomaticallyAllowRequest:(id)a3;
- (BOOL)evaluateRequest:(id)a3 error:(id *)a4;
- (TKTokenAccessRegistry)init;
- (TKTokenAccessRegistry)initWithAccessDB:(id)a3 userPrompt:(id)a4;
- (int64_t)_fetchAccessForRequest:(id)a3;
- (int64_t)_promptUserToEvaluateRequest:(id)a3 error:(id *)a4;
- (void)_storeAccess:(int64_t)a3 forRequest:(id)a4;
- (void)setAccessDB:(id)a3;
- (void)setUserPrompt:(id)a3;
@end

@implementation TKTokenAccessRegistry

- (TKTokenAccessRegistry)initWithAccessDB:(id)a3 userPrompt:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKTokenAccessRegistry;
  v9 = -[TKTokenAccessRegistry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessDB, a3);
    objc_storeStrong((id *)&v10->_prompt, a4);
  }

  return v10;
}

- (TKTokenAccessRegistry)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TKTokenAccessUserPromptCreate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TKTokenAccessRegistry initWithAccessDB:userPrompt:](self, "initWithAccessDB:userPrompt:", v3, v4);

  return v5;
}

- (BOOL)evaluateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:](self, "_shouldAutomaticallyAllowRequest:", v6))
  {
    BOOL v7 = 1;
  }

  else
  {
    int64_t v8 = -[TKTokenAccessRegistry _fetchAccessForRequest:](self, "_fetchAccessForRequest:", v6);
    if (!v8)
    {
      int64_t v8 = -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:]( self,  "_promptUserToEvaluateRequest:error:",  v6,  a4);
      -[TKTokenAccessRegistry _storeAccess:forRequest:](self, "_storeAccess:forRequest:", v8, v6);
    }

    BOOL v7 = v8 == 1;
  }

  return v7;
}

- (BOOL)_shouldAutomaticallyAllowRequest:(id)a3
{
  id v4 = a3;
  if (-[TKTokenAccessRegistry _platformAllowsAllRequests](self, "_platformAllowsAllRequests"))
  {
    TK_LOG_token_access_registry();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.1();
    }
  }

  else if ([v4 clientHasAccessTokenEntitlement])
  {
    TK_LOG_token_access_registry();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.2();
    }
  }

  else
  {
    [v4 clientBundleID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      TK_LOG_token_access_registry();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.3();
      }
      goto LABEL_21;
    }

    [v4 clientBundleID];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 hasPrefix:@"com.apple"])
    {
      [v4 clientBundleID];
      int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v8 isEqualToString:@"com.apple.sear.SampleToken"];

      if ((v9 & 1) == 0)
      {
        TK_LOG_token_access_registry();
        v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.6();
        }
        goto LABEL_21;
      }
    }

    else
    {
    }

    [v4 tokenID];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 classID];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEqualToString:*MEMORY[0x18960BAC8]];

    if (v12)
    {
      TK_LOG_token_access_registry();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.4();
      }
    }

    else
    {
      [v4 tokenID];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 classID];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = [v14 isEqualToString:*MEMORY[0x18960BAD0]];

      if (!v15)
      {
        BOOL v16 = 0;
        goto LABEL_22;
      }

      TK_LOG_token_access_registry();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.5();
      }
    }
  }

- (BOOL)_platformAllowsAllRequests
{
  return 0;
}

- (int64_t)_promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v8 = -[TKTokenAccessUserPrompt preflightStatus](self->_prompt, "preflightStatus");
  if (v8)
  {
    if (v8 == 1)
    {
      TK_LOG_token_access_registry();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.2();
      }

      int64_t v4 = 1LL;
    }

    else if (v8 == 2)
    {
      TK_LOG_token_access_registry();
      char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.1();
      }

      int64_t v4 = -[TKTokenAccessUserPrompt promptUserToEvaluateRequest:error:]( self->_prompt,  "promptUserToEvaluateRequest:error:",  v7,  a4);
    }
  }

  else
  {
    TK_LOG_token_access_registry();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.3();
    }

    if (a4)
    {
      v11 = (void *)MEMORY[0x189607870];
      uint64_t v15 = *MEMORY[0x189607490];
      v16[0] = @"Operation not supported in this platform";
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v12];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    int64_t v4 = 2LL;
  }

  return v4;
}

- (int64_t)_fetchAccessForRequest:(id)a3
{
  id v4 = a3;
  if (-[TKTokenAccessRegistry _isPersistenceEnabled](self, "_isPersistenceEnabled"))
  {
    int64_t v5 = -[TKTokenAccessDB fetchAccessForRequest:](self->_accessDB, "fetchAccessForRequest:", v4);
  }

  else
  {
    TK_LOG_token_access_registry();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _fetchAccessForRequest:].cold.1();
    }

    int64_t v5 = 0LL;
  }

  return v5;
}

- (void)_storeAccess:(int64_t)a3 forRequest:(id)a4
{
  id v6 = a4;
  if (!-[TKTokenAccessRegistry _isPersistenceEnabled](self, "_isPersistenceEnabled")) {
    goto LABEL_5;
  }
  uint64_t v7 = [v6 clientBundleID];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  [v6 clientBundleID];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 length];

  if (v10)
  {
    -[TKTokenAccessDB storeAccess:forRequest:](self->_accessDB, "storeAccess:forRequest:", a3, v6);
  }

  else
  {
LABEL_5:
    TK_LOG_token_access_registry();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenAccessRegistry _storeAccess:forRequest:].cold.1();
    }
  }
}

- (BOOL)_isPersistenceEnabled
{
  return 1;
}

- (void)setUserPrompt:(id)a3
{
}

- (void)setAccessDB:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.1()
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.2()
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.3()
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.4()
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.5()
{
}

- (void)_shouldAutomaticallyAllowRequest:.cold.6()
{
}

- (void)_promptUserToEvaluateRequest:error:.cold.1()
{
}

- (void)_promptUserToEvaluateRequest:error:.cold.2()
{
}

- (void)_promptUserToEvaluateRequest:error:.cold.3()
{
}

- (void)_fetchAccessForRequest:.cold.1()
{
}

- (void)_storeAccess:forRequest:.cold.1()
{
}

@end