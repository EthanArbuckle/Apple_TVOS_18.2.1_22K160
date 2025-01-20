@interface MCMResultInfoValueForKey
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultInfoValueForKey)initWithValue:(id)a3;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation MCMResultInfoValueForKey

- (MCMResultInfoValueForKey)initWithValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultInfoValueForKey;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_value, a3);
  }

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCMResultInfoValueForKey;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v10, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    v7 = -[MCMResultInfoValueForKey value](self, "value");
    if (v7)
    {
      v6 = -[MCMResultInfoValueForKey value](self, "value");
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(v4, "ReplyInfoValue", v8);

      goto LABEL_5;
    }
  }

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end