@interface TKTokenSessionConnection
- (NSMutableDictionary)initialKeepAlives;
- (NSMutableDictionary)sessions;
- (TKTokenConnection)tokenConnection;
- (TKTokenSessionConnection)initWithTokenConnection:(id)a3;
- (void)endSession:(id)a3 reply:(id)a4;
- (void)session:(id)a3 createObjectWithAttributes:(id)a4 reply:(id)a5;
- (void)session:(id)a3 deleteObjectWithObjectID:(id)a4 reply:(id)a5;
- (void)session:(id)a3 evaluateAccessControl:(id)a4 forOperation:(id)a5 reply:(id)a6;
- (void)session:(id)a3 getAdvertisedItemsWithReply:(id)a4;
- (void)session:(id)a3 getAttributesOfObjectID:(id)a4 reply:(id)a5;
- (void)session:(id)a3 objectID:(id)a4 operation:(int64_t)a5 data:(id)a6 algorithms:(id)a7 parameters:(id)a8 reply:(id)a9;
- (void)session:(id)a3 slotNameWithReply:(id)a4;
- (void)startSessionWithLAContext:(id)a3 parameters:(id)a4 reply:(id)a5;
- (void)withSessionID:(id)a3 invoke:(id)a4;
@end

@implementation TKTokenSessionConnection

- (TKTokenSessionConnection)initWithTokenConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKTokenSessionConnection;
  v6 = -[TKTokenSessionConnection init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tokenConnection, a3);
    v8 = (void *)MEMORY[0x189604A60];
    uint64_t v9 = [MEMORY[0x189604A60] mutableCopy];
    sessions = v7->_sessions;
    v7->_sessions = (NSMutableDictionary *)v9;

    uint64_t v11 = [v8 mutableCopy];
    initialKeepAlives = v7->_initialKeepAlives;
    v7->_initialKeepAlives = (NSMutableDictionary *)v11;
  }

  return v7;
}

- (void)startSessionWithLAContext:(id)a3 parameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v54 = a5;
  if (v8)
  {
    v10 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    [v10 sessions];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_enter(v11);
    v12 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    [v12 sessions];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKey:v8];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v11);
    v15 = (void *)[v9 mutableCopy];
    if (v14)
    {
LABEL_24:
      id v41 = v9;
      if ([v15 count])
      {
        [v15 removeObjectForKey:@"PIN"];
        [v15 removeObjectForKey:@"callerPID"];
        [v14 parameters];
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 addEntriesFromDictionary:v42];

        [v14 setParameters:v15];
      }

      v43 = (void *)MEMORY[0x189607968];
      ++self->_sessionIDCounter;
      objc_msgSend(v43, "numberWithInteger:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[TKTokenSessionConnection sessions](self, "sessions");
      [v44 setObject:v14 forKey:v17];
      v45 = -[TKTokenSessionConnection initialKeepAlives](self, "initialKeepAlives");
      objc_sync_enter(v45);
      v46 = -[TKTokenSessionConnection initialKeepAlives](self, "initialKeepAlives");
      [v14 token];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 tokenDriver];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v48 keepAlive];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      [v46 setObject:v49 forKey:v17];

      objc_sync_exit(v45);
      v23 = v54;
      (*((void (**)(id, void *, void))v54 + 2))(v54, v17, 0LL);
      id v19 = v14;
      id v9 = v41;
      goto LABEL_27;
    }
  }

  else
  {
    v15 = (void *)[v9 mutableCopy];
  }
  v16 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  [v16 token];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v17 delegate];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v58 = 0LL;
  [v18 token:v17 createSessionWithError:&v58];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v58;

  if (v14)
  {
    [v14 setLAContext:v8];
    [MEMORY[0x189607B30] currentConnection];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      [v20 auditToken];
    }

    else
    {
      __int128 v56 = 0u;
      __int128 v57 = 0u;
    }

    v55[0] = v56;
    v55[1] = v57;
    [v14 setCreatorAuditToken:v55];

    [v9 objectForKey:@"PIN"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 removeObjectForKey:@"PIN"];
    if (v24)
    {
      TK_LOG_token_3();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:].cold.2(v25);
      }

      [v24 dataUsingEncoding:4];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setCredential:v26 type:-3];
    }

    [v9 objectForKey:@"callerPID"];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setCallerPID:v27];

    [v15 removeObjectForKey:@"callerPID"];
    if ([v15 count])
    {
      [v14 parameters];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 addEntriesFromDictionary:v28];

      [v14 setParameters:v15];
    }

    if (v8)
    {
      id v52 = v9;
      v29 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
      [v29 sessions];
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      id obj = v30;
      objc_sync_enter(v30);
      v31 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
      [v31 sessions];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 objectForKey:v8];
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = v14;
        id v14 = v33;
      }

      else
      {
        v35 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
        [v35 sessions];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 setObject:v14 forKey:v8];
        v34 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
        [v34 token];
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v51 tokenDriver];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v50 keepAlive];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setKeepAlive:v37];
      }

      objc_sync_exit(obj);
      id v9 = v52;
    }
    v38 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    [v38 sessions];
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_enter(v39);
    v40 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    [v40 setInitialKeepAlive:0];

    objc_sync_exit(v39);
    goto LABEL_24;
  }

  TK_LOG_token_3();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:].cold.1(v17, (uint64_t)v19, v22);
  }

  v23 = v54;
  (*((void (**)(id, void, id))v54 + 2))(v54, 0LL, v19);
LABEL_27:
}

- (void)endSession:(id)a3 reply:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  v7 = -[TKTokenSessionConnection sessions](self, "sessions");
  [v7 removeObjectForKey:v6];

  v8[2]();
}

- (void)withSessionID:(id)a3 invoke:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  TK_LOG_token_3();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKTokenSessionConnection withSessionID:invoke:].cold.1((uint64_t)v7, self, v9);
  }
  v10 = -[TKTokenSessionConnection sessions](self, "sessions");
  [v10 objectForKey:v7];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
    [v22 token];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 tokenID];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2, self, @"TKTokenConnection.m", 114, @"An attempt to reference nonexistent session %@ on token %@", v7, v24 object file lineNumber description];
  }

  [MEMORY[0x189607B30] currentConnection];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  v13 = -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  [v13 token];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 tokenDriver];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 keepAlive];
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  [v11 queue];
  v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke;
  block[3] = &unk_189F8B640;
  id v26 = v11;
  id v27 = v12;
  id v30 = v8;
  v31 = v32;
  v28 = self;
  id v29 = v7;
  id v17 = v7;
  id v18 = v8;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v16, block);

  _Block_object_dispose(v32, 8);
}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2;
  v7[3] = &unk_189F8B618;
  id v4 = v3;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v7);
}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18959C510]();
  [*(id *)(a1 + 32) endRequest];
  [*(id *)(a1 + 32) setCaller:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;

  [*(id *)(a1 + 40) initialKeepAlives];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  [*(id *)(a1 + 40) initialKeepAlives];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 removeObjectForKey:*(void *)(a1 + 48)];

  objc_sync_exit(v5);
  objc_autoreleasePoolPop(v2);
}

- (void)session:(id)a3 getAdvertisedItemsWithReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke;
  v8[3] = &unk_189F8B690;
  id v9 = v6;
  id v7 = v6;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v8);
}

void __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2;
  v7[3] = &unk_189F8B668;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 getAdvertisedItemsWithReply:v7];
}

uint64_t __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 evaluateAccessControl:(id)a4 forOperation:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke;
  v16[3] = &unk_189F8B6E0;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v16);
}

void __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2;
  v9[3] = &unk_189F8B6B8;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v8 = v5;
  [a2 evaluateAccessControl:v6 forOperation:v7 reply:v9];
}

uint64_t __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 getAttributesOfObjectID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 token];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 tokenID];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = 0LL;
  [v13 decodedObjectID:v10 isCertificate:&v21 error:&v20];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = v20;
  if (v14)
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke;
    v16[3] = &unk_189F8B730;
    id v17 = v14;
    char v19 = v21;
    id v18 = v9;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v8, v16);
  }

  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v15);
  }
}

void __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2;
  v9[3] = &unk_189F8B708;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 getAttributesOfObject:v7 isCertificate:v6 reply:v9];
}

uint64_t __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 objectID:(id)a4 operation:(int64_t)a5 data:(id)a6 algorithms:(id)a7 parameters:(id)a8 reply:(id)a9
{
  id v26 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 token];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 tokenID];
  char v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v34 = 0LL;
  [v21 decodedKeyID:v18 error:&v34];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  id v23 = v34;
  if (v22)
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke;
    v27[3] = &unk_189F8B780;
    id v28 = v22;
    int64_t v33 = a5;
    id v29 = v14;
    id v30 = v15;
    id v31 = v16;
    id v32 = v17;
    v24 = v26;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v26, v27);
  }

  else
  {
    (*((void (**)(id, void, id))v17 + 2))(v17, 0LL, v23);
    v24 = v26;
  }
}

void __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2;
  v12[3] = &unk_189F8B758;
  uint64_t v10 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 64);
  id v14 = v5;
  id v11 = v5;
  [a2 objectID:v6 operation:v10 inputData:v7 algorithms:v8 parameters:v9 reply:v12];
}

uint64_t __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 createObjectWithAttributes:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke;
  v12[3] = &unk_189F8B7A8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v12);
}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2;
  v8[3] = &unk_189F8B708;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 createObjectWithAttributes:v6 reply:v8];
}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x18960BAD8];
  uint64_t v7 = [v13 objectForKeyedSubscript:*MEMORY[0x18960BAD8]];
  if (v7)
  {
    id v8 = (void *)v7;
    +[TKTokenID encodedKeyID:](&OBJC_CLASS___TKTokenID, "encodedKeyID:", v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v10 = (void *)[v13 mutableCopy];
    [v10 setObject:v9 forKeyedSubscript:v6];
    uint64_t v11 = [v10 copy];

    id v12 = (id)v11;
  }

  else
  {
    id v9 = 0LL;
    id v12 = v13;
  }

  id v14 = v12;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 deleteObjectWithObjectID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  -[TKTokenSessionConnection tokenConnection](self, "tokenConnection");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 token];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 tokenID];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  [v13 decodedKeyID:v10 error:&v19];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = v19;
  if (v14)
  {
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke;
    v16[3] = &unk_189F8B7A8;
    id v17 = v14;
    id v18 = v9;
    -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", v8, v16);
  }

  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v15);
  }
}

void __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2;
  v8[3] = &unk_189F8B6B8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 deleteObject:v6 reply:v8];
}

uint64_t __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)session:(id)a3 slotNameWithReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke;
  v8[3] = &unk_189F8B690;
  id v9 = v6;
  id v7 = v6;
  -[TKTokenSessionConnection withSessionID:invoke:](self, "withSessionID:invoke:", a3, v8);
}

void __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = a3;
  [a2 name];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  v6[2]();
}

- (TKTokenConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (NSMutableDictionary)initialKeepAlives
{
  return self->_initialKeepAlives;
}

- (void).cxx_destruct
{
}

- (void)startSessionWithLAContext:(void *)a1 parameters:(uint64_t)a2 reply:(os_log_s *)a3 .cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a1 tokenID];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "Token %{public}@ failed to create new session, error %{public}@",  (uint8_t *)&v6,  0x16u);
}

- (void)startSessionWithLAContext:(os_log_t)log parameters:reply:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl( &dword_186E58000,  log,  OS_LOG_TYPE_DEBUG,  "setting PIN sent in creation attributes into LAContext",  v1,  2u);
}

- (void)withSessionID:(os_log_s *)a3 invoke:.cold.1(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a2 tokenConnection];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 token];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 tokenID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = 138543618;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_debug_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_DEBUG,  "with session %{public}@ on token %{public}@",  (uint8_t *)&v8,  0x16u);
}

@end