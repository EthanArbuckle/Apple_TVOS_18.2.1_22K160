@interface MCMResultRelay
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultRelay)initWithXPCReplyFromRelay:(id)a3;
- (OS_xpc_object)xpcReplyFromRelay;
@end

@implementation MCMResultRelay

- (MCMResultRelay)initWithXPCReplyFromRelay:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultRelay;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcReplyFromRelay, a3);
  }

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMResultRelay;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v11, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      v7 = -[MCMResultRelay xpcReplyFromRelay](self, "xpcReplyFromRelay");
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __40__MCMResultRelay_encodeResultOntoReply___block_invoke;
      v9[3] = &unk_18A29E4A8;
      id v10 = v4;
      xpc_dictionary_apply(v7, v9);
    }
  }

  return v5;
}

- (OS_xpc_object)xpcReplyFromRelay
{
  return self->_xpcReplyFromRelay;
}

- (void).cxx_destruct
{
}

uint64_t __40__MCMResultRelay_encodeResultOntoReply___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1LL;
}

@end