@interface MCMXPCMessageFlushContainerCache
- (BOOL)transient;
- (MCMXPCMessageFlushContainerCache)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageFlushContainerCache

- (MCMXPCMessageFlushContainerCache)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMXPCMessageFlushContainerCache;
  v9 = -[MCMXPCMessageWithContainerClassBase initWithXPCObject:context:error:]( &v11,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  if (v9) {
    v9->_transient = xpc_dictionary_get_BOOL(v8, "Transient");
  }

  return v9;
}

- (BOOL)transient
{
  return self->_transient;
}

@end