@interface MCMResultGetCodeSignMapping
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultGetCodeSignMapping)initWithInfo:(id)a3;
- (NSDictionary)info;
@end

@implementation MCMResultGetCodeSignMapping

- (MCMResultGetCodeSignMapping)initWithInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultGetCodeSignMapping;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_info, a3);
  }

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCMResultGetCodeSignMapping;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v10, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      v7 = -[MCMResultGetCodeSignMapping info](self, "info");
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v8) {
        xpc_dictionary_set_value(v4, "ReplyInfoDictionary", v8);
      }
    }
  }

  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end