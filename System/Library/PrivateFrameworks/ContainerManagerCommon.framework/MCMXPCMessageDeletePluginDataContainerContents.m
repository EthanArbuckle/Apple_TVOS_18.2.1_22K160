@interface MCMXPCMessageDeletePluginDataContainerContents
- (MCMXPCMessageDeletePluginDataContainerContents)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageDeletePluginDataContainerContents

- (MCMXPCMessageDeletePluginDataContainerContents)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a3;
  xpc_dictionary_set_uint64(v9, "ContainerClass", 4uLL);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMXPCMessageDeletePluginDataContainerContents;
  v10 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:]( &v12,  sel_initWithXPCObject_context_error_,  v9,  v8,  a5);

  return v10;
}

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMXPCMessageDeletePluginDataContainerContents;
  unsigned int v2 = -[MCMXPCMessageWithContainerBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 dispositionForContainerClass:4];
  }

  return v2;
}

@end