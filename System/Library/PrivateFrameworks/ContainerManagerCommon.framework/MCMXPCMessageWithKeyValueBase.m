@interface MCMXPCMessageWithKeyValueBase
- (MCMXPCMessageWithKeyValueBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)value;
@end

@implementation MCMXPCMessageWithKeyValueBase

- (MCMXPCMessageWithKeyValueBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithKeyValueBase;
  v9 = -[MCMXPCMessageWithKeyBase initWithXPCObject:context:error:]( &v17,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  v10 = v9;
  if (!v9
    || ((unint64_t v16 = 1LL,
         -[MCMXPCMessageBase nsObjectFromXPCObject:key:error:]( v9,  "nsObjectFromXPCObject:key:error:",  v8,  "Value",  &v16),  uint64_t v11 = objc_claimAutoreleasedReturnValue(),  value = v10->_value,  v10->_value = (id)v11,  value,  !v10->_value)
      ? (BOOL v13 = v16 == 1)
      : (BOOL v13 = 1),
        v13))
  {
    v14 = v10;
  }

  else
  {
    if (a5) {
      *a5 = v16;
    }
    v14 = 0LL;
  }

  return v14;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end