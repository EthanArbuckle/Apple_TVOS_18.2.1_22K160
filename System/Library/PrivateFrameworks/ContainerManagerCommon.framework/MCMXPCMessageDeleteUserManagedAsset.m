@interface MCMXPCMessageDeleteUserManagedAsset
- (MCMXPCMessageDeleteUserManagedAsset)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)sourceRelativePath;
@end

@implementation MCMXPCMessageDeleteUserManagedAsset

- (MCMXPCMessageDeleteUserManagedAsset)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  xpc_dictionary_set_uint64(v8, "ContainerClass", 2uLL);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMXPCMessageDeleteUserManagedAsset;
  v10 = -[MCMXPCMessageWithContainerBase initWithXPCObject:context:error:]( &v14,  sel_initWithXPCObject_context_error_,  v8,  v9,  a5);

  if (v10)
  {
    uint64_t v11 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "SourcePath");
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    if (!v10->_sourceRelativePath)
    {
      if (a5) {
        *a5 = 11LL;
      }

      v10 = 0LL;
    }
  }

  return v10;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (void).cxx_destruct
{
}

@end