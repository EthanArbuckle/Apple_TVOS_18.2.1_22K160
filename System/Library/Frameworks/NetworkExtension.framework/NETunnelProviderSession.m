@interface NETunnelProviderSession
- (BOOL)sendProviderMessage:(NSData *)messageData returnError:(NSError *)error responseHandler:(void *)responseHandler;
- (BOOL)startTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error;
- (void)stopTunnel;
@end

@implementation NETunnelProviderSession

- (BOOL)startTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NETunnelProviderSession;
  return -[NEVPNConnection startVPNTunnelWithOptions:andReturnError:]( &v5,  sel_startVPNTunnelWithOptions_andReturnError_,  options,  error);
}

- (void)stopTunnel
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (-[NEVPNConnection status](self, "status") && self && self->super._session)
  {
    objc_opt_self();
    ne_session_get_configuration_id();
    v3 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v10];
    id v4 = (id)wrapperMap;
    objc_sync_enter(v4);
    [(id)wrapperMap objectForKeyedSubscript:v3];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v5)
    {
      id v8 = objc_getProperty(v5, v6, 24LL, 1);
      -[NEIPC stop](v8);

      -[NEIPCWrapper cancel](v7);
    }

    objc_sync_exit(v4);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NETunnelProviderSession;
  -[NEVPNConnection stopVPNTunnel](&v9, sel_stopVPNTunnel);
}

- (BOOL)sendProviderMessage:(NSData *)messageData returnError:(NSError *)error responseHandler:(void *)responseHandler
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v8 = messageData;
  objc_super v9 = responseHandler;
  if (error) {
    *error = 0LL;
  }
  if (+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "App messages cannot be sent from Network Extension providers",  buf,  2u);
    }

    if (error)
    {
      [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:3 userInfo:0];
      uint64_t v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      BOOL v30 = 0;
      *error = v11;
      goto LABEL_26;
    }

    goto LABEL_25;
  }

  if (-[NEVPNConnection status](self, "status") == NEVPNStatusInvalid || !self || !self->super._session)
  {
    if (error)
    {
      [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
      uint64_t v11 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }

void __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke( uint64_t a1,  const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 24LL, 1))
  {
    objc_super v5 = *(void **)(a1 + 32);
    if (v5) {
      id Property = objc_getProperty(v5, v4, 24LL, 1);
    }
    else {
      id Property = 0LL;
    }
    v7 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    id v9 = MEMORY[0x1895F8AE0];
    id v10 = v7;
    if (!Property) {
      goto LABEL_19;
    }
    id v11 = Property;
    objc_sync_enter(v11);
    if (objc_getProperty(v11, v12, 16LL, 1))
    {
      xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v13, "type", 0LL);
      if (v8)
      {
        id v15 = v8;
        xpc_dictionary_set_data(v13, "data", (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      }

      if (v10)
      {
        xpc_dictionary_set_BOOL(v13, "needs-reply", 1);
        v17 = (_xpc_connection_s *)objc_getProperty(v11, v16, 16LL, 1);
        uint64_t handler = MEMORY[0x1895F87A8];
        uint64_t v23 = 3221225472LL;
        v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke;
        v25 = &unk_18A0903E0;
        id v26 = v10;
        xpc_connection_send_message_with_reply(v17, v13, MEMORY[0x1895F8AE0], &handler);
      }

      else
      {
        v19 = (_xpc_connection_s *)objc_getProperty(v11, v14, 16LL, 1);
        xpc_connection_send_message(v19, v13);
      }

      -[NEIPC logMessageType:data:actionString:](0, v8, @"Sent");
    }

    else
    {
      if (!v10)
      {
LABEL_18:
        objc_sync_exit(v11);

LABEL_19:
        return;
      }

      uint64_t handler = MEMORY[0x1895F87A8];
      uint64_t v23 = 3221225472LL;
      v24 = __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke_2;
      v25 = &unk_18A090940;
      id v26 = v10;
      dispatch_async(MEMORY[0x1895F8AE0], &handler);
      xpc_object_t v13 = v26;
    }

    goto LABEL_18;
  }

  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2;
    v20[3] = &unk_18A090940;
    id v21 = v18;
    dispatch_async(MEMORY[0x1895F8AE0], v20);
  }

uint64_t __75__NETunnelProviderSession_sendProviderMessage_returnError_responseHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end