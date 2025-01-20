@interface MCMXPCMessageWithIdentifierBase
- (MCMXPCMessageWithIdentifierBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)identifier;
@end

@implementation MCMXPCMessageWithIdentifierBase

- (MCMXPCMessageWithIdentifierBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithIdentifierBase;
  v10 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v17, sel_initWithXPCObject_context_error_, v8, v9, a5);
  if (v10)
  {
    [v9 clientIdentity];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 codeSignInfo];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 identifier];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[MCMXPCMessageBase identifierFromXPCObject:elseClientIdentifier:]( v10,  "identifierFromXPCObject:elseClientIdentifier:",  v8,  v13);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end