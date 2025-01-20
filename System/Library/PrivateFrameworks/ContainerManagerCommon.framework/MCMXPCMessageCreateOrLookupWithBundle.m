@interface MCMXPCMessageCreateOrLookupWithBundle
- (BOOL)createIfNecessary;
- (BOOL)issueSandboxExtension;
- (BOOL)transient;
- (MCMXPCMessageCreateOrLookupWithBundle)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (const)sandboxToken;
@end

@implementation MCMXPCMessageCreateOrLookupWithBundle

- (MCMXPCMessageCreateOrLookupWithBundle)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MCMXPCMessageCreateOrLookupWithBundle;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v25, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    char uint64 = xpc_dictionary_get_uint64(v8, "Flags");
    v9->_createIfNecessary = uint64 & 1;
    v9->_transient = (uint64 & 2) != 0;
    v9->_issueSandboxExtension = (uint64 & 8) != 0;
    v9->_sandboxToken = xpc_dictionary_get_string(v8, "SandboxToken");
    v11 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "BundlePath");
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x189604030] fileURLWithPath:v11 isDirectory:1 relativeToURL:0];
      bundleURL = v9->_bundleURL;
      v9->_bundleURL = (NSURL *)v12;

      uint64_t v14 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "ExecutablePath");
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [MEMORY[0x189604030] fileURLWithPath:v14 isDirectory:0 relativeToURL:0];
        executableURL = v9->_executableURL;
        v9->_executableURL = (NSURL *)v16;
        v18 = -[NSURL path](v9->_executableURL, "path");
        v19 = -[NSURL path](v9->_bundleURL, "path");
        char v20 = [v18 hasPrefix:v19];

        if ((v20 & 1) != 0)
        {

          goto LABEL_11;
        }

        container_log_handle_for_category();
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = -[NSURL path](v9->_executableURL, "path");
          v24 = -[NSURL path](v9->_bundleURL, "path");
          *(_DWORD *)buf = 138412546;
          v27 = v23;
          __int16 v28 = 2112;
          v29 = v24;
          _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Executable path [%@] is not inside bundle path [%@]",  buf,  0x16u);
        }
      }
    }

    v9 = 0LL;
    if (a5) {
      *a5 = 10LL;
    }
  }

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (void).cxx_destruct
{
}

@end