@interface MCMXPCMessageRepairUserData
- (MCMXPCMessageRepairUserData)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)url;
- (char)sandboxToken;
- (unsigned)disposition;
- (void)dealloc;
@end

@implementation MCMXPCMessageRepairUserData

- (MCMXPCMessageRepairUserData)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMXPCMessageRepairUserData;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v16, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "SandboxToken");
    if (string) {
      string = strndup(string, 0x800uLL);
    }
    v9->_sandboxToken = (char *)string;
    url = v9->_url;
    v9->_url = 0LL;
    v12 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "Path");
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x189604030] fileURLWithPath:v12 isDirectory:1 relativeToURL:0];
      v14 = v9->_url;
      v9->_url = (NSURL *)v13;
    }
  }

  return v9;
}

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMXPCMessageRepairUserData;
  unsigned int v2 = -[MCMXPCMessageBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 runmode] == 0;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMXPCMessageRepairUserData;
  -[MCMXPCMessageBase dealloc](&v5, sel_dealloc);
}

- (NSURL)url
{
  return self->_url;
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (void).cxx_destruct
{
}

@end