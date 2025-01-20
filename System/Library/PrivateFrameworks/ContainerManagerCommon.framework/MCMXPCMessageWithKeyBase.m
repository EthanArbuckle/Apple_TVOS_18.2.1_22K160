@interface MCMXPCMessageWithKeyBase
- (MCMXPCMessageWithKeyBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)key;
@end

@implementation MCMXPCMessageWithKeyBase

- (MCMXPCMessageWithKeyBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithKeyBase;
  v9 = -[MCMXPCMessageWithConcreteContainerBase initWithXPCObject:context:error:]( &v14,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "Key");
    key = v10->_key;
    v10->_key = (NSString *)v11;
  }

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end