@interface NWStreamConnection
+ (id)connectionWithConnectedSocket:(int)a3;
- (BOOL)readDataWithMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (BOOL)writeCloseWithCompletionHandler:(id)a3;
- (BOOL)writeData:(id)a3 completionHandler:(id)a4;
@end

@implementation NWStreamConnection

- (BOOL)readDataWithMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  v9 = -[NWConnection internalConnection](self, "internalConnection");
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __80__NWStreamConnection_readDataWithMinimumLength_maximumLength_completionHandler___block_invoke;
  v12[3] = &unk_189BC56E8;
  id v13 = v8;
  id v10 = v8;
  nw_connection_receive_internal(v9, 0LL, v6, v5, v12);

  return 1;
}

- (BOOL)writeData:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NWConnection internalConnection](self, "internalConnection");
  id v8 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    v9 = (dispatch_data_s *)[v7 _createDispatchData];
  }
  else {
    v9 = 0LL;
  }

  if (v6 == &__block_literal_global_14103)
  {
    nw_connection_send(v8, v9, (nw_content_context_t)&__block_literal_global_41831, 1, &__block_literal_global_24170);
  }

  else
  {
    completion[0] = MEMORY[0x1895F87A8];
    completion[1] = 3221225472LL;
    completion[2] = __50__NWStreamConnection_writeData_completionHandler___block_invoke;
    completion[3] = &unk_189BC5710;
    id v12 = v6;
    nw_connection_send(v8, v9, (nw_content_context_t)&__block_literal_global_41831, 1, completion);
  }

  return 1;
}

- (BOOL)writeCloseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NWConnection internalConnection](self, "internalConnection");
  unsigned int v5 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1895F87A8];
  completion[1] = 3221225472LL;
  completion[2] = __54__NWStreamConnection_writeCloseWithCompletionHandler___block_invoke;
  completion[3] = &unk_189BC5710;
  id v9 = v4;
  id v6 = v4;
  nw_connection_send(v5, 0LL, (nw_content_context_t)&__block_literal_global_3_41839, 1, completion);

  return 1;
}

void __54__NWStreamConnection_writeCloseWithCompletionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error) {
    error = nw_error_copy_cf_error(error);
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __50__NWStreamConnection_writeData_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  if (error) {
    error = nw_error_copy_cf_error(error);
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __80__NWStreamConnection_readDataWithMinimumLength_maximumLength_completionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  int a4,  void *a5)
{
  error = a5;
  id v8 = a2;
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }

  if (error)
  {
    v11 = nw_error_copy_cf_error(error);
    if (v9) {
      goto LABEL_10;
    }
  }

  else
  {
    v11 = 0LL;
    if (v9) {
      goto LABEL_10;
    }
  }

  if (a4 && !v11)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:57 userInfo:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

+ (id)connectionWithConnectedSocket:(int)a3
{
  return  -[NWConnection initWithConnectedSocket:]( objc_alloc(&OBJC_CLASS___NWStreamConnection),  "initWithConnectedSocket:",  *(void *)&a3);
}

@end