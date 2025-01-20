@interface MCMXPCMessageSetTestLock
- (BOOL)enable;
- (MCMXPCMessageSetTestLock)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unint64_t)requestedLocks;
@end

@implementation MCMXPCMessageSetTestLock

- (MCMXPCMessageSetTestLock)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMXPCMessageSetTestLock;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    v9->_requestedLocks = xpc_dictionary_get_uint64(v8, "TestLock");
    v9->_enable = xpc_dictionary_get_BOOL(v8, "Enable");
  }

  return v9;
}

- (unint64_t)requestedLocks
{
  return self->_requestedLocks;
}

- (BOOL)enable
{
  return self->_enable;
}

@end