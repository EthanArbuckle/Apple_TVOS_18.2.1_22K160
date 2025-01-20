@interface TKExtensionClientTokenSession
- (BOOL)ensureSessionWithClient:(id)a3 connectionIdentifier:(int64_t)a4 error:(id *)a5;
- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5;
- (BOOL)isValidWithError:(id *)a3;
- (NSNumber)sessionID;
- (TKExtensionClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)advertisedItems;
- (id)certificates;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)identities;
- (id)itemsOfClass:(id)a3;
- (id)keys;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
- (id)slotName;
- (id)withError:(id *)a3 accessControl:(__SecAccessControl *)a4 invoke:(id)a5;
- (void)dealloc;
- (void)terminate;
@end

@implementation TKExtensionClientTokenSession

- (TKExtensionClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TKExtensionClientTokenSession;
  return (TKExtensionClientTokenSession *)-[TKClientTokenSession _initWithToken:LAContext:parameters:error:]( &v7,  sel__initWithToken_LAContext_parameters_error_,  a3,  a4,  a5,  a6);
}

- (void)terminate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __42__TKExtensionClientTokenSession_terminate__block_invoke;
    v5[3] = &unk_189F8BAE0;
    v5[4] = self;
    id v4 =  -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  0LL,  0LL,  v5);
  }

uint64_t __42__TKExtensionClientTokenSession_terminate__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 sessionID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 endSession:v4 reply:&__block_literal_global_138];

  return MEMORY[0x189604A88];
}

- (BOOL)isValidWithError:(id *)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 BOOLValue];

  return v4;
}

uint64_t __50__TKExtensionClientTokenSession_isValidWithError___block_invoke()
{
  return MEMORY[0x189604A88];
}

- (BOOL)ensureSessionWithClient:(id)a3 connectionIdentifier:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (self->_connectionIdentifier == a4) {
    goto LABEL_7;
  }
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0LL;
  v9 = -[TKClientTokenSession LAContext](self, "LAContext");
  v10 = -[TKClientTokenSession parameters](self, "parameters");
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke;
  v14[3] = &unk_189F8BB48;
  v14[4] = self;
  v14[5] = &v15;
  [v8 startSessionWithLAContext:v9 parameters:v10 reply:v14];

  sessionID = self->_sessionID;
  if (sessionID)
  {
    self->_connectionIdentifier = a4;
  }

  else if (a5)
  {
    *a5 = (id) v16[5];
  }

  _Block_object_dispose(&v15, 8);

  if (sessionID) {
LABEL_7:
  }
    BOOL v12 = 1;
  else {
    BOOL v12 = 0;
  }

  return v12;
}

void __84__TKExtensionClientTokenSession_ensureSessionWithClient_connectionIdentifier_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 104);
  *(void *)(v7 + 104) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)withError:(id *)a3 accessControl:(__SecAccessControl *)a4 invoke:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  -[TKClientTokenSession token](self, "token");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke;
  v14[3] = &unk_189F8BB70;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  v16 = &v22;
  uint64_t v17 = &v19;
  v18 = a4;
  [v9 withError:a3 invoke:v14];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = (void *)v23[5];
  if (v12)
  {
    if (([v12 isEqual:self->_sessionID] & 1) == 0)
    {
      -[TKExtensionClientTokenSession terminate](self, "terminate");
      objc_storeStrong((id *)&self->_sessionID, (id)v23[5]);
      self->_connectionIdentifier = v20[3];
    }

    -[TKClientTokenSession setLAContext:](self, "setLAContext:", 0LL);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

id __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = 0LL;
  v31 = @"CryptoTokenKit";
  int v9 = 16;
  do
  {
    if (!objc_msgSend( *(id *)(a1 + 32),  "ensureSessionWithClient:connectionIdentifier:error:",  v7,  a3,  a4,  v31))
    {
      id v10 = 0LL;
      goto LABEL_31;
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    BOOL v12 = v11;
    if (v10) {
      goto LABEL_23;
    }
    [v11 domain];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v13 isEqualToString:v31]
      || [v12 code] != -9
      || !*(void *)(a1 + 64))
    {

LABEL_21:
      if (a4) {
        *a4 = v12;
      }
LABEL_23:
      id v24 = v10;
LABEL_30:

      goto LABEL_31;
    }

    char v14 = [*(id *)(a1 + 32) authenticateWhenNeeded];

    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 32) LAContext];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x189608728]);
      [*(id *)(a1 + 32) setLAContext:v16];

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), *(id *)(*(void *)(a1 + 32) + 104LL));
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = *(void *)(*(void *)(a1 + 32) + 80LL);
      *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
      if (![*(id *)(a1 + 32) ensureSessionWithClient:v7 connectionIdentifier:a3 error:a4]) {
        goto LABEL_30;
      }
    }

    [v12 userInfo];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 objectForKeyedSubscript:@"operation"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      TK_LOG_client_1();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke_cold_1((uint64_t)v12, v25, v26);
      }

      if (a4)
      {
        [MEMORY[0x189607870] errorWithDomain:v31 code:-5 userInfo:0];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

- (BOOL)evaluateAccessControl:(id)a3 forOperation:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create( &dword_186E58000,  "ExtClientObject: evaluateAccessControl",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke;
  v15[3] = &unk_189F8BB98;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v13 = -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  a5,  0LL,  v15);
  LOBYTE(a5) = [v13 BOOLValue];

  os_activity_scope_leave(&state);
  return (char)a5;
}

id __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0LL;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__6;
  id v17 = __Block_byref_object_dispose__6;
  id v18 = 0LL;
  [*(id *)(a1 + 32) sessionID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2;
  v12[3] = &unk_189F8B490;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 session:v6 evaluateAccessControl:v7 forOperation:v8 reply:v12];

  id v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    id v9 = (void *)v20[5];
  }

  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __74__TKExtensionClientTokenSession_evaluateAccessControl_forOperation_error___block_invoke_2( uint64_t a1,  int a2,  void *a3)
{
  id v5 = a3;
  if (a2) {
    id v6 = (void *)MEMORY[0x189604A88];
  }
  else {
    id v6 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( &dword_186E58000,  "ExtClientObject: getObject",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  uint64_t v15 = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke;
  id v16 = &unk_189F8BA98;
  id v17 = self;
  id v8 = v6;
  id v18 = v8;
  -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  a4,  0LL,  &v13);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = objc_alloc(&OBJC_CLASS___TKExtensionClientTokenObject);
    id v11 = -[TKClientTokenObject initWithSession:objectID:attributes:]( v10,  "initWithSession:objectID:attributes:",  self,  v8,  v9,  v13,  v14,  v15,  v16,  v17);
  }

  else
  {
    id v11 = 0LL;
  }

  os_activity_scope_leave(&state);
  return v11;
}

id __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0LL;
  [*(id *)(a1 + 32) sessionID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2;
  v11[3] = &unk_189F8B3F0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v5 session:v6 getAttributesOfObjectID:v7 reply:v11];

  id v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    id v8 = (void *)v19[5];
  }

  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __57__TKExtensionClientTokenSession_objectForObjectID_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create( &dword_186E58000,  "ExtClientObject: createObject",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  id v41 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x3032000000LL;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  id v25 = 0LL;
  uint64_t v14 = MEMORY[0x1895F87A8];
  uint64_t v15 = 3221225472LL;
  id v16 = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke;
  id v17 = &unk_189F8BBE8;
  uint64_t v20 = v24;
  uint64_t v18 = self;
  id v8 = v6;
  id v19 = v8;
  uint64_t v21 = &v36;
  uint64_t v22 = &v32;
  id v23 = &v26;
  -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  a4,  0LL,  &v14);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)v37[5];
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqual:", self->_sessionID, v14, v15, v16, v17, v18) & 1) == 0)
    {
      -[TKExtensionClientTokenSession terminate](self, "terminate");
      objc_storeStrong((id *)&self->_sessionID, (id)v37[5]);
      self->_connectionIdentifier = v33[3];
    }

    -[TKClientTokenSession setLAContext:](self, "setLAContext:", 0LL);
  }

  if (v27[5])
  {
    id v11 = objc_alloc(&OBJC_CLASS___TKExtensionClientTokenObject);
    uint64_t v12 = -[TKClientTokenObject initWithSession:objectID:attributes:]( v11,  "initWithSession:objectID:attributes:",  self,  v27[5],  v9);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  os_activity_scope_leave(&state);
  return v12;
}

id __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v31 = 0LL;
    uint64_t v8 = [v6 processObjectCreationAttributes:v7 authContext:&v31 error:a3];
    id v9 = v31;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
      goto LABEL_14;
    }
    [*(id *)(a1 + 32) LAContext];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (v9)
      {
        [*(id *)(a1 + 32) setLAContext:v9];
      }

      else
      {
        id v13 = objc_alloc_init(MEMORY[0x189608728]);
        [*(id *)(a1 + 32) setLAContext:v13];
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), *(id *)(*(void *)(a1 + 32) + 104LL));
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = *(void *)(*(void *)(a1 + 32) + 80LL);
      *(void *)(*(void *)(a1 + 32) + 80LL) = 0LL;
      if (![*(id *)(a1 + 32) ensureSessionWithClient:v5 connectionIdentifier:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) error:a3])
      {
LABEL_14:

        id v16 = 0LL;
        goto LABEL_13;
      }
    }
  }

  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = 0LL;
  [*(id *)(a1 + 32) sessionID];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2;
  v18[3] = &unk_189F8BBC0;
  v18[4] = *(void *)(a1 + 72);
  v18[5] = &v25;
  v18[6] = &v19;
  [v5 session:v14 createObjectWithAttributes:v15 reply:v18];

  if (a3 && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL)) {
    *a3 = (id) v20[5];
  }
  id v16 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
LABEL_13:

  return v16;
}

void __66__TKExtensionClientTokenSession_createObjectWithAttributes_error___block_invoke_2( void *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKExtensionClientTokenSession;
  -[TKExtensionClientTokenSession dealloc](&v3, sel_dealloc);
}

- (id)advertisedItems
{
  advertisedItems = self->_advertisedItems;
  if (!advertisedItems)
  {
    char v4 = _os_activity_create( &dword_186E58000,  "ExtClientObject: advertisedItems",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke;
    v7[3] = &unk_189F8BAE0;
    v7[4] = self;
    id v5 =  -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  0LL,  0LL,  v7);
    os_activity_scope_leave(&state);

    advertisedItems = self->_advertisedItems;
  }

  return advertisedItems;
}

id __48__TKExtensionClientTokenSession_advertisedItems__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 sessionID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2;
  v7[3] = &unk_189F8AA70;
  v7[4] = *(void *)(a1 + 32);
  [v4 session:v5 getAdvertisedItemsWithReply:v7];

  return *(id *)(*(void *)(a1 + 32) + 88LL);
}

void __48__TKExtensionClientTokenSession_advertisedItems__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)itemsOfClass:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v18 = (void *)[MEMORY[0x189604A58] mutableCopy];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = self;
  -[TKExtensionClientTokenSession advertisedItems](self, "advertisedItems");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    uint64_t v10 = *MEMORY[0x18960BB38];
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v12 objectForKeyedSubscript:v10];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = [v13 isEqual:v4];

        if (v14)
        {
          uint64_t v15 = -[TKClientTokenAdvertisedItem initWithSession:keychainAttributes:secRef:]( objc_alloc(&OBJC_CLASS___TKClientTokenAdvertisedItem),  "initWithSession:keychainAttributes:secRef:",  v5,  v12,  0LL);
          [v18 addObject:v15];
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  id v16 = (void *)[v18 copy];
  return v16;
}

- (id)keys
{
  return -[TKExtensionClientTokenSession itemsOfClass:](self, "itemsOfClass:", *MEMORY[0x18960BB60]);
}

- (id)certificates
{
  return -[TKExtensionClientTokenSession itemsOfClass:](self, "itemsOfClass:", *MEMORY[0x18960BB40]);
}

- (id)identities
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v23 = (void *)[MEMORY[0x189604A58] mutableCopy];
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v30 = self;
  -[TKExtensionClientTokenSession keys](self, "keys");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v40;
    uint64_t v33 = *MEMORY[0x18960BA68];
    uint64_t v32 = *MEMORY[0x18960B878];
    uint64_t v26 = *MEMORY[0x18960BB50];
    uint64_t v24 = *MEMORY[0x18960B9F8];
    uint64_t v25 = *MEMORY[0x18960BB38];
    do
    {
      for (uint64_t i = 0LL; i != v29; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        -[TKExtensionClientTokenSession certificates](v30, "certificates");
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v31 = i;
          uint64_t v7 = *(void *)v36;
LABEL_8:
          uint64_t v8 = 0LL;
          while (1)
          {
            if (*(void *)v36 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
            [v9 keychainAttributes];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 objectForKeyedSubscript:v33];
            id v11 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 keychainAttributes];
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 objectForKeyedSubscript:v32];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            char v14 = [v11 isEqual:v13];

            if ((v14 & 1) != 0) {
              break;
            }
            if (v6 == ++v8)
            {
              uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v6) {
                goto LABEL_8;
              }
              id v15 = v4;
              uint64_t i = v31;
              goto LABEL_23;
            }
          }

          id v15 = v9;

          uint64_t i = v31;
          if (!v15) {
            continue;
          }
          [v34 keychainAttributes];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          id v17 = (void *)[v16 mutableCopy];

          [v17 setObject:v26 forKeyedSubscript:v25];
          [v15 localizedName];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 setObject:v18 forKeyedSubscript:v24];

          if ([v34 keyRef] && objc_msgSend(v15, "certificateRef"))
          {
            [v15 certificateRef];
            [v34 keyRef];
            __int128 v19 = (void *)SecIdentityCreate();
            if (v19)
            {
              __int128 v20 = -[TKClientTokenAdvertisedItem initWithSession:keychainAttributes:secRef:]( objc_alloc(&OBJC_CLASS___TKClientTokenAdvertisedItem),  "initWithSession:keychainAttributes:secRef:",  v30,  v17,  v19);
              [v23 addObject:v20];
            }
          }
        }

        else
        {
          id v15 = v4;
        }

- (id)slotName
{
  slotName = self->_slotName;
  if (!slotName)
  {
    id v4 = _os_activity_create( &dword_186E58000,  "ExtClientObject: slotName",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &state);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke;
    v7[3] = &unk_189F8BAE0;
    v7[4] = self;
    id v5 =  -[TKExtensionClientTokenSession withError:accessControl:invoke:]( self,  "withError:accessControl:invoke:",  0LL,  0LL,  v7);
    os_activity_scope_leave(&state);

    slotName = self->_slotName;
  }

  return slotName;
}

id __41__TKExtensionClientTokenSession_slotName__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 sessionID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__TKExtensionClientTokenSession_slotName__block_invoke_2;
  v7[3] = &unk_189F8BC10;
  v7[4] = *(void *)(a1 + 32);
  [v4 session:v5 slotNameWithReply:v7];

  return *(id *)(*(void *)(a1 + 32) + 96LL);
}

void __41__TKExtensionClientTokenSession_slotName__block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
}

void __64__TKExtensionClientTokenSession_withError_accessControl_invoke___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_3( &dword_186E58000,  a2,  a3,  "TKErrorCodeAuthenticationNeeded does not have operation set: %{public}@",  (uint8_t *)&v3);
}

@end