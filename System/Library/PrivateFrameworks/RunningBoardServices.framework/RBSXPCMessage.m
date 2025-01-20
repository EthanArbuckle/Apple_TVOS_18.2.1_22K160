@interface RBSXPCMessage
+ (RBSXPCMessage)messageWithEncoder:(uint64_t)a1;
+ (id)messageForMethod:(SEL)a3 varguments:(id)a4;
+ (id)messageForXPCMessage:(id)a3;
+ (void)messageForMethod:(void *)a3 arguments:;
- (BOOL)isEmpty;
- (RBSXPCMessage)init;
- (RBSXPCMessageReply)reply;
- (SEL)invokeOnConnection:(uint64_t)a3 withReturnClass:(void *)a4 error:;
- (SEL)method;
- (id)_initWithMessage:(id *)a1;
- (id)decodeArgumentCollection:(Class)a3 withClass:(Class)a4 atIndex:(unint64_t)a5 allowNil:(BOOL)a6 error:(id *)a7;
- (id)decodeArgumentWithClass:(Class)a3 atIndex:(unint64_t)a4 allowNil:(BOOL)a5 error:(id *)a6;
- (id)error;
- (id)invokeOnConnection:(uint64_t)a3 withReturnCollectionClass:(uint64_t)a4 entryClass:(void *)a5 error:;
- (id)sendToConnection:(id)a3 error:(id *)a4;
- (void)sendToConnection:(id)a3;
- (void)sendToConnection:(id)a3 completion:(id)a4;
- (void)sendToConnection:(id)a3 replyQueue:(id)a4 completion:(id)a5;
@end

@implementation RBSXPCMessage

+ (RBSXPCMessage)messageWithEncoder:(uint64_t)a1
{
  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(&OBJC_CLASS___RBSXPCMessage);
  v4 = v3;
  if (v2) {
    ((void (**)(id, RBSXPCCoder *))v2)[2](v2, v3->_payload);
  }

  return v4;
}

+ (void)messageForMethod:(void *)a3 arguments:
{
  id v4 = a3;
  uint64_t v5 = objc_opt_self();
  if (!a2)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:sel_messageForMethod_arguments_ object:v5 file:@"RBSXPCUtilities.m" lineNumber:165 description:@"method must be specified"];
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__RBSXPCMessage_messageForMethod_arguments___block_invoke;
  v10[3] = &unk_189DE1380;
  id v11 = v4;
  v12 = sel_messageForMethod_arguments_;
  uint64_t v13 = v5;
  uint64_t v14 = a2;
  id v6 = v4;
  v7 = +[RBSXPCMessage messageWithEncoder:]((uint64_t)&OBJC_CLASS___RBSXPCMessage, v10);
  v7[3] = a2;

  return v7;
}

void __44__RBSXPCMessage_messageForMethod_arguments___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 32) objectAtIndex:0];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 encodeObject:v3 forKey:@"rbs_argument_0"];
  }

  else
  {
    v3 = 0LL;
  }

  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectAtIndex:1];

    [v7 encodeObject:v4 forKey:@"rbs_argument_1"];
    v3 = (void *)v4;
  }

  if ((unint64_t)[*(id *)(a1 + 32) count] >= 3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"RBSXPCUtilities.m" lineNumber:177 description:@"Only up to two arguments supported by RBSXPCMessage"];
  }

  NSStringFromSelector(*(SEL *)(a1 + 56));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 encodeObject:v5 forKey:@"rbs_selector"];
}

+ (id)messageForMethod:(SEL)a3 varguments:(id)a4
{
  id v5 = a4;
  [MEMORY[0x189603FA8] array];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)&v13;
  if (v5)
  {
    uint64_t v7 = 0LL;
    do
    {
      [v6 insertObject:v5 atIndex:v7];
      v8 = v12++;
      id v9 = *v8;

      ++v7;
      id v5 = v9;
    }

    while (v9);
  }
  v10 = +[RBSXPCMessage messageForMethod:arguments:]((uint64_t)&OBJC_CLASS___RBSXPCMessage, (uint64_t)a3, v6);
  return v10;
}

+ (id)messageForXPCMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && MEMORY[0x186E30AB4](v3) == MEMORY[0x1895F9250]) {
    id v5 = -[RBSXPCMessage _initWithMessage:]((id *)objc_alloc(&OBJC_CLASS___RBSXPCMessage), v4);
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_initWithMessage:(id *)a1
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    if (!v4 || MEMORY[0x186E30AB4](v4) != MEMORY[0x1895F9250])
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 handleFailureInMethod:sel__initWithMessage_ object:a1 file:@"RBSXPCUtilities.m" lineNumber:209 description:@"can only init messages with dictionaries"];
    }

    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___RBSXPCMessage;
    id v6 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      uint64_t v7 = +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v5);
      id v8 = a1[2];
      a1[2] = (id)v7;

      [a1[2] decodeStringForKey:@"rbs_selector"];
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      a1[3] = (id)NSSelectorFromString(v9);
    }
  }

  return a1;
}

- (RBSXPCMessage)init
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v4 = (RBSXPCMessage *)-[RBSXPCMessage _initWithMessage:]((id *)&self->super.isa, v3);

  return v4;
}

- (BOOL)isEmpty
{
  return xpc_dictionary_get_count(self->_xpc_message) == 0;
}

- (RBSXPCMessageReply)reply
{
  if (xpc_dictionary_expects_reply() && (xpc_object_t reply = xpc_dictionary_create_reply(self->_xpc_message)) != 0LL)
  {
    id v4 = reply;
    id v5 = -[RBSXPCMessageReply _initWithMessage:](objc_alloc(&OBJC_CLASS___RBSXPCMessageReply), reply);
  }

  else
  {
    id v5 = 0LL;
  }

  return (RBSXPCMessageReply *)v5;
}

- (id)error
{
  if (a1)
  {
    [a1[2] decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)sendToConnection:(id)a3
{
}

- (id)sendToConnection:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v6 = (_xpc_connection_s *)a3;
  if (!v6)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x189607870];
      uint64_t v11 = *MEMORY[0x189607460];
      uint64_t v21 = *MEMORY[0x1896075F0];
      v22[0] = @"The connection does not exist";
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 errorWithDomain:v11 code:4099 userInfo:v12];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_6;
  }

  NSStringFromSelector(self->_method);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v7 hasPrefix:@"async_"];

  if (!v8)
  {
    NSStringFromSelector(self->_method);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 hasPrefix:@"void_"];
    v16 = -[RBSXPCCoder createMessage](self->_payload, "createMessage");
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v6, v16);

    if ((v15 & 1) != 0)
    {
      if (!v17) {
        goto LABEL_13;
      }
    }

    else
    {
      if (!v17)
      {
LABEL_13:
        uint64_t v13 = 0LL;
LABEL_21:

        goto LABEL_22;
      }

      if (MEMORY[0x186E30AB4](v17) == MEMORY[0x1895F9250])
      {
        +[RBSXPCCoder coderWithMessage:](&OBJC_CLASS___RBSXPCCoder, "coderWithMessage:", v17);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a4) {
          goto LABEL_21;
        }
        [v13 decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }

    if (MEMORY[0x186E30AB4](v17) != MEMORY[0x1895F9268]) {
      goto LABEL_13;
    }
    rbs_connection_log();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[RBSXPCMessage sendToConnection:error:].cold.1(v18);
    }

    if (!a4) {
      goto LABEL_13;
    }
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:4101 userInfo:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0LL;
LABEL_20:
    *a4 = v19;
    goto LABEL_21;
  }

  -[RBSXPCCoder createMessage](self->_payload, "createMessage");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v6, v9);

LABEL_6:
  uint64_t v13 = 0LL;
LABEL_22:

  return v13;
}

- (void)sendToConnection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[RBSWorkloop sharedBackgroundWorkloop](&OBJC_CLASS___RBSWorkloop, "sharedBackgroundWorkloop");
  -[RBSXPCMessage sendToConnection:replyQueue:completion:](self, "sendToConnection:replyQueue:completion:", v7, v8, v6);
}

- (void)sendToConnection:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  id v9 = (_xpc_connection_s *)a3;
  v10 = (dispatch_queue_s *)a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }

  else
  {
    v10 = +[RBSWorkloop sharedBackgroundWorkloop](&OBJC_CLASS___RBSWorkloop, "sharedBackgroundWorkloop");
    if (v9)
    {
LABEL_3:
      method = self->_method;
      if (method)
      {
        NSStringFromSelector(method);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        char v14 = [v13 hasPrefix:@"async_"];

        if ((v14 & 1) == 0)
        {
          [MEMORY[0x1896077D8] currentHandler];
          xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(self->_method);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 handleFailureInMethod:a2, self, @"RBSXPCUtilities.m", 293, @"syncronous method cannot be sent async: %@", v18 object file lineNumber description];
        }
      }

      -[RBSXPCCoder createMessage](self->_payload, "createMessage");
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        xpc_connection_send_message(v9, v15);

        goto LABEL_13;
      }

      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2;
      handler[3] = &unk_189DE13D0;
      id v20 = v11;
      xpc_connection_send_message_with_reply(v9, v15, v10, handler);

      v16 = v20;
      goto LABEL_11;
    }
  }

  if (v11)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke;
    block[3] = &unk_189DE13A8;
    id v22 = v11;
    dispatch_async(v10, block);
    v16 = v22;
LABEL_11:
  }

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x189607870];
  uint64_t v3 = *MEMORY[0x189607460];
  uint64_t v6 = *MEMORY[0x1896075F0];
  v7[0] = @"The connection does not exist";
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9250])
    {
      +[RBSXPCMessage messageForXPCMessage:](&OBJC_CLASS___RBSXPCMessage, "messageForXPCMessage:", v5);
      id v4 = (id *)objc_claimAutoreleasedReturnValue();
      -[RBSXPCMessage error](v4);
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }

    if (MEMORY[0x186E30AB4](v5) == MEMORY[0x1895F9268])
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:4101 userInfo:0];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }

  uint64_t v3 = 0LL;
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)invokeOnConnection:(uint64_t)a3 withReturnCollectionClass:(uint64_t)a4 entryClass:(void *)a5 error:
{
  id v9 = a2;
  if (!a1)
  {
    objc_super v12 = 0LL;
    goto LABEL_15;
  }

  if (!a1[3])
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_ object:a1 file:@"RBSXPCUtilities.m" lineNumber:317 description:@"must initialize message with a method to use this mechanism"];
  }
  v10 = -[SEL sendToConnection:error:](a1, "sendToConnection:error:", v9, a5);
  id v11 = v10;
  if (a5 && [v10 containsValueForKey:@"__RBSXPCError__"])
  {
    [v11 decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ([v11 containsValueForKey:@"return-value"])
  {
    if (a3) {
      [v11 decodeCollectionOfClass:a3 containingClass:a4 forKey:@"return-value"];
    }
    else {
      [v11 decodeObjectOfClass:a4 forKey:@"return-value"];
    }
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12) {
      goto LABEL_14;
    }
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a1[3]);
    char v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_, a1, @"RBSXPCUtilities.m", 332, @"failed to decode return value for %@", v14 object file lineNumber description];
  }

  objc_super v12 = 0LL;
LABEL_14:

LABEL_15:
  return v12;
}

- (SEL)invokeOnConnection:(uint64_t)a3 withReturnClass:(void *)a4 error:
{
  if (a1)
  {
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](a1, a2, 0LL, a3, a4);
    a1 = (SEL *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)decodeArgumentWithClass:(Class)a3 atIndex:(unint64_t)a4 allowNil:(BOOL)a5 error:(id *)a6
{
  return -[RBSXPCMessage decodeArgumentCollection:withClass:atIndex:allowNil:error:]( self,  "decodeArgumentCollection:withClass:atIndex:allowNil:error:",  0LL,  a3,  a4,  a5,  a6);
}

- (id)decodeArgumentCollection:(Class)a3 withClass:(Class)a4 atIndex:(unint64_t)a5 allowNil:(BOOL)a6 error:(id *)a7
{
  v26[3] = *MEMORY[0x1895F89C0];
  if (a5)
  {
    if (a5 != 1)
    {
      uint64_t v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = *MEMORY[0x1896075F0];
      v26[0] = @"requested argument index not supported";
      v25[0] = v14;
      v25[1] = @"method-name";
      NSStringFromSelector(self->_method);
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v15;
      v25[2] = @"argument-index";
      [MEMORY[0x189607968] numberWithUnsignedInteger:a5];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:3];
      xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:@"RBSXPCCodingErrorDomain" code:1 userInfo:v17];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0LL;
LABEL_12:
      *a7 = v18;

      return v19;
    }

    id v11 = @"rbs_argument_1";
  }

  else
  {
    id v11 = @"rbs_argument_0";
  }

  payload = self->_payload;
  if (a3) {
    -[RBSXPCCoder decodeCollectionOfClass:containingClass:forKey:]( payload,  "decodeCollectionOfClass:containingClass:forKey:",  a3,  a4,  v11);
  }
  else {
    -[RBSXPCCoder decodeObjectOfClass:forKey:](payload, "decodeObjectOfClass:forKey:", a4, v11);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 && !a6)
  {
    id v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = *MEMORY[0x1896075F0];
    v24[0] = @"nil argument when nonnil expected";
    v23[0] = v21;
    v23[1] = @"method-name";
    NSStringFromSelector(self->_method);
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  a5,  v23[0],  @"method-name",  @"argument-index",  @"nil argument when nonnil expected",  v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v16;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:3];
    xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:@"RBSXPCCodingErrorDomain" code:1 userInfo:v17];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  return v19;
}

- (SEL)method
{
  return self->_method;
}

- (void).cxx_destruct
{
}

- (void)sendToConnection:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_185F67000, log, OS_LOG_TYPE_ERROR, "XPC message send failed", v1, 2u);
}

@end