@interface MCMXPCMessageWithURLBase
- (MCMXPCMessageWithURLBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)url;
@end

@implementation MCMXPCMessageWithURLBase

- (MCMXPCMessageWithURLBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMXPCMessageWithURLBase;
  v9 = -[MCMXPCMessageBase initWithXPCObject:context:error:](&v15, sel_initWithXPCObject_context_error_, v8, a4, a5);
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "Path");
    if (string
      && ([MEMORY[0x189604030] fileURLWithFileSystemRepresentation:string isDirectory:1 relativeToURL:0],  (v11 = (NSURL *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      url = v9->_url;
      v9->_url = v11;
      v13 = v11;
    }

    else
    {
      if (a5) {
        *a5 = 38LL;
      }
      v13 = v9;
      v9 = 0LL;
    }
  }

  return v9;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end