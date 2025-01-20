@interface TKExtensionClientTokenObject
- (BOOL)deleteWithError:(id *)a3;
- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
@end

@implementation TKExtensionClientTokenObject

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = _os_activity_create( &dword_186E58000,  "ExtClientObject: operation",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v15, &state);
  v16 = -[TKClientTokenObject session](self, "session");
  v17 = -[TKClientTokenObject accessControlRef](self, "accessControlRef");
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke;
  v24[3] = &unk_189F8BA70;
  id v18 = v16;
  id v25 = v18;
  v26 = self;
  int64_t v30 = a3;
  id v19 = v12;
  id v27 = v19;
  id v20 = v13;
  id v28 = v20;
  id v21 = v14;
  id v29 = v21;
  [v18 withError:a7 accessControl:v17 invoke:v24];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&state);
  return v22;
}

id __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__6;
  id v20 = __Block_byref_object_dispose__6;
  id v21 = 0LL;
  [*(id *)(a1 + 32) sessionID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectID];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke_2;
  v15[3] = &unk_189F8BA48;
  v15[4] = &v22;
  v15[5] = &v16;
  [v5 session:v6 objectID:v7 operation:v10 data:v8 algorithms:v9 parameters:v11 reply:v15];

  id v12 = (void *)v23[5];
  if (a3 && !v12)
  {
    *a3 = (id) v17[5];
    id v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __75__TKExtensionClientTokenObject_operation_data_algorithms_parameters_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)deleteWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_186E58000, "ExtClientObject: delete", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  -[TKClientTokenObject session](self, "session");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[TKClientTokenObject accessControlRef](self, "accessControlRef");
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 3221225472LL;
  id v13 = __48__TKExtensionClientTokenObject_deleteWithError___block_invoke;
  id v14 = &unk_189F8BA98;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  [v8 withError:a3 accessControl:v7 invoke:&v11];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "BOOLValue", v11, v12, v13, v14);

  os_activity_scope_leave(&state);
  return (char)a3;
}

id __48__TKExtensionClientTokenObject_deleteWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__6;
  uint64_t v22 = __Block_byref_object_dispose__6;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0LL;
  [*(id *)(a1 + 32) sessionID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) objectID];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __48__TKExtensionClientTokenObject_deleteWithError___block_invoke_2;
  v11[3] = &unk_189F8B490;
  v11[4] = &v18;
  v11[5] = &v12;
  [v5 session:v6 deleteObjectWithObjectID:v7 reply:v11];

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

void __48__TKExtensionClientTokenObject_deleteWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
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
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

@end