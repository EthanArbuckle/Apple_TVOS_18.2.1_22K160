@interface NWMessageConnection
- (void)readMessageWithCompletionHandler:(id)a3;
- (void)writeMessage:(id)a3 completionHandler:(id)a4;
@end

@implementation NWMessageConnection

- (void)readMessageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = -[NWConnection internalConnection](self, "internalConnection");
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__NWMessageConnection_readMessageWithCompletionHandler___block_invoke;
  v7[3] = &unk_189BC56E8;
  id v8 = v4;
  id v6 = v4;
  nw_connection_receive_internal(v5, 0LL, 0xFFFFFFFF, 0xFFFFFFFF, v7);
}

- (void)writeMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = nw_content_context_create("NWMessageConnection");
  [v7 relativePriority];
  nw_content_context_set_relative_priority(v8, v9);
  nw_content_context_set_expiration_milliseconds(v8, [v7 expirationMilliseconds]);
  -[NWConnection internalConnection](self, "internalConnection");
  v10 = (nw_connection *)objc_claimAutoreleasedReturnValue();
  [v7 internalContent];
  v11 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue();

  completion[0] = MEMORY[0x1895F87A8];
  completion[1] = 3221225472LL;
  completion[2] = __54__NWMessageConnection_writeMessage_completionHandler___block_invoke;
  completion[3] = &unk_189BC5710;
  id v14 = v6;
  id v12 = v6;
  nw_connection_send(v10, v11, v8, 1, completion);
}

void __54__NWMessageConnection_writeMessage_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CFErrorRef v3 = nw_error_copy_cf_error(error);
  (*(void (**)(uint64_t, CFErrorRef))(v2 + 16))(v2, v3);
}

void __56__NWMessageConnection_readMessageWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  uint64_t a4,  void *a5)
{
  id v8 = a5;
  id v9 = a3;
  id v10 = a2;
  v13 = -[NWMessage initWithContent:context:]( objc_alloc(&OBJC_CLASS___NWInboundMessage),  "initWithContent:context:",  v10,  v9);

  uint64_t v11 = *(void *)(a1 + 32);
  CFErrorRef v12 = nw_error_copy_cf_error(v8);

  (*(void (**)(uint64_t, NWInboundMessage *, CFErrorRef))(v11 + 16))(v11, v13, v12);
}

@end