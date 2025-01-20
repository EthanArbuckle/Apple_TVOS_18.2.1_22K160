@interface MCMResultFetchPersonaUniqueStrings
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultFetchPersonaUniqueStrings)initWithPersonaUniqueStrings:(id)a3;
- (NSSet)personaUniqueStrings;
- (void)setPersonaUniqueStrings:(id)a3;
@end

@implementation MCMResultFetchPersonaUniqueStrings

- (MCMResultFetchPersonaUniqueStrings)initWithPersonaUniqueStrings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMResultFetchPersonaUniqueStrings;
  v6 = -[MCMResultBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personaUniqueStrings, a3);
  }

  return v7;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMResultFetchPersonaUniqueStrings;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v11, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      v7 = -[MCMResultFetchPersonaUniqueStrings personaUniqueStrings](self, "personaUniqueStrings");
      [v7 allObjects];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

      if (v9) {
        xpc_dictionary_set_value(v4, "ReplyPersonaUniqueStringsArray", v9);
      }
    }
  }

  return v5;
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (void)setPersonaUniqueStrings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end