@interface MCMXPCMessageOpenPrimordialDataContainer
- (BOOL)useCodeSignDatabase;
- (MCMXPCMessageOpenPrimordialDataContainer)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageOpenPrimordialDataContainer

- (MCMXPCMessageOpenPrimordialDataContainer)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMXPCMessageOpenPrimordialDataContainer;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v11, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9) {
    v9->_useCodeSignDatabase = xpc_dictionary_get_BOOL(v8, "UseCodeSigningDatabase");
  }

  return v9;
}

- (BOOL)useCodeSignDatabase
{
  return self->_useCodeSignDatabase;
}

@end