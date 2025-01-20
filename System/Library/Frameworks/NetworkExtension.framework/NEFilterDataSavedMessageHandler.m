@interface NEFilterDataSavedMessageHandler
- (void)enqueueWithFlow:(void *)a3 context:;
- (void)executeVerdictHandlerWithFlow:(void *)a3 verdict:(void *)a4 context:;
- (void)executeWithFlow:(void *)a3 context:;
- (void)initWithGetVerdictBlock:(void *)a3 handleVerdictBlock:;
@end

@implementation NEFilterDataSavedMessageHandler

- (void)initWithGetVerdictBlock:(void *)a3 handleVerdictBlock:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___NEFilterDataSavedMessageHandler;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = _Block_copy(v5);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = _Block_copy(v6);
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (void)enqueueWithFlow:(void *)a3 context:
{
  self = a2;
  id v6 = a3;
  if (a1)
  {
    id Property = self;
    if (self) {
      id Property = objc_getProperty(self, v5, 136LL, 1);
    }
    id v8 = Property;
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v11 = self;
      if (self) {
        id v11 = objc_getProperty(self, v10, 136LL, 1);
      }
      id v12 = v11;
      [v12 addObject:a1];
    }

    else
    {
      -[NEFilterDataSavedMessageHandler executeWithFlow:context:](a1, self, v6);
    }
  }
}

- (void)executeWithFlow:(void *)a3 context:
{
  self = a2;
  id v5 = a3;
  if (!a1) {
    goto LABEL_18;
  }
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 8) + 16LL))();
  id v8 = (void *)v6;
  if (!v6)
  {
    uint64_t v9 = a1;
    v10 = self;
    id v11 = 0LL;
    goto LABEL_6;
  }

  if ((*(_BYTE *)(v6 + 13) & 1) == 0)
  {
    uint64_t v9 = a1;
    v10 = self;
    id v11 = v8;
LABEL_6:
    -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:](v9, v10, v11, v5);
LABEL_17:

LABEL_18:
    return;
  }

  id v12 = self;
  if (!self)
  {
LABEL_10:
    id v13 = v12;

    if (v13)
    {
      id Property = self;
      if (self) {
        id Property = objc_getProperty(self, v14, 136LL, 1);
      }
      id v16 = Property;
      [v16 insertObject:a1 atIndex:0];
    }

    else
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", a1, 0);
      if (self) {
        objc_setProperty_atomic(self, v17, v18, 136LL);
      }
    }

    goto LABEL_17;
  }

  if ((self[11] & 1) == 0)
  {
    self[11] = 1;
    id v12 = objc_getProperty(self, v7, 136LL, 1);
    goto LABEL_10;
  }

  [MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Flow is already paused" userInfo:0];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v19);
  -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:](v20, v21, v22, v23);
}

- (void)executeVerdictHandlerWithFlow:(void *)a3 verdict:(void *)a4 context:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9 && v8 && *((_BYTE *)v9 + 104) && [v8 needRules])
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke;
      v11[3] = &unk_18A08C1F8;
      id v12 = v7;
      id v13 = v10;
      uint64_t v14 = a1;
      id v15 = v8;
      [v13 fetchCurrentRulesForFlow:v12 completionHandler:v11];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 16) + 16LL))();
    }
  }
}

void __81__NEFilterDataSavedMessageHandler_executeVerdictHandlerWithFlow_verdict_context___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) identifierString];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      int v18 = 138412546;
      id v19 = v17;
      __int16 v20 = 2112;
      v21 = v3;
      _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "Control verdict for flow %@: %@",  (uint8_t *)&v18,  0x16u);
    }
  }

  if (!v3)
  {
    [*(id *)(a1 + 40) _principalObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleRulesChanged];

LABEL_13:
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      uint64_t v11 = *(void *)(v10 + 8);
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = (*(void (**)(void))(v11 + 16))();
    goto LABEL_16;
  }

  if ((v3[72] & 1) != 0)
  {
    [*(id *)(a1 + 40) _principalObject];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleRulesChanged];
  }

  if ((v3[73] & 1) != 0) {
    goto LABEL_13;
  }
  int v6 = [v3 drop];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v6)
  {
    if ((isKindOfClass & 1) != 0)
    {
      id v16 = &OBJC_CLASS___NEFilterNewFlowVerdict;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v16 = &OBJC_CLASS___NEFilterDataVerdict;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_32;
        }
        id v16 = &OBJC_CLASS___NEFilterRemediationVerdict;
      }
    }

    uint64_t v12 = -[__objc2_class allowVerdict](v16, "allowVerdict");
    goto LABEL_16;
  }

  if ((isKindOfClass & 1) != 0)
  {
    id v8 = &OBJC_CLASS___NEFilterNewFlowVerdict;
LABEL_28:
    uint64_t v12 = -[__objc2_class dropVerdict](v8, "dropVerdict");
LABEL_16:
    id v13 = (void *)v12;
    goto LABEL_17;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = &OBJC_CLASS___NEFilterDataVerdict;
    goto LABEL_28;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = &OBJC_CLASS___NEFilterRemediationVerdict;
    goto LABEL_28;
  }

- (void).cxx_destruct
{
}

@end