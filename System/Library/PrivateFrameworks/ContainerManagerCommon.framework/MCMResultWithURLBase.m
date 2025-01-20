@interface MCMResultWithURLBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)existed;
- (MCMResultWithURLBase)initWithPath:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5;
- (MCMResultWithURLBase)initWithURL:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5;
- (NSString)path;
- (NSURL)url;
- (const)sandboxToken;
- (void)dealloc;
@end

@implementation MCMResultWithURLBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMResultWithURLBase;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v12, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      v7 = -[MCMResultWithURLBase path](self, "path");
      if (v7)
      {
        id v8 = -[MCMResultWithURLBase path](self, "path");
        v9 = (const char *)[v8 fileSystemRepresentation];

        if (v9) {
          xpc_dictionary_set_string(v4, "ReplyPath", v9);
        }
      }

      v10 = self;
      if (-[MCMResultWithURLBase sandboxToken](v10, "sandboxToken")) {
        xpc_dictionary_set_string( v4, "ReplySandboxToken", -[MCMResultWithURLBase sandboxToken](v10, "sandboxToken"));
      }
      xpc_dictionary_set_BOOL(v4, "ReplyExisted", -[MCMResultWithURLBase existed](v10, "existed"));
    }
  }

  return v5;
}

- (MCMResultWithURLBase)initWithURL:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  [v9 path];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMResultWithURLBase initWithPath:existed:sandboxToken:]( self,  "initWithPath:existed:sandboxToken:",  v10,  v6,  a5);

  if (v11) {
    objc_storeStrong((id *)&v11->_url, a3);
  }

  return v11;
}

- (MCMResultWithURLBase)initWithPath:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMResultWithURLBase;
  v10 = -[MCMResultBase init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    if (a5) {
      objc_super v12 = strndup(a5, 0x800uLL);
    }
    else {
      objc_super v12 = 0LL;
    }
    v11->_sandboxToken = v12;
    v11->_existed = a4;
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMResultWithURLBase;
  -[MCMResultWithURLBase dealloc](&v5, sel_dealloc);
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)path
{
  return self->_path;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (BOOL)existed
{
  return self->_existed;
}

- (void).cxx_destruct
{
}

@end