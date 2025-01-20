@interface MCMResultOperationDelete
- (BOOL)encodeResultOntoReply:(id)a3;
- (OS_xpc_object)xpcToMerge;
- (void)mergeWithXPCResult:(id)a3;
- (void)setXpcToMerge:(id)a3;
@end

@implementation MCMResultOperationDelete

- (void)mergeWithXPCResult:(id)a3
{
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMResultOperationDelete;
  BOOL v5 = -[MCMResultWithContainersArrayBase encodeResultOntoReply:](&v14, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      v8 = -[MCMResultOperationDelete xpcToMerge](self, "xpcToMerge");
      if (!v8) {
        goto LABEL_4;
      }
      v9 = -[MCMResultOperationDelete xpcToMerge](self, "xpcToMerge");
      xpc_dictionary_get_array(v9, "ReplyContainersArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && MEMORY[0x1895CEBDC](v6) == MEMORY[0x1895F9220])
      {
        xpc_dictionary_get_array(v4, "ReplyContainersArray");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 3221225472LL;
        v12[2] = __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke;
        v12[3] = &unk_18A29DE48;
        id v13 = v10;
        id v11 = v10;
        xpc_array_apply(v6, v12);
      }
    }
  }

- (OS_xpc_object)xpcToMerge
{
  return self->_xpcToMerge;
}

- (void)setXpcToMerge:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __50__MCMResultOperationDelete_encodeResultOntoReply___block_invoke( uint64_t a1,  int a2,  xpc_object_t value)
{
  return 1LL;
}

@end